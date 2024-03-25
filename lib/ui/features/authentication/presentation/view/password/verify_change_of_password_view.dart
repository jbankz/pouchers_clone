import 'dart:async';

import 'package:pouchers/app/app.router.dart';
import 'package:pouchers/app/core/router/page_router.dart';
import 'package:pouchers/ui/common/app_colors.dart';
import 'package:pouchers/ui/features/authentication/domain/dto/auth_dto.dart';
import 'package:pouchers/ui/features/dashboard/views/card/presentation/notifier/module/module.dart';
import 'package:pouchers/ui/features/profile/data/dao/user_dao.dart';
import 'package:pouchers/utils/extension.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:stacked/stacked_annotations.dart';

import '../../../../../common/app_strings.dart';
import '../../../../../widgets/elevated_button_widget.dart';
import '../../../../../widgets/gap.dart';
import '../../../../../widgets/pin_code_widget.dart';
import '../../notifier/auth_notifier.dart';
import '../otp/notifier/module.dart';
import '../otp/notifier/timer_notifier.dart';
import 'verify_change_of_password_view.form.dart';

@FormView(fields: [FormTextField(name: 'otp')])
class VerifyChangeOfPasswordView extends ConsumerStatefulWidget {
  const VerifyChangeOfPasswordView({super.key});

  @override
  ConsumerState<VerifyChangeOfPasswordView> createState() =>
      _VerifyChangeOfPasswordViewState();
}

class _VerifyChangeOfPasswordViewState
    extends ConsumerState<VerifyChangeOfPasswordView>
    with $VerifyChangeOfPasswordView {
  final formKey = GlobalKey<FormState>();

  late AuthNotifier _authNotifier;
  late OtpTimerNotifier _otpTimerNotifier;
  final StreamController<ErrorAnimationType> _errorController =
      StreamController<ErrorAnimationType>();

  final CancelToken _cancelToken = CancelToken();

  @override
  void initState() {
    super.initState();
    _initializer();
  }

  Future<void> _initializer() async {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      otpFocusNode.requestFocus();
      _authNotifier = ref.read(authNotifierProvider.notifier);
      _otpTimerNotifier = ref.read(otpTimerModule.notifier);

      final bool value =
          ref.watch(paramModule).userJustWantsToChangeTherePassword;
      if (value) {
        await _authNotifier.requestOtp(
            AuthDto(
                email: userDao.user.email,
                userJustWantsToChangeTherePassword: true),
            _cancelToken);
      }
      if (!value) _otpTimerNotifier.startTimer();
    });
  }

  @override
  void dispose() {
    _otpTimerNotifier.cancelTimer();
    _cancelToken.cancel();
    disposeForm();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final timerState = ref.watch(otpTimerModule);
    final authState = ref.watch(authNotifierProvider);
    return ValueListenableBuilder<Box>(
        valueListenable: userDao.getListenable(),
        builder: (_, box, __) {
          final user = userDao.returnUser(box);

          return Scaffold(
            appBar: AppBar(),
            body: SafeArea(
              minimum: const EdgeInsets.symmetric(horizontal: 16),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    Expanded(
                      child: ListView(
                        keyboardDismissBehavior:
                            ScrollViewKeyboardDismissBehavior.onDrag,
                        children: [
                          Text(AppString.verifyAccount,
                              style: context.headlineMedium?.copyWith(
                                  fontWeight: FontWeight.w700, fontSize: 24)),
                          const Gap(height: 8),
                          RichText(
                              text: TextSpan(
                                  text: AppString.changePasswordVerification,
                                  style: context.titleLarge
                                      ?.copyWith(fontSize: 16))),
                          const Gap(height: 32),
                          PinCodeWidget(
                              errorAnimationController: _errorController,
                              controller: otpController,
                              focusNode: otpFocusNode)
                        ],
                      ),
                    ),
                    ElevatedButtonWidget(
                        title: AppString.confirm,
                        loading: authState.isBusy,
                        onPressed: timerState.isTimerFinished
                            ? null
                            : () {
                                if (!formKey.currentState!.validate()) return;
                                PageRouter.pushNamed(Routes.setNewPasswordView,
                                    args: SetNewPasswordViewArguments(
                                        email: user.email ?? ''));
                                // _authNotifier.verifyAccountEmail(
                                //     AuthDto(otp: otpController.text), () {
                                //   _errorController.add(ErrorAnimationType.shake);
                                //   otpController.clear();
                                //   otpFocusNode.requestFocus();
                                //   setState(() {});
                                // });
                              }),
                    const Gap(height: 24),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(AppString.noCode, style: context.titleLarge),
                        const Gap(width: 8),
                        AnimatedSwitcher(
                          duration: const Duration(milliseconds: 350),
                          child: authState.isBusy
                              ? const CupertinoActivityIndicator()
                              : InkWell(
                                  onTap: !timerState.isTimerFinished
                                      ? null
                                      : () => _authNotifier.requestOtp(AuthDto(
                                          email: user.email,
                                          userJustWantsToChangeTherePassword:
                                              true)),
                                  borderRadius: BorderRadius.circular(20.r),
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 14.w, vertical: 4.h),
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(20.r),
                                        color: timerState.isTimerFinished
                                            ? AppColors.kPurpleColor
                                                .withOpacity(.1)
                                            : context.inputDecorationTheme
                                                .fillColor),
                                    child: Text(
                                        timerState.isTimerFinished
                                            ? AppString.resend
                                            : '${AppString.resend} in ${timerState.timerCount}s',
                                        style: context.titleLarge?.copyWith(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 12,
                                            color: timerState.isTimerFinished
                                                ? AppColors.kPrimaryColor
                                                : null)),
                                  ),
                                ),
                        ),
                      ],
                    ),
                    const Gap(height: 16),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
