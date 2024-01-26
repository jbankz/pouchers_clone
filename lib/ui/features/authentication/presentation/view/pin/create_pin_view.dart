import 'package:Pouchers/ui/features/authentication/presentation/view/pin/module/pin_module.dart';
import 'package:Pouchers/utils/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../common/app_strings.dart';
import '../../../../../widgets/gap.dart';
import '../../../../../widgets/keypad/account_pin_widget.dart';
import '../../../../../widgets/keypad/virtual_key_pad_controller.dart';
import '../../../../../widgets/keypad/virtual_keypad.dart';
import 'notifier/pin_notifier.dart';

class CreatePinView extends ConsumerStatefulWidget {
  const CreatePinView({super.key});

  @override
  ConsumerState<CreatePinView> createState() => _CreatePinViewState();
}

class _CreatePinViewState extends ConsumerState<CreatePinView> {
  final formKey = GlobalKey<FormState>();

  late PinNotifier _pinNotifier;

  final VirtualKeyPadController _controller = VirtualKeyPadController();

  @override
  void initState() {
    _pinNotifier = ref.read(pinModule.notifier);
    _controller.addListener(() => setState(() {}));

    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(),
        body: SafeArea(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    keyboardDismissBehavior:
                        ScrollViewKeyboardDismissBehavior.onDrag,
                    children: [
                      Text(AppString.createPin,
                          style: context.headlineMedium?.copyWith(
                              fontWeight: FontWeight.w700, fontSize: 24)),
                      const Gap(height: 8),
                      Text(AppString.createPinHint,
                          style: context.titleLarge?.copyWith(fontSize: 16)),
                      const Gap(height: 97),
                      AccountPinCodeField(virtualKeyPadController: _controller),
                      const Gap(height: 94),
                    ],
                  ),
                ),
                VirtualKeyPad(
                    keyPadController: _controller,
                    onComplete: _pinNotifier.setPinValue),
                const Gap(height: 119),
              ],
            ),
          ),
        ),
      );
}
