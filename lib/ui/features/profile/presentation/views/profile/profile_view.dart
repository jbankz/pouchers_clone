import 'package:Pouchers/ui/widgets/dialog/bottom_sheet.dart';
import 'package:Pouchers/utils/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hive/hive.dart';

import '../../../../../../app/app.router.dart';
import '../../../../../../app/core/router/page_router.dart';
import '../../../../../common/app_colors.dart';
import '../../../../../common/app_images.dart';
import '../../../../../common/app_strings.dart';
import '../../../../../widgets/gap.dart';
import '../../../../../widgets/profile_image.dart';
import '../../../data/dao/user_dao.dart';
import 'widget/update_fullname.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) => ValueListenableBuilder<Box>(
      valueListenable: userDao.getListenable(),
      builder: (_, box, __) {
        final user = userDao.returnUser(box);
        final String name =
            '${user.firstName ?? ''} ${user.lastName ?? ''}'.titleCase;
        return Scaffold(
          backgroundColor: AppColors.kPurpleColor800,
          appBar: AppBar(
              backgroundColor: AppColors.kPurpleColor800,
              title: Text(AppString.profile)),
          body: SafeArea(
            minimum: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            child: SingleChildScrollView(
                child: Center(
              child: Column(mainAxisSize: MainAxisSize.min, children: [
                if (user.tierLevels != 3)
                  Container(
                    width: double.infinity,
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
                    decoration: BoxDecoration(
                        color: AppColors.kLightOrange100,
                        borderRadius: BorderRadius.circular(8.r),
                        border: Border.all(color: AppColors.kLightOrange200)),
                    child: Row(
                      children: [
                        SvgPicture.asset(AppImage.shield),
                        const Gap(width: 7),
                        Expanded(
                          child: Text(AppString.completeAccount,
                              style: context.titleLarge?.copyWith(
                                  color: AppColors.kLightOrange300,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400)),
                        ),
                        const Icon(Icons.navigate_next,
                            color: AppColors.kLightOrange200)
                      ],
                    ),
                  ),
                const Gap(height: 13),
                ProfileImage(
                    image: user.profilePicture ?? '', pickImage: () {}),
                const Gap(height: 8),
                Text(userDao.fullName,
                    style: context.headlineMedium
                        ?.copyWith(fontSize: 16, fontWeight: FontWeight.w500),
                    textAlign: TextAlign.center),
                const Gap(height: 2),
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
                const Gap(height: 25),
                Container(
                  width: double.infinity,
                  padding:
                      EdgeInsets.symmetric(horizontal: 15.w, vertical: 23.h),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.r),
                      color: AppColors.white),
                  child: Column(
                    children: [
                      _buildTile(
                          context: context,
                          key: AppString.fullName,
                          value: name,
                          onTap: () => BottomSheets.showInputAlertDialog(
                              barrierDismissible: false,
                              child: const UpdateFullNameWidget())),
                      _buildTile(
                          context: context,
                          key: AppString.gender,
                          value: user.gender ?? ''),
                      _buildTile(
                          context: context,
                          key: AppString.phone,
                          value: user.phoneNumber ?? ''),
                      _buildTile(
                          context: context,
                          key: AppString.idVerification,
                          value: '',
                          trailing: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10.w, vertical: 5.h),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12.r),
                                  color: AppColors.kLightOrange100),
                              child: Text(AppString.incomplete,
                                  style: context.headlineMedium?.copyWith(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.kLightOrange300)))),
                      _buildTile(
                          context: context,
                          key: AppString.dob,
                          value: user.dob ?? ''),
                      _buildTile(
                          context: context,
                          isLast: true,
                          key: AppString.tag,
                          value: '@${user.tag ?? ''}'),
                    ],
                  ),
                )
              ]),
            )),
          ),
        );
      });

  GestureDetector _buildTile(
          {required BuildContext context,
          required String key,
          required String value,
          Widget? trailing,
          bool isLast = false,
          void Function()? onTap}) =>
      GestureDetector(
        onTap: onTap,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(key,
                      style: context.headlineMedium?.copyWith(
                          fontWeight: FontWeight.w400,
                          color: AppColors.kIconGrey),
                      textAlign: TextAlign.left),
                ),
                const Gap(width: 30),
                trailing ??
                    Expanded(
                        child: Text(value,
                            style: context.headlineMedium
                                ?.copyWith(fontWeight: FontWeight.w400),
                            textAlign: TextAlign.right,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis)),
                const Icon(Icons.navigate_next,
                    color: AppColors.kSecondaryTextColor)
              ],
            ),
            if (!isLast)
              const Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [Gap(height: 7), Divider(), Gap(height: 15)])
          ],
        ),
      );
}
