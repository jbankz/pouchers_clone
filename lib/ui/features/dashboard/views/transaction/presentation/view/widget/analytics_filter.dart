import 'package:pouchers/utils/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../common/app_colors.dart';
import '../../../../../../../widgets/gap.dart';

class AnalyticFilterActionButton extends StatelessWidget {
  const AnalyticFilterActionButton(
      {super.key, required this.value, required this.tap});

  final String value;
  final Function() tap;

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: tap,
        child: Row(
          children: [
            Expanded(
                child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 5.h),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7.r),
                  border: Border.all(color: AppColors.kLightPurple)),
              child: Row(
                children: [
                  Expanded(
                    child: Text(value,
                        style: context.headlineMedium?.copyWith(
                            fontSize: 14,
                            color: AppColors.kPurpleColor,
                            fontWeight: FontWeight.w400)),
                  ),
                  const Gap(width: 23),
                  const Icon(Icons.keyboard_arrow_down_outlined,
                      size: 12, color: AppColors.kSecondaryTextColor)
                ],
              ),
            )),
            const Gap(width: 12),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.5.w, vertical: 5.h),
              decoration: BoxDecoration(
                  color: AppColors.kBackgroundColor,
                  borderRadius: BorderRadius.circular(7.r),
                  border: Border.all(color: AppColors.kLightPurple)),
              child: Text(DateTime.now().year.toString(),
                  style: context.headlineMedium?.copyWith(
                      fontSize: 14,
                      color: AppColors.kPurpleColor,
                      fontWeight: FontWeight.w400)),
            ),
          ],
        ),
      );
}
