import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pouchers/app/helpers/size_config.dart';
import 'package:pouchers/modules/tab_layout/screens/homepage/voucher/voucher_widgets.dart';
import 'package:pouchers/modules/transactions/components/transaction_components.dart';
import 'package:pouchers/utils/assets_path.dart';
import 'package:pouchers/utils/constant/theme_color_constants.dart';
import 'package:pouchers/utils/strings.dart';
import 'package:pouchers/utils/widgets.dart';
import 'package:pdf/pdf.dart' as pdfSaver;
import 'package:pdf/widgets.dart' as pdfWidget;

class HistoryDetail extends StatelessWidget {
  static const String routeName = "historyDetail";
  final VoucherItems? item;

  const HistoryDetail({Key? key, this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return InitialPage(
      title: transactionReceipt,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Container(
                padding: EdgeInsets.all(35),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: kColorGreen.withOpacity(0.2)),
                child: Container(
                  padding: EdgeInsets.all(35),
                  decoration:
                      BoxDecoration(shape: BoxShape.circle, color: kColorGreen),
                  child: Icon(Icons.check, color: kPrimaryWhite, size: 50),
                ),
              ),
            ),
            SizedBox(
              height: kRegularPadding,
            ),
            Text(
              transSuccessful,
              style: textTheme.bodyText2!.copyWith(
                fontWeight: FontWeight.w500,
                color: kColorGreen,
                fontSize: 22,
              ),
            ),
            SizedBox(
              height: kPadding,
            ),
            Text(
              transSummary,
              style: textTheme.bodyText1!.copyWith(color: kDarkGrey100),
            ),
            SizedBox(
              height: kRegularPadding,
            ),
            Row(
              children: [
                Container(
                  height: 45,
                  width: 45,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: kDarkGrey100),
                ),
                SizedBox(
                  width: kRegularPadding,
                ),
                Expanded(
                  child: Text(
                    item!.code,
                    style: textTheme.headline3!.copyWith(
                        color: kBlueColorDark, fontWeight: FontWeight.w500),
                  ),
                ),
                NairaWidget(
                  sign: '-',
                  addSign: true,
                  text: item!.value,
                  textStyle1: TextStyle(fontSize: 16, color: kColorRedDeep),
                  textStyle2: textTheme.headline3!.copyWith(
                    color: kColorRedDeep,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: kMacroPadding,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TransactionDate(
                  textTheme: textTheme,
                  text: "Oct 18,2022",
                ),
                SizedBox(
                  width: kRegularPadding,
                ),
                TransactionDate(
                  textTheme: textTheme,
                  text: "16:30 PM",
                )
              ],
            ),
            SizedBox(
              height: kMacroPadding,
            ),
            TransactionDetails(
              textTheme: textTheme,
              text: status,
              subText: "Completed",
            ),
            TransactionDetails(
              textTheme: textTheme,
              text: paidWith,
              subText: "BalancePayment",
            ),
            TransactionDetails(
              textTheme: textTheme,
              text: operator,
              subText: "Globacom",
            ),
            TransactionDetails(
              textTheme: textTheme,
              text: phoneNumberText,
              subText: "+2348145224890",
            ),
            SizedBox(
              height: kRegularPadding,
            ),
            Container(
              padding: EdgeInsets.symmetric(
                  vertical: kRegularPadding, horizontal: 50),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(kSmallPadding),
                  color: kBackgroundColor),
              child: Column(
                children: [
                  Text(
                    transNumber,
                    style: textTheme.headline3!.copyWith(
                      color: kIconGrey,
                    ),
                  ),
                  SizedBox(
                    height: kSmallPadding,
                  ),
                  Text(
                    "3006211465789745271937",
                    style: textTheme.subtitle1!.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: kRegularPadding,
            ),
           // File: '/storage/emulated/0/Android/data/com.enyata.pouchers/files/receipt.pdf'
            LargeButton(
                title: getReceipt,
                onPressed: () async {
                  await pdfApi.saveDocument();
                  print(await pdfApi.saveDocument());
                })
          ],
        ),
      ),
    );
  }

  Future<void> _requestDownload(String _url, String _name) async {
    String dir;
    if (Platform.isIOS) {
      dir = (await getApplicationDocumentsDirectory()).path;
    } else {
      dir = (await getExternalStorageDirectory())!.path;
    }
    var _localPath = dir + _name;
    final savedDir = Directory(_localPath);
    await savedDir.create(recursive: true).then((value) async {
      String? _taskid = await FlutterDownloader.enqueue(
        url: _url.split(" ")[1],
        fileName: _url.split(" ")[0],
        savedDir: _localPath,
        showNotification: true,
        openFileFromNotification: true,
      );
      print(_taskid);
    });
  }
}

