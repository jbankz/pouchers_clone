import 'package:pouchers/utils/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../common/app_colors.dart';
import '../../../../../../widgets/gap.dart';

class PointWidget extends StatelessWidget {
  const PointWidget({super.key, this.point = 0});

  final num point;

  @override
  Widget build(BuildContext context) => Container(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
        decoration: BoxDecoration(
            color: AppColors.kPrimaryColor.withOpacity(.20),
            borderRadius: BorderRadius.circular(100.r)),
        child: Row(
          children: [
            Container(
              height: 18.h,
              width: 18.w,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border:
                      Border.all(color: AppColors.kPurpleColor, width: 2.w)),
              child: Text(
                'P',
                style: context.displaySmall?.copyWith(
                    fontWeight: FontWeight.w700,
                    fontSize: 10,
                    color: AppColors.kPrimaryColor),
                textAlign: TextAlign.center,
              ),
            ),
            const Gap(width: 8),
            Text('$point',
                style: context.displaySmall?.copyWith(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: AppColors.kPurpleColor)),
          ],
        ),
      );
}
