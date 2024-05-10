import 'dart:async';
import 'dart:io';

import 'package:pouchers/ui/common/app_colors.dart';
import 'package:pouchers/ui/common/app_strings.dart';
import 'package:pouchers/utils/extension.dart';
import 'package:pouchers/utils/field_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class PinCodeWidget extends StatelessWidget {
  final Function(String?)? onSaved;
  final Function(String)? onChanged;
  final MainAxisAlignment align;
  final int pinLength;
  final FocusNode? focusNode;
  final TextEditingController? controller;
  final bool readOnly;
  final StreamController<ErrorAnimationType>? errorAnimationController;
  final void Function(String)? onCompleted;
  final String? Function(String?)? validator;

  const PinCodeWidget(
      {super.key,
      this.onSaved,
      this.onChanged,
      this.pinLength = 6,
      this.focusNode,
      this.controller,
      this.readOnly = false,
      this.errorAnimationController,
      this.onCompleted,
      this.validator,
      this.align = MainAxisAlignment.spaceBetween});

  @override
  Widget build(BuildContext context) => PinCodeTextField(
      keyboardType: TextInputType.number,
      enableActiveFill: true,
      mainAxisAlignment: align,
      animationDuration: const Duration(milliseconds: 300),
      cursorColor: context.onPrimary,
      controller: controller,
      errorTextSpace: 25,
      focusNode: focusNode,
      readOnly: readOnly,
      validator: validator ?? FieldValidator.validateOTP(),
      animationType: AnimationType.scale,
      autoDisposeControllers: false,
      onSaved: onSaved,
      onCompleted: onCompleted,
      errorAnimationController: errorAnimationController,
      pastedTextStyle: context.headlineLarge?.copyWith(
          fontWeight: FontWeight.w700,
          color: AppColors.kPrimaryColor,
          fontSize: 14),
      dialogConfig: DialogConfig(
          dialogTitle: AppString.appName,
          platform:
              Platform.isIOS ? PinCodePlatform.iOS : PinCodePlatform.other),
      useHapticFeedback: true,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        LengthLimitingTextInputFormatter(pinLength)
      ],
      textStyle: context.bodyLarge?.copyWith(fontWeight: FontWeight.w500),
      backgroundColor: Colors.transparent,
      hintStyle: const TextStyle(fontWeight: FontWeight.bold),
      pinTheme: PinTheme(
        fieldWidth: 48.w,
        fieldHeight: 48.h,
        shape: PinCodeFieldShape.box,
        fieldOuterPadding: const EdgeInsets.only(right: 8),
        borderWidth: 0,
        selectedColor: context.inputDecorationTheme.fillColor,
        activeBorderWidth: 0,
        inactiveColor: context.inputDecorationTheme.fillColor,
        activeColor: context.inputDecorationTheme.fillColor,
        selectedFillColor: context.inputDecorationTheme.fillColor,
        activeFillColor: context.inputDecorationTheme.fillColor,
        inactiveFillColor: context.inputDecorationTheme.fillColor,
        borderRadius: BorderRadius.circular(5.r),
      ),
      appContext: context,
      length: pinLength,
      onChanged: onChanged);
}
