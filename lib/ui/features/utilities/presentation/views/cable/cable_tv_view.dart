import 'package:Pouchers/ui/features/merchant/domain/model/get_merchants.dart';
import 'package:Pouchers/utils/debouncer.dart';
import 'package:Pouchers/utils/extension.dart';
import 'package:cached_network_image/cached_network_image.dart';
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
import '../../../../../../app/core/skeleton/widgets.dart';
import '../../../../../../utils/field_validator.dart';
import '../../../../../common/app_colors.dart';
import '../../../../../common/app_images.dart';
import '../../../../../common/app_strings.dart';
import '../../../../../widgets/bottom_sheet.dart';
import '../../../../../widgets/dialog/bottom_sheet.dart';
import '../../../../../widgets/edit_text_field_with.dart';
import '../../../../../widgets/elevated_button_widget.dart';
import '../../../../../widgets/gap.dart';
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
import '../../notifier/billers_notifier.dart';
import '../../state/billers_state.dart';
import '../sheet/provider_services_sheets.dart';
import '../sheet/providers_sheets.dart';
import '../sheet/summary_sheet.dart';
import '../widget/scheduling_widget.dart';
import 'cable_tv_view.form.dart';
import 'skeleton/cable_skeleton.dart';

@FormView(fields: [
  FormTextField(name: 'provider'),
  FormTextField(name: 'number'),
  FormTextField(name: 'subscriptionType'),
])
class CableTvView extends ConsumerStatefulWidget {
  const CableTvView({super.key});

  @override
  ConsumerState<CableTvView> createState() => _CableTvViewState();
}

class _CableTvViewState extends ConsumerState<CableTvView> with $CableTvView {
  late BillersNotifier _billersNotifier;
  late MerchantsNotifier _merchantsNotifier;
  final CancelToken _cancelToken = CancelToken();
  final FlutterContactPicker _contactPicker = FlutterContactPicker();
  final _debouncer = Debouncer();

  Billers? _billers;
  CableService? _cableService;

  bool _beneficiary = false;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

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

