import 'package:Pouchers/app/core/skeleton/widgets.dart';
import 'package:Pouchers/ui/features/dashboard/views/card/presentation/notifier/module/module.dart';
import 'package:Pouchers/ui/features/merchant/presentation/notifier/merchants_notifier.dart';
import 'package:Pouchers/ui/features/utilities/domain/dto/mobile_dto.dart';
import 'package:Pouchers/ui/features/utilities/domain/dto/summary_dto.dart';
import 'package:Pouchers/ui/features/utilities/domain/enum/billers_category.dart';
import 'package:Pouchers/ui/features/utilities/domain/model/discounts.dart';
import 'package:Pouchers/utils/debouncer.dart';
import 'package:Pouchers/utils/extension.dart';
import 'package:cached_network_image/cached_network_image.dart';
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
import '../../../../../../utils/formatters/currency_formatter.dart';
import '../../../../../common/app_colors.dart';
import '../../../../../common/app_images.dart';
import '../../../../../common/app_strings.dart';
import '../../../../../widgets/dialog/bottom_sheet.dart';
import '../../../../../widgets/dialog/guest_maximum_modal_sheet.dart';
import '../../../../../widgets/dialog/guest_modal_sheet.dart';
import '../../../../../widgets/edit_text_field_with.dart';
import '../../../../../widgets/elevated_button_widget.dart';
import '../../../../../widgets/gap.dart';
import '../../../../admin/data/dao/env_dao.dart';
import '../../../../admin/domain/enum/fees.dart';
import '../../../../authentication/presentation/view/pin/sheet/pin_confirmation_sheet.dart';
import '../../../../dashboard/views/card/domain/enum/currency.dart';
import '../../../../payment/domain/dto/debit_card_dto.dart';
import '../../../domain/dto/billers_dto.dart';
import '../../../domain/enum/service_category.dart';
import '../../../domain/model/billers.dart';
import '../../../domain/model/cable_service.dart';
import '../../../domain/model/top_deals_model.dart';
import '../../notifier/billers_notifier.dart';
import '../../state/billers_state.dart';
import '../sheet/provider_services_sheets.dart';
import '../sheet/providers_sheets.dart';
import '../sheet/summary_sheet.dart';
import '../widget/top_deal_widget.dart';
import 'betting_view.form.dart';
import 'skeleton/betting_skeleton.dart';

@FormView(fields: [
  FormTextField(name: 'provider'),
  FormTextField(name: 'number'),
  FormTextField(name: 'amount'),
  FormTextField(name: 'subscriptionType')
])
class BettingView extends ConsumerStatefulWidget {
  const BettingView({super.key});

  @override
  ConsumerState<BettingView> createState() => _BettingViewState();
}

class _BettingViewState extends ConsumerState<BettingView> with $BettingView {
  late BillersNotifier _billersNotifier;
  late MerchantsNotifier _merchantsNotifier;
  final CancelToken _cancelToken = CancelToken();
  final FlutterContactPicker _contactPicker = FlutterContactPicker();

  Billers? _billers;
  final _debouncer = Debouncer();
  CableService? _cableService;
  MobileDto? _mobileDto;

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

  final formKey = GlobalKey<FormState>();
  final CurrencyFormatter _formatter = CurrencyFormatter(
      enableNegative: false, name: '', symbol: '', decimalDigits: 0);

  Future<void> _initializeNotifiers() async {
    _billersNotifier = ref.read(billersNotifierProvider.notifier);
    _merchantsNotifier = ref.read(merchantsNotifierProvider.notifier);

    await _billersNotifier.billers(BillersCategory.betting, _cancelToken);
    await _merchantsNotifier.getMerchants(_cancelToken);
  }

