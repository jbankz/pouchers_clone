import 'dart:async';

import 'package:pouchers/ui/features/authentication/domain/dto/auth_dto.dart';
import 'package:pouchers/utils/extension.dart';
import 'package:dio/dio.dart';
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
import 'verify_password_account.form.dart';

@FormView(fields: [FormTextField(name: 'otp')])
class VerifyPasswordAccountView extends ConsumerStatefulWidget {
  const VerifyPasswordAccountView({super.key, this.email});

  final String? email;

  @override
  ConsumerState<VerifyPasswordAccountView> createState() =>
      _VerifyPasswordAccountViewState();
}

class _VerifyPasswordAccountViewState
    extends ConsumerState<VerifyPasswordAccountView>
    with $VerifyPasswordAccountView {
  final formKey = GlobalKey<FormState>();

  late AuthNotifier _authNotifier;
  final StreamController<ErrorAnimationType> _errorController =
      StreamController<ErrorAnimationType>();

  final CancelToken _cancelToken = CancelToken();

  @override
  void initState() {
    otpFocusNode.requestFocus();
    _authNotifier = ref.read(authNotifierProvider.notifier);

    super.initState();
  }

  @override
  void dispose() {
    _cancelToken.cancel();
    disposeForm();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final appState = ref.watch(authNotifierProvider);
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        minimum: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
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
                    Text(AppString.verificationSubTextOne,
                        style: context.titleLarge?.copyWith(fontSize: 16)),
                    const Gap(height: 32),
                    Text(AppString.resetCode,
                        style: context.titleLarge?.copyWith(fontSize: 12)),
                    const Gap(height: 8),
                    PinCodeWidget(
                        errorAnimationController: _errorController,
                        controller: otpController,
                        focusNode: otpFocusNode,
                        readOnly: appState.isBusy,
                        onCompleted: (_) => _submitForm())
                  ],
                ),
              ),
              ElevatedButtonWidget(
                  title: AppString.recoverPassword,
                  loading: appState.isBusy,
                  onPressed: _submitForm),
            ],
          ),
        ),
      ),
    );
  }

  void _submitForm() {
    if (!formKey.currentState!.validate()) return;
    _authNotifier.validateResetPassword(
        AuthDto(email: widget.email, resetCode: otpController.text),
        _cancelToken);
  }
}
