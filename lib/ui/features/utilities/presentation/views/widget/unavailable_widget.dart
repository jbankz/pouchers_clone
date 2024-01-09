import 'package:Pouchers/utils/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../common/app_colors.dart';

class UnavailableWidget extends StatelessWidget {
  const UnavailableWidget({super.key});

  @override
  Widget build(BuildContext context) => Container(
      padding: EdgeInsets.symmetric(horizontal: 5.w),
      decoration: BoxDecoration(
          color: AppColors.kUnknownColor4,
          borderRadius: BorderRadius.circular(5.01)),
      child: Text('Unavailable',
          style: context.headlineMedium?.copyWith(
              color: AppColors.white,
              fontSize: 8.sp,
              fontWeight: FontWeight.w400)));
}
