import 'package:Pouchers/app/core/skeleton/widgets.dart';
import 'package:Pouchers/ui/features/utilities/domain/dto/mobile_dto.dart';
import 'package:Pouchers/ui/features/utilities/domain/dto/summary_dto.dart';
import 'package:Pouchers/ui/features/utilities/domain/enum/billers_category.dart';
import 'package:Pouchers/ui/features/utilities/domain/model/discounts.dart';
import 'package:Pouchers/ui/features/utilities/domain/model/top_deals_model.dart';
import 'package:Pouchers/utils/extension.dart';
import 'package:collection/collection.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_contact_picker/flutter_native_contact_picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:stacked/stacked_annotations.dart';

import '../../../../../../app/app.router.dart';
import '../../../../../../app/core/router/page_router.dart';
import '../../../../../../utils/field_validator.dart';
import '../../../../../common/app_colors.dart';
import '../../../../../common/app_images.dart';
import '../../../../../common/app_strings.dart';
import '../../../../../widgets/dialog/bottom_sheet.dart';
import '../../../../../widgets/dialog/guest_modal_sheet.dart';
import '../../../../../widgets/edit_text_field_with.dart';
import '../../../../../widgets/elevated_button_widget.dart';
import '../../../../../widgets/gap.dart';
import '../../../../admin/data/dao/env_dao.dart';
import '../../../../admin/domain/enum/fees.dart';
import '../../../../authentication/presentation/view/pin/sheet/pin_confirmation_sheet.dart';
import '../../../../dashboard/views/card/domain/enum/currency.dart';
import '../../../../dashboard/views/card/presentation/notifier/module/module.dart';
import '../../../../payment/domain/dto/debit_card_dto.dart';
import '../../../domain/enum/service_category.dart';
import '../../../domain/model/billers.dart';
import '../../../domain/model/mobile_data_services.dart';
import '../../notifier/billers_notifier.dart';
import '../../state/billers_state.dart';
import '../sheet/summary_sheet.dart';
import '../widget/scheduling_widget.dart';
import '../widget/top_deal_widget.dart';
import '../widget/utility_icon.dart';
import 'data_view.form.dart';
import 'sheets/data_bundle_sheets.dart';
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
  MobileOperatorServices? _mobileOperatorServices;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _billersNotifier = ref.read(billersNotifierProvider.notifier)
        ..billers(BillersCategory.data, _cancelToken);
    });
  }

  @override
  void dispose() {
    super.dispose();
    _cancelToken.cancel();
    disposeForm();
  }

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final billerState = ref.watch(billersNotifierProvider);
    final filteredServices = billerState.discounts?.filteredServices ?? [];

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
                        readOnly: billerState.isPurchasing,
                        onFieldSubmitted: (_) =>
                            context.nextFocus(amountFocusNode),
                        validator: FieldValidator.validatePhone(),
                        inputFormatters: [context.digitsOnly, context.limit()],
                        suffixIcon: CupertinoButton(
                            padding: EdgeInsets.zero,
                            child: SvgPicture.asset(AppImage.contactBook,
                                fit: BoxFit.scaleDown),
                            onPressed: () async {
                              if (billerState.isPurchasing) return;

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
                        children:
                            List.generate(billerState.billers.length, (index) {
                          final biller = billerState.billers[index];
                          return Flexible(
                              child: UtitlityIcon(
                            isAvailable: biller.isAvailable,
                            isSelected: biller.name == _billers?.name,
                            image: biller.logoUrl,
                            onTap: () {
                              if (billerState.isPurchasing) return;

                              _mobileOperatorServices = null;
                              setState(() => _billers = biller);

                              _billersNotifier.billersDiscounts(
                                  parameter: BillersCategory.data,
                                  operatorId: _billers?.operatorpublicid,
                                  cancelToken: _cancelToken);
                            },
                          ));
                        }).toList(),
                      ),
                      TopDealsWidget(
                          category: BillersCategory.data,
                          filteredServices: filteredServices
                              .map((topDeal) => TopDeals(
                                  mobileOperatorId: topDeal.mobileOperatorId,
                                  price: topDeal.servicePrice,
                                  validityPeriod: topDeal.validityPeriod,
                                  dataValue: topDeal.dataValue,
                                  serviceName: topDeal.serviceName,
                                  serviceId: topDeal.serviceId))
                              .toList(),
                          callback: (topDeal) {
                            if (billerState.isPurchasing) return;

                            if (billerState.isGuest) {
                              BottomSheets.showAlertDialog(
                                  child: const GuestDiscountSheet());
                              return;
                            }

                            _mobileOperatorServices = MobileOperatorServices(
                                mobileOperatorId: topDeal.mobileOperatorId ?? 0,
                                servicePrice: topDeal.price,
                                validityPeriod: topDeal.validityPeriod,
                                dataValue: topDeal.dataValue,
                                serviceName: topDeal.serviceName,
                                serviceId: topDeal.serviceId ?? 0);

                            setState(() {});
                          }),
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
                          if (billerState.isPurchasing || _billers == null) {
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
                      if (!billerState.isGuest)
                        SchedulingWidget(
                            title: AppString.scheduleDataHint,
                            description: AppString.scheduleDataHint1,
                            tapped: () =>
                                PageRouter.pushNamed(Routes.scheduleDataView))
                    ],
                  ),
                ),
                const Gap(height: 16),
                ElevatedButtonWidget(
                    title: AppString.proceed,
                    loading: billerState.isPurchasing,
                    onPressed: _billers == null
                        ? null
                        : () async {
                            if (!formKey.currentState!.validate()) return;

                            await _handlePayment(billerState);
                          })
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _submitForGuest(dynamic feedback) async {
    final guest = ref.watch(paramModule);
    final bool isCardPayment =
        (feedback is DebitCardDto? && feedback?.bank == null);

    _billersNotifier.purchaseServiceForGuest(
        isCardPayment: isCardPayment,
        mobileDto: MobileDto(
            category: ServiceCategory.data,
            subCategory: _billers?.displayName,
            amount: _mobileOperatorServices?.servicePrice,
            mobileOperatorPublicId: _billers?.operatorpublicid,
            mobileOperatorServiceId:
                _mobileOperatorServices?.serviceId.toString() ?? '',
            currency: Currency.NGN,
            email: guest.customerEmail,
            phoneNumber: phoneController.text,
            payer: Payer(email: guest.customerEmail, name: guest.customerName),
            bank: feedback?.bank),
        cancelToken: _cancelToken);
  }

  Future<void> _handlePayment(BillersState billerState) async {
    final Discounts? discounts = billerState.discounts?.discount;
    final envs = envDao.envs;

    final bool isAppliedDiscount = ((discounts != null) &&
        (_mobileOperatorServices?.servicePrice ?? 0) >= (discounts.threshold));

    final amount = billerState.isGuest
        ? (_mobileOperatorServices?.servicePrice ?? 0)
        : discounts?.payment(_mobileOperatorServices?.servicePrice) ??
            _mobileOperatorServices?.servicePrice;

    final String fee =
        envs.firstWhereOrNull((env) => env.name == Fees.dataFee)?.value ?? '0';

    final feedback = await BottomSheets.showSheet(
      child: SummaryWidget(
        summaryDto: SummaryDto(
            isGuest: billerState.isGuest,
            title: _mobileOperatorServices?.dataValue,
            imageUrl: _billers?.logoUrl,
            recipient: phoneController.text,
            amount: amount,
            cashBack: isAppliedDiscount ? discounts.discountValue : 0,
            fee: num.parse(fee)),
        biometricVerification: (pin) {
          _submitForActualUser(billerState: billerState, pin: pin);
          return;
        },
      ),
    );

    if (feedback != null) {
      if (billerState.isGuest) {
        _submitForGuest(feedback);
      } else if (feedback is bool && feedback) {
        final pin = await BottomSheets.showSheet(
          child: const PinConfirmationSheet(),
        ) as String?;
        if (pin != null) {
          _submitForActualUser(billerState: billerState, pin: pin);
        }
      }
    }
  }

  Future<void> _submitForActualUser(
      {required BillersState billerState, String? pin}) async {
    final Discounts? discounts = billerState.discounts?.discount;

    final bool isAppliedDiscount = ((billerState.discounts != null) &&
        (_mobileOperatorServices?.servicePrice ?? 0) >=
            (discounts?.threshold ?? 0));

    final amount =
        discounts?.payment(_mobileOperatorServices?.servicePrice ?? 0) ?? 0;

    final mobileDto = MobileDto(
        category: ServiceCategory.data,
        subCategory: _billers?.displayName,
        amount: amount,
        destinationPhoneNumber: phoneController.text,
        mobileOperatorPublicId: _billers?.operatorpublicid,
        applyDiscount: isAppliedDiscount,
        mobileOperatorServiceId:
            _mobileOperatorServices?.serviceId.toString() ?? '',
        isDataBundle: true,
        transactionPin: pin);

    _billersNotifier.purchaseService(
        mobileDto: mobileDto,
        onSuccess: () => PageRouter.pushNamed(Routes.successState,
            args: SuccessStateArguments(
                title: AppString.rechargeSuccessful,
                message: AppString.completedDataPurchase,
                btnTitle: AppString.complete,
                tap: () => PageRouter.popToRoot(Routes.dashboardView))),
        cancelToken: _cancelToken);
  }
}
