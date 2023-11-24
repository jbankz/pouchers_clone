import 'package:Pouchers/app/app.router.dart';
import 'package:Pouchers/app/core/router/page_router.dart';
import 'package:Pouchers/ui/common/app_colors.dart';
import 'package:Pouchers/ui/common/app_strings.dart';
import 'package:Pouchers/ui/features/dashboard/views/card/domain/dto/card_dto.dart';
import 'package:Pouchers/ui/widgets/elevated_button_widget.dart';
import 'package:Pouchers/ui/widgets/gap.dart';
import 'package:Pouchers/ui/widgets/keypad/config/keypad_config.dart';
import 'package:Pouchers/ui/widgets/keypad/virtual_keypad.dart';
import 'package:Pouchers/utils/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../widgets/keypad/virtual_key_pad_controller.dart';
import 'widgets/hook_creation_widget.dart';

class CardCalculatorView extends StatefulWidget {
  const CardCalculatorView({super.key});

  @override
  State<CardCalculatorView> createState() => _CardCalculatorViewState();
}

class _CardCalculatorViewState extends State<CardCalculatorView> {
  final VirtualKeyPadController _controller =
      VirtualKeyPadController(applyPinLength: false);

  @override
  void initState() {
    super.initState();
    _controller.addListener(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: AppColors.kPurpleColor,
        appBar: AppBar(
            backgroundColor: AppColors.kPurpleColor,
            title: Text(AppString.createNairaCard,
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
                    const Gap(height: 228),
                    Text(
                        _controller.pins.isEmpty
                            ? 0.toNaira
                            : num.parse(_controller.pins.join()).toNaira,
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
                        : () => PageRouter.pushNamed(
                            Routes.cardCreationSymmaryView,
                            args: CardCreationSymmaryViewArguments(
                                cardDto: CardDto(
                                    amount:
                                        num.parse(_controller.pins.join()))))),
              )
            ],
          ),
        ),
      );
}
