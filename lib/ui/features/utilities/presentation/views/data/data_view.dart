import 'package:Pouchers/app/core/skeleton/widgets.dart';
import 'package:Pouchers/ui/features/utilities/domain/dto/mobile_dto.dart';
import 'package:Pouchers/ui/features/utilities/domain/dto/summary_dto.dart';
import 'package:Pouchers/ui/features/utilities/domain/enum/billers_category.dart';
import 'package:Pouchers/ui/widgets/bottom_sheet.dart';
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
import '../../../domain/model/airtime_top_deals.dart';
import '../../../domain/model/billers.dart';
import '../../notifier/billers_notifier.dart';
import '../sheet/summary_sheet.dart';
import '../widget/utility_icon.dart';
import 'data_view.form.dart';
import 'skeleton/data_skeleton.dart';

@FormView(fields: [FormTextField(name: 'phone'), FormTextField(name: 'amount')])
class DataView extends ConsumerStatefulWidget {
  const DataView({super.key});

  @override
  ConsumerState<DataView> createState() => _DataViewState();
}

class _DataViewState extends ConsumerState<DataView> with $DataView {
  late BillersNotifier _billersNotifier;
  final CancelToken _cancelToken = CancelToken();
  final FlutterContactPicker _contactPicker = FlutterContactPicker();

  Billers? _billers;
  AirtimeTopDeals? _airtimeTopDeals;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _billersNotifier = ref.read(billersNotifierProvider.notifier)
        ..billers(BillersCategory.data, _cancelToken)
        ..billersDiscounts(BillersCategory.data, _cancelToken);
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
    return Scaffold(
      appBar: AppBar(title: Text(AppString.data)),
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
                        readOnly: billerState.purchasing,
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
                              if (billerState.purchasing) return;

                              final Contact? contact =
                                  await _contactPicker.selectContact();

                              if (contact?.phoneNumbers?.isNotEmpty ?? false) {
                                phoneController.text = contact
                                        ?.phoneNumbers?.first
                                        .replaceAll('+234', '0')
                                        .replaceAll(' ', '') ??
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
                                    if (billerState.purchasing) return;

                                    setState(() =>
                                        _billers = billerState.billers[index]);
                                  },
                                ))).toList(),
                      ),
                      const Gap(height: 24),
                      EditTextFieldWidget(
                        title: AppString.selectType,
                        controller: amountController,
                        focusNode: amountFocusNode,
                        readOnly: true,
                        keyboardType: TextInputType.text,
                        onFieldSubmitted: (_) {},
                        validator: FieldValidator.validateString(),
                        suffixIcon: const Icon(
                            Icons.keyboard_arrow_down_rounded,
                            color: AppColors.kSecondaryTextColor),
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
                ElevatedButtonWidget(
                    title: AppString.proceed,
                    loading: billerState.purchasing,
                    onPressed: _billers == null
                        ? null
                        : () async {
                            if (!formKey.currentState!.validate()) return;

                            final feedback = await Sheets.showSheet(
                                child: SummaryWidget(
                                    summaryDto: SummaryDto(
                                        title: _billers?.displayName,
                                        imageUrl: _billers?.logoUrl,
                                        recipient: phoneController.text,
                                        amount:
                                            _formatter.getUnformattedValue(),
                                        cashBack: _airtimeTopDeals?.cashBack,
                                        fee: 0))) as bool?;

                            if (feedback != null && feedback) {
                              final response = await BottomSheets.showSheet(
                                      child: const PinConfirmationSheet())
                                  as String?;
                              if (response != null) {
                                _billersNotifier.purchaseService(
                                    MobileDto(
                                        category: 'airtime-purchase',
                                        subCategory: _billers?.displayName,
                                        amount:
                                            _formatter.getUnformattedValue(),
                                        destinationPhoneNumber:
                                            phoneController.text,
                                        mobileOperatorPublicId:
                                            _billers?.operatorpublicid,
                                        applyDiscount: false,
                                        transactionPin: response),
                                    _cancelToken);
                              }
                            }
                          })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
