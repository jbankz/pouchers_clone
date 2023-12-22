import 'package:Pouchers/app/core/skeleton/widgets.dart';
import 'package:Pouchers/ui/features/merchant/presentation/notifier/merchants_notifier.dart';
import 'package:Pouchers/ui/features/merchant/presentation/state/merchant_state.dart';
import 'package:Pouchers/ui/features/utilities/domain/dto/mobile_dto.dart';
import 'package:Pouchers/ui/features/utilities/domain/dto/summary_dto.dart';
import 'package:Pouchers/ui/features/utilities/domain/enum/billers_category.dart';
import 'package:Pouchers/ui/widgets/bottom_sheet.dart';
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
import '../../state/billers_state.dart';
import '../sheet/providers_sheets.dart';
import '../sheet/summary_sheet.dart';
import 'betting_view.form.dart';
import 'skeleton/betting_skeleton.dart';
import 'widget/top_deal_widget.dart';

@FormView(fields: [
  FormTextField(name: 'provider'),
  FormTextField(name: 'number'),
  FormTextField(name: 'amount')
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
  AirtimeTopDeals? _airtimeTopDeals;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _billersNotifier = ref.read(billersNotifierProvider.notifier)
        ..billers(BillersCategory.betting, _cancelToken)
        ..billersDiscounts(BillersCategory.betting, _cancelToken);
      _merchantsNotifier = ref.read(merchantsNotifierProvider.notifier)
        ..getMerchants(_cancelToken);
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
    final merchantState = ref.watch(merchantsNotifierProvider);
    return Scaffold(
      appBar: AppBar(title: Text(AppString.betting)),
      body: SafeArea(
        minimum: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        child: Skeleton(
          isLoading: billerState.isBusy,
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
                      _buildSmartCardNumberTextField(billerState),
                      const Gap(height: 24),
                      Text(AppString.topDeals,
                          style: context.titleLarge?.copyWith(fontSize: 12.sp)),
                      const Gap(height: 12),
                      TopDealsWidget(callback: (topDeal) {
                        if (billerState.isPurchasing) return;
                        _airtimeTopDeals = topDeal;
                        amountController.text =
                            _formatter.format(topDeal.amount.toString());
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
                    onPressed: _billers == null
                        ? null
                        : () async {
                            if (!formKey.currentState!.validate()) return;

                            final feedback = await Sheets.showSheet(
                                child: SummaryWidget(
                                    summaryDto: SummaryDto(
                                        title: _billers?.displayName,
                                        imageUrl: _billers?.logoUrl,
                                        recipient: numberController.text,
                                        amount:
                                            _formatter.getUnformattedValue(),
                                        cashBack: _airtimeTopDeals?.cashBack,
                                        fee: 0))) as bool?;

                            if (feedback != null && feedback) {
                              final pin = await BottomSheets.showSheet(
                                      child: const PinConfirmationSheet())
                                  as String?;
                              if (pin != null) _submit(pin, merchantState);
                            }
                          })
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSmartCardNumberTextField(BillersState billerState) =>
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
        suffixIcon: CupertinoButton(
          padding: EdgeInsets.zero,
          child: SvgPicture.asset(AppImage.contactBook, fit: BoxFit.scaleDown),
          onPressed: () async {
            _onContactBookIconPressed(billerState);
            setState(() {});
          },
        ),
      );

  Future<void> _submit(String pin, MerchantState merchantState) =>
      _billersNotifier.purchaseService(
          mobileDto: MobileDto(
              isMerchantPayment: true,
              category: ServiceCategory.betting,
              merchantAccount: _billers?.operatorpublicid,
              // merchantService: merchantState.getMerchant?.,
              merchantReferenceNumber:
                  merchantState.getMerchant?.referenceNumber,
              subCategory: _billers?.displayName,
              amount: _formatter.getUnformattedValue(),
              applyDiscount: false,
              transactionPin: pin),
          onSuccess: () => PageRouter.pushNamed(Routes.successState,
              args: SuccessStateArguments(
                  title: AppString.rechargeSuccessful,
                  message: AppString.completedBettingPurchase,
                  btnTitle: AppString.complete,
                  tap: () => PageRouter.popToRoot(Routes.bettingView))),
          cancelToken: _cancelToken);

  void _onContactBookIconPressed(BillersState billerState) {
    if (billerState.isPurchasing) return;

    _contactPicker.selectContact().then((contact) {
      if (contact != null && (contact.phoneNumbers?.isNotEmpty ?? false)) {
        numberController.text =
            contact.phoneNumbers?.first.formatCountryCode ?? '';
        context.nextFocus();
      }
    });
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
          context.nextFocus();
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
}
