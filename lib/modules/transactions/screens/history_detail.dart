import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';

// import 'package:media_storage/media_storage.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:pouchers/app/common/listener.dart';
import 'package:pouchers/app/helpers/size_config.dart';
import 'package:pouchers/modules/login/models/login_response.dart';
import 'package:pouchers/modules/reuseables/components.dart';
import 'package:pouchers/modules/transactions/components/transaction_components.dart';
import 'package:pouchers/modules/transactions/model/transaction_model.dart';
import 'package:pouchers/modules/utilities/screens/voucher/voucher_widgets.dart';
import 'package:pouchers/utils/assets_path.dart';
import 'package:pouchers/utils/components.dart';
import 'package:pouchers/utils/constant/theme_color_constants.dart';
import 'package:pouchers/utils/flushbar.dart';
import 'package:pouchers/utils/input_formatters.dart';
import 'package:pouchers/utils/logger.dart';
import 'package:pouchers/utils/strings.dart';
import 'package:pouchers/utils/utils.dart';
import 'package:pouchers/utils/widgets.dart';
import 'package:pdf/pdf.dart' as pdfSaver;
import 'package:pdf/widgets.dart' as pdfWidget;
import 'package:printing/printing.dart';

class HistoryDetail extends StatelessWidget {
  static const String routeName = "historyDetail";
  final GetTransactionsData? item;

