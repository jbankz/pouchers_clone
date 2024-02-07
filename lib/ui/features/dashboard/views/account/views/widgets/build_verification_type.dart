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

  const BuildVerificationTypes({
    super.key,
    required this.title,
    required this.desc,
    required this.kycStatus,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) => InkWell(
        onTap: kycStatus == KycStatus.verified ? null : onTap,
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
                    color: _statusBgColor(),
                    borderRadius: BorderRadius.circular(10.r)),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SvgPicture.asset(_statusBadge()),
                    const Gap(width: 4),
                    Flexible(
                        child: Text(_statusName(),
                            style: context.displayMedium?.copyWith(
                                color: _statusNameColor(),
                                fontSize: 10,
                                fontWeight: FontWeight.w400)))
                  ],
                ),
              )
            ],
          ),
        ),
      );

  String _statusBadge() {
    switch (kycStatus) {
      case KycStatus.verified:
        return AppImage.verifiedBadge;
      case KycStatus.pending:
        return AppImage.pendingBadge;
      case KycStatus.failed:
        return AppImage.failedBadge;
    }
  }

  String _statusName() {
    switch (kycStatus) {
      case KycStatus.verified:
        return AppString.verified;
      case KycStatus.pending:
        return AppString.pending;
      case KycStatus.failed:
        return AppString.failed;
    }
  }

  Color _statusNameColor() {
    switch (kycStatus) {
      case KycStatus.verified:
        return AppColors.kColorGreen;
      case KycStatus.pending:
        return AppColors.kColorYellow200;
      case KycStatus.failed:
        return AppColors.kColorOrange;
    }
  }

  Color _statusBgColor() {
    switch (kycStatus) {
      case KycStatus.verified:
        return AppColors.kLightColorGreen;
      case KycStatus.pending:
        return AppColors.kColorLightYellow;
      case KycStatus.failed:
        return AppColors.kColorOrangeLight;
    }
  }
}
