import 'package:Pouchers/utils/extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../../common/app_colors.dart';
import '../../../../../../widgets/gap.dart';

class BuildActionButton extends StatelessWidget {
  final String title;
  final String icon;
  final double width;

  const BuildActionButton(
      {super.key, required this.title, required this.icon, this.width = 54});

  @override
  Widget build(BuildContext context) => SizedBox(
        width: width.w,
        child: Column(
          children: [
            Container(
              height: 32.h,
              width: 32.w,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.white.withOpacity(.90)),
              child: SvgPicture.asset(icon, fit: BoxFit.scaleDown),
            ),
            Gap(height: 6.h),
            Text(title,
                style: context.headlineLarge?.copyWith(
                    color: AppColors.kPurple200,
                    fontWeight: FontWeight.w400,
                    fontSize: 12)),
          ],
        ),
      );
}