  HistoryDetail({Key? key, this.item}) : super(key: key);
  String dateFormatter = 'MMM dd, yyy';
  HiveStoreResponseData userProfile = Hive.box(kUserBox).get(kUserInfoKey);

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return InitialPage(
      title: transactionReceipt,
      child: ListenerPage(
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
                  Expanded(
                    child: Text(
                      finalCatName(
                          item!.currency!, item!.transactionCategory!),
                      style: textTheme.headline3!.copyWith(
                          color: kBlueColorDark, fontWeight: FontWeight.w500),
                    ),
                  ),
                  NairaWidget(
                    sign: item!.transactionType == "debit" ? "-" : "+",
                    addSign: true,
                    text: kPriceFormatter(double.parse(item!.amount!)),
                    textStyle1: TextStyle(
                        fontSize: 16,
                        color: item!.transactionType == "debit"
                            ? kColorRedDeep
                            : kColorGreen),
                    textStyle2: textTheme.headline3!.copyWith(
                      color: item!.transactionType == "debit"
                          ? kColorRedDeep
                          : kColorGreen,
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
                    text: item!.createdAt!.formatDate(dateFormatter),
                  ),
                  SizedBox(
                    width: kRegularPadding,
                  ),
                  TransactionDate(
                    textTheme: textTheme,
                    text: DateFormat.jm().format(item!.createdAt!),
                  )
                ],
              ),
              SizedBox(
                height: kMacroPadding,
              ),
              TransactionDetails(
                textTheme: textTheme,
                text: status,
                subText: item!.status ?? "",
              ),
              item!.extraDetails!.subCategory == null
                  ? SizedBox()
                  : TransactionDetails(
                textTheme: textTheme,
                text: paidWith,
                subText: "BalancePayment",
              ),
              item!.extraDetails!.subCategory == null
                  ? SizedBox()
                  : TransactionDetails(
                      textTheme: textTheme,
                      text: operator,
                      subText: item!.extraDetails!.subCategory!,
                    ),
              item!.extraDetails!.phoneNumber == null
                  ? SizedBox()
                  : TransactionDetails(
                      textTheme: textTheme,
                      text: phoneNumberText,
                      subText:
                          item!.extraDetails!.phoneNumber ?? "No PhoneNumber",
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
                      item!.transactionId ?? "",
                      style: textTheme.subtitle1!.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: kSmallPadding,
              ),
              inkWell(
                onTap: (){
                  Clipboard.setData(ClipboardData(text: item!.transactionReference));
                  showSuccessBar(context, "Copied");
                },
                child: Text(
                  tapCopy,
                  style: textTheme.headline3!.copyWith(
                    color: kIconGrey,
                  ),
                ),
              ),
              SizedBox(
                height: kRegularPadding,
              ),
              LargeButton(
                  title: getReceipt,
                  onPressed: () async {
                    await Printing.sharePdf(
                      bytes: await DownloadTransactionReceipt.generate(item!),
                      filename:
                          'receipt_${DateTime.now().millisecondsSinceEpoch}.pdf',
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
}

class pdfApi {
  static saveDocument() async {
    // final permission = await Permission.manageExternalStorage.request();
    final permission = await Permission.storage.request();

    if (permission.isGranted) {
      String dir;
      if (Platform.isIOS) {
        dir = (await getApplicationDocumentsDirectory()).path;
      } else {
        // dir = "/sdcard/download/";
        // dir = (await getExternalStorageDirectory())!.path;
        dir = (await getTemporaryDirectory()).path;
        logPrint("Directory: $dir");
        // await getTemporaryDirectory()
        //     .then((dir) => logPrint("Download dir: ${dir.path}"));
      }
      // final bytes = await DownloadTransactionReceipt.generate();
      final file = File('${dir}receipt_${DateTime.now()}.pdf');
      // await file.writeAsBytes(bytes);
    } else {
      Permission.manageExternalStorage.request();
    }

    // bool isPermission = await MediaStorage.getRequestStoragePermission();

    // if (isPermission) {
    //   var path = await MediaStorage.getExternalStoragePublicDirectory(
    //       MediaStorage.DIRECTORY_DOWNLOADS);
    //   final file = File('${path}/receipt.pdf');
    //   await file.writeAsBytes(bytes);
    // }
    // String dir

    // if (Platform.isIOS) {
    //   dir = (await getApplicationDocumentsDirectory()).path;
    // } else {
    //   dir = (await getExternalStorageDirectory())!.path;
    // }
  }
}

class DownloadTransactionReceipt {
  static Future<Uint8List> generate(GetTransactionsData item) async {
    final font = await rootBundle.load("assets/fonts/DMSans-Bold.ttf");
    final font2 = await rootBundle.load("assets/fonts/Inter.ttf");
    final ByteData bytes = await rootBundle.load(AssetPaths.checkImage);
    final Uint8List checkImage = bytes.buffer.asUint8List();

    final ttf = pdfWidget.Font.ttf(font);
    String dateFormatter = 'MMM dd, yyy';
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
                child: pdfWidget.Image(
                  pdfWidget.MemoryImage(checkImage),
                ),
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
              pdfWidget.Expanded(
                child: pdfWidget.Text(finalCatName(
                    item.currency!, item.transactionCategory!) ?? "",
                    style: pdfWidget.TextStyle(
                      fontWeight: pdfWidget.FontWeight.bold,
                      font: ttf,
                      color: pdfSaver.PdfColor.fromHex("2B2B2B"),
                      fontSize: 16,
                    )),
              ),
              pdfWidget.Text(
                  "- ₦${kPriceFormatter(double.parse(item.amount!))}",
                  style: pdfWidget.TextStyle(
                    fontSize: 20,
                    font: nairaTtf,
                    color: item.transactionType == "debit"
                        ? pdfSaver.PdfColor.fromHex("AE1313")
                        : pdfSaver.PdfColor.fromHex("00BB64"),
                  ))
            ],
          ),
          pdfWidget.SizedBox(
            height: kMacroPadding,
          ),
          pdfWidget.Row(
            mainAxisAlignment: pdfWidget.MainAxisAlignment.center,
            children: [
              pdfTransactionDate(item.createdAt!.formatDate(dateFormatter)),
              pdfWidget.SizedBox(
                width: kRegularPadding,
              ),
              pdfTransactionDate(DateFormat.jm().format(item.createdAt!)),
            ],
          ),
          pdfWidget.SizedBox(
            height: kMacroPadding,
          ),
          pdfTransactionDetails(text: status, subText: item.status ?? ""),
          pdfTransactionDetails(text: paidWith, subText: "BalancePayment"),
          pdfTransactionDetails(
              text: operator,
              subText: item.extraDetails!.subCategory ?? "No SubCategory"),
          pdfTransactionDetails(
              text: phoneNumberText,
              subText: item.extraDetails!.phoneNumber ?? "No PhoneNumber"),
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
                  item.transactionId!,
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
    }));
    return await pdfDoc.save();
  }
}
