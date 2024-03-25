import 'package:pouchers/app/app.router.dart';
import 'package:pouchers/app/core/router/page_router.dart';
import 'package:pouchers/ui/common/app_images.dart';
import 'package:pouchers/ui/common/app_strings.dart';
import 'package:pouchers/ui/features/profile/data/dao/wallet_dao.dart';
import 'package:pouchers/ui/features/profile/domain/dto/wallet_dto.dart';
import 'package:pouchers/ui/features/profile/presentation/notifier/wallet_notifier.dart';
import 'package:pouchers/ui/features/transfer/data/dao/local_bank_dao.dart';
import 'package:pouchers/ui/widgets/elevated_button_widget.dart';
import 'package:pouchers/utils/extension.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:stacked/stacked_annotations.dart';

import '../../../../../app/formatter/money_formatter.dart';
import '../../../../../utils/field_validator.dart';
import '../../../../common/app_colors.dart';
import '../../../../widgets/edit_text_field_with.dart';
import '../../../../widgets/gap.dart';
import '../../../profile/presentation/state/wallet_state.dart';
import '../../../profile/presentation/views/wallet/widget/balance_indicator_widget.dart';
import '../../domain/dto/confirm_transfer_money_dto.dart';
import '../../domain/model/attributes.dart';
import '../notifier/local_bank_notifier.dart';
import 'transfer_money_sheet.form.dart';

@FormView(
    fields: [FormTextField(name: 'bank'), FormTextField(name: 'accountNumber')])
class TransferMoneySheet extends ConsumerStatefulWidget {
  const TransferMoneySheet({super.key});

  @override
  ConsumerState<TransferMoneySheet> createState() => _TransferMoneySheetState();
}

