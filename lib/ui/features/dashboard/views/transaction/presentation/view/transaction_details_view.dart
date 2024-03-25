import 'package:Pouchers/app/config/app_helper.dart';
import 'package:Pouchers/ui/common/app_colors.dart';
import 'package:Pouchers/ui/common/app_images.dart';
import 'package:Pouchers/ui/features/dashboard/views/transaction/domain/model/transaction_history.dart';
import 'package:Pouchers/ui/features/dashboard/views/transaction/presentation/notifier/receipt_notifier.dart';
import 'package:Pouchers/ui/features/dashboard/views/transaction/presentation/view/receipts/transfer_receipt.dart';
import 'package:Pouchers/ui/features/utilities/domain/enum/service_category.dart';
import 'package:Pouchers/ui/widgets/dialog/bottom_sheet.dart';
import 'package:Pouchers/ui/widgets/elevated_button_widget.dart';
import 'package:Pouchers/ui/widgets/gap.dart';
import 'package:Pouchers/utils/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:screenshot/screenshot.dart';

import '../../../../../../common/app_strings.dart';
import '../../domain/enum/receipt_type.dart';
import '../../domain/enum/transaction_type.dart';
import '../../domain/parser/parse_transaction_title.dart';
import 'receipts/airtime_or_data_receipt.dart';
import 'receipts/betting_receipt.dart';
import 'receipts/build_electricity_receipt.dart';
import 'receipts/operator_receipt.dart';
import 'receipts/receipt_status.dart';
import 'receipts/receipts_tiles.dart';
import 'receipts/vouchers_receipt.dart';
import 'receipts/wallet_funding_receipt.dart';
import 'sheets/share_receipts_sheet.dart';

class TransactionDetailsView extends ConsumerStatefulWidget {
  const TransactionDetailsView({super.key, required this.transactionHistory});

  final TransactionHistory transactionHistory;

  @override
  ConsumerState<TransactionDetailsView> createState() =>
      _TransactionDetailsViewState();
}

