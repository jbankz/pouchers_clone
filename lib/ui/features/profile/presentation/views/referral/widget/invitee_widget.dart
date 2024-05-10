import 'package:pouchers/ui/features/profile/domain/model/referral/referral_trail.dart';
import 'package:pouchers/utils/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../common/app_colors.dart';
import '../../../../../../widgets/gap.dart';

class InviteeWidget extends StatelessWidget {
  const InviteeWidget({super.key, required this.referrals});

  final List<ReferralTrail> referrals;

  @override
  Widget build(BuildContext context) => ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (_, index) {
        final referral = referrals[index];

        final String fullName =
            '${referral.firstName?.titleCase ?? ''} ${referral.lastName?.titleCase ?? ''}';
        final String date = referral.updatedAt?.monthDateYear ?? '';
        final bool isPaid = referral.isPaid ?? false;

        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                  child: SizedBox(
                      width: 84.w,
                      child: Text(fullName,
                          style: context.headlineMedium?.copyWith(
                              fontSize: 14, fontWeight: FontWeight.w500),
                          textAlign: TextAlign.left,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis))),
              const Gap(width: 68),
              Flexible(
                  child: SizedBox(
                      width: 63.w,
                      child: Text(date,
                          style: context.headlineMedium?.copyWith(
                              fontSize: 12, fontWeight: FontWeight.w400),
                          textAlign: TextAlign.center,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis))),
              const Gap(width: 68),
              Flexible(
                child: SizedBox(
                  width: 20.w,
                  child: Container(
                    height: 20.h,
                    width: 20.w,
                    padding: EdgeInsets.all(5.w),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: isPaid
                            ? AppColors.limeGreen.withOpacity(.20)
                            : AppColors.kLightYellow100.withOpacity(.20)),
                    child: Container(
                      height: 10.h,
                      width: 10.w,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: isPaid
                              ? AppColors.limeGreen
                              : AppColors.kLightYellow100),
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      },
      separatorBuilder: (_, __) => const Divider(),
      itemCount: referrals.length);
}
