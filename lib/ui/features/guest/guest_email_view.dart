import 'package:Pouchers/app/core/router/page_router.dart';
import 'package:Pouchers/ui/common/app_colors.dart';
import 'package:Pouchers/ui/common/app_strings.dart';
import 'package:Pouchers/ui/features/dashboard/views/card/presentation/notifier/module/module.dart';
import 'package:Pouchers/ui/widgets/edit_text_field_with.dart';
import 'package:Pouchers/ui/widgets/elevated_button_widget.dart';
import 'package:Pouchers/ui/widgets/gap.dart';
import 'package:Pouchers/utils/extension.dart';
import 'package:Pouchers/utils/field_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stacked/stacked_annotations.dart';

import '../../common/app_images.dart';
import 'guest_email_view.form.dart';

@FormView(fields: [FormTextField(name: 'name'), FormTextField(name: 'email')])
class GetGuestEmailView extends ConsumerStatefulWidget {
  const GetGuestEmailView({required this.route, super.key});

  final String route;

  @override
  ConsumerState<GetGuestEmailView> createState() => _GetGuestEmailViewState();
}

class _GetGuestEmailViewState extends ConsumerState<GetGuestEmailView>
    with $GetGuestEmailView {
  @override
  void initState() {
    super.initState();
    nameFocusNode.requestFocus();
  }

  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    disposeForm();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(),
        body: SafeArea(
          minimum: EdgeInsets.symmetric(horizontal: 21.w, vertical: 16.h),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                Expanded(
                  child: ListView(
                    keyboardDismissBehavior:
                        ScrollViewKeyboardDismissBehavior.onDrag,
                    children: [
                      const Gap(height: 68),
                      SvgPicture.asset(AppImage.mail),
                      const Gap(height: 38),
                      Text(AppString.getFullInfo,
                          style: context.displaySmall?.copyWith(
                              fontWeight: FontWeight.w400,
                              color: AppColors.kIconGrey),
                          textAlign: TextAlign.center),
                      const Gap(height: 56),
                      EditTextFieldWidget(
                        title: AppString.fullName,
                        label: AppString.fullNameInstruction,
                        controller: nameController,
                        focusNode: nameFocusNode,
                        keyboardType: TextInputType.text,
                        textCapitalization: TextCapitalization.sentences,
                        onFieldSubmitted: (_) =>
                            context.nextFocus(emailFocusNode),
                        validator: FieldValidator.validateString(),
                      ),
                      const Gap(height: 16),
                      EditTextFieldWidget(
                          title: AppString.email,
                          label: AppString.emailInstruction,
                          controller: emailController,
                          focusNode: emailFocusNode,
                          keyboardType: TextInputType.emailAddress,
                          validator: FieldValidator.validateEmail(),
                          textInputAction: TextInputAction.go,
                          onFieldSubmitted: (_) => _submit())
                    ],
                  ),
                ),
                const Gap(height: 16),
                ElevatedButtonWidget(
                    title: AppString.proceed, onPressed: _submit)
              ],
            ),
          ),
        ),
      );

  void _submit() {
    if (!formKey.currentState!.validate()) return;

    ref.read(paramModule).setGuestInformations(
        email: emailController.text, name: nameController.text);
    PageRouter.pushNamed(widget.route);
    // _guestNotifier.setGuestInformation(
    //     route: widget.route,
    //     fullName: nameController.text,
    //     email: emailController.text);
  }
}
