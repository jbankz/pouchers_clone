import 'package:Pouchers/app/config/app_helper.dart';
import 'package:Pouchers/ui/common/app_strings.dart';
import 'package:Pouchers/ui/features/profile/data/dao/user_dao.dart';
import 'package:Pouchers/utils/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';

import '../../../../../../common/app_colors.dart';
import '../../../../../../common/app_images.dart';
import '../../../../../../widgets/elevated_button_widget.dart';
import '../../../../../../widgets/gap.dart';

class InviteTabWidget extends StatelessWidget {
  const InviteTabWidget({super.key});

  @override
  Widget build(BuildContext context) => ValueListenableBuilder<Box>(
      valueListenable: userDao.getListenable(),
      builder: (_, box, __) {
        final user = userDao.returnUser(box);
        return Column(
          children: [
            Expanded(
                child: ListView(
              children: [
                Image.asset(AppImage.referralWorld,
                    height: 200.h, width: 200.w),
                const Gap(height: 16),
                Text(
                  AppString.referAndEarn,
                  style: context.headlineMedium
                      ?.copyWith(fontWeight: FontWeight.w700, fontSize: 16),
                  textAlign: TextAlign.center,
                ),
                const Gap(height: 16),
                RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                        text: AppString.howToEarn,
                        style: context.titleLarge?.copyWith(
                            color: AppColors.kSecondaryTextColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w400),
                        children: [
                          TextSpan(
                              text: AppString.tenPoints,
                              style: context.titleLarge?.copyWith(
                                  color: AppColors.kSecondaryTextColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700))
                        ])),
                const Gap(height: 16),
                GestureDetector(
                  onTap: () => AppHelper.copy(user.referralCode ?? ''),
                  child: Container(
                    width: double.infinity,
                    height: 88.h,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.r),
                        image: DecorationImage(
                            image: AssetImage(AppImage.decoratedContainer),
                            fit: BoxFit.contain)),
                    child: Text(user.referralCode ?? '',
                        style: context.titleLarge?.copyWith(
                            color: AppColors.kPrimaryTextColor,
                            fontSize: 20,
                            fontWeight: FontWeight.w500)),
                  ),
                ),
                const Gap(height: 16),
                Text(AppString.tapToCopy,
                    style: context.titleLarge?.copyWith(
                        color: AppColors.kPrimaryTextColor, fontSize: 16),
                    textAlign: TextAlign.center),
              ],
            )),
            ElevatedButtonWidget(
                title: AppString.sendInvite,
                onPressed: () => AppHelper.share(user.referralCode ?? '',
                    subject: AppString.referral))
          ],
        );
      });
}
