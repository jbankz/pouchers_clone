import 'package:pouchers/ui/common/app_strings.dart';
import 'package:pouchers/ui/features/profile/data/dao/user_dao.dart';
import 'package:pouchers/ui/notification/notification_tray.dart';
import 'package:pouchers/utils/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hive/hive.dart';

import '../../../../../../common/app_colors.dart';
import '../../../../../../widgets/gap.dart';

class BuildActionButton extends StatelessWidget {
  final String title;
  final String icon;
  final double width;
  final void Function() onTap;
  final bool checkUsersLevel;

  const BuildActionButton(
      {super.key,
      required this.title,
      required this.icon,
      this.width = 54,
      this.checkUsersLevel = true,
      required this.onTap});

  @override
  Widget build(BuildContext context) => ValueListenableBuilder<Box>(
      valueListenable: userDao.getListenable(),
      builder: (_, box, __) {
        final user = userDao.returnUser(box);
        return InkWell(
          onTap: () {
            if (checkUsersLevel && user.tierLevels == 1) {
              triggerNotificationTray(AppString.verifyBVNproceed, error: true);
              return;
            }
            onTap();
          },
          child: SizedBox(
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
          ),
        );
      });
}