  @override
  Widget build(BuildContext context) {
    final billerState = ref.watch(billersNotifierProvider);
    final discountData = billerState.discounts;

    final getMerchantState = ref.watch(merchantsNotifierProvider);

    return Scaffold(
      appBar: AppBar(title: Text(AppString.betting)),
      body: SafeArea(
        minimum: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        child: Skeleton(
          isLoading: billerState.isBusy || getMerchantState.isBusy,
          skeleton: const BettingSkeleton(),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                Expanded(
                  child: ListView(
                    keyboardDismissBehavior:
                        ScrollViewKeyboardDismissBehavior.onDrag,
                    children: [
                      _buildProviderTextField(billerState),
                      const Gap(height: 24),
                      _buildSubscriptionTypeTextField(),
                      const Gap(height: 24),
                      _buildSmartCardNumberTextField(billerState),
                      TopDealsWidget(
                          category: BillersCategory.betting,
                          filteredServices:
                              (discountData?.discount?.topDeals ?? [])
                                  .map((topDeal) =>
                                      TopDeals(price: topDeal.servicePrice))
                                  .toList(),
                          callback: (topDeal) {
                            if (billerState.isPurchasing) return;

                            if (billerState.isGuest) {
                              BottomSheets.showAlertDialog(
                                  child: const GuestDiscountSheet());
                              return;
                            }

                            amountController.text = _formatter
                                .formatDouble(topDeal.price.toDouble());

                            setState(() {});
                          }),
                      const Gap(height: 24),
                      EditTextFieldWidget(
                        title: AppString.amount,
                        label: AppString.amountInstruction,
                        controller: amountController,
                        focusNode: amountFocusNode,
                        readOnly: billerState.isPurchasing,
                        keyboardType: TextInputType.number,
                        validator: FieldValidator.validateAmount(),
                        prefix: IconButton(
                            onPressed: () {},
                            icon: Text(AppString.nairaSymbol,
                                style: context.headlineMedium
                                    ?.copyWith(fontSize: 16))),
                        inputFormatters: [context.digitsOnly, _formatter],
                      ),
                    ],
                  ),
                ),
                const Gap(height: 16),
                ElevatedButtonWidget(
                    title: AppString.proceed,
                    loading: billerState.isPurchasing,
                    onPressed: (_billers == null ||
                            billerState.validateCustomerInfo?.customerName ==
                                null)
                        ? null
                        : () async {
                            if (!formKey.currentState!.validate()) return;

                            if (billerState.isGuest &&
                                amountController.text.replaceComma > 10000) {
                              BottomSheets.showAlertDialog(
                                  child: const GuestMaximumSheet());
                              return;
                            }

                            await _handlePayment(billerState);
                          })
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSmartCardNumberTextField(BillersState billerState) => Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          EditTextFieldWidget(
            title: AppString.accountId,
            label: AppString.accountIdInstr,
            controller: numberController,
            focusNode: numberFocusNode,
            keyboardType: TextInputType.number,
            readOnly: billerState.isPurchasing || _billers == null,
            onFieldSubmitted: (_) {},
            validator: FieldValidator.validateInt(),
            inputFormatters: [context.digitsOnly],
            onChanged: (_) => _debouncer.run(() => _validateCustomer()),
            suffixIcon: CupertinoButton(
              padding: EdgeInsets.zero,
              child:
                  SvgPicture.asset(AppImage.contactBook, fit: BoxFit.scaleDown),
              onPressed: () async {
                _onContactBookIconPressed(billerState);
                setState(() {});
              },
            ),
          ),
          const Gap(height: 8),
          _buildCustomerInfoText(billerState),
        ],
      );

  Widget _buildCustomerInfoText(BillersState billerState) => Align(
        alignment: Alignment.centerLeft,
        child: billerState.isValidatingCustomerInfo
            ? const CupertinoActivityIndicator()
            : billerState.validateCustomerInfo == null
                ? const SizedBox.shrink()
                : Text(
                    'Account name: ${billerState.validateCustomerInfo?.customerName?.titleCase ?? ''}',
                    style: context.headlineMedium
                        ?.copyWith(color: AppColors.kIconGrey),
                  ),
      );

  void _onContactBookIconPressed(BillersState billerState) {
    if (billerState.isPurchasing) return;

    _contactPicker.selectContact().then((contact) {
      if (contact != null && (contact.phoneNumbers?.isNotEmpty ?? false)) {
        numberController.text =
            contact.phoneNumbers?.first.formatCountryCode ?? '';
        context.nextFocus();
        _validateCustomer();
      }
    });
  }

  Future<void> _validateCustomer() async {
    await _billersNotifier.validateCustomerInfo(
      biller: BillersDto(
        merchantAccount: _billers?.operatorpublicid,
        billersCategory: BillersCategory.betting,
        merchantReferenceNumber: numberController.text,
        merchantServiceProductCode: _cableService?.code,
      ),
      cancelToken: _cancelToken,
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

  void _onProviderTextFieldTapped() =>
      BottomSheets.showSheet(child: const ProvidersSheet()).then((response) {
        if (response != null) {
          _billers = response;
          providerController.text = response.name ?? '';
          numberController.clear();
          _cableService == null;
          context.nextFocus();

          _billersNotifier.billersDiscounts(
              parameter: BillersCategory.betting,
              operatorId: _billers?.operatorpublicid,
              cancelToken: _cancelToken);
        }
      });

  Widget? _buildProviderPrefix() => _billers == null
      ? null
      : Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
          child: CachedNetworkImage(
              imageUrl: _billers?.logoUrl ?? '',
              height: 40.h,
              width: 40.w,
              errorWidget: (_, __, ___) => Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                            width: 1.w,
                            color: AppColors.kPrimaryColor.withOpacity(.30))),
                  )),
        );

