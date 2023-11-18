import 'package:Pouchers/app/core/router/page_router.dart';
import 'package:Pouchers/utils/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../common/app_colors.dart';
import '../../../../../../common/app_strings.dart';
import '../../../../../../widgets/gap.dart';

class BvnModal extends StatelessWidget {
  const BvnModal({super.key});

  @override
  Widget build(BuildContext context) => Align(
        alignment: Alignment.bottomCenter,
        child: SafeArea(
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 23.w, vertical: 34.h),
            margin: EdgeInsets.symmetric(horizontal: 11.w),
            decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(20.r)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(AppString.bvnReminder,
                    style: context.titleMedium
                        ?.copyWith(fontSize: 18, fontWeight: FontWeight.w500)),
                const Gap(height: 9),
                RichText(
                    textAlign: TextAlign.left,
                    text: TextSpan(
                        text: AppString.bvnHint2,
                        style: context.titleLarge,
                        children: [
                          TextSpan(
                              text: '*565*0#',
                              style: context.titleLarge?.copyWith(
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.kPrimaryTextColor)),
                          TextSpan(
                              text: " on your registered number.",
                              style: context.titleLarge),
                        ])),
                const Gap(height: 45),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      GestureDetector(
                        onTap: () => PageRouter.pop(),
                        child: Text(AppString.cancel,
                            style: context.titleMedium?.copyWith(
                                fontSize: 18,
                                color: AppColors.kSecondaryTextColor,
                                fontWeight: FontWeight.w600)),
                      ),
                      const Gap(width: 45),
                      Flexible(
                        child: Text(AppString.getBVN,
                            style: context.titleMedium?.copyWith(
                                fontSize: 18,
                                color: AppColors.kPrimaryColor,
                                fontWeight: FontWeight.w700)),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      );
}
