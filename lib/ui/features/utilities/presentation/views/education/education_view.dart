import 'package:Pouchers/app/config/app_logger.dart';
import 'package:Pouchers/ui/features/merchant/presentation/state/merchant_state.dart';
import 'package:Pouchers/utils/extension.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:collection/collection.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:stacked/stacked_annotations.dart';

import '../../../../../../app/app.router.dart';
import '../../../../../../app/core/router/page_router.dart';
import '../../../../../../app/core/skeleton/widgets.dart';
import '../../../../../../utils/field_validator.dart';
import '../../../../../../utils/formatters/currency_formatter.dart';
import '../../../../../common/app_colors.dart';
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
import '../../../../merchant/presentation/notifier/merchants_notifier.dart';
import '../../../../payment/domain/dto/debit_card_dto.dart';
import '../../../domain/dto/billers_dto.dart';
import '../../../domain/dto/mobile_dto.dart';
import '../../../domain/dto/summary_dto.dart';
import '../../../domain/enum/billers_category.dart';
import '../../../domain/enum/service_category.dart';
import '../../../domain/model/billers.dart';
import '../../../domain/model/cable_service.dart';
import '../../../domain/model/discounts.dart';
import '../../../domain/model/top_deals_model.dart';
import '../../notifier/billers_notifier.dart';
import '../../state/billers_state.dart';
import '../sheet/provider_services_sheets.dart';
import '../sheet/providers_sheets.dart';
import '../sheet/summary_sheet.dart';
import '../widget/top_deal_widget.dart';
import 'education_view.form.dart';
import 'skeleton/education_skeleton.dart';

@FormView(fields: [
  FormTextField(name: 'provider'),
  FormTextField(name: 'subscriptionType'),
  FormTextField(name: 'amount')
])
class EducationView extends ConsumerStatefulWidget {
  const EducationView({super.key});

  @override
  ConsumerState<EducationView> createState() => _EducationViewState();
}

