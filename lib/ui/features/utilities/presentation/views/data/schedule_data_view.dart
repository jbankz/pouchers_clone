import 'package:Pouchers/app/core/skeleton/widgets.dart';
import 'package:Pouchers/ui/features/utilities/domain/dto/mobile_dto.dart';
import 'package:Pouchers/utils/extension.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_contact_picker/flutter_native_contact_picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:stacked/stacked_annotations.dart';

import '../../../../../../app/app.router.dart';
import '../../../../../../utils/field_validator.dart';
import '../../../../../../utils/formatters/currency_formatter.dart';
import '../../../../../common/app_colors.dart';
import '../../../../../common/app_images.dart';
import '../../../../../common/app_strings.dart';
import '../../../../../widgets/dialog/bottom_sheet.dart';
import '../../../../../widgets/edit_text_field_with.dart';
import '../../../../../widgets/elevated_button_widget.dart';
import '../../../../../widgets/gap.dart';
import '../../../../authentication/presentation/view/pin/sheet/pin_confirmation_sheet.dart';
import '../../../../schedules/domain/model/schedule_model.dart';
import '../../../../schedules/presentation/notifier/schedule_notifier.dart';
import '../../../domain/enum/billers_category.dart';
import '../../../domain/enum/service_category.dart';
import '../../../domain/model/billers.dart';
import '../../../domain/model/mobile_data_services.dart';
import '../../notifier/billers_notifier.dart';
import '../sheet/frequency_sheet.dart';
import '../widget/delete_schedule_widget.dart';
import '../widget/utility_icon.dart';
import 'schedule_data_view.form.dart';
import 'sheets/data_bundle_sheets.dart';
import 'skeleton/data_skeleton.dart';

@FormView(fields: [
  FormTextField(name: 'phone'),
  FormTextField(name: 'amount'),
  FormTextField(name: 'frequency')
])
class ScheduleDataView extends ConsumerStatefulWidget {
  const ScheduleDataView({super.key, this.schedule});

  final ScheduleModel? schedule;

  @override
  ConsumerState<ScheduleDataView> createState() => _ScheduleDataViewState();
}

