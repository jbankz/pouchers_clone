import 'dart:io';

import 'package:pouchers/app/app.router.dart';
import 'package:pouchers/app/core/router/page_router.dart';
import 'package:pouchers/ui/common/app_colors.dart';
import 'package:pouchers/ui/common/app_strings.dart';
import 'package:pouchers/ui/features/dashboard/views/card/domain/dto/card_dto.dart';
import 'package:pouchers/ui/features/dashboard/views/card/presentation/notifier/card_notifier.dart';
import 'package:pouchers/ui/features/dashboard/views/card/presentation/notifier/module/module.dart';
import 'package:pouchers/ui/features/dashboard/views/card/presentation/notifier/params_notifier.dart';
import 'package:pouchers/ui/widgets/elevated_button_widget.dart';
import 'package:pouchers/ui/widgets/gap.dart';
import 'package:pouchers/ui/widgets/keypad/config/keypad_config.dart';
import 'package:pouchers/ui/widgets/keypad/virtual_keypad.dart';
import 'package:pouchers/utils/extension.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../app/formatter/money_formatter.dart';
import '../../../../../../widgets/keypad/virtual_key_pad_controller.dart';
import '../../../../../profile/data/dao/wallet_dao.dart';
import 'widgets/hook_creation_widget.dart';

class CardCalculatorView extends ConsumerStatefulWidget {
  const CardCalculatorView({super.key});

  @override
  ConsumerState<CardCalculatorView> createState() => _CardCalculatorViewState();
}

class _CardCalculatorViewState extends ConsumerState<CardCalculatorView>
    with TickerProviderStateMixin {
  final VirtualKeyPadController _controller =
      VirtualKeyPadController(applyPinLength: false);
  late ParamNotifier _paramNotifier;

  final CancelToken _cancelToken = CancelToken();
  late MoneyMaskedTextController _moneyMaskedTextController;
  String _errorMessage = '';
  bool get _isBtnDisabled =>
      _controller.pins.isEmpty || _errorMessage.isNotEmpty;

  late AnimationController _keyboardAnimationController;
  late AnimationController _scaleButtonController;

  @override
  void initState() {
    super.initState();
    _paramNotifier = ref.read(paramModule.notifier);
    _moneyMaskedTextController = MoneyMaskedTextController(
        leftSymbol: _paramNotifier.isNairaCardType
            ? AppString.nairaSymbol
            : AppString.dollarSymbol,
        amountColor: AppColors.white,
        koboColor: AppColors.white.withOpacity(.50));

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

    Future.microtask(() {
      _controller.addListener(() => setState(() {}));
      if (!_paramNotifier.isNairaCardType) {
        ref
            .read(cardNotifierProvider.notifier)
            .getExchangeRate(CardDto(), _cancelToken);
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _cancelToken.cancel();
    _keyboardAnimationController.dispose();
    _scaleButtonController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final param = ref.watch(paramModule);
    final cardState = ref.watch(cardNotifierProvider);

    final minimumAccount = param.isNairaCardType ? 1000.toNaira : 1000.toDollar;

    return Scaffold(
      backgroundColor: AppColors.kPurpleColor,
      appBar: AppBar(
          backgroundColor: AppColors.kPurpleColor,
          iconTheme: const IconThemeData(color: Colors.white),
          leading: _buildBackButton(),
          title: Text(param.appTitle,
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
                  const Gap(height: 80),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      param.isNairaCardType
                          ? const SizedBox.shrink()
                          : AnimatedSwitcher(
                              duration: const Duration(milliseconds: 250),
                              child: cardState.isBusy
                                  ? const CupertinoActivityIndicator(
                                      color: Colors.white)
                                  : Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 10.w, vertical: 5.h),
                                      decoration: BoxDecoration(
                                          color:
                                              AppColors.white.withOpacity(.20),
                                          borderRadius:
                                              BorderRadius.circular(7.r)),
                                      child: Text(
                                          '${1.toDollar.replaceAll('.00', '')} = ${num.parse((cardState.exchangeRate)?.rate ?? '0').toNaira.replaceAll('.00', '')}',
                                          style: context.headlineLarge
                                              ?.copyWith(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w500)),
                                    ),
                            ),
                      const Gap(height: 10),
                    ],
                  ),
                  if (param.isCreatingCardActivity)
                    Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 10.w, vertical: 5.h),
                        decoration: BoxDecoration(
                            color: AppColors.white.withOpacity(.20),
                            borderRadius: BorderRadius.circular(7.r)),
                        child: const HookCreationFeeWidget()),
                  const Gap(height: 43),
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
                        hintText:
                            param.isNairaCardType ? 0.toDollar : 0.toNaira,
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
                        errorBorder: InputBorder.none),
                  ),
                  const Gap(height: 11),
                  Text(
                    _errorMessage,
                    style: context.headlineLarge
                        ?.copyWith(color: AppColors.kColorOrange, fontSize: 12),
                  ),
                  const Gap(height: 11),
                  Text('Minimum Amount = $minimumAccount',
                      style: context.headlineLarge?.copyWith(
                          fontSize: 14, fontWeight: FontWeight.w500)),
                  const Gap(height: 51),
                ],
              ),
            )),
            _buildVirtualKeyPad(),
            const Gap(height: 23),
            ScaleTransition(
              scale: _scaleButtonController,
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: ElevatedButtonWidget(
                    bacgroundColor:
                        _isBtnDisabled ? null : AppColors.kPurpleDeep,
                    title: AppString.fundCard,
                    onPressed: _isBtnDisabled
                        ? null
                        : () {
                            if (!param.isNairaCardType) {
                              _paramNotifier.setExchangeRate(num.parse(
                                  (cardState.exchangeRate)?.rate ?? '0'));
                            }
                            PageRouter.pushNamed(Routes.cardCreationSymmaryView,
                                args: CardCreationSymmaryViewArguments(
                                    cardDto: CardDto(
                                        amount: _moneyMaskedTextController
                                            .numberValue)));
                          }),
              ),
            )
          ],
        ),
      ),
    );
  }

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

  InkWell _buildBackButton() => InkWell(
        customBorder: const CircleBorder(),
        child:
            Icon(Platform.isAndroid ? Icons.arrow_back : Icons.arrow_back_ios),
        onTap: () async {
          await HapticFeedback.selectionClick();
          await _scaleButtonController.reverse();
          await _keyboardAnimationController.reverse();
          PageRouter.pop();
        },
      );
}
