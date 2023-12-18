import 'package:Pouchers/ui/common/app_images.dart';
import 'package:Pouchers/ui/features/authentication/domain/dto/auth_dto.dart';
import 'package:Pouchers/ui/features/authentication/presentation/notifier/auth_notifier.dart';
import 'package:Pouchers/utils/extension.dart';
import 'package:Pouchers/utils/field_validator.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stacked/stacked_annotations.dart';

import '../../../../../../app/app.router.dart';
import '../../../../../../app/config/app_config.dart';
import '../../../../../../app/config/app_helper.dart';
import '../../../../../../app/core/router/page_router.dart';
import '../../../../../common/app_colors.dart';
import '../../../../../common/app_strings.dart';
import '../../../../../widgets/edit_text_field_with.dart';
import '../../../../../widgets/elevated_button_widget.dart';
import '../../../../../widgets/gap.dart';
import 'sign_up_view.form.dart';

@FormView(fields: [
  FormTextField(name: 'firstName'),
  FormTextField(name: 'lastName'),
  FormTextField(name: 'email'),
  FormTextField(name: 'phoneNumber'),
  FormTextField(name: 'referralCode'),
  FormTextField(name: 'password')
])
class SignUpView extends ConsumerStatefulWidget {
  const SignUpView({super.key});

  @override
  ConsumerState<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends ConsumerState<SignUpView> with $SignUpView {
  final formKey = GlobalKey<FormState>();

  bool _obscureText = true;

  late AuthNotifier _authNotifier;
  final _cancelToken = CancelToken();

  @override
  void initState() {
    firstNameFocusNode.requestFocus();
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
        child: Form(
          key: formKey,
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            children: [
              Text(AppString.createAnAccount,
                  style: context.headlineMedium
                      ?.copyWith(fontWeight: FontWeight.w700, fontSize: 24)),
              const Gap(height: 12),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: EditTextFieldWidget(
                      readOnly: appState.isBusy,
                      title: AppString.firstName,
                      label: AppString.firstNameInstruction,
                      focusNode: firstNameFocusNode,
                      controller: firstNameController,
                      textCapitalization: TextCapitalization.words,
                      keyboardType: TextInputType.text,
                      validator: FieldValidator.validateString(min: 2),
                      onFieldSubmitted: (_) =>
                          context.nextFocus(lastNameFocusNode),
                      inputFormatters: [context.charactersOnly],
                    ),
                  ),
                  const Gap(width: 17),
                  Expanded(
                    child: EditTextFieldWidget(
                      readOnly: appState.isBusy,
                      title: AppString.lastName,
                      label: AppString.lastNameInstruction,
                      controller: lastNameController,
                      focusNode: lastNameFocusNode,
                      textCapitalization: TextCapitalization.words,
                      keyboardType: TextInputType.text,
                      validator: FieldValidator.validateString(min: 2),
                      inputFormatters: [context.charactersOnly],
                      onFieldSubmitted: (_) =>
                          context.nextFocus(emailFocusNode),
                    ),
                  ),
                ],
              ),
              const Gap(height: 3),
              Text(AppString.signUpLegalInfo,
                  style:
                      context.titleLarge?.copyWith(color: AppColors.kIconGrey)),
              const Gap(height: 16),
              EditTextFieldWidget(
                readOnly: appState.isBusy,
                title: AppString.email,
                label: AppString.emailInstruction,
                controller: emailController,
                focusNode: emailFocusNode,
                keyboardType: TextInputType.emailAddress,
                validator: FieldValidator.validateEmail(),
                onFieldSubmitted: (_) =>
                    context.nextFocus(phoneNumberFocusNode),
              ),
              const Gap(height: 16),
              EditTextFieldWidget(
                readOnly: appState.isBusy,
                title: AppString.phoneNumber,
                label: AppString.phoneNumberInstruction,
                controller: phoneNumberController,
                focusNode: phoneNumberFocusNode,
                keyboardType: TextInputType.phone,
                inputFormatters: [context.limit(), context.digitsOnly],
                validator: FieldValidator.validatePhone(),
                onFieldSubmitted: (_) =>
                    context.nextFocus(referralCodeFocusNode),
              ),
              const Gap(height: 16),
              EditTextFieldWidget(
                  readOnly: appState.isBusy,
                  title: AppString.referralCode,
                  label: AppString.referralCodeInstruction,
                  controller: referralCodeController,
                  focusNode: referralCodeFocusNode,
                  keyboardType: TextInputType.text,
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
              const Gap(height: 11),
              Text(AppString.passwordHint, style: context.headlineMedium),
              const Gap(height: 32),
              ElevatedButtonWidget(
                  title: AppString.createAccount,
                  loading: appState.isBusy,
                  onPressed: _submitForm),
              const Gap(height: 16),
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child: Text(AppString.haveAccount,
                        style: context.titleLarge
                            ?.copyWith(color: AppColors.kPrimaryGrey)),
                  ),
                  InkWell(
                      onTap: () => PageRouter.pushNamed(Routes.signInView),
                      child: Text(AppString.login,
                          style: context.headlineMedium?.copyWith(
                              fontWeight: FontWeight.w700,
                              color: AppColors.kPurpleColor))),
                ],
              ),
              const Gap(height: 55),
              RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                      text: '${AppString.byCreatingAccount}\n',
                      style: context.titleLarge,
                      children: [
                        TextSpan(
                            text: AppString.termsOfUse,
                            style: context.titleLarge?.copyWith(
                                fontWeight: FontWeight.w700,
                                color: AppColors.kPrimaryColor),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () async => await AppHelper.triggerUrl(
                                  AppConfig.termsOfUse)),
                        TextSpan(text: " ${AppString.andText} "),
                        TextSpan(
                            text: "${AppString.privacyPolicy}.",
                            style: context.titleLarge?.copyWith(
                                fontWeight: FontWeight.w700,
                                color: AppColors.kPrimaryColor),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () async => await AppHelper.triggerUrl(
                                  AppConfig.privacyPolicy))
                      ])),
            ],
          ),
        ),
      ),
    );
  }

  void _submitForm() {
    if (!formKey.currentState!.validate()) return;

    final dto = AuthDto(
        firstName: firstNameController.text,
        lastName: lastNameController.text,
        email: emailController.text,
        phoneNumber: phoneNumberController.text,
        referralCode: referralCodeController.text,
        password: passwordController.text);

    _authNotifier.signUpUser(dto, _cancelToken);
  }
}
