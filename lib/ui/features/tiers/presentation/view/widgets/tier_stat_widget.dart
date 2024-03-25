import 'package:pouchers/ui/features/profile/data/dao/user_dao.dart';
import 'package:pouchers/ui/features/tiers/domain/model/tiers/data.dart';
import 'package:pouchers/ui/features/tiers/presentation/notifier/tier_notifier.dart';
import 'package:pouchers/utils/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../common/app_colors.dart';
import '../../../../../common/app_images.dart';
import '../../../../../widgets/gap.dart';
import 'progress_bar.dart';
import 'tier_widget.dart';

class TierStatsWidget extends HookConsumerWidget {
  const TierStatsWidget({super.key});

  @override
  Widget build(BuildContext context, _) => HookConsumer(builder: (_, ref, __) {
        final data = ref.watch(tierNotifierProvider).data as Data?;
        return ValueListenableBuilder<Box>(
            valueListenable: userDao.getListenable(),
            builder: (_, box, __) {
              final user = userDao.returnUser(box);
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Stack(clipBehavior: Clip.none, children: [
                    Container(
                      height: context.height,
                      width: 7.w,
                      margin: EdgeInsets.only(bottom: 70.h),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.vertical(
                              top: Radius.circular(8.r),
                              bottom: Radius.circular(8.r)),
                          color: user.tierLevels >= 3
                              ? AppColors.kLightYellow200
                              : AppColors.kLight100),
                      child: SingleChildScrollView(
                        physics: const NeverScrollableScrollPhysics(),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ProgressBar(status: user.tierLevels >= 1),
                            ProgressBar(
                                height: 4.6, status: user.tierLevels >= 2),
                            ProgressBar(
                                height: 4.6, status: user.tierLevels >= 3)
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                        left: 0,
                        top: context.height / _returnPosition(user.tierLevels),
                        child: SvgPicture.asset(AppImage.pointedArrow))
                  ]),
                  const Gap(width: 25),
                  Flexible(
                    child: Column(
                      children: [
                        TiersWidget(tierNo: 1, tier: data?.tier1),
                        const Gap(height: 20),
                        TiersWidget(tierNo: 2, tier: data?.tier2),
                        const Gap(height: 20),
                        TiersWidget(tierNo: 3, tier: data?.tier3, highest: true)
                      ],
                    ),
                  ),
                ],
              );
            });
      });

  num _returnPosition(int? tierLevels) {
    if (tierLevels == 1) return 13;
    if (tierLevels == 2) return 3.5;
    return 2;
  }
}
