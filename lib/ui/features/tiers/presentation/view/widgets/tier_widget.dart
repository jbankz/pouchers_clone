import 'package:Pouchers/utils/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../common/app_colors.dart';
import '../../../../../common/app_strings.dart';
import '../../../../../widgets/gap.dart';
import '../../../domain/model/tiers/tier.dart';

class TiersWidget extends StatelessWidget {
  const TiersWidget(
      {super.key,
      this.highest = false,
      required this.tierNo,
      required this.tier});

  final bool highest;
  final int tierNo;
  final Tier? tier;

  @override
  Widget build(BuildContext context) => Container(
        width: double.infinity,
        padding: EdgeInsets.fromLTRB(0, 36.h, 31.w, 35.h),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.r),
            color:
                highest ? AppColors.kPurpleColor : AppColors.paleLavenderGray),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(7.w, 7.h, 19.w, 6.h),
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(100.r),
                      topRight: Radius.circular(300.r),
                      bottomRight: Radius.circular(300.r),
                      bottomLeft: Radius.circular(6.r)),
                  color: highest ? AppColors.white : AppColors.kPrimaryColor),
              child: Text('Tier $tierNo',
                  style: context.headlineLarge?.copyWith(
                      fontSize: 12.sp,
                      color: highest
                          ? AppColors.kPurpleColor
                          : AppColors.paleLavenderGray,
                      fontWeight: FontWeight.w700)),
            ),
            Gap(width: 77.4.w),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(AppString.dailyLimit,
                      style: context.displayMedium?.copyWith(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: highest ? AppColors.white : null)),
                  const Gap(height: 4),
                  Text(num.parse(tier?.dailyTxLimit ?? '0').toNaira,
                      style: context.displayMedium?.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: highest ? AppColors.white : null)),
                  const Gap(height: 14),
                  Text(AppString.maximumBalance,
                      style: context.displayMedium?.copyWith(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: highest ? AppColors.white : null)),
                  const Gap(height: 4),
                  Text(
                      tier?.maxBalance == 'Unlimited'
                          ? tier?.maxBalance ?? ''
                          : num.parse(tier?.maxBalance ?? '0').toNaira,
                      style: context.displayMedium?.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: highest ? AppColors.white : null)),
                ],
              ),
            )
          ],
        ),
      );
}
