import 'package:pouchers/utils/extension.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/widgets.dart';
import 'package:printing/printing.dart';

import '../../../../../../common/app_colors.dart';
import '../../../../../../common/app_images.dart';
import '../../../../../../common/app_strings.dart';
import '../../../../../utilities/domain/enum/service_category.dart';
import '../../domain/enum/transaction_type.dart';
import '../../domain/model/transaction_history.dart';
import '../../domain/parser/parse_transaction_title.dart';

Future<pw.Widget> generateTransactionReceipt(
    TransactionHistory? transactionHistory) async {
  final dmSansFont = await rootBundle.load("assets/fonts/DMSans-Bold.ttf");
  final img = await rootBundle.load(AppImage.check);
  final fullNameLogo = await rootBundle.load(AppImage.pouchers);
  final fullLogoBadge = await rootBundle.load(AppImage.receiptLogoBadge);

  final imageBytes = img.buffer.asUint8List();
  final fullNameLogoBytes = fullNameLogo.buffer.asUint8List();
  final fullLogoBadgeBytes = fullLogoBadge.buffer.asUint8List();

  final pw.Font getDmSansFont = pw.Font.ttf(dmSansFont);
  final robotFont = await PdfGoogleFonts.robotoBold();

  final bool isDebitTransaction =
      transactionHistory?.transactionType == TransactionType.debit;

  final Color color =
      isDebitTransaction ? AppColors.kColorRedDeep : AppColors.limeGreen;
  final String amount = isDebitTransaction
      ? '-${transactionHistory?.amount.toNaira}'
      : '+${transactionHistory?.amount.toNaira}';

  return pw.Column(children: [
    pw.Align(
        alignment: Alignment.topRight,
        child: pw.Image(pw.MemoryImage(fullNameLogoBytes),
            width: 100.w, height: 100.h)),
    pw.SizedBox(height: 20),
    pw.Container(
        height: 121, width: 121, child: pw.Image(pw.MemoryImage(imageBytes))),
    pw.SizedBox(height: 14),
    pw.Text(AppString.transactionSuccess,
        textAlign: pw.TextAlign.center,
        style: pw.TextStyle(
            color: PdfColor.fromInt(AppColors.limeGreen.value),
            fontSize: 20,
            font: getDmSansFont,
            fontWeight: pw.FontWeight.bold)),
    pw.SizedBox(height: 4),
    pw.Text(AppString.transactionSuccessSummary,
        textAlign: pw.TextAlign.center,
        style: pw.TextStyle(
            color: PdfColor.fromInt(AppColors.kDarkGrey100.value),
            fontSize: 16,
            font: getDmSansFont,
            fontWeight: pw.FontWeight.normal)),
    pw.SizedBox(height: 16),
    pw.Row(
      children: [
        pw.Expanded(
          child: pw.Text(transactionTitle(transactionHistory!),
              textAlign: pw.TextAlign.left,
              style: pw.TextStyle(
                  color: PdfColor.fromInt(AppColors.kBlueColorDark.value),
                  fontSize: 14,
                  font: getDmSansFont,
                  fontWeight: pw.FontWeight.normal)),
        ),
        pw.SizedBox(width: 23),
        pw.Expanded(
          child: pw.Text(amount,
              textAlign: pw.TextAlign.right,
              style: pw.TextStyle(
                  color: PdfColor.fromInt(color.value),
                  fontSize: 20,
                  font: robotFont,
                  fontWeight: pw.FontWeight.normal)),
        ),
      ],
    ),
    pw.SizedBox(height: 26),
    // pw.Row(
    //   mainAxisSize: pw.MainAxisSize.min,
    //   children: [
    //     transactionHistory.updatedAt?.dateMonthYear ?? '',
    //     transactionHistory.updatedAt?.timeAloneWithMeridian12 ?? ''
    //   ]
    //       .map((date) => pw.Container(
    //           margin: pw.EdgeInsets.symmetric(horizontal: 14.w),
    //           padding: pw.EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
    //           decoration: pw.BoxDecoration(
    //               borderRadius: pw.BorderRadius.circular(10.r),
    //               border: pw.Border.all(
    //                   color: PdfColor.fromInt(
    //                       AppColors.kSecondaryTextColor.value))),
    //           child: pw.Text(
    //             date,
    //           )))
    //       .toList(),
    // ),
    _buildTile(
        title: AppString.transactionDate,
        value: transactionHistory.updatedAt?.dateMonthYearTime ?? '',
        font: robotFont),
    pw.SizedBox(height: 16),
    switch (transactionHistory.transactionCategory) {
      ServiceCategory.p2p => _buildTransferReceipt(
          robotFont: robotFont, transactionHistory: transactionHistory),
      ServiceCategory.airtime => _buildAirtimeOrDataReceipt(
          robotFont: robotFont, transactionHistory: transactionHistory),
      ServiceCategory.data => _buildAirtimeOrDataReceipt(
          robotFont: robotFont, transactionHistory: transactionHistory),
      ServiceCategory.voucherPurchase => _buildVoucherReceipt(
          robotFont: robotFont, transactionHistory: transactionHistory),
      ServiceCategory.voucherRedeem => _buildVoucherReceipt(
          robotFont: robotFont, transactionHistory: transactionHistory),
      ServiceCategory.fundWallet => _buildWalletFundingReceipt(
          robotFont: robotFont, transactionHistory: transactionHistory),
      ServiceCategory.adminDebitWallet => _buildStatusReceipt(
          robotFont: robotFont, transactionHistory: transactionHistory),
      ServiceCategory.adminCreditWallet => _buildStatusReceipt(
          robotFont: robotFont, transactionHistory: transactionHistory),
      ServiceCategory.cable => _buildOperatorReceipt(
          robotFont: robotFont, transactionHistory: transactionHistory),
      ServiceCategory.electricity => _buildElectricityReceipt(
          robotFont: robotFont, transactionHistory: transactionHistory),
      ServiceCategory.betting => _buildBettingReceipt(
          robotFont: robotFont, transactionHistory: transactionHistory),
      ServiceCategory.localBankTransfer => _buildTransferReceipt(
          robotFont: robotFont, transactionHistory: transactionHistory),
      ServiceCategory.referralBonusPayment => pw.SizedBox.shrink(),
      ServiceCategory.moneyRequest => _buildStatusReceipt(
          robotFont: robotFont, transactionHistory: transactionHistory),
      ServiceCategory.education => pw.SizedBox.shrink(),
      ServiceCategory.internet => pw.SizedBox.shrink(),
      ServiceCategory.createVirtualCard => pw.SizedBox.shrink(),
      ServiceCategory.fundVirtualCard => pw.SizedBox.shrink(),
      null => pw.SizedBox.shrink()
    },
    pw.SizedBox(height: 27),
    pw.Container(
      width: double.infinity,
      padding: pw.EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      margin: pw.EdgeInsets.symmetric(horizontal: 16.w),
      decoration: pw.BoxDecoration(
          color: PdfColor.fromInt(AppColors.kBackgroundColor.value),
          borderRadius: pw.BorderRadius.circular(8.r)),
      child: pw.Column(
        children: [
          pw.Text(AppString.transactionId,
              textAlign: pw.TextAlign.center,
              style: pw.TextStyle(
                  color: PdfColor.fromInt(AppColors.kIconGrey.value),
                  fontSize: 14,
                  font: getDmSansFont,
                  fontWeight: pw.FontWeight.normal)),
          pw.SizedBox(height: 16),
          pw.Text(transactionHistory.transactionId ?? '',
              textAlign: pw.TextAlign.center,
              style: pw.TextStyle(
                  color: PdfColor.fromInt(AppColors.kPrimaryTextColor.value),
                  fontSize: 16,
                  font: getDmSansFont,
                  fontWeight: pw.FontWeight.bold))
        ],
      ),
    ),
    pw.SizedBox(height: 15),
    pw.Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 8.88.w, vertical: 8.88.h),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.88.r),
          color: PdfColor.fromInt(AppColors.kPrimaryColor.value)),
      child: Row(
        children: [
          pw.Image(pw.MemoryImage(fullLogoBadgeBytes),
              width: 36.09.w, height: 44.41.h),
          pw.SizedBox(width: 7.99),
          Flexible(
            child: Text(AppString.notOnPoucher,
                style: pw.TextStyle(
                    color: PdfColor.fromInt(AppColors.kBackgroundColor.value),
                    fontSize: 13,
                    font: await PdfGoogleFonts.dMSansMedium(),
                    fontWeight: pw.FontWeight.normal)),
          )
        ],
      ),
    )
  ]);
}