class pdfApi {
  static Future<File> saveDocument() async {
    final bytes = await DownloadTransactionReceipt.generate();
    String dir;
    if (Platform.isIOS) {
      dir = (await getApplicationDocumentsDirectory()).path;
    } else {
      dir = (await getExternalStorageDirectory())!.path;
    }
    final file = File('${dir}/receipt.pdf');
    await file.writeAsBytes(bytes);
    return file;
  }
}

class DownloadTransactionReceipt {
  static Future<Uint8List> generate() async {
    final font = await rootBundle.load("assets/fonts/DMSans-Bold.ttf");
    final font2 = await rootBundle.load("assets/fonts/Inter.ttf");
    final ttf = pdfWidget.Font.ttf(font);
    final nairaTtf = pdfWidget.Font.ttf(font2);
    final pdfDoc = pdfWidget.Document();

    pdfWidget.Widget pdfTransactionDate(String text) {
      var _widget = pdfWidget.Container(
        padding: pdfWidget.EdgeInsets.symmetric(
            horizontal: kSmallPadding, vertical: kPadding),
        decoration: pdfWidget.BoxDecoration(
          borderRadius: pdfWidget.BorderRadius.circular(kSmallPadding),
          border: pdfWidget.Border.all(
              color: pdfSaver.PdfColor.fromHex("8F8E9B"), width: 1),
        ),
        child: pdfWidget.Text(
          text,
          style: pdfWidget.TextStyle(
            fontWeight: pdfWidget.FontWeight.bold,
            font: ttf,
            color: pdfSaver.PdfColor.fromHex("8F8E9B"),
            fontSize: 16,
          ),
        ),
      );
      return _widget;
    }

    ;

    pdfWidget.Widget pdfTransactionDetails({required String text, subText}) {
      var _widget = pdfWidget.Column(
        children: [
          pdfWidget.Row(
            mainAxisAlignment: pdfWidget.MainAxisAlignment.spaceBetween,
            children: [
              pdfWidget.Text(
                text,
                style: pdfWidget.TextStyle(
                  fontWeight: pdfWidget.FontWeight.bold,
                  font: ttf,
                  color: pdfSaver.PdfColor.fromHex("8F8E9B"),
                  fontSize: 16,
                ),
              ),
              pdfWidget.Text(
                subText,
                style: pdfWidget.TextStyle(
                  fontWeight: pdfWidget.FontWeight.bold,
                  font: ttf,
                  color: pdfSaver.PdfColor.fromHex("060628"),
                  fontSize: 16,
                ),
              ),
            ],
          ),
          pdfWidget.SizedBox(
            height: kRegularPadding,
          )
        ],
      );
      return _widget;
    }

    pdfDoc.addPage(pdfWidget.Page(build: (context) {
      return pdfWidget.Column(
        children: [
          pdfWidget.Center(
            child: pdfWidget.Container(
              padding: pdfWidget.EdgeInsets.all(35),
              decoration: pdfWidget.BoxDecoration(
                  shape: pdfWidget.BoxShape.circle,
                  color: pdfSaver.PdfColor.fromHex("B4EBD1")),
              child: pdfWidget.Container(
                padding: pdfWidget.EdgeInsets.all(35),
                decoration: pdfWidget.BoxDecoration(
                    shape: pdfWidget.BoxShape.circle,
                    color: pdfSaver.PdfColor.fromHex("00BB64")),
                child: pdfWidget.Icon(
                    pdfWidget.IconData(
                      (Icons.check.codePoint),
                    ),
                    size: 50,
                    color: pdfSaver.PdfColor.fromHex("FFFFFF")),
              ),
            ),
          ),
          pdfWidget.SizedBox(
            height: kRegularPadding,
          ),
          pdfWidget.Text(transSuccessful,
              style: pdfWidget.TextStyle(
                fontWeight: pdfWidget.FontWeight.bold,
                font: ttf,
                color: pdfSaver.PdfColor.fromHex("00BB64"),
                fontSize: 22,
              )),
          pdfWidget.SizedBox(
            height: kPadding,
          ),
          pdfWidget.Text(transSummary,
              style: pdfWidget.TextStyle(
                fontWeight: pdfWidget.FontWeight.normal,
                font: ttf,
                color: pdfSaver.PdfColor.fromHex("A2A7B1"),
                fontSize: 18,
              )),
          pdfWidget.SizedBox(
            height: kRegularPadding,
          ),
          pdfWidget.Row(
            children: [
              pdfWidget.Container(
                height: 45,
                width: 45,
                decoration: pdfWidget.BoxDecoration(
                    shape: pdfWidget.BoxShape.circle,
                    color: pdfSaver.PdfColor.fromHex("A2A7B1")),
              ),
              pdfWidget.SizedBox(
                width: kRegularPadding,
              ),
              pdfWidget.Expanded(
                child: pdfWidget.Text("item!.code",
                    style: pdfWidget.TextStyle(
                      fontWeight: pdfWidget.FontWeight.bold,
                      font: ttf,
                      color: pdfSaver.PdfColor.fromHex("2B2B2B"),
                      fontSize: 16,
                    )),
              ),
              pdfWidget.Text("- ₦500,000",
                  style: pdfWidget.TextStyle(
                      fontSize: 20,
                      font: nairaTtf,
                      color: pdfSaver.PdfColor.fromHex("AE1313")))
            ],
          ),
          pdfWidget.SizedBox(
            height: kMacroPadding,
          ),
          pdfWidget.Row(
            mainAxisAlignment: pdfWidget.MainAxisAlignment.center,
            children: [
              pdfTransactionDate("Oct 18,2022"),
              pdfTransactionDate("16:30 PM"),
              pdfWidget.SizedBox(
                width: kRegularPadding,
              ),
            ],
          ),
          pdfWidget.SizedBox(
            height: kMacroPadding,
          ),
          pdfTransactionDetails(text: status, subText: "Completed"),
          pdfTransactionDetails(text: paidWith, subText: "BalancePayment"),
          pdfTransactionDetails(text: operator, subText: "Globacom"),
          pdfTransactionDetails(
              text: phoneNumberText, subText: "+2348145224890"),
          pdfWidget.SizedBox(
            height: kRegularPadding,
          ),
          pdfWidget.Container(
            padding: pdfWidget.EdgeInsets.symmetric(
                vertical: kRegularPadding, horizontal: 50),
            decoration: pdfWidget.BoxDecoration(
                borderRadius: pdfWidget.BorderRadius.circular(kSmallPadding),
                color: pdfSaver.PdfColor.fromHex("F4F4FB")),
            child: pdfWidget.Column(
              children: [
                pdfWidget.Text(
                  transNumber,
                  style: pdfWidget.TextStyle(
                    fontWeight: pdfWidget.FontWeight.normal,
                    font: ttf,
                    color: pdfSaver.PdfColor.fromHex("6D6D6F"),
                    fontSize: 16,
                  ),
                ),
                pdfWidget.SizedBox(
                  height: kSmallPadding,
                ),
                pdfWidget.Text(
                  "3006211465789745271937",
                  style: pdfWidget.TextStyle(
                    fontWeight: pdfWidget.FontWeight.bold,
                    font: ttf,
                    color: pdfSaver.PdfColor.fromHex("060628"),
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
          pdfWidget.SizedBox(
            height: kRegularPadding,
          ),
        ],
      );
      //pdfWidget.Container(
      // padding: pdfWidget.EdgeInsets.only(
      //   left: kSmallPadding,
      //   right: kSmallPadding,
      //   top: kSmallPadding,
      // ),
      // child: pdfWidget.ListView(
      //   children: [
      //       pdfWidget.Container(
      //         margin: pdfWidget.EdgeInsets.only(
      //             left: kRegularPadding,
      //             right: kRegularPadding,
      //             bottom: kMediumPadding),
      //         padding: pdfWidget.EdgeInsets.symmetric(
      //             horizontal: kMacroPadding, vertical: kRegularPadding),
      //         decoration: pdfWidget.BoxDecoration(
      //             color: pdfSaver.PdfColor.fromHex("D9D9D9"),
      //             borderRadius: pdfWidget.BorderRadius.circular(
      //               kMediumPadding,
      //             )),
      //         child: pdfWidget.Column(
      //           children: [
      //             pdfWidget.Align(
      //               alignment: pdfWidget.Alignment.centerRight,
      //               child: pdfWidget.Image(pdfWidget.MemoryImage(poucherLogo),
      //                   height: 80),
      //             ),
      //             pdfWidget.SizedBox(
      //               height: kLargePadding,
      //             ),
      //             pdfWidget.SizedBox(
      //               height: kRegularPadding,
      //             ),
      //             pdfWidget.Container(
      //                 decoration: pdfWidget.BoxDecoration(
      //               border: pdfWidget.Border.all(
      //                   style: pdfWidget.BorderStyle.dashed, width: 2),
      //             )),
      //             pdfWidget.SizedBox(
      //               height: kMacroPadding,
      //             ),
      //             pdfWidget.Text(
      //               transferSuccess,
      //               style: pdfWidget.TextStyle(
      //                 fontWeight: pdfWidget.FontWeight.normal,
      //                 font: ttf,
      //                 color: pdfSaver.PdfColor.fromHex("8F8E9B"),
      //                 fontSize: 16,
      //               ),
      //               textAlign: pdfWidget.TextAlign.center,
      //             ),
      //             pdfWidget.SizedBox(
      //               height: kMicroPadding,
      //             ),
      //           ],
      //         ),
      //       ),
      //     ],
      //   ),
      // );
    }));
    return await pdfDoc.save();
  }
}
