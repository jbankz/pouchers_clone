import 'dart:io';

import 'package:pouchers/app/core/router/page_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:dio/dio.dart';

import 'package:pouchers/ui/common/app_colors.dart';
import 'package:pouchers/ui/common/app_images.dart';
import 'package:pouchers/ui/common/app_strings.dart';
import 'package:pouchers/ui/features/profile/data/dao/wallet_dao.dart';
import 'package:pouchers/ui/features/profile/domain/model/user.dart';
import 'package:pouchers/ui/features/profile/presentation/views/wallet/widget/balance_indicator_widget.dart';
import 'package:pouchers/ui/features/transfer/domain/dto/transfer_money_dto.dart';
import 'package:pouchers/ui/features/transfer/presentation/notifier/transfer_notifier.dart';
import 'package:pouchers/ui/widgets/dialog/bottom_sheet.dart';
import 'package:pouchers/ui/widgets/elevated_button_widget.dart';
import 'package:pouchers/ui/widgets/gap.dart';
import 'package:pouchers/ui/widgets/keypad/config/keypad_config.dart';
import 'package:pouchers/ui/widgets/keypad/virtual_keypad.dart';
import 'package:pouchers/ui/widgets/profile_image.dart';
import 'package:pouchers/utils/extension.dart';
import 'package:pouchers/ui/widgets/sheets/confirmation_sheet.dart';
import 'package:pouchers/ui/features/transfer/presentation/state/transfer_state.dart';

import '../../../../../app/formatter/money_formatter.dart';
import '../../../../widgets/keypad/virtual_key_pad_controller.dart';
import '../sheets/transfer_to_poucher_note_sheet.dart';
import '../sheets/transfer_to_poucher_tags_sheet.dart';

class TransferMoneyView extends ConsumerStatefulWidget {
  const TransferMoneyView({super.key, this.isRequestingMoney = false});

  final bool isRequestingMoney;

  @override
  ConsumerState<TransferMoneyView> createState() => _TransferMoneyViewState();
}

