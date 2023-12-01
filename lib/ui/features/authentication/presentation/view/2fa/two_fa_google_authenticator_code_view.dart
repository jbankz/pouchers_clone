import 'dart:async';

import 'package:Pouchers/ui/common/app_colors.dart';
import 'package:Pouchers/ui/features/authentication/presentation/notifier/auth_notifier.dart';
import 'package:Pouchers/ui/widgets/elevated_button_widget.dart';
import 'package:Pouchers/ui/widgets/gap.dart';
import 'package:Pouchers/ui/widgets/pin_code_widget.dart';
import 'package:Pouchers/utils/extension.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:stacked/stacked_annotations.dart';

import '../../../../../common/app_strings.dart';
import 'two_fa_google_authenticator_code_view.form.dart';

@FormView(fields: [FormTextField(name: 'code')])
class TwoFaGoogleAuthenticatorCodeView extends ConsumerStatefulWidget {
  const TwoFaGoogleAuthenticatorCodeView({super.key});

  @override
  ConsumerState<TwoFaGoogleAuthenticatorCodeView> createState() =>
      _TwoFaGoogleAuthenticatorCodeViewState();
}

class _TwoFaGoogleAuthenticatorCodeViewState
    extends ConsumerState<TwoFaGoogleAuthenticatorCodeView>
    with $TwoFaGoogleAuthenticatorCodeView {
  final StreamController<ErrorAnimationType> _errorAnimationController =
      StreamController<ErrorAnimationType>();
  final _formKey = GlobalKey<FormState>();

  late AuthNotifier _authNotifier;
  final CancelToken _cancelToken = CancelToken();

  @override
  void initState() {
    super.initState();
    codeFocusNode.requestFocus();
    _authNotifier = ref.read(authNotifierProvider.notifier);
  }

  @override
  void dispose() {
    super.dispose();
    _cancelToken.cancel();
    disposeForm();
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authNotifierProvider);
    return Scaffold(
      appBar: AppBar(title: Text(AppString.authentication)),
      body: SafeArea(
        minimum: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Expanded(
                  child: ListView(
                children: [
                  const Gap(height: 168),
                  Text(AppString.digitsCode,
                      style: context.headlineMedium?.copyWith(
                          fontSize: 24, fontWeight: FontWeight.w700)),
                  const Gap(height: 30),
                  PinCodeWidget(
                      controller: codeController,
                      errorAnimationController: _errorAnimationController,
                      focusNode: codeFocusNode,
                      onCompleted: (value) => _submitForm()),
                  const Gap(height: 20),
                  Text(
                    AppString.digitsCodeHint,
                    style: context.headlineMedium?.copyWith(
                        color: AppColors.kSecondaryTextColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w400),
                    textAlign: TextAlign.center,
                  )
                ],
              )),
              ElevatedButtonWidget(
                  loading: authState.isBusy,
                  title: AppString.confirm,
                  onPressed: _submitForm),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _submitForm() async {
    if (!_formKey.currentState!.validate()) return;

    _authNotifier.validateTwoFaToken(
        user2faToken: codeController.text,
        cancelToken: _cancelToken,
        onError: () {
          codeController.text = '';
          setState(() {});
          _errorAnimationController.addError(ErrorAnimationType.shake);
        });
  }
}
