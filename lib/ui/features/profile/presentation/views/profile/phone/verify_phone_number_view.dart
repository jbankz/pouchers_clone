import 'dart:async';

import 'package:Pouchers/ui/common/app_colors.dart';
import 'package:Pouchers/ui/features/profile/data/dao/user_dao.dart';
import 'package:Pouchers/ui/features/profile/domain/dto/user_dto.dart';
import 'package:Pouchers/ui/features/profile/presentation/notifier/user_notifier.dart';
import 'package:Pouchers/utils/extension.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:stacked/stacked_annotations.dart';

import '../../../../../../common/app_strings.dart';
import '../../../../../../widgets/elevated_button_widget.dart';
import '../../../../../../widgets/gap.dart';
import '../../../../../../widgets/pin_code_widget.dart';
import '../../../../../authentication/presentation/view/otp/notifier/module.dart';
import '../../../../../authentication/presentation/view/otp/notifier/timer_notifier.dart';
import 'verify_phone_number_view.form.dart';

@FormView(fields: [FormTextField(name: 'otp')])
class VerifyPhoneOtpView extends ConsumerStatefulWidget {
  const VerifyPhoneOtpView({super.key});

  @override
  ConsumerState<VerifyPhoneOtpView> createState() => _VerifyPhoneOtpViewState();
}

class _VerifyPhoneOtpViewState extends ConsumerState<VerifyPhoneOtpView>
    with $VerifyPhoneOtpView {
  final formKey = GlobalKey<FormState>();

  late UserNotifier _userNotifier;
  late OtpTimerNotifier _otpTimerNotifier;
  final StreamController<ErrorAnimationType> _errorController =
      StreamController<ErrorAnimationType>();

  final CancelToken _cancelToken = CancelToken();

  @override
  void initState() {
    otpFocusNode.requestFocus();
    _userNotifier = ref.read(userNotifierProvider.notifier);
    _otpTimerNotifier = ref.read(otpTimerModule.notifier);
    _otpTimerNotifier.resetTimer();
    super.initState();
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
    final userState = ref.watch(userNotifierProvider);
    return Scaffold(
      appBar: AppBar(title: Text(AppString.changePhoneNumber)),
      body: SafeArea(
        minimum: EdgeInsets.symmetric(horizontal: 16.w),
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
                    Text(AppString.requestVerificationPhoneHint,
                        style: context.titleLarge?.copyWith(fontSize: 16)),
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
                  loading: userState.isBusy,
                  onPressed: timerState.isTimerFinished
                      ? null
                      : () {
                          if (!formKey.currentState!.validate()) return;
                          _userNotifier.validatePhoneNumberOtp(
                              UserDto(
                                  email: userDao.user.email,
                                  resetCode: otpController.text),
                              cancelToken: _cancelToken);
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
                        : () => _userNotifier.requestPhoneNumberOtp(
                            UserDto(email: userDao.user.email),
                            cancelToken: _cancelToken,
                            resent: true),
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
              ),
              const Gap(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
