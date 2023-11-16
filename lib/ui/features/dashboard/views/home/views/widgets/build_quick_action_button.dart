import 'package:Pouchers/utils/extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../../common/app_colors.dart';
import '../../../../../../widgets/gap.dart';

class BuildQuickActionButton extends StatelessWidget {
  final String title;
  final String icon;
  final double width;
  final Function()? onPressed;

  const BuildQuickActionButton(
      {super.key,
      required this.title,
      required this.icon,
      this.width = 56,
      this.onPressed});

  @override
  Widget build(BuildContext context) => Flexible(
        child: CupertinoButton(
          onPressed: onPressed,
          padding: EdgeInsets.zero,
          child: SizedBox(
            width: width.w,
            child: Column(
              children: [
                Container(
                  height: 56.h,
                  width: 56.w,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.paleLavenderGray),
                  child: SvgPicture.asset(icon, fit: BoxFit.scaleDown),
                ),
                Gap(height: 12.h),
                Text(
                  title,
                  style: context.headlineLarge?.copyWith(
                      color: AppColors.kPrimaryBlack,
                      fontWeight: FontWeight.w400,
                      fontSize: 12),
                ),
              ],
            ),
          ),
        ),
      );
}
