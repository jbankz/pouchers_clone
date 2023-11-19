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
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hive/hive.dart';

import '../../../../../common/app_images.dart';
import 'widgets/account_setting_tile.dart';
import 'widgets/build_verification_type.dart';

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
                      onTap: () => PageRouter.pushNamed(Routes.idView)),
                  const Gap(height: 15),
                  BuildVerificationTypes(
                      title: AppString.utilityBill,
                      desc: AppString.utilityBillVerify,
                      onTap: () =>
                          PageRouter.pushNamed(Routes.utilityBillView)),
                ]),
              ),
            );
          });
}