class _TransferMoneySheetState extends ConsumerState<TransferMoneySheet>
    with $TransferMoneySheet, SingleTickerProviderStateMixin {
  late WalletNotifier _walletNotifier;

  final CancelToken _cancelToken = CancelToken();
  late AnimationController _animationController;

  int _uiIndex = 0;
  String _searchQuery = '';
  Attributes? _attributes;
  String _errorMessage = '';

  final MoneyMaskedTextController _moneyMaskedTextController =
      MoneyMaskedTextController(leftSymbol: '₦');

  void _setUiIndex(int value) => setState(() => _uiIndex = value);

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 250))
      ..forward();
    Future.microtask(() {
      _walletNotifier = ref.read(walletNotifierProvider.notifier);
      ref.read(localBankNotifierProvider.notifier).getLocalBanks(_cancelToken);
    });
  }

  @override
  void dispose() {
    super.dispose();
    _cancelToken.cancel();
    _animationController.dispose();
    disposeForm();
  }

  @override
  Widget build(BuildContext context) {
    final bankAccount = ref.watch(walletNotifierProvider);

    return SafeArea(
      minimum: EdgeInsets.only(
          left: 16.w,
          right: 16.w,
          bottom: MediaQuery.of(context).viewInsets.bottom),
      child: SizedBox(
        width: double.infinity,
        child: AnimatedSize(
          duration: const Duration(milliseconds: 250),
          child: SingleChildScrollView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            child: Column(
              children: [
                Text(AppString.transferMoney,
                    style: context.headlineMedium
                        ?.copyWith(fontWeight: FontWeight.w700, fontSize: 15)),
                const Gap(height: 36),
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 500),
                  transitionBuilder: (child, animation) =>
                      FadeTransition(opacity: animation, child: child),
                  child: switch (_uiIndex) {
                    0 => SlideTransition(
                        position: Tween<Offset>(
                                begin: const Offset(0, 1), end: Offset.zero)
                            .animate(_animationController),
                        child: FadeTransition(
                            opacity: _animationController,
                            child: _buildFirstUI(context)),
                      ),
                    1 => _buildSecondUI(context, bankAccount),
                    2 => _buildThirdUI(context),
                    int() => const SizedBox.shrink()
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  _buildThirdUI(BuildContext context) => ValueListenableBuilder<Box>(
      valueListenable: localBankDao.getListenable(),
      builder: (_, box, __) {
        final banks = localBankDao.retrieve(box, query: _searchQuery);
        return Column(
          children: [
            EditTextFieldWidget(
                title: AppString.selectBank,
                label: AppString.selectBankInst,
                onChanged: (value) => setState(() => _searchQuery = value)),
            const Gap(height: 16),
            SizedBox(
              height: context.height * .7,
              child: ListView.separated(
                  keyboardDismissBehavior:
                      ScrollViewKeyboardDismissBehavior.onDrag,
                  itemBuilder: (_, index) {
                    final bank = banks[index].attributes;
                    return GestureDetector(
                      onTap: () {
                        _attributes = bank;
                        _searchQuery = '';
                        accountNumberFocusNode.requestFocus();

                        _setUiIndex(1);
                      },
                      child: Text(bank?.name ?? '',
                          style: context.headlineMedium
                              ?.copyWith(fontWeight: FontWeight.w500)),
                    );
                  },
                  separatorBuilder: (_, __) => const Column(
                      children: [Gap(height: 14), Divider(), Gap(height: 14)]),
                  itemCount: banks.length),
            )
          ],
        );
      });

  Column _buildSecondUI(
          BuildContext context, WalletState<dynamic> bankAccount) =>
      Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(AppString.howMuchToTransfer,
                    style: context.titleTextStyle
                        ?.copyWith(fontSize: 15, fontWeight: FontWeight.w700)),
                TextFormField(
                  textAlign: TextAlign.center,
                  controller: _moneyMaskedTextController,
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                  style: TextStyle(
                      color: AppColors.kPrimaryTextColor,
                      fontSize: 40.sp,
                      fontWeight: FontWeight.w700),
                  decoration: InputDecoration(
                      hintText: 0.toNaira,
                      hintStyle: TextStyle(
                          color: AppColors.kPrimaryTextColor,
                          fontSize: 40.sp,
                          fontWeight: FontWeight.w700),
                      fillColor: Colors.transparent,
                      filled: false,
                      focusedBorder: InputBorder.none,
                      border: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      focusedErrorBorder: InputBorder.none,
                      errorBorder: InputBorder.none),
                  onChanged: (value) {
                    if (_moneyMaskedTextController.numberValue >
                        num.parse(walletDao.wallet.balance ?? '0')) {
                      _errorMessage = AppString.insufficientFund;
                    } else {
                      _errorMessage = '';
                    }
                    setState(() {});
                  },
                ),
                Text(
                  _errorMessage,
                  style: context.headlineLarge
                      ?.copyWith(color: AppColors.kColorOrange, fontSize: 12),
                )
              ],
            ),
          ),
          const Gap(height: 15),
          Center(
              child: BalanceIndicatorWidget(
                  amount: _moneyMaskedTextController.numberValue)),
          const Gap(height: 40),
          EditTextFieldWidget(
            readOnly: true,
            title: AppString.selectBank,
            label: AppString.selectBank,
            controller: bankController..text = _attributes?.name ?? '',
            focusNode: bankFocusNode,
            suffixIcon: const Icon(Icons.keyboard_arrow_down_rounded,
                color: AppColors.kSecondaryTextColor),
            validator: FieldValidator.validateString(),
            onTap: () async => _setUiIndex(2),
          ),
          const Gap(height: 25),
          EditTextFieldWidget(
              controller: accountNumberController,
              focusNode: accountNumberFocusNode,
              title: AppString.accountNumber,
              label: AppString.accountNumberInst,
              validator: FieldValidator.validateInt(
                  limit: 10, textEditingController: bankController),
              inputFormatters: [context.digitsOnly, context.limit(max: 10)],
              keyboardType: TextInputType.number,
              onChanged: (accountNumber) {
                if (accountNumber.length == 10 &&
                    bankController.text.isNotEmpty) {
                  FocusManager.instance.primaryFocus?.unfocus();
                  _walletNotifier.validateBankAccount(
                      WalletDto(
                          accountNumber: accountNumber,
                          amount:
                              _moneyMaskedTextController.numberValue.toString(),
                          bankName: _attributes?.name ?? ''),
                      _cancelToken);
                }
              }),
          const Gap(height: 10),
          AnimatedSize(
            duration: const Duration(milliseconds: 250),
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 250),
              child: bankAccount.validatingAccount
                  ? const CupertinoActivityIndicator()
                  : Row(children: [
                      if (bankAccount.bankAccountDetails != null)
                        CircleAvatar(
                            backgroundColor:
                                AppColors.kLightPurple.withOpacity(.70),
                            child: SvgPicture.asset(AppImage.profile)),
                      const Gap(width: 10),
                      Flexible(
                          child: Text(
                              bankAccount.bankAccountDetails?.accountName ?? '',
                              style: context.headlineMedium?.copyWith(
                                  fontWeight: FontWeight.w700, fontSize: 14)))
                    ]),
            ),
          ),
          const Gap(height: 48),
          ElevatedButtonWidget(
              title: AppString.proceed,
              onPressed: bankAccount.bankAccountDetails == null
                  ? null
                  : () {
                      if (_errorMessage.isNotEmpty) return;

                      if (_moneyMaskedTextController.numberValue == 0.00) {
                        setState(() =>
                            _errorMessage = AppString.amountCannotBeEmpty);
                        return;
                      }
                      PageRouter.pushNamed(Routes.transferMoneyConfirmationView,
                          args: TransferMoneyConfirmationViewArguments(
                              confirmTransferMoney: ConfirmTransferMoney(
                                  amount:
                                      _moneyMaskedTextController.numberValue,
                                  bankAccountDetails:
                                      bankAccount.bankAccountDetails!,
                                  attributes: _attributes ?? Attributes(),
                                  accountNumber:
                                      accountNumberController.text)));
                    })
        ],
      );

  Column _buildFirstUI(BuildContext context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildTile(
              context: context,
              title: AppString.transferToFriend,
              content: AppString.transferToFriendInst,
              isFree: true,
              onTap: () => PageRouter.pushNamed(Routes.transferMoneyView)),
          const Gap(height: 30),
          _buildTile(
              context: context,
              title: AppString.transferToBank,
              content: AppString.transferToBankInst,
              onTap: () => _setUiIndex(1)),
        ],
      );

  InkWell _buildTile(
          {required BuildContext context,
          required String title,
          required String content,
          required void Function() onTap,
          bool isFree = false}) =>
      InkWell(
        onTap: onTap,
        child: Row(
          children: [
            Container(
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: AppColors.kContainerColor),
              alignment: Alignment.center,
              padding:
                  EdgeInsets.symmetric(horizontal: 12.5.w, vertical: 12.5.h),
              child: SvgPicture.asset(AppImage.moreIcon),
            ),
            const Gap(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(title,
                        style: context.headlineMedium?.copyWith(
                            fontWeight: FontWeight.w700, fontSize: 16)),
                    if (isFree)
                      Container(
                          margin: EdgeInsets.only(left: 7.w),
                          padding: EdgeInsets.symmetric(
                              horizontal: 10.w, vertical: 2.h),
                          decoration: BoxDecoration(
                              color: AppColors.kIconPink,
                              borderRadius: BorderRadius.circular(4.r)),
                          child: Text('Free',
                              style: context.headlineMedium?.copyWith(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 12,
                                  color: AppColors.white)))
                  ],
                ),
                const Gap(height: 5),
                Text(content,
                    style: context.headlineMedium?.copyWith(
                        fontWeight: FontWeight.w400,
                        color: AppColors.kIconGrey)),
              ],
            )
          ],
        ),
      );
}