pw.Column _buildBettingReceipt(
        {TransactionHistory? transactionHistory, Font? robotFont}) =>
    pw.Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTile(
            title: AppString.status,
            value: transactionHistory?.status?.titleCase ?? '',
            font: robotFont),
        pw.SizedBox(height: 16),
        _buildTile(
            title: AppString.beneficiary,
            value: transactionHistory?.beneficiaryName ?? '',
            font: robotFont),
        pw.SizedBox(height: 16),
        _buildTile(
            title: AppString.operator,
            value: transactionHistory?.extraDetails?.subCategory ?? '',
            font: robotFont)
      ],
    );

pw.Column _buildElectricityReceipt(
        {TransactionHistory? transactionHistory, Font? robotFont}) =>
    pw.Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTile(
            title: AppString.status,
            value: transactionHistory?.status?.titleCase ?? '',
            font: robotFont),
        pw.SizedBox(height: 16),
        _buildTile(
            title: AppString.operator,
            value: transactionHistory?.extraDetails?.subCategory ?? '',
            font: robotFont),
        pw.SizedBox(height: 16),
        _buildTile(
            font: robotFont,
            title: AppString.token,
            value: transactionHistory?.extraDetails?.token ?? ''),
        pw.SizedBox(height: 16),
        _buildTile(
            font: robotFont,
            title: AppString.vat,
            value: transactionHistory?.extraDetails?.vat ?? ''),
        pw.SizedBox(height: 16),
        _buildTile(
            font: robotFont,
            title: AppString.transactionID,
            value: transactionHistory?.extraDetails?.transactionId ?? ''),
        pw.SizedBox(height: 16),
        _buildTile(
            font: robotFont,
            title: AppString.customerRefNumber,
            value: transactionHistory?.extraDetails?.customerReferenceNumber ??
                ''),
        pw.SizedBox(height: 16),
        _buildTile(
            font: robotFont,
            title: AppString.customerReceiptNumber,
            value:
                transactionHistory?.extraDetails?.customerReceiptNumber ?? ''),
        pw.SizedBox(height: 16),
        _buildTile(
            font: robotFont,
            title: AppString.customerName,
            value: transactionHistory?.extraDetails?.customerName ?? ''),
        pw.SizedBox(height: 16),
        _buildTile(
            font: robotFont,
            title: AppString.address,
            value: transactionHistory?.extraDetails?.address ?? ''),
        pw.SizedBox(height: 16),
        _buildTile(
            font: robotFont,
            title: AppString.units,
            value: transactionHistory?.extraDetails?.units.toString() ?? ''),
      ],
    );

