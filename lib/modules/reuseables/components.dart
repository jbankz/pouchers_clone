import 'package:pouchers/modules/login/models/login_response.dart';
import 'package:pouchers/utils/assets_path.dart';
import 'package:pdf/pdf.dart' as pdfSaver;
import 'package:pdf/widgets.dart' as pdfWidget;
import 'package:flutter/services.dart' show ByteData, Uint8List, rootBundle;
import 'package:pouchers/utils/constant/theme_color_constants.dart';
import 'package:pouchers/utils/strings.dart';
import 'package:pouchers/utils/utils.dart';


class PdfInvoiceApi {
  static Future<Uint8List> generate(
      HiveStoreResponseData userProfile,
      String beneficiaryName,
      String transferType,
      String transferName,
      String accNo,
      String amount, DateTime transactionTime, String tag) async {
    final ByteData bytes = await rootBundle.load(AssetPaths.poucherLogo);
    final Uint8List poucherLogo = bytes.buffer.asUint8List();
    final font = await rootBundle.load("assets/fonts/DMSans-Bold.ttf");
    final font2 = await rootBundle.load("assets/fonts/Inter.ttf");
    final ttf = pdfWidget.Font.ttf(font);
    final nairaTtf = pdfWidget.Font.ttf(font2);
    final pdfDoc = pdfWidget.Document();

    pdfWidget.Widget widget(
        {String? color,
          required String text,
          required String subText,
          bool hasSymbol = false}) {
      var _widget = pdfWidget.Column(children: [
        pdfWidget.Row(
          mainAxisAlignment: pdfWidget.MainAxisAlignment.spaceBetween,
          children: [
            pdfWidget.Text(text,
                style: pdfWidget.TextStyle(
                  fontWeight: pdfWidget.FontWeight.bold,
                  font: ttf,
                  color: pdfSaver.PdfColor.fromHex("8F8E9B"),
                  fontSize: 18,
                )),
            hasSymbol
                ? pdfWidget.RichText(
              text: pdfWidget.TextSpan(text: "₦", children: [
                pdfWidget.TextSpan(
                    text: subText,
                    style: pdfWidget.TextStyle(
                      fontWeight: pdfWidget.FontWeight.bold,
                      font: ttf,
                      color: pdfSaver.PdfColor.fromHex(color ?? "060628"),
                      fontSize: 18,
                    ))
              ], style: pdfWidget.TextStyle(
                fontWeight: pdfWidget.FontWeight.bold,
                font: nairaTtf,
                color: pdfSaver.PdfColor.fromHex(color ?? "060628"),
                fontSize: 18,
              ) ),
            )
                : pdfWidget.Text(subText,
                style: pdfWidget.TextStyle(
                  fontWeight: pdfWidget.FontWeight.bold,
                  font: null,
                  color: pdfSaver.PdfColor.fromHex(color ?? "060628"),
                  fontSize: 18,
                )),
          ],
        ),
        pdfWidget.SizedBox(height: kMicroPadding)
      ]);
      return _widget;
    }

    pdfDoc.addPage(pdfWidget.Page(build: (context) {
      return pdfWidget.Container(
        padding: pdfWidget.EdgeInsets.only(
          left: kSmallPadding,
          right: kSmallPadding,
          top: kSmallPadding,
        ),
        child: pdfWidget.ListView(
          children: [
            pdfWidget.Container(
              margin: pdfWidget.EdgeInsets.only(
                  left: kRegularPadding,
                  right: kRegularPadding,
                  bottom: kMediumPadding),
              padding: pdfWidget.EdgeInsets.symmetric(
                  horizontal: kMacroPadding, vertical: kRegularPadding),
              decoration: pdfWidget.BoxDecoration(
                  color: pdfSaver.PdfColor.fromHex("D9D9D9"),
                  borderRadius: pdfWidget.BorderRadius.circular(
                    kMediumPadding,
                  )),
              child: pdfWidget.Column(
                children: [
                  pdfWidget.Align(
                    alignment: pdfWidget.Alignment.centerRight,
                    child: pdfWidget.Image(pdfWidget.MemoryImage(poucherLogo),
                        height: 80),
                  ),

                  pdfWidget.SizedBox(
                    height: kLargePadding,
                  ),
                  widget(
                      text: transactionDate,
                      subText: transactionTime
                          .formatDate(dateFormatter2)
                          .toString()),
                  widget(
                    text: sender,
                    subText: "${userProfile.firstName!.substring(0, 1).toUpperCase()}${userProfile.firstName!.substring(1).toLowerCase()} ${userProfile.lastName!.substring(0, 1).toUpperCase()}${userProfile.lastName!.substring(1).toLowerCase()}",
                  ),
                  widget(
                    text: beneficiary,
                    subText: beneficiaryName,
                  ),
                  transferType == "localBank"
                      ? pdfWidget.Column(children: [
                    widget(text: bankName, subText: transferName),
                    widget(text: accNumber, subText: accNo),
                  ])
                      : pdfWidget.SizedBox(),
                  transferType == "localBank"
                      ? pdfWidget.SizedBox()
                      : widget(text: poucherTag, subText: "@$tag"),
                  widget(text: transactionAmount, subText: amount, hasSymbol: true),
                  transferType == "localBank"
                      ? widget(text: transactionFee, subText: "53.75", hasSymbol: true)
                      : widget(
                      text: status, subText: "Sent", color: "00BB64"),
                  pdfWidget.SizedBox(
                    height: kRegularPadding,
                  ),
                  pdfWidget.Container(
                      decoration: pdfWidget.BoxDecoration(
                        border: pdfWidget.Border.all(
                            style: pdfWidget.BorderStyle.dashed, width: 2),
                      )),
                  pdfWidget.SizedBox(
                    height: kMacroPadding,
                  ),
                  pdfWidget.Text(
                    transferSuccess,
                    style: pdfWidget.TextStyle(
                      fontWeight: pdfWidget.FontWeight.normal,
                      font: ttf,
                      color: pdfSaver.PdfColor.fromHex("8F8E9B"),
                      fontSize: 16,
                    ),
                    textAlign: pdfWidget.TextAlign.center,
                  ),
                  pdfWidget.SizedBox(
                    height: kMicroPadding,
                  ),
                ],
              ),
            ),

          ],
        ),
      );
    }));
    return await await pdfDoc.save();
  }
}
