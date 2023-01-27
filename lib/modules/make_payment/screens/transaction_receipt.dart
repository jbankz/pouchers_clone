import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pouchers/modules/login/models/login_response.dart';
import 'package:pouchers/modules/transactions/components/transaction_components.dart';
import 'package:pouchers/utils/assets_path.dart';
import 'package:pouchers/utils/strings.dart';
import 'package:pouchers/utils/utils.dart';
import 'package:pouchers/utils/widgets.dart';
import 'package:printing/printing.dart';
import '../../../utils/constant/theme_color_constants.dart';
import 'package:pdf/pdf.dart' as pdfSaver;
import 'package:pdf/widgets.dart' as pdfWidget;
import 'package:flutter/services.dart' show rootBundle;

class TransactionReceipt extends StatefulWidget {
  static const String routeName = "transactionReceipt";
  final String? typeOfTransfer;
  final String? transferName, accNo, amount, beneficiary;

  const TransactionReceipt(
      {Key? key,
      this.typeOfTransfer,
      this.amount,
      this.accNo,
      this.transferName,
      this.beneficiary})
      : super(key: key);

  @override
  State<TransactionReceipt> createState() => _TransactionReceiptState();
}

class _TransactionReceiptState extends State<TransactionReceipt> {
  HiveStoreResponseData userProfile = Hive.box(kUserBox).get(kUserInfoKey);

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width;
    TextTheme textTheme = Theme.of(context).textTheme;
    return InitialPage(
      addSpace: false,
      title: transactionReceipt,
      color: kBackgroundColor,
      child: Column(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.only(
                left: kSmallPadding,
                right: kSmallPadding,
                top: kSmallPadding,
              ),
              child: ListView(
                children: [
                  Stack(
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                            left: kRegularPadding,
                            right: kRegularPadding,
                            bottom: kMediumPadding),
                        padding: EdgeInsets.symmetric(
                            horizontal: kMacroPadding,
                            vertical: kRegularPadding),
                        decoration: BoxDecoration(
                            color: kColorBackgroundLight300,
                            borderRadius: BorderRadius.circular(
                              kMediumPadding,
                            )),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Container(
                                  height: 70,
                                  width: 70,
                                  decoration: BoxDecoration(
                                      color: kBackgroundColor,
                                      shape: BoxShape.circle),
                                ),
                                Image.asset(
                                  AssetPaths.poucherLogo,
                                  height: 80,
                                )
                              ],
                            ),
                            SizedBox(
                              height: kLargePadding,
                            ),
                            TransactionReceiptItems(
                              text: transactionDate,
                              subText: DateTime.now()
                                  .formatDate(dateFormatter2)
                                  .toString(),
                            ),
                            TransactionReceiptItems(
                              text: sender,
                              subText:
                                  "${userProfile.firstName!.substring(0, 1).toUpperCase()}${userProfile.firstName!.substring(1).toLowerCase()} ${userProfile.lastName!.substring(0, 1).toUpperCase()}${userProfile.lastName!.substring(1).toLowerCase()}",
                            ),
                            TransactionReceiptItems(
                              text: beneficiary,
                              subText: widget.beneficiary ?? "",
                            ),
                            widget.typeOfTransfer == "localBank"
                                ? Column(
                                    children: [
                                      TransactionReceiptItems(
                                        text: bankName,
                                        subText: widget.transferName ?? "",
                                      ),
                                      TransactionReceiptItems(
                                        text: accNumber,
                                        subText: widget.accNo ?? "",
                                      ),
                                    ],
                                  )
                                : SizedBox(),
                            widget.typeOfTransfer == "localBank"
                                ? SizedBox()
                                : TransactionReceiptItems(
                                    text: poucherTag,
                                    subText: "@barakat",
                                  ),
                            TransactionReceiptItems(
                              text: transactionAmount,
                              subText: widget.amount ?? "",
                              hasSymbol: true,
                            ),
                            widget.typeOfTransfer == "localBank"
                                ? SizedBox()
                                : TransactionReceiptItems(
                                    text: status,
                                    subText: "Sent",
                                    color: kColorGreen,
                                  ),
                            widget.typeOfTransfer == "localBank"
                                ? TransactionReceiptItems(
                                    text: transactionFee,
                                    subText: "53.75",
                                    hasSymbol: true,
                                  )
                                : SizedBox(),
                            SizedBox(
                              height: kRegularPadding,
                            ),
                            MySeparator(
                              color: kLightColor200,
                            ),
                            SizedBox(
                              height: kMacroPadding,
                            ),
                            Text(
                              transferSuccess,
                              style: textTheme.headline6,
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(
                              height: kMicroPadding,
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                          left: 0,
                          top: 0,
                          bottom: 0,
                          child: Center(
                            child: Container(
                                height: kLargePadding,
                                width: kLargePadding,
                                decoration: BoxDecoration(
                                  color: kBackgroundColor,
                                  shape: BoxShape.circle,
                                )),
                          )),
                      Positioned(
                          right: 0,
                          top: 0,
                          bottom: 0,
                          child: Center(
                            child: Container(
                                height: kLargePadding,
                                width: kLargePadding,
                                decoration: BoxDecoration(
                                  color: kBackgroundColor,
                                  shape: BoxShape.circle,
                                )),
                          )),
                      Positioned(
                        bottom: 0,
                        left: 30,
                        right: 30,
                        child: Container(
                          width: size / 1.2,
                          //color: Colors.red,
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: List.generate(
                                5,
                                (index) => Container(
                                    height: kLargePadding,
                                    width: kLargePadding,
                                    decoration: BoxDecoration(
                                      color: kBackgroundColor,
                                      shape: BoxShape.circle,
                                    )),
                              )),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(
                vertical: kSmallPadding, horizontal: kMediumPadding),
            decoration: BoxDecoration(
                color: kPrimaryWhite,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(kMicroPadding),
                    topRight: Radius.circular(kMicroPadding))),
            child: Column(
              children: [
                Container(
                  width: kMicroPadding,
                  height: 3,
                  decoration: BoxDecoration(
                    color: kPurpleColor200,
                    borderRadius: BorderRadius.circular(kPadding),
                  ),
                ),
                SizedBox(
                  height: kRegularPadding,
                ),
                Text(
                  share,
                  style: textTheme.subtitle1!.copyWith(
                    fontWeight: FontWeight.w500,
                    color: kIconGrey,
                  ),
                ),
                SizedBox(
                  height: kMediumPadding,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ShareTransactionReceiptOptions(
                      text: image,
                      onTap: () async {
                        await for (var page in Printing.raster(
                            await PdfInvoiceApi.generate(
                                userProfile,
                                widget.beneficiary ?? "",
                                widget.typeOfTransfer ?? "",
                                widget.transferName ?? "",
                                widget.accNo ?? "",
                                widget.amount ?? ""),
                            pages: [0, 1],
                            dpi: 72)) {
                          final imagee = page.toPng();
                          await Printing.sharePdf(
                            bytes: await imagee,
                            filename: 'receipt.png',
                          );
                        }
                      },
                      icon: Icon(
                        Icons.image,
                        color: kPrimaryColor,
                      ),
                    ),
                    SizedBox(
                      width: kMediumPadding,
                    ),
                    ShareTransactionReceiptOptions(
                      text: pdf,
                      onTap: () async {
                        await Printing.sharePdf(
                          bytes: await PdfInvoiceApi.generate(
                            userProfile,
                            widget.beneficiary ?? "",
                            widget.typeOfTransfer ?? "",
                            widget.transferName ?? "",
                            widget.accNo ?? "",
                            widget.amount ?? "",
                          ),
                          filename: 'receipt.pdf',
                        );
                      },
                      icon: SvgPicture.asset(AssetPaths.pdfIcon),
                    )
                  ],
                ),
                SizedBox(
                  height: kMediumPadding,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}




class PdfInvoiceApi {
  static Future<Uint8List> generate(
      HiveStoreResponseData userProfile,
      String beneficiaryName,
      String transferType,
      String transferName,
      String accNo,
      String amount) async {
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
                          subText: DateTime.now()
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
                          : widget(text: poucherTag, subText: "@barakat"),
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
