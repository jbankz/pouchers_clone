import 'package:Pouchers/ui/common/app_colors.dart';
import 'package:Pouchers/ui/features/dashboard/views/transaction/domain/model/transaction_history.dart';
import 'package:Pouchers/ui/widgets/elevated_button_widget.dart';
import 'package:Pouchers/ui/widgets/gap.dart';
import 'package:Pouchers/utils/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../app/config/app_helper.dart';
import '../../../../../../common/app_strings.dart';
import '../../domain/enum/transaction_type.dart';
import '../../domain/parser/parse_transaction_title.dart';
import '../receipt/transaction_receipt.dart';

class TransactionDetailsView extends StatelessWidget {
  const TransactionDetailsView({super.key, required this.transactionHistory});

  final TransactionHistory transactionHistory;

  @override
  Widget build(BuildContext context) {
    final bool isDebitTransaction =
        transactionHistory.transactionType == TransactionType.debit;

    final Color color =
        isDebitTransaction ? AppColors.kColorRedDeep : AppColors.limeGreen;
        
    final String amount = isDebitTransaction
        ? '-${transactionHistory.amount.toNaira}'
        : '+${transactionHistory.amount.toNaira}';

    return Scaffold(
      appBar: AppBar(title: Text(AppString.transactionReceipt)),
      body: SafeArea(
          minimum: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          child: Center(
            child: Column(children: [
              Container(
                height: 121.h,
                width: 121.w,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.kColorGreen.withOpacity(.30)),
                child: Center(
                  child: Container(
                    height: 80.h,
                    width: 80.w,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: AppColors.kColorGreen),
                    child: const Center(
                        child: Icon(Icons.check,
                            color: AppColors.white, size: 48)),
                  ),
                ),
              ),
              const Gap(height: 14),
              Text(
                AppString.transactionSuccess,
                style: context.headlineLarge?.copyWith(
                    fontSize: 20,
                    color: AppColors.limeGreen,
                    fontWeight: FontWeight.w500),
                textAlign: TextAlign.center,
              ),
              const Gap(height: 4),
              Text(
                AppString.transactionSuccessSummary,
                style: context.headlineMedium?.copyWith(
                    fontSize: 16,
                    color: AppColors.kDarkGrey100,
                    fontWeight: FontWeight.w400),
                textAlign: TextAlign.center,
              ),
              const Gap(height: 16),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      transactionTitle(transactionHistory),
                      style: context.headlineMedium?.copyWith(
                          fontSize: 14,
                          color: AppColors.kBlueColorDark,
                          fontWeight: FontWeight.w500),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  const Gap(width: 23),
                  Expanded(
                    child: Text(
                      amount,
                      style: context.headlineMedium?.copyWith(
                          fontSize: 20,
                          color: color,
                          fontWeight: FontWeight.w500),
                      textAlign: TextAlign.right,
                    ),
                  ),
                ],
              ),
              const Gap(height: 26),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  transactionHistory.updatedAt?.monthDayYear ?? '',
                  transactionHistory.updatedAt?.timeAloneWithMeridian12 ?? ''
                ]
                    .map((date) => Container(
                        margin: EdgeInsets.symmetric(horizontal: 14.w),
                        padding: EdgeInsets.symmetric(
                            horizontal: 8.w, vertical: 4.h),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            border: Border.all(
                                color: AppColors.kSecondaryTextColor)),
                        child: Text(date,
                            style: context.headlineLarge?.copyWith(
                                color: AppColors.kSecondaryTextColor,
                                fontSize: 14,
                                fontWeight: FontWeight.w500))))
                    .toList(),
              ),
              const Gap(height: 27),
              _buildTile(
                  context: context,
                  title: AppString.sender,
                  value:
                      transactionHistory.extraDetails?.senderName?.titleCase ??
                          ''),
              const Gap(height: 16),
              _buildTile(
                  context: context,
                  title: AppString.senderTag,
                  value:
                      transactionHistory.extraDetails?.senderTag?.titleCase ??
                          ''),
              const Gap(height: 16),
              _buildTile(
                  context: context,
                  title: AppString.beneficiary,
                  value: transactionHistory.beneficiaryName?.titleCase ?? ''),
              const Gap(height: 16),
              _buildTile(
                  context: context,
                  title: AppString.beneficiaryTag,
                  value: transactionHistory.extraDetails?.receiverTag ?? ''),
              const Gap(height: 16),
              _buildTile(
                  context: context,
                  title: AppString.status,
                  value: transactionHistory.status?.titleCase ?? ''),
              const Gap(height: 29),
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                margin: EdgeInsets.symmetric(horizontal: 16.w),
                decoration: BoxDecoration(
                    color: AppColors.kBackgroundColor,
                    borderRadius: BorderRadius.circular(8.r)),
                child: Column(
                  children: [
                    Text(AppString.transactionNumber,
                        style: context.headlineMedium?.copyWith(
                            fontSize: 14,
                            color: AppColors.kIconGrey,
                            fontWeight: FontWeight.w400),
                        textAlign: TextAlign.center),
                    const Gap(height: 8),
                    Text(transactionHistory.transactionId ?? '',
                        style: context.headlineMedium?.copyWith(
                            fontSize: 16,
                            color: AppColors.kPrimaryTextColor,
                            fontWeight: FontWeight.w500),
                        textAlign: TextAlign.center)
                  ],
                ),
              ),
              const Gap(height: 14),
              ElevatedButtonWidget(
                title: AppString.getReceipt,
                onPressed: () async => await AppHelper.shareReceipt(
                    widget:
                        await generateTransactionReceipt(transactionHistory)),
              )
            ]),
          )),
    );
  }

  Row _buildTile(
          {required BuildContext context,
          required String title,
          required String value}) =>
      Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: context.headlineMedium?.copyWith(
                  fontSize: 14,
                  color: AppColors.kSecondaryTextColor,
                  fontWeight: FontWeight.w500),
              textAlign: TextAlign.left,
            ),
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
