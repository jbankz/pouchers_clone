import 'package:Pouchers/ui/features/dashboard/views/transaction/presentation/view/receipts/receipts_tiles.dart';
import 'package:Pouchers/utils/extension.dart';
import 'package:flutter/material.dart';

import '../../../../../../../common/app_strings.dart';
import '../../../../../../../widgets/gap.dart';
import '../../../domain/model/transaction_history.dart';

class AirtimeOrDataReceipt extends StatelessWidget {
  const AirtimeOrDataReceipt({super.key, required this.transactionHistory});

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
              title: AppString.operator,
              value: transactionHistory?.extraDetails?.subCategory ?? ''),
          const Gap(height: 16),
          ReceiptTiles(
              title: AppString.phoneNumber,
              value: transactionHistory?.extraDetails?.phoneNumber ?? ''),
        ],
      );
}