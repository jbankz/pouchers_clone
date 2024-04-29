import 'package:pouchers/app/config/app_helper.dart';
import 'package:pouchers/app/core/skeleton/widgets.dart';
import 'package:pouchers/ui/common/app_strings.dart';
import 'package:pouchers/ui/features/profile/data/dao/user_dao.dart';
import 'package:pouchers/ui/features/profile/domain/model/referral/earning.dart';
import 'package:pouchers/ui/features/profile/presentation/notifier/user_notifier.dart';
import 'package:pouchers/utils/extension.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hive/hive.dart';

import '../../../../../../common/app_colors.dart';
import '../../../../../../common/app_images.dart';
import '../../../../../../widgets/gap.dart';
import '../../../../data/dao/referral_dao.dart';
import 'empty_referral_widget.dart';
import 'invitee_widget.dart';
import 'point_widget.dart';
import 'reward_skeleton.dart';

class RewardTabWidget extends ConsumerStatefulWidget {
  const RewardTabWidget({super.key});

  @override
  ConsumerState<RewardTabWidget> createState() => _RewardTabWidgetState();
}

class _RewardTabWidgetState extends ConsumerState<RewardTabWidget> {
  final CancelToken _cancelToken = CancelToken();

  @override
  void initState() {
    Future.microtask(
        () => ref.read(userNotifierProvider.notifier).referrals(_cancelToken));
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _cancelToken.cancel();
  }

  @override
  Widget build(BuildContext context) {
    final userState = ref.watch(userNotifierProvider);
    return ValueListenableBuilder<Box>(
        valueListenable: referralDao.getListenable(),
        builder: (_, box, __) {
          final referral = referralDao.returnReferral(box);

          final earnings = (referral.earning?.isNotEmpty ?? false)
              ? referral.earning?.first
              : Earning();

          final referrals = referral.referralTrail ?? [];

          final num totalPoints =
              referrals.where((data) => data.isPaid ?? false).toList().length;
          return Skeleton(
              isLoading: userState.isBusy,
              skeleton: const RewardsSkeleton(),
              child: ListView(
                children: [
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4.r),
                        border: Border.all(
                            color: AppColors.kLightPurple, width: 1.w)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 8.w, vertical: 8.h),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4.r),
                              border: Border.all(
                                  color: AppColors.kLightPurple, width: 1.w)),
                          child: SvgPicture.asset(AppImage.ticketStarIcon,
                              fit: BoxFit.scaleDown),
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                                num.parse(earnings?.totalEarnings ?? '0')
                                    .toNaira,
                                style: context.headlineMedium?.copyWith(
                                  fontSize: 32,
                                  fontWeight: FontWeight.w700,
                                )),
                            Text(AppString.bonusEarned,
                                style: context.displaySmall?.copyWith(
                                    fontWeight: FontWeight.w400, fontSize: 14)),
                          ],
                        ),
                        PointWidget(point: totalPoints)
                      ],
                    ),
                  ),
                  const Gap(height: 24),
                  Text(AppString.invitationsAndRewards,
                      style: context.headlineMedium?.copyWith(
                          fontSize: 16, fontWeight: FontWeight.w700)),
                  const Gap(height: 16),
                  Text(AppString.invitationsAndRewardsHints,
                      style: context.displaySmall?.copyWith(
                          fontSize: 14, fontWeight: FontWeight.w400)),
                  const Gap(height: 8),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.r),
                        border: Border.all(color: AppColors.kLightPurple)),
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 16.w, vertical: 16.h),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(8.r)),
                              color: AppColors.kLightPurple,
                              border:
                                  Border.all(color: AppColors.kLightPurple)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                child: Text(AppString.invitee,
                                    style: context.headlineMedium?.copyWith(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w700),
                                    textAlign: TextAlign.left,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis),
                              ),
                              const Gap(width: 16),
                              Flexible(
                                child: Text(AppString.date,
                                    style: context.headlineMedium?.copyWith(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w700),
                                    textAlign: TextAlign.center,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis),
                              ),
                              const Gap(width: 16),
                              Flexible(
                                child: Text(AppString.status,
                                    style: context.headlineMedium?.copyWith(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w700),
                                    textAlign: TextAlign.right,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis),
                              ),
                            ],
                          ),
                        ),
                        const Gap(height: 16),
                        AnimatedSwitcher(
                            duration: const Duration(milliseconds: 250),
                            child: referrals.isEmpty
                                ? const EmptyReferralWidget()
                                : InviteeWidget(referrals: referrals))
                      ],
                    ),
                  ),
                  const Gap(height: 24),
                  Text(AppString.howToEarnPoints,
                      style: context.displayLarge?.copyWith(fontSize: 16)),
                  const Gap(height: 16),
                  InkWell(
                    onTap: () => AppHelper.share(
                        userDao.user.referralCode ?? '',
                        subject: AppString.referral),
                    borderRadius: BorderRadius.circular(4.r),
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 16.w, vertical: 16.h),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4.r),
                          border: Border.all(
                              color: AppColors.kLightPurple, width: 1.w)),
                      child: Row(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 8.w, vertical: 8.h),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4.r),
                                border: Border.all(
                                    color: AppColors.kLightPurple, width: 1.w)),
                            child: SvgPicture.asset(AppImage.addUser,
                                fit: BoxFit.scaleDown),
                          ),
                          const Gap(width: 19),
                          Expanded(
                            child: Text(AppString.inviteFriends,
                                style: context.headlineMedium?.copyWith(
                                    fontSize: 16, fontWeight: FontWeight.w500)),
                          ),
                          PointWidget(point: totalPoints)
                        ],
                      ),
                    ),
                  )
                ],
              ));
        });
  }
}
