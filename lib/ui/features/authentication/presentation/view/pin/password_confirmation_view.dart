import 'package:pouchers/app/app.router.dart';
import 'package:pouchers/app/core/router/page_router.dart';
import 'package:pouchers/ui/common/app_images.dart';
import 'package:pouchers/ui/features/authentication/domain/dto/auth_dto.dart';
import 'package:pouchers/ui/features/authentication/presentation/notifier/auth_notifier.dart';
import 'package:pouchers/ui/features/profile/data/dao/user_dao.dart';
import 'package:pouchers/utils/extension.dart';
import 'package:pouchers/utils/field_validator.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stacked/stacked_annotations.dart';

import '../../../../../common/app_colors.dart';
import '../../../../../common/app_strings.dart';
import '../../../../../notification/notification_tray.dart';
import '../../../../../widgets/edit_text_field_with.dart';
import '../../../../../widgets/elevated_button_widget.dart';
import '../../../../../widgets/gap.dart';
import 'password_confirmation_view.form.dart';

@FormView(fields: [FormTextField(name: 'password')])
class PasswordConfirmationView extends ConsumerStatefulWidget {
  const PasswordConfirmationView({super.key});

  @override
  ConsumerState<PasswordConfirmationView> createState() =>
      _PasswordConfirmationViewState();
}

class _PasswordConfirmationViewState
    extends ConsumerState<PasswordConfirmationView>
    with $PasswordConfirmationView {
  final formKey = GlobalKey<FormState>();

  late AuthNotifier _authNotifier;
  bool _obscureText = true;

  final CancelToken _cancelToken = CancelToken();

  @override
  void initState() {
    passwordFocusNode.requestFocus();
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
      appBar: AppBar(title: Text(AppString.transactionPin)),
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
                    Text(AppString.passwordInstruction,
                        style: context.titleLarge?.copyWith(
                            fontWeight: FontWeight.w700,
                            fontSize: 24,
                            color: AppColors.kPrimaryTextColor)),
                    const Gap(height: 8),
                    Text(AppString.passwordInstruction2,
                        style: context.titleLarge?.copyWith(fontSize: 16)),
                    const Gap(height: 43),
                    EditTextFieldWidget(
                        readOnly: appState.isBusy,
                        title: AppString.newPassword,
                        label: AppString.newPasswordInstruction,
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
              const Gap(height: 28),
              ElevatedButtonWidget(
                  title: AppString.proceed,
                  loading: appState.isBusy,
                  onPressed: _submitForm),
              const Gap(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  void _submitForm() {
    if (!formKey.currentState!.validate()) return;

    _authNotifier.signInUser(
        AuthDto(email: userDao.user.email, password: passwordController.text),
        cancelToken: _cancelToken,
        onSuccess: () => PageRouter.pushNamed(Routes.changePinView),
        onError: (error) => triggerNotificationTray(
            error.toString().replaceAll('email/', ''),
            error: true));
  }
}
