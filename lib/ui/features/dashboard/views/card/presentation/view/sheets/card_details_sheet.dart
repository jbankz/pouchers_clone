import 'package:pouchers/utils/extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../../../common/app_strings.dart';
import '../../../../../../../widgets/gap.dart';
import '../../notifier/card_notifier.dart';
import '../widgets/card_billing_window.dart';
import '../widgets/card_details_window.dart';

class CardDetailsSheet extends HookConsumerWidget {
  const CardDetailsSheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appState = ref.watch(cardNotifierProvider);
    final cardDetail = appState.virtualCardDetails;
    final billingAddress = cardDetail?.customer?.billingAddress;
    return Wrap(
      children: [
        SizedBox(
          width: double.infinity,
          child: SafeArea(
            child: AnimatedSize(
              duration: const Duration(milliseconds: 250),
              child: appState.isBusy
                  ? const CupertinoActivityIndicator()
                  : SingleChildScrollView(
                      child: Column(
                        children: [
                          Text(AppString.cardDetail,
                              style: context.titleMedium?.copyWith(
                                  fontSize: 15, fontWeight: FontWeight.w700)),
                          const Gap(height: 13),
                          CardDetailsWindow(cardDetail: cardDetail),
                          const Gap(height: 36),
                          CardBillingWindow(billingAddress: billingAddress)
                        ],
                      ),
                    ),
            ),
          ),
        )
      ],
    );
  }
}
