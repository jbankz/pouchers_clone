import 'package:Pouchers/utils/extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../common/app_colors.dart';
import '../../../../../common/app_images.dart';
import '../../../../../common/app_strings.dart';
import '../../../../../widgets/gap.dart';

class ThirSlideWidget extends StatelessWidget {
  const ThirSlideWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        const Gap(height: 25),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SvgPicture.asset(AppImage.onBoardingVoucher2Icon),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset(AppImage.giftCard),
                const Gap(height: 16),
                Text(AppString.buyVoucher,
                    style: context.headlineMedium
                        ?.copyWith(color: AppColors.kPrimaryColor))
              ],
            )
          ],
        ),
        const Gap(height: 53),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset(AppImage.box),
                const Gap(height: 16),
                Text(AppString.redeemVoucher,
                    style: context.headlineMedium
                        ?.copyWith(color: AppColors.kBlueColor))
              ],
            ),
            SvgPicture.asset(AppImage.onBoardingVoucherIcon),
          ],
        ),
        const Gap(height: 31),
        SvgPicture.asset(AppImage.giftBox),
        const Gap(height: 16),
        Text(AppString.giftVoucher,
            style: context.headlineMedium
                ?.copyWith(color: AppColors.kColorOrange100)),
        const Gap(height: 27),
      ]),
    );
  }
}
