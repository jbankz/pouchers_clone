import 'dart:async';

import 'package:Pouchers/ui/common/app_colors.dart';
import 'package:Pouchers/ui/features/authentication/domain/dto/auth_dto.dart';
import 'package:Pouchers/ui/features/profile/data/dao/user_dao.dart';
import 'package:Pouchers/ui/features/profile/domain/dto/user_dto.dart';
import 'package:Pouchers/ui/features/profile/presentation/notifier/user_notifier.dart';
import 'package:Pouchers/utils/extension.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:stacked/stacked_annotations.dart';

import '../../../../../../../utils/field_validator.dart';
import '../../../../../../common/app_strings.dart';
import '../../../../../../widgets/edit_text_field_with.dart';
import '../../../../../../widgets/elevated_button_widget.dart';
import '../../../../../../widgets/gap.dart';
import '../../../../../../widgets/pin_code_widget.dart';
import '../../../../../authentication/presentation/notifier/auth_notifier.dart';
import '../../../../../authentication/presentation/view/otp/notifier/module.dart';
import '../../../../../authentication/presentation/view/otp/notifier/timer_notifier.dart';
import 'change_password_view.form.dart';
import 'verify_phone_number_view.form.dart';

@FormView(fields: [FormTextField(name: 'phoneNumber')])
class ChangePhoneNumberView extends ConsumerStatefulWidget {
  const ChangePhoneNumberView({super.key});

  @override
  ConsumerState<ChangePhoneNumberView> createState() =>
      _ChangePhoneNumberViewState();
}

class _ChangePhoneNumberViewState extends ConsumerState<ChangePhoneNumberView>
    with $ChangePhoneNumberView {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  late UserNotifier _userNotifier;
  late OtpTimerNotifier _otpTimerNotifier;

  final CancelToken _cancelToken = CancelToken();

  @override
  void initState() {
    phoneNumberFocusNode.requestFocus();
    _userNotifier = ref.read(userNotifierProvider.notifier);
    _otpTimerNotifier = ref.read(otpTimerModule.notifier);
    _otpTimerNotifier.startTimer();
    super.initState();
  }

  @override
  void dispose() {
    _otpTimerNotifier.cancelTimer();
    _cancelToken.cancel();
    disposeForm();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final userState = ref.watch(userNotifierProvider);
    return Scaffold(
      appBar: AppBar(title: Text(AppString.changePhoneNumber)),
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
                    Text(AppString.changePhone,
                        style: context.headlineMedium?.copyWith(
                            fontWeight: FontWeight.w700, fontSize: 24.sp)),
                    const Gap(height: 8),
                    Text(AppString.changePhoneInstr,
                        style: context.titleLarge?.copyWith(fontSize: 16)),
                    const Gap(height: 32),
                    EditTextFieldWidget(
                        readOnly: userState.isBusy,
                        title: AppString.firstName,
                        label: AppString.firstNameInstruction,
                        focusNode: phoneNumberFocusNode,
                        controller: phoneNumberController,
                        keyboardType: TextInputType.number,
                        validator: FieldValidator.validatePhone(),
                        onFieldSubmitted: (_) => _submit(),
                        inputFormatters: [context.digitsOnly]),
                  ],
                ),
              ),
              ElevatedButtonWidget(
                  title: AppString.save,
                  loading: userState.isBusy,
                  onPressed: _submit),
            ],
          ),
        ),
      ),
    );
  }

  void _submit() {
    if (!formKey.currentState!.validate()) return;

    _userNotifier.changePhone(UserDto(phoneNumber: phoneNumberController.text),
        cancelToken: _cancelToken);
  }
}
