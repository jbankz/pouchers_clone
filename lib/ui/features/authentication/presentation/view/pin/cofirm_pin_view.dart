import 'package:pouchers/ui/common/app_colors.dart';
import 'package:pouchers/ui/features/authentication/domain/dto/auth_dto.dart';
import 'package:pouchers/ui/notification/notification_tray.dart';
import 'package:pouchers/utils/extension.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../common/app_strings.dart';
import '../../../../../widgets/gap.dart';
import '../../../../../widgets/keypad/account_pin_widget.dart';
import '../../../../../widgets/keypad/virtual_key_pad_controller.dart';
import '../../../../../widgets/keypad/virtual_keypad.dart';
import '../../notifier/auth_notifier.dart';
import 'module/pin_module.dart';
import 'notifier/pin_notifier.dart';

class ConfirmPinView extends ConsumerStatefulWidget {
  const ConfirmPinView({super.key});

  @override
  ConsumerState<ConfirmPinView> createState() => _ConfirmPinViewState();
}

class _ConfirmPinViewState extends ConsumerState<ConfirmPinView> {
  final formKey = GlobalKey<FormState>();

  late AuthNotifier _authNotifier;
  late PinNotifier _pinNotifier;

  final VirtualKeyPadController _controller = VirtualKeyPadController();
  final CancelToken _cancelToken = CancelToken();

  bool _hasError = false;

  @override
  void initState() {
    _authNotifier = ref.read(authNotifierProvider.notifier);
    _pinNotifier = ref.read(pinModule.notifier);

    _controller.addListener(() => setState(() {}));

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _cancelToken.cancel();
  }

  @override
  Widget build(BuildContext context) {
    final appState = ref.watch(authNotifierProvider);

    return Stack(
      children: [
        Scaffold(
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
                        Text(AppString.confirmPin,
                            style: context.headlineMedium?.copyWith(
                                fontWeight: FontWeight.w700, fontSize: 24)),
                        const Gap(height: 8),
                        Text(AppString.createPinHint,
                            style: context.titleLarge?.copyWith(fontSize: 16)),
                        const Gap(height: 97),
                        AccountPinCodeField(
                          virtualKeyPadController: _controller,
                          hasError: _hasError,
                        ),
                        const Gap(height: 94),
                      ],
                    ),
                  ),
                  VirtualKeyPad(
                      keyPadController: _controller,
                      onTyping: () => setState(() => _hasError = false),
                      onComplete: (String pin) {
                        if (pin == _pinNotifier.pin) {
                          _authNotifier.createTransactionPin(AuthDto(pin: pin),
                              cancelToken: _cancelToken);
                        } else {
                          setState(() => _hasError = true);
                          triggerNotificationTray(AppString.pinNotMatch,
                              error: true);
                        }
                      }),
                  const Gap(height: 119),
                ],
              ),
            ),
          ),
        ),
        Visibility(
          visible: appState.isBusy,
          child: Container(
            height: context.height,
            width: context.width,
            color: AppColors.kPrimaryTextColor.withOpacity(.30),
            child: const Center(
                child: CircularProgressIndicator(
                    strokeCap: StrokeCap.butt,
                    valueColor: AlwaysStoppedAnimation(AppColors.kPurple100),
                    backgroundColor: AppColors.white)),
          ),
        )
      ],
    );
  }
}
