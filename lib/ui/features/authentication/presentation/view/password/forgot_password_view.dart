import 'package:Pouchers/ui/features/authentication/domain/dto/auth_dto.dart';
import 'package:Pouchers/ui/features/authentication/presentation/notifier/auth_notifier.dart';
import 'package:Pouchers/utils/extension.dart';
import 'package:Pouchers/utils/field_validator.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked_annotations.dart';

import '../../../../../common/app_colors.dart';
import '../../../../../common/app_strings.dart';
import '../../../../../widgets/edit_text_field_with.dart';
import '../../../../../widgets/elevated_button_widget.dart';
import '../../../../../widgets/gap.dart';
import 'forgot_password_view.form.dart';

@FormView(fields: [FormTextField(name: 'email')])
class ForgotPasswordView extends ConsumerStatefulWidget {
  const ForgotPasswordView({super.key});

  @override
  ConsumerState<ForgotPasswordView> createState() => _ForgotPasswordViewState();
}

class _ForgotPasswordViewState extends ConsumerState<ForgotPasswordView>
    with $ForgotPasswordView {
  final formKey = GlobalKey<FormState>();

  late AuthNotifier _authNotifier;

  final CancelToken _cancelToken = CancelToken();

  @override
  void initState() {
    emailFocusNode.requestFocus();
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
                child: Column(children: [
                  Expanded(
                    child: ListView(
                      keyboardDismissBehavior:
                          ScrollViewKeyboardDismissBehavior.onDrag,
                      children: [
                        Text('${AppString.forgotPassword}?',
                            style: context.titleLarge?.copyWith(
                                fontWeight: FontWeight.w700,
                                fontSize: 24,
                                color: AppColors.kPrimaryTextColor)),
                        const Gap(height: 8),
                        Text(AppString.forgotPasswordSubText,
                            style: context.titleLarge?.copyWith(fontSize: 16)),
                        const Gap(height: 43),
                        EditTextFieldWidget(
                            readOnly: appState.isBusy,
                            title: AppString.email,
                            label: AppString.emailPesonalizedInstruction,
                            controller: emailController,
                            focusNode: emailFocusNode,
                            keyboardType: TextInputType.emailAddress,
                            validator: FieldValidator.validateString(),
                            onFieldSubmitted: (_) => _submitForm()),
                      ],
                    ),
                  ),
                  const Gap(height: 28),
                  ElevatedButtonWidget(
                      title: AppString.recoverPassword,
                      loading: appState.isBusy,
                      onPressed: _submitForm)
                ]))));
  }

  void _submitForm() {
    if (!formKey.currentState!.validate()) return;

    _authNotifier.forgotPassword(
        AuthDto(email: emailController.text), _cancelToken);
  }
}
