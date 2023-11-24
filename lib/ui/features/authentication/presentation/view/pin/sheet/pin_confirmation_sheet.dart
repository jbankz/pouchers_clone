import 'package:Pouchers/app/core/router/page_router.dart';
import 'package:Pouchers/ui/common/app_colors.dart';
import 'package:Pouchers/ui/widgets/keypad/config/keypad_config.dart';
import 'package:Pouchers/utils/extension.dart';
import 'package:flutter/material.dart';

import '../../../../../../common/app_strings.dart';
import '../../../../../../widgets/gap.dart';
import '../../../../../../widgets/keypad/account_pin_widget.dart';
import '../../../../../../widgets/keypad/virtual_key_pad_controller.dart';
import '../../../../../../widgets/keypad/virtual_keypad.dart';

class PinConfirmationSheet extends StatefulWidget {
  const PinConfirmationSheet({super.key});

  @override
  State<PinConfirmationSheet> createState() => _PinConfirmationSheetState();
}

class _PinConfirmationSheetState extends State<PinConfirmationSheet> {
  final VirtualKeyPadController _keyPadController = VirtualKeyPadController();

  @override
  void initState() {
    super.initState();
    _keyPadController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) => Wrap(
        children: [
          SizedBox(
            width: double.infinity,
            child: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Text(AppString.pinRequest,
                        style: context.titleMedium?.copyWith(
                            fontSize: 15, fontWeight: FontWeight.w500)),
                    const Gap(height: 31),
                    AccountPinCodeField(
                        virtualKeyPadController: _keyPadController),
                    const Gap(height: 31),
                    VirtualKeyPad(
                        keyPadController: _keyPadController,
                        keypadConfig:
                            KeypadConfig(keypadColor: AppColors.kDarkFill100),
                        onComplete: (pin) => PageRouter.pop(pin)),
                  ],
                ),
              ),
            ),
          )
        ],
      );
}
