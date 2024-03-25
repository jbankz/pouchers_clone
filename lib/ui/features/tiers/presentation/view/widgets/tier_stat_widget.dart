import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pouchers/ui/features/profile/data/dao/user_dao.dart';
import 'package:pouchers/ui/features/tiers/domain/model/tiers/data.dart';
import 'package:pouchers/ui/features/tiers/presentation/notifier/tier_notifier.dart';

import '../../../../../widgets/gap.dart';
import 'tier_widget.dart';

class TierStatsWidget extends StatelessWidget {
  const TierStatsWidget({super.key});

  @override
  Widget build(BuildContext context) => HookConsumer(builder: (_, ref, __) {
        final data = ref.watch(tierNotifierProvider).data as Data?;
        return ValueListenableBuilder<Box>(
            valueListenable: userDao.getListenable(),
            builder: (_, box, __) {
              final user = userDao.returnUser(box);
              String tierOnestatus = '';
              String tierTwostatus = '';
              String tierThreestatus = '';

              if (user.tierLevels < 1) {
                tierOnestatus = 'Inactive';
              }
              if (user.tierLevels > 1) {
                tierOnestatus = 'Exceeded';
              }
              if (user.tierLevels == 1) {
                tierOnestatus = 'Active';
              }
              if (user.tierLevels < 2) {
                tierTwostatus = 'Inactive';
              }
              if (user.tierLevels > 2) {
                tierTwostatus = 'Exceeded';
              }
              if (user.tierLevels == 2) {
                tierTwostatus = 'Active';
              }
              if (user.tierLevels < 3) {
                tierThreestatus = 'Inactive';
              }
              if (user.tierLevels > 3) {
                tierThreestatus = 'Exceeded';
              }
              if (user.tierLevels == 3) {
                tierThreestatus = 'Active';
              }
              return Column(
                children: [
                  TiersWidget(
                      tierNo: 1, tier: data?.tier1, status: tierOnestatus),
                  const Gap(height: 20),
                  TiersWidget(
                      tierNo: 2, tier: data?.tier2, status: tierTwostatus),
                  const Gap(height: 20),
                  TiersWidget(
                      tierNo: 3,
                      tier: data?.tier3,
                      highest: true,
                      status: tierThreestatus)
                ],
              );
            });
      });
}
