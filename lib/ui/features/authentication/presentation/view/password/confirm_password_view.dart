import 'package:Pouchers/app/core/router/page_router.dart';
import 'package:Pouchers/ui/common/app_colors.dart';
import 'package:Pouchers/ui/common/app_images.dart';
import 'package:Pouchers/ui/features/authentication/presentation/notifier/auth_notifier.dart';
import 'package:Pouchers/ui/widgets/dialog/bottom_sheet.dart';
import 'package:Pouchers/utils/extension.dart';
import 'package:Pouchers/utils/field_validator.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stacked/stacked_annotations.dart';

import '../../../../../common/app_strings.dart';
import '../../../../../notification/notification_tray.dart';
import '../../../../../widgets/edit_text_field_with.dart';
import '../../../../../widgets/elevated_button_widget.dart';
import '../../../../../widgets/gap.dart';
import '../../../../profile/data/dao/user_dao.dart';
import '../../../domain/dto/auth_dto.dart';
import 'confirm_password_view.form.dart';
import 'enum/password_confirmation_type.dart';
import 'sheets/info_sheets.dart';

@FormView(fields: [FormTextField(name: 'password')])
class ConfirmPasswordView extends ConsumerStatefulWidget {
  const ConfirmPasswordView(
      {super.key,
      this.passwordConfirmationType = PasswordConfirmationType.disable});

  final PasswordConfirmationType? passwordConfirmationType;

  @override
  ConsumerState<ConfirmPasswordView> createState() =>
      _ConfirmPasswordViewState();
}

class _ConfirmPasswordViewState extends ConsumerState<ConfirmPasswordView>
    with $ConfirmPasswordView {
  final formKey = GlobalKey<FormState>();

  bool _obscureText = true;

  late AuthNotifier _authNotifier;

  final CancelToken _cancelToken = CancelToken();

  bool _isDeleteAccount = false;

  @override
  void initState() {
    passwordFocusNode.requestFocus();
    _authNotifier = ref.read(authNotifierProvider.notifier);
    _isDeleteAccount =
        widget.passwordConfirmationType == PasswordConfirmationType.delete;
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _cancelToken.cancel();
    disposeForm();
  }

  @override
  Widget build(BuildContext context) {
    final appState = ref.watch(authNotifierProvider);
    return Scaffold(
      appBar: AppBar(
          title: Text(_isDeleteAccount
              ? AppString.deleteAccount2
              : AppString.disableAccount2)),
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
                    Text(AppString.confirmation,
                        style: context.displayLarge?.copyWith(
                            fontWeight: FontWeight.w700, fontSize: 24)),
                    const Gap(height: 8),
                    Text(
                        _isDeleteAccount
                            ? AppString.confirmPasswordDeleteHint
                            : AppString.confirmPasswordDisableHint,
                        style: context.titleLarge?.copyWith(fontSize: 16)),
                    const Gap(height: 43),
                    EditTextFieldWidget(
                        readOnly: appState.isBusy,
                        title: AppString.password,
                        label: AppString.passwordInstruction,
                        controller: passwordController,
                        focusNode: passwordFocusNode,
                        obscureText: _obscureText,
                        validator: FieldValidator.validateSpecialPassword(),
                        suffixIcon: CupertinoButton(
                          padding: EdgeInsets.zero,
                          onPressed: () =>
                              setState(() => _obscureText = !_obscureText),
                          child: SvgPicture.asset(
                              _obscureText
                                  ? AppImage.showEye
                                  : AppImage.hideEye,
                              fit: BoxFit.scaleDown),
                        ),
                        textInputAction: TextInputAction.done,
                        onFieldSubmitted: (_) => _submitForm()),
                  ],
                ),
              ),
              const Gap(height: 16),
              ElevatedButtonWidget(
                  outlinedColor:
                      _isDeleteAccount ? AppColors.kLightOrange : null,
                  bacgroundColor:
                      _isDeleteAccount ? AppColors.kLightOrange : null,
                  title: _isDeleteAccount
                      ? AppString.deleteAccount2
                      : AppString.disableAccount2,
                  loading: appState.isBusy,
                  onPressed: _submitForm),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _submitForm() async {
    if (!formKey.currentState!.validate()) return;

    final response = await BottomSheets.showAlertDialog(
            child: ConfirmationPasswordSheet(
                passwordConfirmationType: widget.passwordConfirmationType))
        as bool?;

    if (response ?? false) {
      _authNotifier.signInUser(
          AuthDto(email: userDao.user.email, password: passwordController.text),
          cancelToken: _cancelToken,
          onSuccess: () => PageRouter.pop(true),
          onError: (error) => triggerNotificationTray(
              error.toString().replaceAll('email/', ''),
              error: true));
    }
  }
}
