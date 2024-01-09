import 'package:Pouchers/app/core/skeleton/widgets.dart';
import 'package:Pouchers/ui/features/dashboard/views/card/domain/enum/currency.dart';
import 'package:Pouchers/ui/features/dashboard/views/card/presentation/notifier/module/module.dart';
import 'package:Pouchers/ui/features/payment/domain/dto/debit_card_dto.dart';
import 'package:Pouchers/ui/features/utilities/domain/dto/mobile_dto.dart';
import 'package:Pouchers/ui/features/utilities/domain/dto/summary_dto.dart';
import 'package:Pouchers/ui/features/utilities/domain/enum/billers_category.dart';
import 'package:Pouchers/ui/features/utilities/presentation/state/billers_state.dart';
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
import '../../../../authentication/presentation/view/pin/sheet/pin_confirmation_sheet.dart';
import '../../../domain/enum/service_category.dart';
import '../../../domain/model/airtime_top_deals.dart';
import '../../../domain/model/billers.dart';
import '../../notifier/billers_notifier.dart';
import '../sheet/summary_sheet.dart';
import '../widget/scheduling_widget.dart';
import '../widget/utility_icon.dart';
import 'airtime_view.form.dart';
import 'skeleton/airtime_skeleton.dart';
import 'widget/top_deal_widget.dart';

@FormView(fields: [FormTextField(name: 'phone'), FormTextField(name: 'amount')])
class AirtimeView extends ConsumerStatefulWidget {
  const AirtimeView({super.key});

  @override
  ConsumerState<AirtimeView> createState() => _AirtimeViewState();
}

class _AirtimeViewState extends ConsumerState<AirtimeView> with $AirtimeView {
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
        ..billers(BillersCategory.airtime, _cancelToken)
        ..billersDiscounts(BillersCategory.airtime, _cancelToken);
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
      appBar: AppBar(title: Text(AppString.airtime)),
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

                              setState(() => _billers = biller);
                            },
                          ));
                        }).toList(),
                      ),
                      const Gap(height: 24),
                      Text(AppString.topDeals,
                          style: context.titleLarge?.copyWith(fontSize: 12.sp)),
                      const Gap(height: 12),
                      TopDealsWidget(callback: (topDeal) {
                        if (billerState.isPurchasing) return;

                        if (billerState.isGuest) {
                          BottomSheets.showAlertDialog(
                              child: const GuestDiscountSheet());
                          return;
                        }

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
                        onFieldSubmitted: (_) {},
                        validator: FieldValidator.validateAmount(),
                        prefix: IconButton(
                            onPressed: () {},
                            icon: Text(AppString.nairaSymbol,
                                style: context.headlineMedium
                                    ?.copyWith(fontSize: 16))),
                        inputFormatters: [context.digitsOnly, _formatter],
                      ),
                      const Gap(height: 24),
                      if (!billerState.isGuest)
                        SchedulingWidget(
                            title: AppString.scheduleAirtimeHint,
                            description: AppString.scheduleAirtimeHint1,
                            tapped: () => PageRouter.pushNamed(
                                Routes.scheduledAirtimeView))
                    ],
                  ),
                ),
                ElevatedButtonWidget(
                    title: AppString.proceed,
                    loading: billerState.isPurchasing,
                    onPressed: _billers == null
                        ? null
                        : () async {
                            if (!formKey.currentState!.validate()) return;

                            if (billerState.isGuest &&
                                _formatter.getUnformattedValue() > 10000) {
                              BottomSheets.showAlertDialog(
                                  child: const GuestMaximumSheet());
                              return;
                            }
                            await _handlePayment(billerState);
                          }),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _submitForActualUser({String? pin}) =>
      _billersNotifier.purchaseService(
          mobileDto: MobileDto(
              category: ServiceCategory.airtime,
              subCategory: _billers?.displayName,
              amount: _formatter.getUnformattedValue(),
              destinationPhoneNumber: phoneController.text,
              mobileOperatorPublicId: _billers?.operatorpublicid,
              applyDiscount: false,
              transactionPin: pin),
          onSuccess: () => PageRouter.pushNamed(Routes.successState,
              args: SuccessStateArguments(
                  title: AppString.rechargeSuccessful,
                  message: AppString.completedAirtimePurchase,
                  btnTitle: AppString.complete,
                  tap: () => PageRouter.popToRoot(Routes.airtimeView))),
          cancelToken: _cancelToken);

  Future<void> _submitForGuest(dynamic feedback) async {
    final guest = ref.watch(paramModule);
    final bool isCardPayment =
        (feedback is DebitCardDto? && feedback?.bank == null);

    _billersNotifier.purchaseServiceForGuest(
        isCardPayment: isCardPayment,
        mobileDto: MobileDto(
            category: ServiceCategory.airtime,
            subCategory: _billers?.displayName,
            currency: Currency.NGN,
            email: guest.customerEmail,
            payer: Payer(email: guest.customerEmail, name: guest.customerName),
            amount: _formatter.getUnformattedValue(),
            phoneNumber: phoneController.text,
            mobileOperatorPublicId: _billers?.operatorpublicid,
            bank: feedback?.bank),
        cancelToken: _cancelToken);
  }

  Future<void> _handlePayment(BillersState billerState) async {
    final feedback = await BottomSheets.showSheet(
      child: SummaryWidget(
        summaryDto: SummaryDto(
          isGuest: billerState.isGuest,
          title: AppString.airtime,
          imageUrl: _billers?.logoUrl,
          recipient: phoneController.text,
          recipientWidget: Text(
            phoneController.text,
            style: context.titleLarge?.copyWith(
              color: AppColors.kPurple100,
              fontWeight: FontWeight.w700,
            ),
            textAlign: TextAlign.right,
          ),
          amount: _formatter.getUnformattedValue(),
          cashBack: _airtimeTopDeals?.cashBack,
          fee: 0,
        ),
        biometricVerification: (pin) {
          _submitForActualUser(pin: pin);
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
        if (pin != null) _submitForActualUser(pin: pin);
      }
    }
  }
}
