import 'package:Pouchers/app/core/skeleton/widgets.dart';
import 'package:Pouchers/ui/features/utilities/domain/dto/mobile_dto.dart';
import 'package:Pouchers/utils/extension.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_contact_picker/flutter_native_contact_picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:stacked/stacked_annotations.dart';

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
import '../../../domain/enum/service_category.dart';
import '../../../domain/model/airtime_top_deals.dart';
import '../../../domain/model/billers.dart';
import '../../notifier/billers_notifier.dart';
import '../sheet/frequency_sheet.dart';
import '../widget/utility_icon.dart';
import 'schedule_airtime_view.form.dart';
import 'skeleton/airtime_skeleton.dart';

@FormView(fields: [
  FormTextField(name: 'phone'),
  FormTextField(name: 'amount'),
  FormTextField(name: 'frequency')
])
class ScheduledAirtimeView extends ConsumerStatefulWidget {
  const ScheduledAirtimeView({super.key});

  @override
  ConsumerState<ScheduledAirtimeView> createState() =>
      _ScheduledAirtimeViewState();
}

class _ScheduledAirtimeViewState extends ConsumerState<ScheduledAirtimeView>
    with $ScheduledAirtimeView {
  late BillersNotifier _billersNotifier;
  final CancelToken _cancelToken = CancelToken();
  final FlutterContactPicker _contactPicker = FlutterContactPicker();

  Billers? _billers;
  AirtimeTopDeals? _airtimeTopDeals;
  String _frequency = '';

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
        (_) => _billersNotifier = ref.read(billersNotifierProvider.notifier));
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
    return Scaffold(
      appBar: AppBar(title: Text(AppString.scheduleAirtime)),
      body: SafeArea(
        minimum: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        child: Skeleton(
          isLoading: billerState.isBusy,
          skeleton: const AirtimeSkeleton(),
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
                      readOnly: billerState.isScheduling,
                      onFieldSubmitted: (_) =>
                          context.nextFocus(amountFocusNode),
                      validator: FieldValidator.validatePhone(),
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(11)
                      ],
                      suffixIcon: CupertinoButton(
                          padding: EdgeInsets.zero,
                          child: SvgPicture.asset(AppImage.contactBook,
                              fit: BoxFit.scaleDown),
                          onPressed: () async {
                            if (billerState.isScheduling) return;

                            final Contact? contact =
                                await _contactPicker.selectContact();

                            if (contact?.phoneNumbers?.isNotEmpty ?? false) {
                              phoneController.text = contact
                                      ?.phoneNumbers?.first.formatCountryCode ??
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
                                  if (billerState.isScheduling) return;

                                  setState(() =>
                                      _billers = billerState.billers[index]);
                                },
                              ))).toList(),
                    ),
                    const Gap(height: 24),
                    EditTextFieldWidget(
                      title: AppString.amount,
                      label: AppString.amountInstruction,
                      controller: amountController,
                      focusNode: amountFocusNode,
                      readOnly: billerState.isScheduling,
                      keyboardType: TextInputType.number,
                      onFieldSubmitted: (_) =>
                          context.nextFocus(frequencyFocusNode),
                      validator: FieldValidator.validateAmount(),
                      prefix: Text('${AppString.nairaSymbol} '),
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        _formatter
                      ],
                    ),
                    const Gap(height: 24),
                    EditTextFieldWidget(
                        title: 'Choose top-up period',
                        label: 'Select frequency',
                        controller: frequencyController,
                        focusNode: frequencyFocusNode,
                        readOnly: true,
                        keyboardType: TextInputType.text,
                        validator: FieldValidator.validateFrequency(_frequency),
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
                                  const Icon(Icons.keyboard_arrow_down_outlined,
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
                )),
                ElevatedButtonWidget(
                    title: AppString.proceed,
                    loading: billerState.isScheduling,
                    onPressed: _billers == null
                        ? null
                        : () async {
                            if (!formKey.currentState!.validate()) return;

                            final pin = await BottomSheets.showSheet(
                                child: const PinConfirmationSheet()) as String?;
                            if (pin != null) _submit(pin);
                          })
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _submit(String pin) => _billersNotifier.scheduleAirtime(
      mobileDto: MobileDto(
          frequency: _frequency,
          amount: _formatter.getUnformattedValue(),
          transactionPin: pin,
          subCategory: _billers?.displayName,
          category: ServiceCategory.airtime,
          destinationPhoneNumber: phoneController.text,
          mobileOperatorPublicId: _billers?.operatorpublicid),
      cancelToken: _cancelToken);
}
