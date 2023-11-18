import 'package:Pouchers/app/app.router.dart';
import 'package:Pouchers/app/core/router/page_router.dart';
import 'package:Pouchers/ui/common/app_colors.dart';
import 'package:Pouchers/ui/common/app_strings.dart';
import 'package:Pouchers/ui/features/profile/data/dao/user_dao.dart';
import 'package:Pouchers/ui/widgets/elevated_button_widget.dart';
import 'package:Pouchers/ui/widgets/gap.dart';
import 'package:Pouchers/utils/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';

import 'widgets/account_setting_tile.dart';

class AccountVerificationView extends ConsumerWidget {
  const AccountVerificationView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) =>
      ValueListenableBuilder<Box>(
          valueListenable: userDao.getListenable(),
          builder: (_, box, __) {
            final user = userDao.returnUser(box);
            return Scaffold(
              backgroundColor: AppColors.kPurpleColor800,
              appBar: AppBar(
                  title: Text(AppString.accountVerification),
                  backgroundColor: AppColors.kPurpleColor800),
              body: SafeArea(
                minimum: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                child: ListView(children: [
                  Text(AppString.completedVerificationProcess,
                      style: context.titleLarge?.copyWith(fontSize: 14)),
                  const Gap(height: 20),
                  BuildVerificationTypes(
                      title: AppString.bvn,
                      desc: AppString.bvnVerify,
                      onTap: () => PageRouter.pushNamed(Routes.bvnView)),
                  const Gap(height: 15),
                  BuildVerificationTypes(
                      title: AppString.validId,
                      desc: AppString.validIdVerify,
                      onTap: () {}),
                  const Gap(height: 15),
                  BuildVerificationTypes(
                      title: AppString.utilityBill,
                      desc: AppString.utilityBillVerify,
                      onTap: () {})
                ]),
              ),
            );
          });
}

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
              Icon(Icons.arrow_forward_ios_sharp,
                  color: AppColors.kSecondaryTextColor, size: 11.w)
            ],
          ),
        ),
      );
}