class _ScheduleDataViewState extends ConsumerState<ScheduleDataView>
    with $ScheduleDataView {
  late BillersNotifier _billersNotifier;
  final CancelToken _cancelToken = CancelToken();
  final FlutterContactPicker _contactPicker = FlutterContactPicker();
  late ScheduleNotifier _scheduleNotifier;

  Billers? _billers;
  MobileOperatorServices? _mobileOperatorServices;
  String _frequency = '';

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _billersNotifier = ref.read(billersNotifierProvider.notifier)
        ..billers(BillersCategory.data, _cancelToken);
      _scheduleNotifier = ref.read(scheduleNotifierProvider.notifier);
      _frequency = widget.schedule?.frequency ?? '';
      phoneController.text = widget.schedule?.recipient ?? '';
      _billers = Billers(
          name: widget.schedule?.subCategory,
          operatorpublicid: widget.schedule?.mobileOperatorPublicId ?? '');
    });
  }

  @override
  void dispose() {
    super.dispose();
    _cancelToken.cancel();
    disposeForm();
  }

  final formKey = GlobalKey<FormState>();
  final CurrencyFormatter _formatter = CurrencyFormatter(
      enableNegative: false, name: '', symbol: '', decimalDigits: 0);

  @override
  Widget build(BuildContext context) {
    final billerState = ref.watch(billersNotifierProvider);
    final scheduleState = ref.watch(scheduleNotifierProvider);

    final bool isBusy =
        billerState.isScheduling || scheduleState.isBusy || billerState.isBusy;
    return Scaffold(
      appBar: AppBar(title: Text(AppString.scheduleData)),
      body: SafeArea(
        minimum: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        child: Skeleton(
          isLoading: billerState.isBusy,
          skeleton: const DataSkeleton(),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                Expanded(
                  child: ListView(
                    keyboardDismissBehavior:
                        ScrollViewKeyboardDismissBehavior.onDrag,
                    children: [
                      EditTextFieldWidget(
                        title: AppString.mobileNumber,
                        controller: phoneController,
                        focusNode: phoneFocusNode,
                        keyboardType: TextInputType.phone,
                        readOnly: isBusy,
                        onFieldSubmitted: (_) =>
                            context.nextFocus(amountFocusNode),
                        validator: FieldValidator.validatePhone(),
                        inputFormatters: [context.digitsOnly, context.limit()],
                        suffixIcon: CupertinoButton(
                            padding: EdgeInsets.zero,
                            child: SvgPicture.asset(AppImage.contactBook,
                                fit: BoxFit.scaleDown),
                            onPressed: () async {
                              if (isBusy) return;

                              final Contact? contact =
                                  await _contactPicker.selectContact();

                              if (contact?.phoneNumbers?.isNotEmpty ?? false) {
                                phoneController.text = contact?.phoneNumbers
                                        ?.first.formatCountryCode ??
                                    '';
                              }
                              setState(() {});
                            }),
                      ),
                      const Gap(height: 24),
                      Text(AppString.selectProvider,
                          style: context.titleLarge?.copyWith(fontSize: 12.sp)),
                      const Gap(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: List.generate(
                            billerState.billers.length,
                            (index) => Flexible(
                                    child: UtitlityIcon(
                                  isSelected: billerState.billers[index].name ==
                                      _billers?.name,
                                  image: billerState.billers[index].logoUrl,
                                  onTap: () {
                                    if (isBusy) return;

                                    _mobileOperatorServices = null;
                                    setState(() =>
                                        _billers = billerState.billers[index]);
                                  },
                                ))).toList(),
                      ),
                      const Gap(height: 24),
                      EditTextFieldWidget(
                        title: AppString.selectType,
                        controller: amountController
                          ..text = _mobileOperatorServices == null
                              ? ''
                              : '${_mobileOperatorServices?.serviceName ?? ''} - ${_mobileOperatorServices?.servicePrice.toNaira ?? ''}',
                        focusNode: amountFocusNode,
                        readOnly: true,
                        keyboardType: TextInputType.text,
                        onFieldSubmitted: (_) {},
                        validator: FieldValidator.validateString(),
                        suffixIcon: const Icon(
                            Icons.keyboard_arrow_down_rounded,
                            color: AppColors.kSecondaryTextColor),
                        onTap: () async {
                          if (isBusy || _billers == null) {
                            return;
                          }
                          _mobileOperatorServices =
                              await BottomSheets.showSheet(
                                  child: DataBundleSheets(
                                      providerId: _billers?.operatorpublicid ??
                                          '')) as MobileOperatorServices?;
                          setState(() {});
                        },
                      ),
                      const Gap(height: 24),
                      EditTextFieldWidget(
                          title: AppString.choosePeriod,
                          label: AppString.frequency,
                          controller: frequencyController,
                          focusNode: frequencyFocusNode,
                          readOnly: true,
                          keyboardType: TextInputType.text,
                          validator:
                              FieldValidator.validateFrequency(_frequency),
                          suffixIcon: _frequency.isEmpty
                              ? const Icon(Icons.keyboard_arrow_down_outlined,
                                  color: AppColors.kSecondaryTextColor)
                              : Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    if (_frequency.isNotEmpty)
                                      Flexible(
                                        child: Text(_frequency,
                                            style: context.titleLarge?.copyWith(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w700,
                                                color: AppColors.kPurpleColor)),
                                      ),
                                    const Icon(
                                        Icons.keyboard_arrow_down_outlined,
                                        color: AppColors.kSecondaryTextColor),
                                    if (_frequency.isNotEmpty)
                                      const Gap(width: 16)
                                  ],
                                ),
                          onTap: () async {
                            final response = await BottomSheets.showSheet(
                                child: const FrequencySheet()) as String;
                            if (response.isNotEmpty) {
                              _frequency = 'Every $response';
                            }
                            setState(() {});
                          }),
                    ],
                  ),
                ),
                ElevatedButtonWidget(
                    title: AppString.proceed,
                    loading: isBusy,
                    onPressed: _billers == null || _frequency.isEmpty
                        ? null
                        : () async {
                            if (!formKey.currentState!.validate()) return;

                            final pin = await BottomSheets.showSheet(
                                child: const PinConfirmationSheet()) as String?;
                            if (pin != null) _submit(pin);
                          }),
                DeleteScheduleWidget(
                    enabled: widget.schedule != null,
                    onTap: () => _scheduleNotifier.deleteSchedule(
                        scheduleId: widget.schedule?.scheduleId,
                        cancelToken: _cancelToken)),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _submit(String pin) async {
    if (widget.schedule != null) {
      _scheduleNotifier.updateSchedule(
          mobileDto: MobileDto(
              scheduleId: widget.schedule?.scheduleId,
              frequency: _frequency,
              transactionPin: pin,
              amount: amountController.text.replaceComma),
          cancelToken: _cancelToken);
    } else {
      _billersNotifier.schedule(
          mobileDto: MobileDto(
              frequency: _frequency,
              amount: amountController.text.replaceComma,
              transactionPin: pin,
              subCategory: _billers?.displayName,
              category: ServiceCategory.data,
              destinationPhoneNumber: phoneController.text,
              mobileOperatorServiceId:
                  _mobileOperatorServices?.serviceId.toString(),
              mobileOperatorPublicId: _billers?.operatorpublicid),
          route: Routes.scheduleDataView,
          cancelToken: _cancelToken);
    }
  }
}
