import 'package:pouchers/ui/common/app_colors.dart';
import 'package:pouchers/ui/common/app_strings.dart';
import 'package:pouchers/ui/features/profile/data/dao/user_dao.dart';
import 'package:pouchers/ui/features/profile/domain/dto/user_dto.dart';
import 'package:pouchers/ui/features/profile/presentation/notifier/user_notifier.dart';
import 'package:pouchers/ui/widgets/edit_text_field_with.dart';
import 'package:pouchers/ui/widgets/gap.dart';
import 'package:pouchers/utils/extension.dart';
import 'package:pouchers/utils/field_validator.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked_annotations.dart';

import '../../../../../../../app/core/router/page_router.dart';
import 'update_fullname.form.dart';

@FormView(
    fields: [FormTextField(name: 'firstName'), FormTextField(name: 'lastName')])
class UpdateFullNameWidget extends ConsumerStatefulWidget {
  const UpdateFullNameWidget({super.key});

  @override
  ConsumerState<UpdateFullNameWidget> createState() =>
      _UpdateFullNameWidgetState();
}

class _UpdateFullNameWidgetState extends ConsumerState<UpdateFullNameWidget>
    with $UpdateFullNameWidget {
  late UserNotifier _userNotifier;
  final CancelToken _cancelToken = CancelToken();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _userNotifier = ref.read(userNotifierProvider.notifier);
    firstNameController.text = userDao.user.firstName?.titleCase ?? '';
    lastNameController.text = userDao.user.lastName?.titleCase ?? '';
    firstNameFocusNode.requestFocus();
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
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 23.w, vertical: 23.h),
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                AppString.fullName,
                style: context.headlineLarge?.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: AppColors.kPrimaryTextColor),
              ),
              const Gap(height: 20),
              EditTextFieldWidget(
                readOnly: userState.isBusy,
                title: AppString.firstName,
                label: AppString.firstNameInstruction,
                focusNode: firstNameFocusNode,
                controller: firstNameController,
                textCapitalization: TextCapitalization.words,
                keyboardType: TextInputType.text,
                validator: FieldValidator.validateString(min: 2),
                onFieldSubmitted: (_) => context.nextFocus(lastNameFocusNode),
                inputFormatters: [context.charactersOnly],
              ),
              const Gap(height: 20),
              EditTextFieldWidget(
                  readOnly: userState.isBusy,
                  title: AppString.lastName,
                  label: AppString.lastNameInstruction,
                  controller: lastNameController,
                  focusNode: lastNameFocusNode,
                  textCapitalization: TextCapitalization.words,
                  keyboardType: TextInputType.text,
                  validator: FieldValidator.validateString(min: 2),
                  inputFormatters: [context.charactersOnly],
                  onFieldSubmitted: (_) => _submit()),
              const Gap(height: 20),
              Align(
                alignment: Alignment.bottomRight,
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 350),
                  child: userState.isBusy
                      ? const CupertinoActivityIndicator()
                      : Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            GestureDetector(
                              onTap: () => PageRouter.pop(),
                              child: Text(AppString.cancel,
                                  style: context.titleMedium?.copyWith(
                                      fontSize: 18,
                                      color: AppColors.kSecondaryTextColor,
                                      fontWeight: FontWeight.w600)),
                            ),
                            const Gap(width: 45),
                            Flexible(
                              child: GestureDetector(
                                onTap: _submit,
                                child: Text(AppString.save,
                                    style: context.titleMedium?.copyWith(
                                        fontSize: 18,
                                        color: AppColors.kPrimaryColor,
                                        fontWeight: FontWeight.w700)),
                              ),
                            ),
                          ],
                        ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _submit() {
    if (!_formKey.currentState!.validate()) return;

    _userNotifier.updateProfile(
        UserDto(
            firstName: firstNameController.text,
            lastName: lastNameController.text),
        cancelToken: _cancelToken,
        success: () => PageRouter.pop());
  }
}
