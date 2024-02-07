import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ValidationOptionsSkeleton extends StatelessWidget {
  const ValidationOptionsSkeleton({super.key});

  @override
  Widget build(BuildContext context) => ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: List.generate(
          3,
          (index) => Container(
              height: 76.h,
              margin: EdgeInsets.only(bottom: 15.h),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.r)))));
}
