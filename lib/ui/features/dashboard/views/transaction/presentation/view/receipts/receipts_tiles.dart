import 'package:pouchers/utils/extension.dart';
import 'package:flutter/material.dart';

import '../../../../../../../common/app_colors.dart';
import '../../../../../../../widgets/gap.dart';

class ReceiptTiles extends StatelessWidget {
  const ReceiptTiles({super.key, required this.title, required this.value});

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) => Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: context.headlineMedium?.copyWith(
                fontSize: 14,
                color: AppColors.kSecondaryTextColor,
                fontWeight: FontWeight.w500),
            textAlign: TextAlign.left,
            maxLines: 1,
          ),
          const Gap(width: 23),
          Expanded(
            child: Text(
              value,
              style: context.headlineMedium?.copyWith(
                  fontSize: 14,
                  color: AppColors.kPrimaryTextColor,
                  fontWeight: FontWeight.w500),
              textAlign: TextAlign.right,
            ),
          ),
        ],
      );
}
