import 'dart:async';

import 'package:Pouchers/ui/features/authentication/presentation/notifier/auth_notifier.dart';
import 'package:Pouchers/utils/extension.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:stacked/stacked_annotations.dart';

import '../../../../../common/app_colors.dart';
import '../../../../../common/app_strings.dart';
import '../../../../../widgets/elevated_button_widget.dart';
import '../../../../../widgets/gap.dart';
import '../../../../../widgets/pin_code_widget.dart';
import 'change_pin_view.form.dart';

@FormView(fields: [
  FormTextField(name: 'newPin'),
  FormTextField(name: 'confirmNewPin')
])
class ChangePinView extends ConsumerStatefulWidget {
  const ChangePinView({super.key});

  @override
  ConsumerState<ChangePinView> createState() => _ChangePinViewState();
}

class _ChangePinViewState extends ConsumerState<ChangePinView>
    with $ChangePinView {
  final formKey = GlobalKey<FormState>();

  late AuthNotifier _authNotifier;
  bool _obscureText = true;

  final CancelToken _cancelToken = CancelToken();

  final StreamController<ErrorAnimationType> _newPinErrorController =
      StreamController<ErrorAnimationType>();

  final StreamController<ErrorAnimationType> _confirmNewPinErrorController =
      StreamController<ErrorAnimationType>();

  @override
  void initState() {
    newPinFocusNode.requestFocus();
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
        minimum: const EdgeInsets.symmetric(horizontal: 16),
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
                            fontSize: 24.sp,
                            color: AppColors.kPrimaryTextColor)),
                    const Gap(height: 8),
                    Text(AppString.passwordInstruction2,
                        style: context.titleLarge?.copyWith(fontSize: 16)),
                    const Gap(height: 43),
                    Text(AppString.newPin,
                        style: context.titleLarge?.copyWith(fontSize: 12.sp)),
                    const Gap(height: 8),
                    PinCodeWidget(
                        pinLength: 4,
                        align: MainAxisAlignment.start,
                        errorAnimationController: _newPinErrorController,
                        controller: newPinController,
                        focusNode: newPinFocusNode),
                    const Gap(height: 32),
                    Text(AppString.confirmNewPin,
                        style: context.titleLarge?.copyWith(fontSize: 12.sp)),
                    const Gap(height: 8),
                    PinCodeWidget(
                        align: MainAxisAlignment.start,
                        pinLength: 4,
                        errorAnimationController: _confirmNewPinErrorController,
                        controller: newPinController,
                        focusNode: newPinFocusNode),
                  ],
                ),
              ),
              const Gap(height: 28),
              ElevatedButtonWidget(
                  title: AppString.savePin,
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
  }
}
