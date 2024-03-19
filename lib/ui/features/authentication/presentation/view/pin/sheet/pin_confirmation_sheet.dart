import 'package:Pouchers/app/core/router/page_router.dart';
import 'package:Pouchers/ui/common/app_colors.dart';
import 'package:Pouchers/ui/features/authentication/presentation/notifier/auth_notifier.dart';
import 'package:Pouchers/ui/widgets/keypad/config/keypad_config.dart';
import 'package:Pouchers/utils/extension.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../../common/app_strings.dart';
import '../../../../../../widgets/gap.dart';
import '../../../../../../widgets/keypad/account_pin_widget.dart';
import '../../../../../../widgets/keypad/virtual_key_pad_controller.dart';
import '../../../../../../widgets/keypad/virtual_keypad.dart';
import '../../../../../profile/presentation/views/biometric/biometric_verification_view.dart';

class PinConfirmationSheet extends ConsumerStatefulWidget {
  const PinConfirmationSheet({super.key, this.validatePinHere = false});

  final bool validatePinHere;

  @override
  ConsumerState<PinConfirmationSheet> createState() =>
      _PinConfirmationSheetState();
}

class _PinConfirmationSheetState extends ConsumerState<PinConfirmationSheet>
    with SingleTickerProviderStateMixin {
  final VirtualKeyPadController _keyPadController = VirtualKeyPadController();

  final CancelToken _cancelToken = CancelToken();
  late AnimationController _keyboardAnimationController;

  @override
  void initState() {
    super.initState();
    _keyboardAnimationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1000))
      ..forward();
    _keyPadController.addListener(() {
      if (mounted) setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    _cancelToken.cancel();
    _keyboardAnimationController.dispose();
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
                    AnimatedSwitcher(
                        duration: const Duration(milliseconds: 250),
                        child: ref.watch(authNotifierProvider).isBusy
                            ? const CupertinoActivityIndicator(
                                color: AppColors.kBlueColor)
                            : AccountPinCodeField(
                                virtualKeyPadController: _keyPadController)),
                    const Gap(height: 31),
                    FadeTransition(
                      opacity: _keyboardAnimationController,
                      alwaysIncludeSemantics: true,
                      child: VirtualKeyPad(
                          keyPadController: _keyPadController,
                          keypadConfig:
                              KeypadConfig(keypadColor: AppColors.kDarkFill100),
                          onComplete: (pin) async {
                            if (widget.validatePinHere) {
                              await ref
                                  .read(authNotifierProvider.notifier)
                                  .validatePin(pin, _cancelToken,
                                      onError: () =>
                                          _keyPadController.clearAll(),
                                      onSuccess: () => PageRouter.pop(pin));
                              return;
                            }
                            PageRouter.pop(pin);
                          }),
                    ),
                    BiometricVerification(
                        popScreenWhenVerificationCompletes: false,
                        callback: (pin) async {
                          if (widget.validatePinHere) {
                            await ref
                                .read(authNotifierProvider.notifier)
                                .validatePin(pin, _cancelToken,
                                    onError: () => _keyPadController.clearAll(),
                                    onSuccess: () => PageRouter.pop(pin));
                            return;
                          }
                          PageRouter.pop(pin);
                        })
                  ],
                ),
              ),
            ),
          )
        ],
      );
}
