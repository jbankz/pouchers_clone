import 'package:Pouchers/ui/common/app_colors.dart';
import 'package:Pouchers/ui/features/authentication/presentation/view/pin/sheet/pin_confirmation_sheet.dart';
import 'package:Pouchers/ui/features/profile/data/dao/wallet_dao.dart';
import 'package:Pouchers/ui/features/voucher/domain/dto/voucher_dto.dart';
import 'package:Pouchers/ui/features/voucher/presentation/notifier/vouchers_notifier.dart';
import 'package:Pouchers/ui/widgets/dialog/bottom_sheet.dart';
import 'package:Pouchers/ui/widgets/elevated_button_widget.dart';
import 'package:Pouchers/ui/widgets/gap.dart';
import 'package:Pouchers/utils/extension.dart';
import 'package:dio/dio.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked_annotations.dart';

import '../../../../../utils/field_validator.dart';
import '../../../../../utils/formatters/currency_formatter.dart';
import '../../../../common/app_strings.dart';
import '../../../../widgets/edit_text_field_with.dart';
import '../../../profile/presentation/views/biometric/biometric_verification_view.dart';
import '../../../profile/presentation/views/wallet/widget/balance_indicator_widget.dart';
import 'buy_voucher_view.form.dart';

@FormView(fields: [FormTextField(name: 'amount')])
class BuyVoucherView extends ConsumerStatefulWidget {
  const BuyVoucherView({super.key});

  @override
  ConsumerState<BuyVoucherView> createState() => _BuyVoucherViewState();
}

class _BuyVoucherViewState extends ConsumerState<BuyVoucherView>
    with $BuyVoucherView {
  final formKey = GlobalKey<FormState>();
  final CurrencyFormatter _formatter = CurrencyFormatter(
      enableNegative: false, name: '', symbol: '', decimalDigits: 0);

  late VouchersNotifier _vouchersNotifier;
  final CancelToken _cancelToken = CancelToken();

  num _amount = 0;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _initializeNotifier());
  }

  @override
  void dispose() {
    super.dispose();
    _cancelToken.cancel();
    disposeForm();
  }

  void _initializeNotifier() {
    _vouchersNotifier = ref.read(vouchersNotifierProvider.notifier);
  }

  @override
  Widget build(BuildContext context) {
    final voucherState = ref.watch(vouchersNotifierProvider);
    final topDeals = voucherState.vouchersTopDeals;
    return Scaffold(
      appBar: AppBar(title: Text(AppString.buyVoucher)),
      body: SafeArea(
        minimum: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  keyboardDismissBehavior:
                      ScrollViewKeyboardDismissBehavior.onDrag,
                  child: Column(
                    children: [
                      Text(AppString.selectAmount,
                          style: context.headlineMedium?.copyWith(
                              color: AppColors.kIconGrey,
                              fontWeight: FontWeight.w400,
                              fontSize: 14)),
                      const Gap(height: 16),
                      GridView.builder(
                          primary: false,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: topDeals.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  mainAxisSpacing: 14.w,
                                  crossAxisSpacing: 16.h,
                                  childAspectRatio: 1.9,
                                  crossAxisCount: 3),
                          itemBuilder: (_, index) {
                            final deal = topDeals[index];
                            return _buildActionButton(
                                context: context,
                                title: deal.toNaira,
                                isSelected: _amount == deal,
                                tapped: () => setState(() {
                                      _amount = deal;
                                      amountController.text =
                                          _formatter.format(_amount.toString());
                                    }));
                          }),
                      const Gap(height: 24),
                      EditTextFieldWidget(
                        title: AppString.amount,
                        label: AppString.amountInstruction,
                        controller: amountController,
                        focusNode: amountFocusNode,
                        readOnly: voucherState.isBusy,
                        keyboardType: TextInputType.number,
                        validator: FieldValidator.validateAmount(minAmount: 10),
                        onChanged: (_) => setState(() => _amount = 0),
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
              ),
              const Gap(height: 16),
              BalanceIndicatorWidget(amount: _formatter.getUnformattedValue()),
              const Gap(height: 16),
              BiometricVerification(
                  isNotAffordable: _formatter.getUnformattedValue() >
                      (num.parse(walletDao.wallet.balance ?? '0')),
                  popScreenWhenVerificationCompletes: false,
                  callback: (pin) => _submitRequest(pin)),
              ElevatedButtonWidget(
                  title: AppString.buyVoucher,
                  loading: voucherState.isBusy,
                  onPressed: _formatter.getUnformattedValue() >
                          (num.parse(walletDao.wallet.balance ?? '0'))
                      ? null
                      : () {
                          if (!_formKey.currentState!.validate()) return;

                          BottomSheets.showSheet(
                                  child: const PinConfirmationSheet())
                              .then((value) {
                            if (value != null) _submitRequest(value);
                          });
                        })
            ],
          ),
        ),
      ),
    );
  }

  InkWell _buildActionButton(
          {bool isSelected = false,
          required BuildContext context,
          required String title,
          required Function() tapped}) =>
      InkWell(
        onTap: tapped,
        borderRadius: BorderRadius.circular(10.r),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 2.h),
          width: double.infinity,
          decoration: BoxDecoration(
              border: Border.all(
                  color: isSelected
                      ? AppColors.kPurple100
                      : AppColors.kLightPurple,
                  width: 1.w),
              borderRadius: BorderRadius.circular(10.r)),
          child: Stack(
            children: [
              Align(
                child: Text(title,
                    style: context.headlineMedium?.copyWith(
                        color: AppColors.kSecondaryTextColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 16)),
              ),
              if (isSelected)
                Container(
                    alignment: Alignment.bottomRight,
                    child: Icon(Icons.check_circle,
                        color: AppColors.kPurpleColor, size: 15.w))
            ],
          ),
        ),
      );

  void _submitRequest(String pin) {
    if (!_formKey.currentState!.validate()) return;

    _vouchersNotifier.buyVoucher(
        VoucherDto(
            amount: _formatter.getUnformattedValue(), transactionPin: pin),
        cancelToken: _cancelToken);
  }
}
