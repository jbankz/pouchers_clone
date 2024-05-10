import 'package:pouchers/app/core/theme/light_theme.dart';
import 'package:pouchers/utils/extension.dart';
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
      this.status = '',
      required this.tierNo,
      required this.tier});

  final bool highest;
  final int tierNo;
  final Tier? tier;
  final String status;

  @override
  Widget build(BuildContext context) {
    final isActive = status == 'Active';
    final bool isExceeded = status == 'Exceeded';
    return Container(
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(0, 15.h, 25.w, 25.h),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          color: highest
              ? AppColors.kPurpleColor
              : (isExceeded
                  ? AppColors.paleLavenderGray.withOpacity(.40)
                  : AppColors.paleLavenderGray)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Align(
            alignment: Alignment.topRight,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 3.h),
              decoration: BoxDecoration(
                  color: highest
                      ? (isActive
                          ? AppColors.kLightYellow200
                          : AppColors.lightGrey)
                      : (isActive
                          ? AppColors.kLightYellow200
                          : kPrimaryGrey.withOpacity(.20)),
                  borderRadius: BorderRadius.circular(15.r)),
              child: Text(status,
                  style: context.headlineMedium?.copyWith(
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w400,
                      color: highest
                          ? (isActive
                              ? AppColors.kPrimaryColor
                              : AppColors.heavyGrey)
                          : (isActive
                              ? AppColors.kPrimaryColor
                              : AppColors.heavyGrey))),
            ),
          ),
          const Gap(height: 13),
          Row(
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
                    color: highest
                        ? AppColors.white
                        : (isExceeded
                            ? AppColors.kPrimaryColor.withOpacity(.40)
                            : AppColors.kPrimaryColor)),
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
                            color: highest
                                ? AppColors.white
                                : (isExceeded
                                    ? AppColors.kPrimaryColor.withOpacity(.40)
                                    : AppColors.kPrimaryColor))),
                    const Gap(height: 4),
                    Text(num.parse(tier?.dailyTxLimit ?? '0').toNaira,
                        style: context.headlineLarge?.copyWith(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: highest
                                ? AppColors.white
                                : (isExceeded
                                    ? AppColors.kPrimaryColor.withOpacity(.40)
                                    : AppColors.kPrimaryColor))),
                    const Gap(height: 14),
                    Text(AppString.maximumBalance,
                        style: context.displayMedium?.copyWith(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: highest
                                ? AppColors.white
                                : (isExceeded
                                    ? AppColors.kPrimaryColor.withOpacity(.40)
                                    : AppColors.kPrimaryColor))),
                    const Gap(height: 4),
                    Text(
                        tier?.maxBalance?.toLowerCase() ==
                                'Unlimited'.toLowerCase()
                            ? tier?.maxBalance ?? ''
                            : num.parse(tier?.maxBalance ?? '0').toNaira,
                        style: context.headlineLarge?.copyWith(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: highest
                                ? AppColors.white
                                : (isExceeded
                                    ? AppColors.kPrimaryColor.withOpacity(.40)
                                    : AppColors.kPrimaryColor))),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
