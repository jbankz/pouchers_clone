import 'package:Pouchers/app/app.router.dart';
import 'package:Pouchers/app/config/app_config.dart';
import 'package:Pouchers/app/config/app_helper.dart';
import 'package:Pouchers/app/core/manager/intercom_manager.dart';
import 'package:Pouchers/app/core/router/page_router.dart';
import 'package:Pouchers/ui/common/app_colors.dart';
import 'package:Pouchers/ui/common/app_strings.dart';
import 'package:Pouchers/ui/features/authentication/presentation/view/password/enum/password_confirmation_type.dart';
import 'package:Pouchers/ui/features/profile/data/dao/user_dao.dart';
import 'package:Pouchers/ui/features/profile/presentation/notifier/user_notifier.dart';
import 'package:Pouchers/ui/widgets/dialog/bottom_sheet.dart';
import 'package:Pouchers/ui/widgets/edit_text_field_with.dart';
import 'package:Pouchers/ui/widgets/elevated_button_widget.dart';
import 'package:Pouchers/ui/widgets/gap.dart';
import 'package:Pouchers/utils/extension.dart';
import 'package:Pouchers/utils/field_validator.dart';
import 'package:dio/dio.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:stacked/stacked_annotations.dart';

import 'delete_view.form.dart';
import 'sheets/delete_reasons_sheet.dart';

@FormView(
    fields: [FormTextField(name: 'reason'), FormTextField(name: 'others')])
class DeleteView extends ConsumerStatefulWidget {
  const DeleteView({super.key});

  @override
  ConsumerState<DeleteView> createState() => _DeleteViewState();
}

class _DeleteViewState extends ConsumerState<DeleteView> with $DeleteView {
  late UserNotifier _userNotifier;
  final CancelToken _cancelToken = CancelToken();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _userNotifier = ref.read(userNotifierProvider.notifier);
  }

  @override
  void dispose() {
    super.dispose();
    disposeForm();
    _cancelToken.cancel();
  }

  @override
  Widget build(BuildContext context) {
    final userState = ref.watch(userNotifierProvider);
    final bool paymentNotGoingThrough =
        reasonController.text == userState.deleteReason.first;
    final bool eraseData = reasonController.text == userState.deleteReason[1];
    final bool noReason = reasonController.text != userState.deleteReason[2];
    return Scaffold(
      appBar: AppBar(title: Text(AppString.deleteAccount2)),
      body: SafeArea(
        minimum: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Expanded(
                  child: ListView(children: [
                Text(
                  AppString.deleteAccountHint,
                  style: context.headlineMedium
                      ?.copyWith(fontSize: 24, fontWeight: FontWeight.w700),
                ),
                const Gap(height: 35),
                EditTextFieldWidget(
                    readOnly: true,
                    title: AppString.reason,
                    label: AppString.selectReason,
                    controller: reasonController,
                    focusNode: reasonFocusNode,
                    keyboardType: TextInputType.text,
                    validator: FieldValidator.validateString(),
                    suffixIcon: const Icon(Icons.keyboard_arrow_down_outlined,
                        color: AppColors.kSecondaryTextColor),
                    onTap: () async {
                      BottomSheets.showSheet(child: const DeleteReasonSheet())
                          .then((reason) {
                        if (reason != null) {
                          setState(() => reasonController.text = reason ?? '');
                        }
                      });
                    }),
                const Gap(height: 40),
                if (reasonController.text == userState.deleteReason.last)
                  EditTextFieldWidget(
                    title: AppString.tellUsWhy,
                    readOnly: userState.isBusy,
                    controller: othersController,
                    focusNode: othersFocusNode,
                    keyboardType: TextInputType.multiline,
                    maxLines: 7,
                    validator: FieldValidator.validateString(),
                    onFieldSubmitted: (_) => _submit(),
                  ),
                if (paymentNotGoingThrough)
                  Text(
                      'Hi ${userDao.user.firstName?.titleCase}, ${AppString.deleteApology}',
                      style: context.headlineMedium?.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: AppColors.kIconGrey,
                          height: 1.5)),
                if (eraseData)
                  RichText(
                      textAlign: TextAlign.left,
                      text: TextSpan(
                          text:
                              'Hi ${userDao.user.firstName?.titleCase},\n\n${AppString.eraseData}',
                          style: context.titleLarge,
                          children: [
                            TextSpan(
                                text: 'privacy policy',
                                style: context.titleLarge
                                    ?.copyWith(color: AppColors.kPurpleColor),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () => AppHelper.triggerUrl(
                                      AppConfig.privacyPolicy)),
                            const TextSpan(text: ' and our '),
                            TextSpan(
                                text: 'security measures.',
                                style: context.titleLarge
                                    ?.copyWith(color: AppColors.kPurpleColor),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {}),
                          ])),
                const Gap(height: 16),
              ])),
              ElevatedButtonWidget(
                  title: noReason
                      ? AppString.talkToSupport
                      : AppString.deleteAccount,
                  onPressed: () {
                    if (!noReason) {
                      _submit();
                      return;
                    }
                    IntercomManager.displayMessenger();
                  }),
              if (noReason) const Gap(height: 29),
              if (noReason)
                InkWell(
                    onTap: _submit,
                    child: Text(AppString.deleteAccount,
                        style: context.headlineMedium?.copyWith(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: AppColors.kLightOrange)))
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;

    final response = await PageRouter.pushNamed(Routes.confirmPasswordView,
            args: const ConfirmPasswordViewArguments(
                passwordConfirmationType: PasswordConfirmationType.delete))
        as bool?;

    if (response ?? false) {
      _userNotifier.deleteAccount(_cancelToken);
    }
  }
}
