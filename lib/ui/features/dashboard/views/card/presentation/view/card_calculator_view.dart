import 'package:Pouchers/app/app.router.dart';
import 'package:Pouchers/app/core/router/page_router.dart';
import 'package:Pouchers/ui/common/app_colors.dart';
import 'package:Pouchers/ui/common/app_strings.dart';
import 'package:Pouchers/ui/features/dashboard/views/card/domain/dto/card_dto.dart';
import 'package:Pouchers/ui/features/dashboard/views/card/presentation/notifier/card_notifier.dart';
import 'package:Pouchers/ui/features/dashboard/views/card/presentation/notifier/module/module.dart';
import 'package:Pouchers/ui/features/dashboard/views/card/presentation/notifier/params_notifier.dart';
import 'package:Pouchers/ui/widgets/elevated_button_widget.dart';
import 'package:Pouchers/ui/widgets/gap.dart';
import 'package:Pouchers/ui/widgets/keypad/config/keypad_config.dart';
import 'package:Pouchers/ui/widgets/keypad/virtual_keypad.dart';
import 'package:Pouchers/utils/extension.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../widgets/keypad/virtual_key_pad_controller.dart';
import '../../domain/enum/card_type.dart';
import '../../domain/model/get_exchange_rate/data.dart';
import 'widgets/hook_creation_widget.dart';

class CardCalculatorView extends ConsumerStatefulWidget {
  const CardCalculatorView({super.key});

  @override
  ConsumerState<CardCalculatorView> createState() => _CardCalculatorViewState();
}

class _CardCalculatorViewState extends ConsumerState<CardCalculatorView> {
  final VirtualKeyPadController _controller =
      VirtualKeyPadController(applyPinLength: false);
  late ParamNotifier _paramNotifier;

  final CancelToken _cancelToken = CancelToken();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _controller.addListener(() => setState(() {}));
      _paramNotifier = ref.read(paramModule.notifier);
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
  }

  @override
  Widget build(BuildContext context) {
    final param = ref.watch(paramModule);
    final cardState = ref.watch(cardNotifierProvider);

    return Scaffold(
      backgroundColor: AppColors.kPurpleColor,
      appBar: AppBar(
          backgroundColor: AppColors.kPurpleColor,
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
                  param.isNairaCardType
                      ? const Gap(height: 228)
                      : Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Gap(height: 109),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10.w, vertical: 5.h),
                              decoration: BoxDecoration(
                                  color: AppColors.white.withOpacity(.20),
                                  borderRadius: BorderRadius.circular(7.r)),
                              child: Text(
                                  '${1.toDollar.replaceAll('.00', '')} = ${num.parse((cardState.data as Data?)?.rate ?? '0').toNaira.replaceAll('.00', '')}',
                                  style: context.headlineLarge?.copyWith(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500)),
                            ),
                            const Gap(height: 81),
                          ],
                        ),
                  Text(
                      _controller.pins.isEmpty
                          ? param.isNairaCardType
                              ? 0.toNaira
                              : 0.toDollar
                          : param.isNairaCardType
                              ? num.parse(_controller.pins.join()).toNaira
                              : num.parse(_controller.pins.join()).toDollar,
                      style: context.titleLarge?.copyWith(
                          color: AppColors.kBackgroundColor,
                          fontWeight: FontWeight.w700,
                          fontSize: 40)),
                  const Gap(height: 11),
                  const HookCreationFeeWidget(),
                  const Gap(height: 52),
                ],
              ),
            )),
            VirtualKeyPad(
                keyPadController: _controller,
                keypadConfig: KeypadConfig(keypadColor: AppColors.white),
                onComplete: (_) {}),
            const Gap(height: 23),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: ElevatedButtonWidget(
                  bacgroundColor:
                      _controller.pins.isEmpty ? null : AppColors.kPurpleDeep,
                  title: AppString.fundCard,
                  onPressed: _controller.pins.isEmpty
                      ? null
                      : () {
                          _paramNotifier.setExchangeRate(num.parse(
                              (cardState.data as Data?)?.rate ?? '0'));
                          PageRouter.pushNamed(Routes.cardCreationSymmaryView,
                              args: CardCreationSymmaryViewArguments(
                                  cardDto: CardDto(
                                      amount:
                                          num.parse(_controller.pins.join()))));
                        }),
            )
          ],
        ),
      ),
    );
  }
}
