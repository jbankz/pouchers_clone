import 'package:Pouchers/utils/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hive/hive.dart';

import '../../../../../../../app/app.router.dart';
import '../../../../../../../app/core/router/page_router.dart';
import '../../../../../../common/app_colors.dart';
import '../../../../../../common/app_images.dart';
import '../../../../../../common/app_strings.dart';
import '../../../../../../widgets/gap.dart';
import '../../../../../../widgets/profile_image.dart';
import '../../../../../profile/data/dao/user_dao.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) => ValueListenableBuilder<Box>(
      valueListenable: userDao.getListenable(),
      builder: (_, box, __) {
        final user = userDao.returnUser(box);
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  // Container(
                  //     height: 35.h,
                  //     width: 35.w,
                  //     decoration: const BoxDecoration(
                  //         shape: BoxShape.circle,
                  //         color: AppColors.paleLavenderGray),
                  //     child: SvgPicture.asset(AppImage.bell,
                  //         fit: BoxFit.scaleDown)),
                  ProfileImage(
                      height: 35,
                      width: 35,
                      image: user.profilePicture ?? '',
                      onTap: () => PageRouter.pushNamed(Routes.profileView)),
                  const Gap(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                              text: '${AppString.hello} ',
                              style: context.titleLarge
                                  ?.copyWith(color: AppColors.kDarkFill),
                              children: [
                                TextSpan(
                                  text: user.firstName?.titleCase,
                                  style: context.titleLarge?.copyWith(
                                      fontWeight: FontWeight.w700,
                                      color: AppColors.kDarkFill),
                                ),
                              ])),
                      const Gap(height: 5),
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 10.w, vertical: 1.5.h),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            color: AppColors.kColorBackgroundLight,
                            border:
                                Border.all(color: AppColors.kPurpleColor700)),
                        child: Text('Tier ${user.tierLevels}',
                            style: context.headlineLarge?.copyWith(
                                fontWeight: FontWeight.w700,
                                color: AppColors.kSecondaryPurple,
                                fontSize: 10.sp)),
                      ),
                    ],
                  ),
                  const Spacer(),
                  InkWell(
                    onTap: () => PageRouter.pushNamed(Routes.notificationView),
                    customBorder: const CircleBorder(),
                    child: Container(
                        height: 35.h,
                        width: 35.w,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.paleLavenderGray),
                        child: SvgPicture.asset(AppImage.bell,
                            fit: BoxFit.scaleDown)),
                  )
                ],
              ),
              Container(
                  margin: const EdgeInsets.only(top: 19),
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.w, vertical: 7.h),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.r),
                      color: AppColors.kLightOrange100,
                      border: Border.all(color: AppColors.kLightOrange200)),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SvgPicture.asset(AppImage.shield),
                      const Gap(width: 4),
                      Flexible(
                          child: Text(AppString.completeAccount,
                              style: context.headlineMedium?.copyWith(
                                  color: AppColors.kLightOrange300))),
                      const Spacer(),
                      Icon(Icons.navigate_next,
                          size: 10.5.w, color: AppColors.kLightOrange200)
                    ],
                  ))
            ],
          ),
        );
      });
}
