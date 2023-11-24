import 'package:Pouchers/utils/extension.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../../../common/app_colors.dart';
import '../../../../../../admin/domain/model/envs/envs.dart';
import '../../../../../../admin/presentation/notifier/admin_notifier.dart';

class HookCreationFeeWidget extends HookConsumerWidget {
  const HookCreationFeeWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef widgetRef) =>
      HookConsumer(builder: (_, ref, __) {
        final appState = ref.watch(adminNotifierProvider);

        final envs = (appState.data as List<Envs>);

        final Envs nairaCreationFee = envs.isEmpty
            ? Envs()
            : envs.singleWhere((env) => env.name == 'naira_card_creation_fee');

        final Envs nairaSudoVerveFee = envs.isEmpty
            ? Envs()
            : envs.singleWhere(
                (env) => env.name == 'sudo_verve_naira_card_creation_fee');

        final Envs nairaFundingFee = envs.isEmpty
            ? Envs()
            : envs.singleWhere((env) => env.name == 'naira_card_funding_fee');

        final num totalNairaFee = ((num.parse(nairaCreationFee.value ?? '0')) +
            (num.parse(nairaSudoVerveFee.value ?? '0')) +
            (num.parse(nairaFundingFee.value ?? '0')));

        final Envs dollarCreationFee = envs.isEmpty
            ? Envs()
            : envs.singleWhere((env) => env.name == 'dollar_card_creation_fee');

        final Envs dollarSudoCreationFee = envs.isEmpty
            ? Envs()
            : envs.singleWhere(
                (env) => env.name == 'sudo_dollar_card_creation_fee');

        final Envs dollarFundingFee = envs.isEmpty
            ? Envs()
            : envs.singleWhere((env) => env.name == 'dollar_card_funding_fee');

        final num totalDollarFee =
            ((num.parse(dollarCreationFee.value ?? '0')) +
                (num.parse(dollarSudoCreationFee.value ?? '0')) +
                (num.parse(dollarFundingFee.value ?? '0')));

        return Text('Creation fee: + ${totalNairaFee.toNaira}',
            style: context.titleLarge
                ?.copyWith(color: AppColors.kBackgroundColor));
      });
}
