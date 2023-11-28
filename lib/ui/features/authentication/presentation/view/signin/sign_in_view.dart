import 'package:Pouchers/app/app.router.dart';
import 'package:Pouchers/ui/common/app_images.dart';
import 'package:Pouchers/ui/features/authentication/domain/dto/auth_dto.dart';
import 'package:Pouchers/ui/features/authentication/presentation/notifier/auth_notifier.dart';
import 'package:Pouchers/ui/features/authentication/presentation/view/biometric/notifier/module.dart';
import 'package:Pouchers/utils/extension.dart';
import 'package:Pouchers/utils/field_validator.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stacked/stacked_annotations.dart';

import '../../../../../../app/core/router/page_router.dart';
import '../../../../../common/app_colors.dart';
import '../../../../../common/app_strings.dart';
import '../../../../../widgets/edit_text_field_with.dart';
import '../../../../../widgets/elevated_button_widget.dart';
import '../../../../../widgets/gap.dart';
import 'sign_in_view.form.dart';

@FormView(
    fields: [FormTextField(name: 'email'), FormTextField(name: 'password')])
class SignInView extends ConsumerStatefulWidget {
  const SignInView({super.key});

  @override
  ConsumerState<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends ConsumerState<SignInView> with $SignInView {
  final formKey = GlobalKey<FormState>();

  bool _obscureText = true;

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
    super.dispose();
    _cancelToken.cancel();
    disposeForm();
  }

  @override
  Widget build(BuildContext context) {
    final appState = ref.watch(authNotifierProvider);
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Form(
          key: formKey,
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            children: [
              const Gap(height: 21),
              Align(
                  alignment: Alignment.centerLeft,
                  child: SvgPicture.asset(AppImage.appLogo)),
              const Gap(height: 25),
              Text(AppString.loginAccount,
                  style: context.displayLarge
                      ?.copyWith(fontWeight: FontWeight.w700, fontSize: 24.sp)),
              const Gap(height: 8),
              Text(AppString.loginSubText,
                  style: context.titleLarge?.copyWith(fontSize: 16)),
              const Gap(height: 43),
              EditTextFieldWidget(
                  readOnly: appState.isBusy,
                  title: AppString.loginEmail,
                  label: AppString.loginEmailInstruction,
                  controller: emailController,
                  focusNode: emailFocusNode,
                  keyboardType: TextInputType.emailAddress,
                  validator: FieldValidator.validateString(),
                  onFieldSubmitted: (_) =>
                      context.nextFocus(passwordFocusNode)),
              const Gap(height: 16),
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
                        _obscureText ? AppImage.showEye : AppImage.hideEye,
                        fit: BoxFit.scaleDown),
                  ),
                  textInputAction: TextInputAction.done,
                  onFieldSubmitted: (_) => _submitForm()),
              const Gap(height: 16),
              InkWell(
                onTap: () => PageRouter.pushNamed(Routes.forgotPasswordView),
                child: Text('${AppString.forgotPassword}?',
                    style: context.headlineMedium
                        ?.copyWith(color: AppColors.kPurpleColor),
                    textAlign: TextAlign.right),
              ),
              const Gap(height: 28),
              ElevatedButtonWidget(
                  title: AppString.login,
                  loading: appState.isBusy,
                  onPressed: _submitForm),
              const Gap(height: 16),
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child: Text(AppString.dontHaveAccount,
                        style: context.titleLarge
                            ?.copyWith(color: AppColors.kPrimaryGrey)),
                  ),
                  InkWell(
                    onTap: () => PageRouter.pushNamed(Routes.signUpView),
                    child: Text(AppString.createOne,
                        style: context.headlineMedium?.copyWith(
                            fontWeight: FontWeight.w700,
                            color: AppColors.kPurpleColor)),
                  ),
                ],
              ),
              const Gap(height: 43),
              if (appState.data as bool)
                InkWell(
                  onTap: _authenticateUsingBiometric,
                  customBorder: const CircleBorder(),
                  child: Container(
                    height: 48.h,
                    width: 48.w,
                    decoration: const BoxDecoration(
                        color: AppColors.paleLavenderGray,
                        shape: BoxShape.circle),
                    child: SvgPicture.asset(AppImage.faceId,
                        fit: BoxFit.scaleDown),
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }

  void _submitForm() {
    if (!formKey.currentState!.validate()) return;

    _authNotifier.signInUser(
        AuthDto(email: emailController.text, password: passwordController.text),
        _cancelToken);
  }

  void _authenticateUsingBiometric() =>
      ref.read(biometricNotifier.notifier).authenticateUser(
          callbackAction: () =>
              _authNotifier.signInUserWithBiometric(_cancelToken));
}
