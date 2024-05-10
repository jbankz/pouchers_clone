import 'package:pouchers/ui/common/app_images.dart';
import 'package:pouchers/utils/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../common/app_strings.dart';
import '../../../../../../widgets/gap.dart';

class EmptyReferralWidget extends StatelessWidget {
  const EmptyReferralWidget({super.key});

  @override
  Widget build(BuildContext context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(AppImage.emptyReferral),
          const Gap(height: 8),
          Text(AppString.youHaveNoReferral,
              style: context.displayLarge?.copyWith(fontSize: 16)),
          const Gap(height: 2),
          Text(AppString.youHaveNoReferralHint,
              style: context.displaySmall
                  ?.copyWith(fontSize: 14, fontWeight: FontWeight.w400)),
          const Gap(height: 16),
        ],
      );
}
