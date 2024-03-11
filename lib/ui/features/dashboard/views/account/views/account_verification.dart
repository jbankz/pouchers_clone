import 'package:Pouchers/app/app.router.dart';
import 'package:Pouchers/app/core/router/page_router.dart';
import 'package:Pouchers/app/core/skeleton/widgets.dart';
import 'package:Pouchers/ui/common/app_colors.dart';
import 'package:Pouchers/ui/common/app_strings.dart';
import 'package:Pouchers/ui/features/profile/data/dao/user_dao.dart';
import 'package:Pouchers/ui/features/profile/domain/enum/kyc_status.dart';
import 'package:Pouchers/ui/features/profile/presentation/notifier/user_notifier.dart';
import 'package:Pouchers/ui/widgets/gap.dart';
import 'package:Pouchers/utils/extension.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';

import 'widgets/build_verification_type.dart';
import 'widgets/validation_options_skeleton.dart';

class AccountVerificationView extends ConsumerStatefulWidget {
  const AccountVerificationView({super.key});

  @override
  ConsumerState<AccountVerificationView> createState() =>
      _AccountVerificationViewState();
}

class _AccountVerificationViewState
    extends ConsumerState<AccountVerificationView> {
  final CancelToken _cancelToken = CancelToken();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {});
  }

  @override
  void dispose() {
    super.dispose();
    _cancelToken.cancel();
  }

  @override
  Widget build(BuildContext context) => ValueListenableBuilder<Box>(
      valueListenable: userDao.getListenable(),
      builder: (_, box, __) {
        final user = userDao.returnUser(box);

        KycStatus utilstats = KycStatus.unverified;

        if (user.utilityBill != null && user.tierLevels == 2) {
          utilstats = KycStatus.pending;
        }

        if (user.utilityBill != null && user.tierLevels > 2) {
          utilstats = KycStatus.verified;
        }

        return Scaffold(
          backgroundColor: AppColors.kPurpleColor800,
          appBar: AppBar(
              title: Text(AppString.accountVerification),
              backgroundColor: AppColors.kPurpleColor800),
          body: SafeArea(
            minimum: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
            child: ListView(children: [
              Text(AppString.completedVerificationProcess,
                  style: context.titleLarge?.copyWith(fontSize: 14)),
              const Gap(height: 20),
              Skeleton(
                isLoading: ref.watch(userNotifierProvider).isBusy,
                skeleton: const ValidationOptionsSkeleton(),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    BuildVerificationTypes(
                        title: AppString.bvn,
                        desc: AppString.bvnVerify,
                        kycStatus: (user.tierLevels > 1)
                            ? KycStatus.verified
                            : KycStatus.unverified,
                        onTap: () => PageRouter.pushNamed(Routes.bvnView,
                            args: const BvnViewArguments(
                                routeName: Routes.accountVerificationView))),
                    const Gap(height: 15),
                    BuildVerificationTypes(
                        title: AppString.validId,
                        desc: AppString.validIdVerify,
                        kycStatus: user.isUploadedIdentityCard
                            ? KycStatus.verified
                            : KycStatus.unverified,
                        onTap: () => PageRouter.pushNamed(Routes.idView)),
                    const Gap(height: 15),
                    BuildVerificationTypes(
                        title: AppString.utilityBill,
                        desc: AppString.utilityBillVerify,
                        kycStatus: utilstats,
                        onTap: () =>
                            PageRouter.pushNamed(Routes.utilityBillView)),
                  ],
                ),
              )
            ]),
          ),
        );
      });
}
