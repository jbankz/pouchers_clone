import 'package:Pouchers/ui/features/dashboard/views/card/presentation/notifier/card_notifier.dart';
import 'package:Pouchers/ui/features/dashboard/views/card/presentation/notifier/module/module.dart';
import 'package:Pouchers/utils/extension.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../../../common/app_colors.dart';
import '../../../../../../admin/presentation/notifier/admin_notifier.dart';

class HookCreationFeeWidget extends HookConsumerWidget {
  const HookCreationFeeWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef widgetRef) =>
      HookConsumer(builder: (_, ref, __) {
        final param = ref.watch(paramModule);
        final appState = ref.watch(adminNotifierProvider);

        final cardNotifier = ref.read(cardNotifierProvider.notifier);

        final envs = appState.data;

        final totalNairaFee = cardNotifier.calculateTotalNairaFee(envs);
        final totalDollarFee = cardNotifier.calculateTotalDollarFee(envs);

        return Text(
            'Creation fee: + ${param.isNairaCardType ? totalNairaFee.toNaira : totalDollarFee.toDollar}',
            style: context.titleLarge
                ?.copyWith(color: AppColors.kBackgroundColor));
      });
}