class _EducationViewState extends ConsumerState<EducationView>
    with $EducationView {
  late BillersNotifier _billersNotifier;
  final CancelToken _cancelToken = CancelToken();

  Billers? _billers;
  CableService? _cableService;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final CurrencyFormatter _formatter = CurrencyFormatter(
      enableNegative: false, name: '', symbol: '', decimalDigits: 0);
  late MerchantsNotifier _merchantsNotifier;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _initializeNotifiers());
  }

  @override
  void dispose() {
    super.dispose();
    _cancelToken.cancel();
    disposeForm();
  }

  Future<void> _initializeNotifiers() async {
    _billersNotifier = ref.read(billersNotifierProvider.notifier);
    _merchantsNotifier = ref.read(merchantsNotifierProvider.notifier);

    await _billersNotifier.billers(BillersCategory.education, _cancelToken);
    await _merchantsNotifier.getMerchants(_cancelToken);
  }

  @override
  Widget build(BuildContext context) {
    final billerState = ref.watch(billersNotifierProvider);
    final getMerchantState = ref.watch(merchantsNotifierProvider);
    final discountData = billerState.discounts;
    final filteredServices = discountData?.filteredServices ?? [];

    return Scaffold(
      appBar: AppBar(title: Text(AppString.education)),
      body: SafeArea(
        minimum: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        child: Skeleton(
          isLoading: billerState.isBusy || getMerchantState.isBusy,
          skeleton: const EducationSkeleton(),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: ListView(
                    keyboardDismissBehavior:
                        ScrollViewKeyboardDismissBehavior.onDrag,
                    children: [
                      _buildProviderTextField(billerState),
                      TopDealsWidget(
                          category: BillersCategory.education,
                          filteredServices: filteredServices
                              .map((topDeal) => TopDeals(
                                  code: topDeal.code,
                                  price: topDeal.price,
                                  name: topDeal.name))
                              .toList(),
                          callback: (topDeal) {
                            if (billerState.isPurchasing) return;

                            if (billerState.isGuest) {
                              BottomSheets.showAlertDialog(
                                  child: const GuestDiscountSheet());
                              return;
                            }

                            _cableService = CableService(
                                name: topDeal.name,
                                code: topDeal.code,
                                price: topDeal.price,
                                shortCode: topDeal.shortCode);

                            subscriptionTypeController.text =
                                topDeal.name ?? '';

                            amountController.text = _formatter
                                .formatDouble(topDeal.price.toDouble());

                            setState(() {});
                          }),
                      const Gap(height: 24),
                      _buildSubscriptionTypeTextField(),
                      const Gap(height: 24),
                      EditTextFieldWidget(
                          title: AppString.amount,
                          label: AppString.amountInstruction,
                          controller: amountController,
                          focusNode: amountFocusNode,
                          readOnly: true,
                          keyboardType: TextInputType.number,
                          onFieldSubmitted: (_) {},
                          validator: FieldValidator.validateAmount(),
                          prefix: IconButton(
                              onPressed: () {},
                              icon: Text(AppString.nairaSymbol,
                                  style: context.headlineMedium
                                      ?.copyWith(fontSize: 16))),
                          inputFormatters: [context.digitsOnly, _formatter]),
                    ],
                  ),
                ),
                const Gap(height: 16),
                ElevatedButtonWidget(
                    title: AppString.proceed,
                    loading: billerState.isPurchasing,
                    onPressed: _isProceedButtonEnabled(billerState)
                        ? () => _handlePayment(billerState)
                        : null),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildProviderTextField(BillersState billerState) =>
      EditTextFieldWidget(
        title: AppString.selectProvider,
        label: AppString.selectProvider,
        controller: providerController,
        focusNode: providerFocusNode,
        readOnly: true,
        keyboardType: TextInputType.text,
        onFieldSubmitted: (_) {},
        prefix: _buildProviderPrefix(),
        validator: FieldValidator.validateString(),
        suffixIcon: const Icon(Icons.keyboard_arrow_down_rounded,
            color: AppColors.kSecondaryTextColor),
        onTap: () async {
          _onProviderTextFieldTapped();
          setState(() {});
        },
      );

  Widget? _buildProviderPrefix() => _billers == null
      ? null
      : Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
          child: CachedNetworkImage(
            imageUrl: _billers?.logoUrl ?? '',
            height: 40.h,
            width: 40.w,
            errorWidget: (_, __, ___) => const SizedBox.shrink(),
          ),
        );

  Widget _buildSubscriptionTypeTextField() => EditTextFieldWidget(
        title: AppString.subscriptionType,
        label: AppString.subscriptionType,
        controller: subscriptionTypeController,
        focusNode: subscriptionTypeFocusNode,
        readOnly: true,
        keyboardType: TextInputType.text,
        onFieldSubmitted: (_) {},
        validator: FieldValidator.validateString(),
        suffixIcon: _buildSubscriptionTypeSuffixIcon(),
        onTap: () async {
          _onSubscriptionTypeTextFieldTapped();
          setState(() {});
        },
      );

  Widget _buildSubscriptionTypeSuffixIcon() =>
      const Icon(Icons.keyboard_arrow_down_outlined,
          color: AppColors.kSecondaryTextColor);

  bool _isProceedButtonEnabled(BillersState billerState) =>
      _billers != null && formKey.currentState?.validate() == true;

  void _onProviderTextFieldTapped() {
    BottomSheets.showSheet(child: const ProvidersSheet()).then((response) {
      if (response != null) {
        _billers = response;
        providerController.text = response.name ?? '';
        subscriptionTypeController.clear();
        _cableService = null;
        _billersNotifier.resetCustomerInfo();
        context.nextFocus(subscriptionTypeFocusNode);

        _billersNotifier.billersDiscounts(
            parameter: BillersCategory.education,
            operatorId: _billers?.operatorpublicid,
            cancelToken: _cancelToken);
      }
    });
  }

  Future<void> _onSubscriptionTypeTextFieldTapped() async {
    if (_billers == null) return;

    final response = await BottomSheets.showSheet(
      child: ProviderServiceSheet(
        billersDto: BillersDto(
            cableId: _billers?.operatorpublicid ?? '',
            path: BillersCategory.education),
      ),
    ) as CableService?;

    if (response != null) {
      _cableService = response;
      subscriptionTypeController.text = response.name ?? '';
      amountController.text =
          _formatter.format(_cableService?.price.toString() ?? '');
    }
    setState(() {});
  }

  Future<void> _submitForActualUser(
      {String? pin, required BillersState billerState}) async {
    final MerchantState merchantState = ref.watch(merchantsNotifierProvider);

    final Discounts? discounts = billerState.discounts?.discount;

    final bool isAppliedDiscount = ((billerState.discounts != null) &&
        _formatter.getUnformattedValue() >= (discounts?.threshold ?? 0));

    final amount = discounts?.payment(_formatter.getUnformattedValue()) ??
        _formatter.getUnformattedValue();

    await _billersNotifier.purchaseService(
        mobileDto: MobileDto(
          isMerchantPayment: true,
          amount: _formatter.getUnformattedValue(),
          merchantAccount: _billers?.operatorpublicid,
          merchantReferenceNumber: merchantState.getMerchant?.referenceNumber,
          merchantService: _cableService?.code,
          transactionPin: pin,
          subCategory: _billers?.displayName,
          category: ServiceCategory.education,
          applyDiscount: isAppliedDiscount,
        ),
        onSuccess: () => PageRouter.pushNamed(Routes.successState,
            args: SuccessStateArguments(
                title: AppString.rechargeSuccessful,
                message: AppString.completedAirtimePurchase,
                btnTitle: AppString.complete,
                tap: () => PageRouter.popToRoot(Routes.dashboardView))),
        cancelToken: _cancelToken);
  }

  Future<void> _submitForGuest(dynamic feedback) async {
    final guest = ref.watch(paramModule);
    final MerchantState merchantState = ref.watch(merchantsNotifierProvider);
    final bool isCardPayment =
        (feedback is DebitCardDto? && feedback?.bank == null);

    _billersNotifier.purchaseServiceForGuest(
        isCardPayment: isCardPayment,
        mobileDto: MobileDto(
            isMerchantPayment: true,
            amount: _formatter.getUnformattedValue(),
            merchantAccount: _billers?.operatorpublicid,
            merchantReferenceNumber: merchantState.getMerchant?.referenceNumber,
            makeMerchantServiceArray: false,
            merchantService: _cableService?.code,
            subCategory: _billers?.displayName,
            category: ServiceCategory.education,
            currency: Currency.NGN,
            email: guest.customerEmail,
            payer: Payer(email: guest.customerEmail, name: guest.customerName),
            bank: feedback?.bank),
        cancelToken: _cancelToken);
  }

  Future<void> _handlePayment(BillersState billerState) async {
    final Discounts? discounts = billerState.discounts?.discount;
    final envs = envDao.envs;

    final bool isAppliedDiscount = ((discounts != null) &&
        (_cableService?.price ?? 0) >= (discounts.threshold));

    final amount = billerState.isGuest
        ? _formatter.getUnformattedValue()
        : discounts?.payment(_formatter.getUnformattedValue()) ??
            _formatter.getUnformattedValue();

    final String fee =
        envs.firstWhereOrNull((env) => env.name == Fees.educationFee)?.value ??
            '0';

    final feedback = await BottomSheets.showSheet(
      child: SummaryWidget(
        summaryDto: SummaryDto(
            isGuest: billerState.isGuest,
            title: _billers?.name,
            imageUrl: _billers?.logoUrl,
            recipient: _billers?.displayName,
            amount: amount,
            cashBack: isAppliedDiscount ? discounts.discountValue : 0,
            fee: num.parse(fee)),
        biometricVerification: (pin) {
          _submitForActualUser(pin: pin, billerState: billerState);
          return;
        },
      ),
    );

    if (feedback != null) {
      if (billerState.isGuest) {
        // Handle for guest
        // You can add guest-specific logic here
        _submitForGuest(feedback);
      } else if (feedback is bool && feedback) {
        // Handle for actual user
        final pin = await BottomSheets.showSheet(
          child: const PinConfirmationSheet(),
        ) as String?;
        if (pin != null) {
          _submitForActualUser(pin: pin, billerState: billerState);
        }
      }
    }
  }
}