    await _billersNotifier.billers(BillersCategory.cable, _cancelToken);
    await _billersNotifier.billersDiscounts(
        BillersCategory.cable, _cancelToken);
    await _merchantsNotifier.getMerchants(_cancelToken);
  }

  @override
  Widget build(BuildContext context) {
    final billerState = ref.watch(billersNotifierProvider);
    final getMerchantState = ref.watch(merchantsNotifierProvider);
    return Scaffold(
      appBar: AppBar(title: Text(AppString.cableTv)),
      body: SafeArea(
        minimum: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        child: Skeleton(
          isLoading: billerState.isBusy || getMerchantState.isBusy,
          skeleton: const CableSkeleton(),
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
                      const Gap(height: 24),
                      _buildSubscriptionTypeTextField(),
                      const Gap(height: 24),
                      _buildSmartCardNumberTextField(
                          billerState, getMerchantState.getMerchant),
                      const Gap(height: 8),
                      _buildCustomerInfoText(billerState),
                      const Gap(height: 24),
                      if (!billerState.isGuest)
                        SchedulingWidget(
                            title: AppString.scheduleCableTvHint,
                            description: AppString.scheduleCableTvHint1,
                            tapped: () => PageRouter.pushNamed(
                                Routes.scheduleCableTvView))
                    ],
                  ),
                ),
                if (!billerState.isGuest) _buildBeneficiarySwitch(),
                const Gap(height: 44),
                ElevatedButtonWidget(
                  title: AppString.proceed,
                  loading: billerState.isPurchasing,
                  onPressed: _isProceedButtonEnabled(billerState)
                      ? () => _handlePayment(
                          billerState, getMerchantState.getMerchant)
                      : null,
                ),
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

  Widget _buildSubscriptionTypeSuffixIcon() => _cableService == null
      ? const Icon(Icons.keyboard_arrow_down_outlined,
          color: AppColors.kSecondaryTextColor)
      : Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (_cableService != null)
              Flexible(
                child: Text(
                  _cableService?.price.toNaira ?? '',
                  style: context.titleLarge?.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: AppColors.kPurpleColor,
                  ),
                ),
              ),
            const Icon(Icons.keyboard_arrow_down_outlined,
                color: AppColors.kSecondaryTextColor),
            if (_cableService != null) const Gap(width: 16),
          ],
        );

  Widget _buildSmartCardNumberTextField(
          BillersState billerState, GetMerchant? getMerchant) =>
      EditTextFieldWidget(
        title: AppString.smartCardNumber,
        controller: numberController,
        focusNode: numberFocusNode,
        keyboardType: TextInputType.number,
        readOnly: billerState.isPurchasing ||
            _billers == null ||
            _cableService == null,
        onFieldSubmitted: (_) {},
        onChanged: (value) => _debouncer.run(() {
          if (value.length >= 10) _validateCustomer(getMerchant);
        }),
        validator: FieldValidator.validateSmartCard(cardLength: 10),
        inputFormatters: [context.digitsOnly],
        suffixIcon: CupertinoButton(
          padding: EdgeInsets.zero,
          child: SvgPicture.asset(AppImage.contactBook, fit: BoxFit.scaleDown),
          onPressed: () async {
            _onContactBookIconPressed(billerState, getMerchant);
            setState(() {});
          },
        ),
      );

  Widget _buildCustomerInfoText(BillersState billerState) => Align(
        alignment: Alignment.centerLeft,
        child: billerState.isValidatingCustomerInfo
            ? const CupertinoActivityIndicator()
            : billerState.validateCustomerInfo == null
                ? const SizedBox.shrink()
                : Text(
                    'Account name: ${billerState.validateCustomerInfo?.customerName ?? ''}',
                    style: context.headlineMedium
                        ?.copyWith(color: AppColors.kIconGrey),
                  ),
      );

  Widget _buildBeneficiarySwitch() => Row(
        children: [
          Expanded(
            child: Text(
              AppString.saveBeneficiary,
              style: PageRouter.globalContext.headlineMedium
                  ?.copyWith(fontSize: 16, color: AppColors.kIconGrey),
            ),
          ),
          const Gap(width: 16),
          Transform.scale(
            scale: .7,
            child: Switch.adaptive(
              activeColor: AppColors.kPrimaryColor,
              value: _beneficiary,
              onChanged: (value) =>
                  setState(() => _beneficiary = !_beneficiary),
            ),
          ),
        ],
      );

  bool _isProceedButtonEnabled(BillersState billerState) =>
      _billers != null &&
      billerState.validateCustomerInfo?.customerName != null &&
      formKey.currentState?.validate() == true;

  Future<void> _handlePayment(
      BillersState billerState, GetMerchant? getMerchant) async {
    final feedback = await Sheets.showSheet(
      child: SummaryWidget(
        summaryDto: SummaryDto(
          isGuest: billerState.isGuest,
          recipientWidget: _buildRecipientWidget(billerState),
          title: _billers?.name,
          imageUrl: _billers?.logoUrl,
          recipient: numberController.text,
          amount: _cableService?.price ?? 0,
          cashBack: 0,
          fee: 0,
        ),
        biometricVerification: (pin) {
          _submitForActualUser(pin: pin, getMerchant: getMerchant);
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
          _submitForActualUser(pin: pin, getMerchant: getMerchant);
        }
      }
    }
  }

  Future<void> _submitForGuest(dynamic feedback) async {
    final guest = ref.watch(paramModule);
    final bool isCardPayment =
        (feedback is DebitCardDto? && feedback?.bank == null);

    _billersNotifier.purchaseServiceForGuest(
        isCardPayment: isCardPayment,
        mobileDto: MobileDto(
            isMerchantPayment: true,
            currency: Currency.NGN,
            email: guest.customerEmail,
            payer: Payer(email: guest.customerEmail, name: guest.customerName),
            amount: _cableService?.price,
            merchantAccount: _billers?.operatorpublicid,
            merchantReferenceNumber: ref
                .watch(billersNotifierProvider)
                .cableService
                ?.referenceNumber,
            makeMerchantServiceArray: false,
            merchantService: _cableService?.code,
            subCategory: _billers?.displayName,
            category: ServiceCategory.cable,
            bank: feedback?.bank),
        cancelToken: _cancelToken);
  }

  Widget _buildRecipientWidget(BillersState billerState) => Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            numberController.text,
            style: context.titleLarge?.copyWith(
                color: AppColors.kPrimaryColor, fontWeight: FontWeight.w700),
            textAlign: TextAlign.right,
          ),
          Text(
            billerState.validateCustomerInfo?.customerName ?? '',
            style: context.titleLarge?.copyWith(
                color: AppColors.kPrimaryColor,
                fontWeight: FontWeight.w400,
                fontSize: 12),
            textAlign: TextAlign.right,
          ),
        ],
      );

  Future<void> _submitForActualUser(
      {String? pin, required GetMerchant? getMerchant}) async {
    await _billersNotifier.purchaseService(
      mobileDto: MobileDto(
        isMerchantPayment: true,
        amount: _cableService?.price,
        merchantAccount: _billers?.operatorpublicid,
        merchantReferenceNumber: getMerchant?.referenceNumber,
        merchantService: _cableService?.code,
        transactionPin: pin,
        subCategory: _billers?.displayName,
        category: ServiceCategory.cable,
        applyDiscount: false,
      ),
      onSuccess: () => PageRouter.pushNamed(
        Routes.successState,
        args: SuccessStateArguments(
          title: AppString.rechargeSuccessful,
          message: AppString.completedCablePurchase,
          btnTitle: AppString.complete,
          tap: () => PageRouter.popToRoot(Routes.cableTvView),
        ),
      ),
      cancelToken: _cancelToken,
    );
  }

  Future<void> _validateCustomer(GetMerchant? getMerchant) async {
    await _billersNotifier.validateCustomerInfo(
      biller: BillersDto(
        merchantAccount: _billers?.operatorpublicid,
        billersCategory: BillersCategory.cable,
        merchantReferenceNumber: getMerchant?.referenceNumber,
        merchantServiceProductCode: _cableService?.code,
      ),
      cancelToken: _cancelToken,
    );
  }

  void _onProviderTextFieldTapped() {
    BottomSheets.showSheet(child: const ProvidersSheet()).then((response) {
      if (response != null) {
        _billers = response;
        providerController.text = response.name ?? '';
        subscriptionTypeController.clear();
        numberController.clear();
        _cableService = null;
        _billersNotifier.resetCustomerInfo();
        context.nextFocus(subscriptionTypeFocusNode);
      }
    });
  }

  Future<void> _onSubscriptionTypeTextFieldTapped() async {
    if (_billers == null) return;

    BottomSheets.showSheet(
            child: ProviderServiceSheet(
                billersDto: BillersDto(
                    cableId: _billers?.operatorpublicid ?? '',
                    path: BillersCategory.cable)))
        .then((response) {
      if (response != null) {
        _cableService = response;
        subscriptionTypeController.text = response.name ?? '';
        context.nextFocus(numberFocusNode);
      }
    });

    setState(() {});
  }

  void _onContactBookIconPressed(
      BillersState billerState, GetMerchant? getMerchant) {
    if (billerState.isPurchasing || _cableService == null) return;

    _contactPicker.selectContact().then((contact) {
      if (contact != null && (contact.phoneNumbers?.isNotEmpty ?? false)) {
        numberController.text =
            contact.phoneNumbers?.first.formatCountryCode ?? '';
        context.nextFocus(subscriptionTypeFocusNode);

        _validateCustomer(getMerchant);
      }
    });
  }
}
