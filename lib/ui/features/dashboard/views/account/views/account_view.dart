import 'package:Pouchers/app/app.router.dart';
import 'package:Pouchers/app/core/router/page_router.dart';
import 'package:Pouchers/modules/profile/profile_page.dart';
import 'package:Pouchers/ui/common/app_colors.dart';
import 'package:Pouchers/ui/common/app_images.dart';
import 'package:Pouchers/ui/features/profile/data/dao/user_dao.dart';
import 'package:Pouchers/ui/widgets/gap.dart';
import 'package:Pouchers/utils/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';

import '../../../../../../app/core/manager/intercom_manager.dart';
import '../../../../../common/app_strings.dart';
import '../../../../../widgets/profile_image.dart';
import 'widgets/account_tile.dart';

class AccountView extends ConsumerWidget {
  const AccountView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) => 3 < 2
      ? ProfilePage()
      : ValueListenableBuilder<Box>(
          valueListenable: userDao.getListenable(),
          builder: (_, box, __) {
            final user = userDao.returnUser(box);
            return Scaffold(
              body: SafeArea(
                minimum: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                child: SingleChildScrollView(
                    child: Column(children: [
                  const Gap(height: 32),
                  Center(
                      child: ProfileImage(
                          image: user.profilePicture ?? '',
                          onTap: () =>
                              PageRouter.pushNamed(Routes.profileView))),
                  const Gap(height: 8),
                  Text(userDao.fullName,
                      style: context.headlineMedium
                          ?.copyWith(fontSize: 16, fontWeight: FontWeight.w500),
                      textAlign: TextAlign.center),
                  const Gap(height: 2),
                  Text(user.email ?? '',
                      style: context.displayMedium
                          ?.copyWith(fontSize: 12, fontWeight: FontWeight.w700),
                      textAlign: TextAlign.center),
                  const Gap(height: 4),
                  Text('@${user.tag ?? ''}',
                      style: context.headlineMedium?.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: AppColors.kIconGrey),
                      textAlign: TextAlign.center),
                  const Gap(height: 9),
                  GestureDetector(
                    onTap: () => PageRouter.pushNamed(Routes.tierView),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 6.91.w, vertical: 1.38.h),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6.91.r),
                              color: AppColors.kUnknownColor1,
                              border:
                                  Border.all(color: AppColors.kPurpleColor700)),
                          child: Text('Tier ${user.tierLevels}',
                              style: context.displayMedium?.copyWith(
                                  fontSize: 8, fontWeight: FontWeight.w500),
                              textAlign: TextAlign.center),
                        ),
                        const Gap(width: 10),
                        Flexible(
                          child: Text(AppString.upgradeNow,
                              style: context.displayMedium?.copyWith(
                                  fontSize: 12, fontWeight: FontWeight.w700),
                              textAlign: TextAlign.center),
                        ),
                      ],
                    ),
                  ),
                  const Gap(height: 30),
                  AccountTile(
                      icon: AppImage.referralIcon,
                      title: AppString.referral,
                      desc: AppString.referralInstruction,
                      tapped: () {}),
                  const Gap(height: 23),
                  AccountTile(
                      icon: AppImage.savedCard,
                      title: AppString.savedCards,
                      desc: AppString.savedCardsInstruction,
                      tapped: () {}),
                  const Gap(height: 23),
                  AccountTile(
                      icon: AppImage.sync,
                      title: AppString.scheduledPayments,
                      desc: AppString.scheduledPaymentsInstruction,
                      tapped: () {}),
                  const Gap(height: 23),
                  AccountTile(
                      icon: AppImage.user,
                      title: AppString.accountSettings,
                      desc: AppString.accountSettingsInstruction,
                      tapped: () =>
                          PageRouter.pushNamed(Routes.accountSettingsView)),
                  const Gap(height: 23),
                  AccountTile(
                      icon: AppImage.customerService,
                      title: AppString.helpAndSupport,
                      desc: AppString.helpAndSupportInstruction,
                      tapped: IntercomManager.displayMessenger),
                  const Gap(height: 23),
                  AccountTile(
                      icon: AppImage.logo,
                      title: AppString.aboutPourcher,
                      desc: AppString.aboutPourcherInstruction,
                      tapped: () {}),
                  const Gap(height: 32),
                  AccountTile(
                      icon: AppImage.logOut,
                      title: AppString.logOut,
                      color: AppColors.kColorOrange,
                      tapped: () {})
                ])),
              ),
            );
          });
}