class _TransactionDetailsViewState
    extends ConsumerState<TransactionDetailsView> {
  late ReceiptNotifier _receiptNotifier;
  final padding = EdgeInsets.symmetric(horizontal: 25.w, vertical: 15.h);

  @override
  void initState() {
    super.initState();
    _receiptNotifier = ref.read(receiptNotifierProvider.notifier);
  }

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
      appBar: AppBar(
          title: Text(AppString.transactionReceipt),
          backgroundColor: AppColors.receiptBgColor),
      backgroundColor: AppColors.receiptBgColor,
      body: SafeArea(
          minimum: EdgeInsets.symmetric(horizontal: 20.w),
          child: SingleChildScrollView(
            child: Column(children: [
              Screenshot(
                controller:
                    ref.watch(receiptNotifierProvider).screenshotController!,
                child: Container(
                  decoration: BoxDecoration(
                      color: context.scaffoldBackgroundColor,
                      borderRadius: BorderRadius.circular(20.r)),
                  padding: padding,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Align(
                          alignment: Alignment.topRight,
                          child: SvgPicture.asset(AppImage.fullLogo,
                              width: 124.17.w, height: 29.78.h)),
                      const Gap(height: 20),
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
                                shape: BoxShape.circle,
                                color: AppColors.kColorGreen),
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
                      _biuldTitle(context, amount, color),
                      const Gap(height: 26),
                      ReceiptTiles(
                          title: AppString.transactionDate,
                          value: widget.transactionHistory.updatedAt
                                  ?.dateMonthYearTime ??
                              ''),
                      const Gap(height: 16),
                      switch (widget.transactionHistory.transactionCategory) {
                        ServiceCategory.p2p => TransferReceipt(
                            transactionHistory: widget.transactionHistory),
                        ServiceCategory.airtime => AirtimeOrDataReceipt(
                            transactionHistory: widget.transactionHistory),
                        ServiceCategory.data => AirtimeOrDataReceipt(
                            transactionHistory: widget.transactionHistory),
                        ServiceCategory.voucherRedeem => VouchersReceipt(
                            transactionHistory: widget.transactionHistory),
                        ServiceCategory.voucherPurchase => VouchersReceipt(
                            transactionHistory: widget.transactionHistory),
                        ServiceCategory.fundWallet => WalletReceipt(
                            transactionHistory: widget.transactionHistory),
                        ServiceCategory.adminDebitWallet => StatusReceipt(
                            transactionHistory: widget.transactionHistory),
                        ServiceCategory.adminCreditWallet => StatusReceipt(
                            transactionHistory: widget.transactionHistory),
                        ServiceCategory.cable => OperatorReceipt(
                            transactionHistory: widget.transactionHistory),
                        ServiceCategory.electricity => ElectricityReceipt(
                            transactionHistory: widget.transactionHistory),
                        ServiceCategory.betting => BettingReceipt(
                            transactionHistory: widget.transactionHistory),
                        ServiceCategory.localBankTransfer => TransferReceipt(
                            transactionHistory: widget.transactionHistory),
                        ServiceCategory.moneyRequest => StatusReceipt(
                            transactionHistory: widget.transactionHistory),
                        ServiceCategory.referralBonusPayment => StatusReceipt(
                            transactionHistory: widget.transactionHistory),
                        ServiceCategory.education => StatusReceipt(
                            transactionHistory: widget.transactionHistory),
                        ServiceCategory.internet => StatusReceipt(
                            transactionHistory: widget.transactionHistory),
                        ServiceCategory.createVirtualCard => StatusReceipt(
                            transactionHistory: widget.transactionHistory),
                        ServiceCategory.fundVirtualCard => StatusReceipt(
                            transactionHistory: widget.transactionHistory),
                        null => StatusReceipt(
                            transactionHistory: widget.transactionHistory)
                      },
                      const Gap(height: 29),
                      InkWell(
                        onTap: () async {
                          await HapticFeedback.selectionClick();
                          await AppHelper.copy(
                              widget.transactionHistory.transactionId ?? '');
                        },
                        child: Container(
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(
                              horizontal: 16.w, vertical: 12.h),
                          margin: EdgeInsets.symmetric(horizontal: 16.w),
                          decoration: BoxDecoration(
                              color: AppColors.kBackgroundColor,
                              borderRadius: BorderRadius.circular(8.r)),
                          child: Column(
                            children: [
                              Text(AppString.transactionId,
                                  style: context.headlineMedium?.copyWith(
                                      fontSize: 14,
                                      color: AppColors.kIconGrey,
                                      fontWeight: FontWeight.w400),
                                  textAlign: TextAlign.center),
                              const Gap(height: 8),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Flexible(
                                      child: Text(
                                          widget.transactionHistory
                                                  .transactionId ??
                                              '',
                                          style: context.headlineMedium
                                              ?.copyWith(
                                                  fontSize: 16,
                                                  color: AppColors
                                                      .kPrimaryTextColor,
                                                  fontWeight: FontWeight.w500),
                                          textAlign: TextAlign.center)),
                                  const Gap(width: 5),
                                  SvgPicture.asset(AppImage.tableCopyIcon)
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      const Gap(height: 18.81),
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(
                            horizontal: 8.88.w, vertical: 8.88.h),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.88.r),
                            color: AppColors.kPrimaryColor),
                        child: Row(
                          children: [
                            SvgPicture.asset(AppImage.logo,
                                colorFilter: const ColorFilter.mode(
                                    AppColors.white, BlendMode.srcIn),
                                width: 36.09.w,
                                height: 44.41.h),
                            const Gap(width: 7.99),
                            Flexible(
                              child: Text(AppString.notOnPoucher,
                                  style: context.bodyMedium?.copyWith(
                                      color: AppColors.kBackgroundColor,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500)),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const Gap(height: 30),
              ElevatedButtonWidget(
                  title: AppString.getReceipt,
                  loading: ref.watch(receiptNotifierProvider).isProcessing,
                  onPressed: _handleReceiptAction)
            ]),
          )),
    );
  }

  Row _biuldTitle(BuildContext context, String amount, Color color) => Row(
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
                  fontSize: 20, color: color, fontWeight: FontWeight.w500),
              textAlign: TextAlign.right,
            ),
          ),
        ],
      );

  Future<void> _handleReceiptAction() async {
    final response =
        await BottomSheets.showSheet(child: const ShareReceiptSheets())
            as ReceiptType?;

    if (response != null) {
      switch (response) {
        case ReceiptType.pdf:
          await _receiptNotifier.downloadPdf(widget.transactionHistory);
        case ReceiptType.image:
          await _receiptNotifier.downloadImage();
        case ReceiptType.share:
          await _receiptNotifier.shareImage();
      }
    }
  }
}