pw.Column _buildOperatorReceipt(
        {TransactionHistory? transactionHistory, Font? robotFont}) =>
    pw.Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTile(
            title: AppString.status,
            value: transactionHistory?.status?.titleCase ?? '',
            font: robotFont),
        pw.SizedBox(height: 16),
        _buildTile(
            title: AppString.operator,
            value: transactionHistory?.extraDetails?.subCategory ?? '',
            font: robotFont)
      ],
    );

pw.Column _buildWalletFundingReceipt(
        {TransactionHistory? transactionHistory, Font? robotFont}) =>
    pw.Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTile(
            title: AppString.status,
            value: transactionHistory?.status?.titleCase ?? '',
            font: robotFont),
        pw.SizedBox(height: 16),
        _buildTile(
            title: AppString.amountReceived,
            value: (transactionHistory?.amount ?? 0).toNaira,
            font: robotFont),
        pw.SizedBox(height: 16),
        _buildTile(
            title: AppString.transactionFee,
            value: (transactionHistory?.transactionFee ?? 0).toNaira,
            font: robotFont),
      ],
    );

_buildVoucherReceipt(
        {TransactionHistory? transactionHistory, Font? robotFont}) =>
    pw.Column(children: [
      _buildTile(
          title: AppString.status,
          value: transactionHistory?.status?.titleCase ?? '',
          font: robotFont),
      pw.SizedBox(height: 16),
      _buildTile(
          title: AppString.beneficiary,
          value: transactionHistory?.beneficiaryName?.titleCase ?? '',
          font: robotFont),
      pw.SizedBox(height: 16),
      _buildTile(
          title: AppString.voucherCode,
          value: transactionHistory?.extraDetails?.voucherCode ?? '',
          font: robotFont),
    ]);

