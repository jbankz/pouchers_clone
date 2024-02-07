import 'package:flutter/material.dart';

import '../../../common/app_colors.dart';

class KeypadConfig {
  final Color? keypadColor;
  final EdgeInsets padding;
  final bool showPoint;
  final bool feedback;
  final num? decimal;

  KeypadConfig(
      {this.keypadColor = AppColors.kPrimaryTextColor,
      this.padding = const EdgeInsets.symmetric(horizontal: 49),
      this.showPoint = false,
      this.feedback = true,
      this.decimal});
}
