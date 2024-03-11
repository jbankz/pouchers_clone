import 'package:Pouchers/ui/common/app_strings.dart';
import 'package:Pouchers/utils/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../common/app_colors.dart';
import '../../../../../../common/app_images.dart';
import '../../../../../../widgets/gap.dart';
import '../../../../../profile/domain/enum/kyc_status.dart';

class BuildVerificationTypes extends StatelessWidget {
  final String title;
  final String desc;
  final void Function()? onTap;
  final KycStatus kycStatus;

  const BuildVerificationTypes(
      {super.key,
      required this.title,
      required this.desc,
      required this.kycStatus,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    final String status = switch (kycStatus) {
      KycStatus.verified => AppString.verified,
      KycStatus.unverified => AppString.unverified,
      KycStatus.pending => AppString.pending,
      KycStatus.failed => AppString.failed
    };

    final String badge = switch (kycStatus) {
      KycStatus.verified => AppImage.verifiedBadge,
      KycStatus.unverified => AppImage.pendingBadge,
      KycStatus.pending => AppImage.pendingBadge,
      KycStatus.failed => AppImage.failedBadge
    };

    final Color textColor = switch (kycStatus) {
      KycStatus.verified => AppColors.kColorGreen,
      KycStatus.unverified => AppColors.kColorYellow200,
      KycStatus.pending => AppColors.kColorYellow200,
      KycStatus.failed => AppColors.kColorOrange
    };

    final Color bgColor = switch (kycStatus) {
      KycStatus.verified => AppColors.kLightColorGreen,
      KycStatus.unverified => AppColors.kColorLightYellow,
      KycStatus.pending => AppColors.kColorLightYellow,
      KycStatus.failed => AppColors.kColorOrangeLight
    };

    return InkWell(
      onTap: kycStatus != KycStatus.unverified ? null : onTap,
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
            Container(
              padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 4.h),
              decoration: BoxDecoration(
                  color: bgColor, borderRadius: BorderRadius.circular(10.r)),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset(badge),
                  const Gap(width: 4),
                  Flexible(
                      child: Text(status,
                          style: context.displayMedium?.copyWith(
                              color: textColor,
                              fontSize: 10,
                              fontWeight: FontWeight.w400)))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
