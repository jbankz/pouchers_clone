import 'package:Pouchers/utils/extension.dart';
import 'package:flutter/material.dart';

import '../../../../../../../common/app_strings.dart';
import '../../../../../../../widgets/gap.dart';
import '../../../domain/model/transaction_history.dart';
import 'receipts_tiles.dart';

class ElectricityReceipt extends StatelessWidget {
  const ElectricityReceipt({super.key, required this.transactionHistory});

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
              title: AppString.token,
              value: transactionHistory?.extraDetails?.token ?? ''),
          const Gap(height: 16),
          ReceiptTiles(
              title: AppString.vat,
              value: transactionHistory?.extraDetails?.vat ?? ''),
          const Gap(height: 16),
          ReceiptTiles(
              title: AppString.customerRefNumber,
              value:
                  transactionHistory?.extraDetails?.customerReferenceNumber ??
                      ''),
          const Gap(height: 16),
          ReceiptTiles(
              title: AppString.customerReceiptNumber,
              value: transactionHistory?.extraDetails?.customerReceiptNumber ??
                  ''),
          const Gap(height: 16),
          ReceiptTiles(
              title: AppString.customerName,
              value: transactionHistory?.extraDetails?.customerName ?? ''),
          const Gap(height: 16),
          ReceiptTiles(
              title: AppString.address,
              value: transactionHistory?.extraDetails?.address ?? ''),
          const Gap(height: 16),
          ReceiptTiles(
              title: AppString.units,
              value: transactionHistory?.extraDetails?.units.toString() ?? ''),
        ],
      );
}
