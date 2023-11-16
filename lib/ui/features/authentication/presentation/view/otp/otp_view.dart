import 'dart:async';

import 'package:Pouchers/ui/common/app_colors.dart';
import 'package:Pouchers/ui/features/authentication/domain/dto/auth_dto.dart';
import 'package:Pouchers/utils/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:stacked/stacked_annotations.dart';

import '../../../../../common/app_strings.dart';
import '../../../../../widgets/elevated_button_widget.dart';
import '../../../../../widgets/gap.dart';
import '../../../../../widgets/pin_code_widget.dart';
import '../../notifier/auth_notifier.dart';
import 'notifier/module.dart';
import 'notifier/timer_notifier.dart';
import 'otp_view.form.dart';

@FormView(fields: [FormTextField(name: 'otp')])
class OtpView extends ConsumerStatefulWidget {
  const OtpView({super.key, this.email});

  final String? email;

  @override
  ConsumerState<OtpView> createState() => _OtpViewState();
}

class _OtpViewState extends ConsumerState<OtpView> with $OtpView {
  final formKey = GlobalKey<FormState>();

  late AuthNotifier _authNotifier;
  late OtpTimerNotifier _otpTimerNotifier;
  final StreamController<ErrorAnimationType> _errorController =
      StreamController<ErrorAnimationType>();

  @override
  void initState() {
    otpFocusNode.requestFocus();
    _authNotifier = ref.read(authNotifierProvider.notifier);
    _otpTimerNotifier = ref.read(otpTimerModule.notifier);
    _otpTimerNotifier.startTimer();
    super.initState();
  }

  @override
  void dispose() {
    _otpTimerNotifier.cancelTimer();
    disposeForm();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final timerState = ref.watch(otpTimerModule);
    final authState = ref.watch(authNotifierProvider);
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
                            fontWeight: FontWeight.w700, fontSize: 24.sp)),
                    const Gap(height: 8),
                    RichText(
                        text: TextSpan(
                            text: AppString.verificationSubText,
                            style: context.titleLarge?.copyWith(fontSize: 16),
                            children: [
                          TextSpan(
                            text: widget.email ?? '',
                            style: context.titleLarge?.copyWith(
                                fontWeight: FontWeight.w500, fontSize: 16),
                          )
                        ])),
                    const Gap(height: 32),
                    PinCodeWidget(
                        errorAnimationController: _errorController,
                        controller: otpController,
                        focusNode: otpFocusNode)
                  ],
                ),
              ),
              ElevatedButtonWidget(
                  title: AppString.verifyAccountCode,
                  loading: authState.isBusy,
                  onPressed: timerState.isTimerFinished
                      ? null
                      : () {
                          if (!formKey.currentState!.validate()) return;
                          _authNotifier.verifyAccountEmail(
                              AuthDto(otp: otpController.text), () {
                            _errorController.add(ErrorAnimationType.shake);
                            otpController.clear();
                            otpFocusNode.requestFocus();
                            setState(() {});
                          });
                        }),
              const Gap(height: 24),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(AppString.noCode, style: context.titleLarge?.copyWith()),
                  const Gap(width: 8),
                  InkWell(
                    onTap: !timerState.isTimerFinished
                        ? null
                        : () => _authNotifier
                            .requestOtp(AuthDto(email: widget.email)),
                    borderRadius: BorderRadius.circular(20.r),
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 14.w, vertical: 4.h),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.r),
                          color: timerState.isTimerFinished
                              ? AppColors.kPurpleColor.withOpacity(.1)
                              : context.inputDecorationTheme.fillColor),
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
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
