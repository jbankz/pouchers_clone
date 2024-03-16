import 'package:Pouchers/ui/features/dashboard/views/transaction/presentation/view/receipts/receipts_tiles.dart';
import 'package:Pouchers/utils/extension.dart';
import 'package:flutter/material.dart';

import '../../../../../../../common/app_strings.dart';
import '../../../../../../../widgets/gap.dart';
import '../../../domain/model/transaction_history.dart';

class VouchersReceipt extends StatelessWidget {
  const VouchersReceipt({super.key, required this.transactionHistory});

  final TransactionHistory? transactionHistory;

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ReceiptTiles(
              title: AppString.status,
              value: transactionHistory?.status?.titleCase ?? ''),
          const Gap(height: 16),
          ReceiptTiles(
              title: AppString.beneficiary,
              value: transactionHistory?.beneficiaryName?.titleCase ?? ''),
          const Gap(height: 16),
          ReceiptTiles(
              title: AppString.voucherCode,
              value: transactionHistory?.extraDetails?.voucherCode ?? ''),
        ],
      );
}