class _TransferMoneyViewState extends ConsumerState<TransferMoneyView>
    with TickerProviderStateMixin {
  final VirtualKeyPadController _controller =
      VirtualKeyPadController(applyPinLength: false);
  final CancelToken _cancelToken = CancelToken();
  late TransferNotifier _transferNotifier;

  User? _userTag;
  bool get _isUserAvailable => _userTag != null;
  String get _fullName =>
      '${_userTag?.firstName?.titleCase ?? ''} ${_userTag?.lastName?.titleCase ?? ''}';
  String? _note;
  bool get _isBtnDisabled =>
      _controller.pins.isEmpty || _userTag == null || _errorMessage.isNotEmpty;

  bool isRequestingMoney = false;

  String _errorMessage = '';

  final MoneyMaskedTextController _moneyMaskedTextController =
      MoneyMaskedTextController(
          leftSymbol: AppString.nairaSymbol,
          amountColor: AppColors.white,
          koboColor: AppColors.white.withOpacity(.50));

  late AnimationController _keyboardAnimationController;
  late AnimationController _scaleButtonController;
  late AnimationController _tagController;

  @override
  void initState() {
    super.initState();
    isRequestingMoney = widget.isRequestingMoney;
    _keyboardAnimationController = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 500),
        reverseDuration: const Duration(milliseconds: 150))
      ..forward();
    _scaleButtonController = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 600),
        reverseDuration: const Duration(milliseconds: 150))
      ..forward();
    _tagController = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 1000),
        reverseDuration: const Duration(milliseconds: 150))
      ..forward();
    Future.microtask(() {
      _transferNotifier = ref.read(transferNotifierProvider.notifier);
      _controller.addListener(() => setState(() {}));
    });
  }

  @override
  void dispose() {
    super.dispose();
    _cancelToken.cancel();
    _keyboardAnimationController.dispose();
    _scaleButtonController.dispose();
    _tagController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final transferState = ref.watch(transferNotifierProvider);
    return Scaffold(
      backgroundColor: AppColors.kPurpleColor,
      appBar: AppBar(
          backgroundColor: AppColors.kPurpleColor,
          leading: _buildBackButton(),
          iconTheme: const IconThemeData(color: Colors.white),
          title: Text(
              isRequestingMoney
                  ? AppString.requestMoney
                  : AppString.transferMoney,
              style: context.bodyLarge?.copyWith(
                  color: AppColors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w500))),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Gap(height: 40),
                    if (!isRequestingMoney)
                      const BalanceIndicatorWidget(
                          amount: 0, balanceColor: AppColors.kLightPurple),
                    const Gap(height: 22),
                    _buildTagContainer(context),
                    const Gap(height: 84),
                    TextFormField(
                      textAlign: TextAlign.center,
                      controller: _moneyMaskedTextController,
                      readOnly: true,
                      keyboardType:
                          const TextInputType.numberWithOptions(decimal: true),
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: 40.sp,
                        fontWeight: FontWeight.w700,
                      ),
                      decoration: InputDecoration(
                        hintText: 0.toNaira,
                        hintStyle: TextStyle(
                          color: AppColors.white,
                          fontSize: 40.sp,
                          fontWeight: FontWeight.w700,
                        ),
                        fillColor: Colors.transparent,
                        filled: false,
                        focusedBorder: InputBorder.none,
                        border: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        focusedErrorBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                      ),
                    ),
                    Text(
                      _errorMessage,
                      style: context.headlineLarge?.copyWith(
                          color: AppColors.kColorOrange, fontSize: 12),
                    ),
                    const Gap(height: 52),
                  ],
                ),
              ),
            ),
            _buildVirtualKeyPad(),
            const Gap(height: 23),
            _buildTransferButton(context, transferState),
          ],
        ),
      ),
    );
  }

  Widget _buildTagContainer(BuildContext context) => FadeTransition(
        opacity: _tagController,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 33.w),
          child: InkWell(
            onTap: () async {
              _userTag = await BottomSheets.showSheet(
                child: TransferToPoucherTagSheet(
                    isRequestingMoney: isRequestingMoney),
              ) as User?;
              setState(() {});
            },
            borderRadius: BorderRadius.circular(8.r),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 350),
              padding: EdgeInsets.symmetric(
                horizontal: _isUserAvailable ? 16.w : 30.w,
                vertical: _isUserAvailable ? 11.h : 26.h,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
                color: AppColors.white,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      _isUserAvailable
                          ? ProfileImage(
                              image: _userTag?.profilePicture ?? '',
                              height: 38,
                              width: 38)
                          : Text(
                              '@',
                              style: context.titleMedium?.copyWith(
                                  fontWeight: FontWeight.w700, fontSize: 16),
                            ),
                      const Gap(width: 5),
                      Expanded(
                        child: Text(
                          _isUserAvailable
                              ? _fullName
                              : isRequestingMoney
                                  ? AppString.selectReceipient
                                  : AppString.enterPoucherTag,
                          style: context.titleMedium?.copyWith(
                            color: AppColors.kIconGrey,
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),
                          maxLines: 1,
                        ),
                      ),
                      const Gap(width: 5),
                      Container(
                        height: 24.h,
                        width: 24.w,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.kPurple100,
                        ),
                        child: const Icon(Icons.navigate_next,
                            color: AppColors.white),
                      ),
                    ],
                  ),
                  AnimatedSwitcher(
                    duration: const Duration(milliseconds: 350),
                    child: !_isUserAvailable
                        ? const SizedBox.shrink()
                        : InkWell(
                            onTap: () async {
                              _note = await BottomSheets.showSheet(
                                child: const TransferToPoucherNoteSheet(),
                              ) as String?;
                              setState(() {});
                            },
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Gap(height: 10),
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Flexible(
                                      child: Text(
                                        _note ?? AppString.addNote,
                                        style: context.titleMedium?.copyWith(
                                          color: AppColors.kSecondaryTextColor,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14,
                                        ),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    SvgPicture.asset(AppImage.forwardArrow),
                                  ],
                                ),
                              ],
                            ),
                          ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );

  Widget _buildVirtualKeyPad() => SlideTransition(
        position: Tween<Offset>(begin: const Offset(0, 1), end: Offset.zero)
            .animate(_keyboardAnimationController),
        child: VirtualKeyPad(
          keyPadController: _controller,
          keypadConfig: KeypadConfig(
              keypadColor: AppColors.white, showPoint: true, decimal: 2),
          onTyping: () {
            _controller.pins.join().isEmpty
                ? _moneyMaskedTextController.updateValue(0)
                : _moneyMaskedTextController
                    .updateValue(double.parse(_controller.pins.join()));

            if (_moneyMaskedTextController.numberValue >
                num.parse(walletDao.wallet.balance ?? '0')) {
              _errorMessage = AppString.insufficientFund;
            } else {
              _errorMessage = '';
            }

            setState(() {});
          },
          onComplete: (_) {},
        ),
      );

  Widget _buildTransferButton(
          BuildContext context, TransferState transferState) =>
      ScaleTransition(
        scale: _scaleButtonController,
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: ElevatedButtonWidget(
            loading: transferState.isBusy,
            bacgroundColor: _isBtnDisabled ? null : AppColors.kPurpleDeep,
            title: isRequestingMoney ? AppString.request : AppString.transfer,
            onPressed: _isBtnDisabled
                ? null
                : () async {
                    if (isRequestingMoney) {
                      _transferNotifier.requestMoney(
                          transferMoneyDto: TransferMoneyDto(
                              tag: _userTag?.tag,
                              amount: _moneyMaskedTextController.numberValue
                                  .toString(),
                              note: _note),
                          cancelToken: _cancelToken);
                      return;
                    }

                    final response = await BottomSheets.showAlertDialog(
                        child: TransferConfirmationSheet(
                            isRequested: isRequestingMoney,
                            amount: _moneyMaskedTextController.numberValue,
                            receipient: _fullName)) as String?;

                    if (response != null) {
                      _transferNotifier.p2pTransfer(
                        TransferMoneyDto(
                            tag: _userTag?.tag,
                            amount: _moneyMaskedTextController.numberValue
                                .toString(),
                            note: _note,
                            transactionPin: response),
                        _cancelToken,
                      );
                    }
                  },
          ),
        ),
      );

  InkWell _buildBackButton() => InkWell(
        customBorder: const CircleBorder(),
        child:
            Icon(Platform.isAndroid ? Icons.arrow_back : Icons.arrow_back_ios),
        onTap: () async {
          await HapticFeedback.selectionClick();
          await _scaleButtonController.reverse();
          await _tagController.reverse();
          await _keyboardAnimationController.reverse();
          PageRouter.pop();
        },
      );
}