  Future<void> _submitForActualUser(
      {String? pin, required BillersState billerState}) async {
    final Discounts? discounts = billerState.discounts?.discount;

    final bool isAppliedDiscount = (discounts != null &&
        amountController.text.replaceComma >= discounts.threshold);

    final mobileDto = MobileDto(
        isMerchantPayment: true,
        category: ServiceCategory.betting,
        merchantAccount: _billers?.operatorpublicid,
        merchantService: _cableService?.code,
        merchantReferenceNumber: numberController.text,
        subCategory: _billers?.displayName,
        amount: amountController.text.replaceComma,
        applyDiscount: isAppliedDiscount,
        transactionPin: pin);

    _billersNotifier.purchaseService(
        mobileDto: mobileDto,
        onSuccess: () => PageRouter.pushNamed(Routes.successState,
            args: SuccessStateArguments(
                title: AppString.rechargeSuccessful,
                message: AppString.completedBettingPurchase,
                btnTitle: AppString.complete,
                tap: () => PageRouter.popToRoot(Routes.dashboardView))),
        cancelToken: _cancelToken);
  }

  Future<void> _submitForGuest(dynamic feedback) async {
    final bool isCardPayment =
        (feedback is DebitCardDto? && feedback?.bank == null);

    _mobileDto = _mobileDto?..bank = feedback?.bank;

    _billersNotifier.purchaseServiceForGuest(
        isCardPayment: isCardPayment,
        mobileDto: _mobileDto,
        cancelToken: _cancelToken);
  }

  Future<void> _handlePayment(BillersState billerState) async {
    final Discounts? discounts = billerState.discounts?.discount;
    final envs = envDao.envs;
    final merchantState = ref.watch(merchantsNotifierProvider);

    final bool isAppliedDiscount = ((discounts != null) &&
        amountController.text.replaceComma >= (discounts.threshold));

    final amount = billerState.isGuest
        ? amountController.text.replaceComma
        : discounts?.payment(amountController.text.replaceComma) ??
            amountController.text.replaceComma;

    final String fee = envs
            .firstWhereOrNull((env) => env.name == Fees.betWalletFundingFee)
            ?.value ??
        '0';

    final guest = ref.watch(paramModule);

    _mobileDto = MobileDto(
        isMerchantPayment: true,
        category: ServiceCategory.betting,
        merchantAccount: _billers?.operatorpublicid,
        makeMerchantServiceArray: false,
        merchantService: _cableService?.code,
        merchantReferenceNumber: merchantState.getMerchant?.referenceNumber,
        subCategory: _billers?.displayName,
        amount: amountController.text.replaceComma,
        currency: Currency.ngn,
        email: guest.customerEmail,
        payer: Payer(email: guest.customerEmail, name: guest.customerName));

    _billersNotifier.setMobileDataDto(_mobileDto);

    final feedback = await BottomSheets.showSheet(
      child: SummaryWidget(
        summaryDto: SummaryDto(
            isGuest: billerState.isGuest,
            title: _billers?.displayName,
            imageUrl: _billers?.logoUrl,
            recipient: numberController.text,
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

  Widget _buildSubscriptionTypeTextField() => EditTextFieldWidget(
        title: AppString.subscriptionType,
        label: AppString.subscriptionType,
        controller: subscriptionTypeController,
        focusNode: subscriptionTypeFocusNode,
        readOnly: true,
        keyboardType: TextInputType.text,
        onFieldSubmitted: (_) {},
        validator: FieldValidator.validateString(),
        suffixIcon: const Icon(Icons.keyboard_arrow_down_outlined,
            color: AppColors.kSecondaryTextColor),
        onTap: () async {
          _onSubscriptionTypeTextFieldTapped();
          setState(() {});
        },
      );

  Future<void> _onSubscriptionTypeTextFieldTapped() async {
    if (_billers == null) return;

    BottomSheets.showSheet(
            child: ProviderServiceSheet(
                billersDto: BillersDto(
                    cableId: _billers?.operatorpublicid ?? '',
                    path: BillersCategory.betting)))
        .then((response) {
      if (response != null) {
        _cableService = response;
        subscriptionTypeController.text = response.name ?? '';
        context.nextFocus(numberFocusNode);
      }
    });

    setState(() {});
  }
}
