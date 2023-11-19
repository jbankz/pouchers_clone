import 'package:Pouchers/ui/common/app_strings.dart';
import 'package:Pouchers/utils/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../common/app_colors.dart';
import '../../../../../../common/app_images.dart';
import '../../../../../../widgets/gap.dart';

class BuildVerificationTypes extends StatelessWidget {
  final String title;
  final String desc;
  final void Function()? onTap;

  const BuildVerificationTypes(
      {super.key, required this.title, required this.desc, this.onTap});

  @override
  Widget build(BuildContext context) => InkWell(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          width: double.infinity,
          decoration: BoxDecoration(
              color: AppColors.white, borderRadius: BorderRadius.circular(8.r)),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: context.headlineMedium
                          ?.copyWith(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    const Gap(height: 4),
                    Text(
                      desc,
                      style: context.displaySmall
                          ?.copyWith(fontSize: 12, fontWeight: FontWeight.w400),
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 4.h),
                decoration: BoxDecoration(
                    color: AppColors.kColorLightYellow,
                    borderRadius: BorderRadius.circular(10.r)),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SvgPicture.asset(AppImage.pendingBadge),
                    const Gap(width: 4),
                    Flexible(
                        child: Text(AppString.pending,
                            style: context.displayMedium?.copyWith(
                                color: AppColors.kColorYellow200,
                                fontSize: 10,
                                fontWeight: FontWeight.w400)))
                  ],
                ),
              )
            ],
          ),
        ),
      );
}