_buildStatusReceipt(
        {TransactionHistory? transactionHistory, Font? robotFont}) =>
    _buildTile(
        title: AppString.status,
        value: transactionHistory?.status?.titleCase ?? '',
        font: robotFont);

pw.Column _buildTransferReceipt(
        {TransactionHistory? transactionHistory, Font? robotFont}) =>
    pw.Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTile(
            title: AppString.status,
            value: transactionHistory?.status?.titleCase ?? '',
            font: robotFont),
        pw.SizedBox(height: 16),
        _buildTile(
            title: AppString.sender,
            value:
                transactionHistory?.extraDetails?.senderName?.titleCase ?? '',
            font: robotFont),
        pw.SizedBox(height: 16),
        _buildTile(
            title: AppString.senderTag,
            value: transactionHistory?.extraDetails?.senderTag?.titleCase ?? '',
            font: robotFont),
        pw.SizedBox(height: 16),
        _buildTile(
            title: AppString.beneficiary,
            value: transactionHistory?.beneficiaryName?.titleCase ?? '',
            font: robotFont),
        pw.SizedBox(height: 16),
        _buildTile(
            title: AppString.beneficiaryTag,
            value: transactionHistory?.extraDetails?.receiverTag ?? 'N/A',
            font: robotFont),
      ],
    );

pw.Column _buildAirtimeOrDataReceipt(
        {TransactionHistory? transactionHistory, Font? robotFont}) =>
    pw.Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTile(
            title: AppString.status,
            value: transactionHistory?.status?.titleCase ?? '',
            font: robotFont),
        pw.SizedBox(height: 16),
        _buildTile(
            title: AppString.operator,
            value: transactionHistory?.extraDetails?.subCategory ?? '',
            font: robotFont),
        pw.SizedBox(height: 16),
        _buildTile(
            title: AppString.phoneNumber,
            value: transactionHistory?.extraDetails?.phoneNumber ?? '',
            font: robotFont),
      ],
    );

pw.Row _buildTile(
        {required String title, required String value, required Font? font}) =>
    pw.Row(
      children: [
        pw.Expanded(
          child: pw.Text(title,
              textAlign: pw.TextAlign.left,
              style: pw.TextStyle(
                  color: PdfColor.fromInt(AppColors.kSecondaryTextColor.value),
                  fontSize: 14,
                  font: font,
                  fontWeight: pw.FontWeight.normal)),
        ),
        pw.SizedBox(width: 23),
        pw.Expanded(
          child: pw.Text(value,
              textAlign: pw.TextAlign.right,
              style: pw.TextStyle(
                  color: PdfColor.fromInt(AppColors.kPrimaryTextColor.value),
                  fontSize: 14,
                  font: font,
                  fontWeight: pw.FontWeight.normal)),
        ),
      ],
    );
