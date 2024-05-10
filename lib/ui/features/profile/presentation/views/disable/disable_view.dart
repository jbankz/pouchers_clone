import 'package:pouchers/app/app.router.dart';
import 'package:pouchers/app/core/router/page_router.dart';
import 'package:pouchers/ui/common/app_colors.dart';
import 'package:pouchers/ui/common/app_strings.dart';
import 'package:pouchers/ui/features/profile/presentation/notifier/user_notifier.dart';
import 'package:pouchers/ui/widgets/dialog/bottom_sheet.dart';
import 'package:pouchers/ui/widgets/edit_text_field_with.dart';
import 'package:pouchers/ui/widgets/elevated_button_widget.dart';
import 'package:pouchers/ui/widgets/gap.dart';
import 'package:pouchers/utils/extension.dart';
import 'package:pouchers/utils/field_validator.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:stacked/stacked_annotations.dart';

import 'disable_view.form.dart';
import 'sheets/disable_reasons_sheet.dart';

@FormView(
    fields: [FormTextField(name: 'reason'), FormTextField(name: 'others')])
class DisableView extends ConsumerStatefulWidget {
  const DisableView({super.key});

  @override
  ConsumerState<DisableView> createState() => _DisableViewState();
}

class _DisableViewState extends ConsumerState<DisableView> with $DisableView {
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

    return Scaffold(
      appBar: AppBar(title: Text(AppString.disableAccount2)),
      body: SafeArea(
        minimum: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Expanded(
                  child: ListView(children: [
                Text(
                  AppString.whyDisableAccount,
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
                      if (userState.isBusy) return;

                      BottomSheets.showSheet(child: const DisableReasonSheet())
                          .then((reason) {
                        if (reason != null) {
                          setState(() => reasonController.text = reason ?? '');
                        }
                      });
                    }),
                const Gap(height: 40),
                if (reasonController.text == 'Others')
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
                const Gap(height: 16),
              ])),
              ElevatedButtonWidget(
                  loading: userState.isBusy,
                  title: AppString.disableAccount2,
                  onPressed: _submit)
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;

    final String reason = reasonController.text == 'Others'
        ? othersController.text
        : reasonController.text;

    final response =
        await PageRouter.pushNamed(Routes.confirmPasswordView) as bool?;

    if (response ?? false) {
      _userNotifier.disableAccount(reason, _cancelToken);
    }
  }
}
