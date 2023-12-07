import 'package:Pouchers/utils/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../common/app_colors.dart';

class ProgressBar extends StatelessWidget {
  const ProgressBar({super.key, this.height = 9, this.status = false});

  final double height;
  final bool status;

  @override
  Widget build(BuildContext context) => Container(
      height: context.height / height,
      width: 7.w,
      decoration: BoxDecoration(
          color: status ? AppColors.kLightYellow200 : Colors.transparent));
}
