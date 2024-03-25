import 'package:pouchers/ui/common/app_strings.dart';
import 'package:pouchers/ui/features/profile/data/dao/user_dao.dart';
import 'package:pouchers/utils/extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../../common/app_colors.dart';
import '../../../../../../notification/notification_tray.dart';
import '../../../../../../widgets/gap.dart';

class BuildQuickActionButton extends StatelessWidget {
  final String title;
  final String icon;
  final double width;
  final Function() onPressed;

  const BuildQuickActionButton(
      {super.key,
      required this.title,
      required this.icon,
      required this.onPressed,
      this.width = 56});

  @override
  Widget build(BuildContext context) => Flexible(
        child: CupertinoButton(
          onPressed: () {
            if (userDao.user.tierLevels > 1) {
              onPressed();
              return;
            }
            triggerNotificationTray(AppString.verifyBVNproceed, error: true);
          },
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
