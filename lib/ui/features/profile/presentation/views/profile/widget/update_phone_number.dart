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
import 'update_phone_number.form.dart';

@FormView(fields: [FormTextField(name: 'phone')])
class UpdatePhoneNumberWidget extends ConsumerStatefulWidget {
  const UpdatePhoneNumberWidget({super.key});

  @override
  ConsumerState<UpdatePhoneNumberWidget> createState() =>
      _UpdatePhoneNumberWidgetState();
}

class _UpdatePhoneNumberWidgetState
    extends ConsumerState<UpdatePhoneNumberWidget>
    with $UpdatePhoneNumberWidget {
  late UserNotifier _userNotifier;
  final CancelToken _cancelToken = CancelToken();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _userNotifier = ref.read(userNotifierProvider.notifier);
    phoneController.text = userDao.user.phoneNumber ?? '';
    phoneFocusNode.requestFocus();
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
                AppString.phone,
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
                  focusNode: phoneFocusNode,
                  controller: phoneController,
                  keyboardType: TextInputType.number,
                  validator: FieldValidator.validatePhone(),
                  onFieldSubmitted: (_) => _submit(),
                  inputFormatters: [context.digitsOnly]),
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
                                        fontWeight: FontWeight.w600))),
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

    _userNotifier.updateProfile(UserDto(phoneNumber: phoneController.text),
        cancelToken: _cancelToken, success: () => PageRouter.pop());
  }
}
