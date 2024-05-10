import 'package:pouchers/ui/features/transfer/domain/model/transfer.dart';
import 'package:pouchers/utils/extension.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

import '../../../../../common/app_colors.dart';
import '../../../../../common/app_images.dart';
import '../../../../../common/app_strings.dart';

Future<pw.Widget> generateTransferReceipt(Transfer? transfer) async {
  final dmSansFont = await rootBundle.load("assets/fonts/DMSans-Bold.ttf");
  final img = await rootBundle.load(AppImage.logo1);
  final imageBytes = img.buffer.asUint8List();
  final robotFont = await PdfGoogleFonts.robotoBold();

  final pw.Font getDmSansFont = pw.Font.ttf(dmSansFont);
  return pw.Column(children: [
    pw.Row(
      mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
      children: [
        pw.Expanded(
            child: pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
              pw.Text('Receipt',
                  style: pw.TextStyle(
                      color:
                          PdfColor.fromInt(AppColors.kPrimaryTextColor.value),
                      fontSize: 16,
                      font: getDmSansFont,
                      fontWeight: pw.FontWeight.bold),
                  textAlign: pw.TextAlign.left),
              pw.SizedBox(height: 12.h),
              pw.Text(transfer?.transactionDate ?? '',
                  style: pw.TextStyle(
                      color:
                          PdfColor.fromInt(AppColors.kSecondaryTextColor.value),
                      fontSize: 14,
                      font: getDmSansFont,
                      fontWeight: pw.FontWeight.normal),
                  textAlign: pw.TextAlign.left)
            ])),
        pw.SizedBox(width: 23.w),
        pw.Container(
            height: 50, width: 50, child: pw.Image(pw.MemoryImage(imageBytes)))
      ],
    ),
    pw.SizedBox(height: 40.h),
    _buildTileWidget(
        title: AppString.transactionReceipt,
        value:
            transfer?.transactionDate?.replaceAll('-', ' ').split(',').first ??
                '',
        font: getDmSansFont),
    pw.SizedBox(height: 26.h),
    _buildTileWidget(
        title: AppString.transactionSender,
        value: transfer?.senderName?.titleCase ?? '',
        font: getDmSansFont),
    pw.SizedBox(height: 26.h),
    _buildTileWidget(
        title: AppString.transactionBeneficiary,
        value: transfer?.receiverName?.titleCase ?? '',
        font: getDmSansFont),
    pw.SizedBox(height: 26.h),
    _buildTileWidget(
        title: AppString.poucherTag,
        value: transfer?.receiverTag ?? '',
        font: getDmSansFont),
    pw.SizedBox(height: 26.h),
    _buildTileWidget(
        title: AppString.transactionAmount,
        value: '${AppString.nairaSymbol}${(transfer?.amount ?? 0)}',
        font: robotFont),
    pw.SizedBox(height: 26.h),
    _buildTileWidget(
        title: AppString.transactionStatus,
        isSuccess: true,
        value: transfer?.status ?? '',
        font: getDmSansFont),
    pw.SizedBox(height: 40.h),
    pw.LayoutBuilder(builder: (context, constraint) {
      final boxWidth = constraint?.constrainWidth();
      final dashHeight = 1.h;
      final dashCount = ((boxWidth ?? 0) / (2 * 5.0)).floor();
      return pw.Flex(
          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
          direction: pw.Axis.horizontal,
          children: List.generate(
              dashCount,
              (index) => pw.SizedBox(
                    width: 5.0,
                    height: dashHeight,
                    child: pw.DecoratedBox(
                        decoration: pw.BoxDecoration(
                            color: PdfColor.fromInt(
                                AppColors.kLightColor200.value))),
                  )));
    }),
    pw.SizedBox(height: 48.h),
    pw.Text(AppString.transactionStatusMessage,
        style: pw.TextStyle(
            color: PdfColor.fromInt(AppColors.kSecondaryTextColor.value),
            fontSize: 12,
            fontWeight: pw.FontWeight.normal),
        textAlign: pw.TextAlign.center),
  ]);
}

pw.Row _buildTileWidget(
        {required String title,
        required String value,
        required pw.Font font,
        bool isSuccess = false}) =>
    pw.Row(
      children: [
        pw.Expanded(
            child: pw.Text(title,
                style: pw.TextStyle(
                    color:
                        PdfColor.fromInt(AppColors.kSecondaryTextColor.value),
                    fontSize: 14,
                    font: font,
                    fontWeight: pw.FontWeight.normal),
                textAlign: pw.TextAlign.left)),
        pw.Expanded(
            child: pw.Text(value,
                style: pw.TextStyle(
                    color: PdfColor.fromInt(isSuccess
                        ? AppColors.kColorGreen.value
                        : AppColors.kPrimaryTextColor.value),
                    fontSize: 14,
                    font: font,
                    fontWeight: pw.FontWeight.bold),
                textAlign: pw.TextAlign.right)),
      ],
    );
