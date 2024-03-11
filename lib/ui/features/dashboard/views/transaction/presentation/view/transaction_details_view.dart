import 'package:Pouchers/ui/common/app_colors.dart';
import 'package:Pouchers/ui/features/dashboard/views/transaction/domain/model/transaction_history.dart';
import 'package:Pouchers/ui/features/utilities/domain/enum/service_category.dart';
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

class TransactionDetailsView extends StatefulWidget {
  const TransactionDetailsView({super.key, required this.transactionHistory});

  final TransactionHistory transactionHistory;

  @override
  State<TransactionDetailsView> createState() => _TransactionDetailsViewState();
}

class _TransactionDetailsViewState extends State<TransactionDetailsView> {
  bool _generatingReceipt = false;

  @override
  Widget build(BuildContext context) {
    final bool isDebitTransaction =
        widget.transactionHistory.transactionType == TransactionType.debit;

    final Color color =
        isDebitTransaction ? AppColors.kColorRedDeep : AppColors.limeGreen;

    final String amount = isDebitTransaction
        ? '-${widget.transactionHistory.amount.toNaira}'
        : '+${(widget.transactionHistory.amount + widget.transactionHistory.transactionFee).toNaira}';

    return Scaffold(
      appBar: AppBar(title: Text(AppString.transactionReceipt)),
      body: SafeArea(
          minimum: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          child: SingleChildScrollView(
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
                        transactionTitle(widget.transactionHistory),
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
                    widget.transactionHistory.updatedAt?.monthDayYear ?? '',
                    widget.transactionHistory.updatedAt
                            ?.timeAloneWithMeridian12 ??
                        ''
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
                switch (widget.transactionHistory.transactionCategory) {
                  ServiceCategory.p2p => _buildTransferReceipt(context),
                  ServiceCategory.airtime =>
                    _buildAirtimeOrDataReceipt(context),
                  ServiceCategory.data => _buildAirtimeOrDataReceipt(context),
                  ServiceCategory.voucherRedeem => _buildStatusReceipt(context),
                  ServiceCategory.voucherPurchase =>
                    _buildStatusReceipt(context),
                  ServiceCategory.fundWallet =>
                    _buildWalletFundingReceipts(context),
                  ServiceCategory.adminDebitWallet =>
                    _buildStatusReceipt(context),
                  ServiceCategory.adminCreditWallet =>
                    _buildStatusReceipt(context),
                  ServiceCategory.cable => _buildOperatorReceipts(context),
                  ServiceCategory.electricity =>
                    _buildElectricityReceipts(context),
                  ServiceCategory.betting => _buildOperatorReceipts(context),
                  ServiceCategory.localBankTransfer =>
                    _buildTransferReceipt(context),
                  ServiceCategory.moneyRequest => _buildStatusReceipt(context),
                  ServiceCategory.referralBonusPayment =>
                    const SizedBox.shrink(),
                  ServiceCategory.education => const SizedBox.shrink(),
                  ServiceCategory.internet => const SizedBox.shrink(),
                  ServiceCategory.createVirtualCard => const SizedBox.shrink(),
                  ServiceCategory.fundVirtualCard => const SizedBox.shrink(),
                  null => const SizedBox.shrink(),
                },
                const Gap(height: 29),
                Container(
                  width: double.infinity,
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
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
                      Text(widget.transactionHistory.transactionId ?? '',
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
                    loading: _generatingReceipt,
                    onPressed: () async {
                      setState(() => _generatingReceipt = true);
                      await AppHelper.shareReceipt(
                          widget: await generateTransactionReceipt(
                              widget.transactionHistory));
                      setState(() => _generatingReceipt = false);
                    })
              ]),
            ),
          )),
    );
  }

  Column _buildWalletFundingReceipts(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTile(
              context: context,
              title: AppString.status,
              value: widget.transactionHistory.status?.titleCase ?? ''),
          const Gap(height: 16),
          _buildTile(
              context: context,
              title: AppString.amountReceived,
              value: widget.transactionHistory.amount.toNaira),
          const Gap(height: 16),
          _buildTile(
              context: context,
              title: AppString.transactionFee,
              value: widget.transactionHistory.transactionFee.toNaira)
        ],
      );

  Column _buildElectricityReceipts(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTile(
              context: context,
              title: AppString.status,
              value: widget.transactionHistory.status?.titleCase ?? ''),
          const Gap(height: 16),
          _buildTile(
              context: context,
              title: AppString.operator,
              value: widget.transactionHistory.extraDetails?.subCategory ?? ''),
          const Gap(height: 16),
          _buildTile(
              context: context,
              title: AppString.token,
              value: widget.transactionHistory.extraDetails?.token ?? ''),
          const Gap(height: 16),
          _buildTile(
              context: context,
              title: AppString.vat,
              value: widget.transactionHistory.extraDetails?.vat ?? ''),
          const Gap(height: 16),
          _buildTile(
              context: context,
              title: AppString.transactionID,
              value:
                  widget.transactionHistory.extraDetails?.transactionId ?? ''),
          const Gap(height: 16),
          _buildTile(
              context: context,
              title: AppString.customerRefNumber,
              value: widget.transactionHistory.extraDetails
                      ?.customerReferenceNumber ??
                  ''),
          const Gap(height: 16),
          _buildTile(
              context: context,
              title: AppString.customerReceiptNumber,
              value: widget
                      .transactionHistory.extraDetails?.customerReceiptNumber ??
                  ''),
          const Gap(height: 16),
          _buildTile(
              context: context,
              title: AppString.customerName,
              value:
                  widget.transactionHistory.extraDetails?.customerName ?? ''),
          const Gap(height: 16),
          _buildTile(
              context: context,
              title: AppString.address,
              value: widget.transactionHistory.extraDetails?.address ?? ''),
          const Gap(height: 16),
          _buildTile(
              context: context,
              title: AppString.units,
              value: widget.transactionHistory.extraDetails?.units.toString() ??
                  ''),
        ],
      );

  Column _buildOperatorReceipts(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTile(
              context: context,
              title: AppString.status,
              value: widget.transactionHistory.status?.titleCase ?? ''),
          const Gap(height: 16),
          _buildTile(
              context: context,
              title: AppString.operator,
              value: widget.transactionHistory.extraDetails?.subCategory ?? ''),
        ],
      );

  Row _buildStatusReceipt(BuildContext context) => _buildTile(
      context: context,
      title: AppString.status,
      value: widget.transactionHistory.status?.titleCase ?? '');

  Column _buildAirtimeOrDataReceipt(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTile(
              context: context,
              title: AppString.status,
              value: widget.transactionHistory.status?.titleCase ?? ''),
          const Gap(height: 16),
          _buildTile(
              context: context,
              title: AppString.operator,
              value: widget.transactionHistory.extraDetails?.subCategory ?? ''),
          const Gap(height: 16),
          _buildTile(
              context: context,
              title: AppString.phoneNumber,
              value: widget.transactionHistory.extraDetails?.phoneNumber ?? ''),
        ],
      );

  Column _buildTransferReceipt(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTile(
              context: context,
              title: AppString.status,
              value: widget.transactionHistory.status?.titleCase ?? ''),
          const Gap(height: 16),
          _buildTile(
              context: context,
              title: AppString.sender,
              value: widget
                      .transactionHistory.extraDetails?.senderName?.titleCase ??
                  ''),
          const Gap(height: 16),
          _buildTile(
              context: context,
              title: AppString.senderTag,
              value: widget
                      .transactionHistory.extraDetails?.senderTag?.titleCase ??
                  ''),
          const Gap(height: 16),
          _buildTile(
              context: context,
              title: AppString.beneficiary,
              value:
                  widget.transactionHistory.beneficiaryName?.titleCase ?? ''),
          const Gap(height: 16),
          _buildTile(
              context: context,
              title: AppString.beneficiaryTag,
              value:
                  widget.transactionHistory.extraDetails?.receiverTag ?? 'N/A'),
        ],
      );

  Row _buildTile(
          {required BuildContext context,
          required String title,
          required String value}) =>
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
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
