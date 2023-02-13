import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pouchers/modules/login/models/login_response.dart';
import 'package:pouchers/modules/reuseables/components.dart';
import 'package:pouchers/modules/transactions/components/transaction_components.dart';
import 'package:pouchers/utils/assets_path.dart';
import 'package:pouchers/utils/strings.dart';
import 'package:pouchers/utils/utils.dart';
import 'package:pouchers/utils/widgets.dart';
import 'package:printing/printing.dart';
import '../../../utils/constant/theme_color_constants.dart';

class TransactionReceipt extends StatefulWidget {
  static const String routeName = "transactionReceipt";
  final String? typeOfTransfer;
  final String? transferName, accNo, amount, beneficiary;
  final DateTime? transactionTime;
  final String? tag;
  final String? fromWhere;

  const TransactionReceipt(
      {Key? key,
      this.typeOfTransfer,
      this.amount,
      this.accNo,
      this.tag,
      this.transferName,
      this.transactionTime,
      this.fromWhere,
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
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              AssetPaths.poucherLogo,
                              height: 80,
                            ),
                            SizedBox(
                              height: kLargePadding,
                            ),
                            TransactionReceiptItems(
                              text: transactionDate,
                              subText: widget.transactionTime!
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
                                    subText: "@${widget.tag}",
                                  ),
                            TransactionReceiptItems(
                              text: transactionAmount,
                              subText: kPriceFormatter(
                                  double.parse(widget.amount ?? "0")),
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
          widget.fromWhere == "history"
              ? Padding(
                padding: const EdgeInsets.all( kMediumPadding),
                child: LargeButton(
                    title: getReceipt,
                    onPressed: () async {
                      await Printing.sharePdf(
                        bytes: await PdfInvoiceApi.generate(
                            userProfile,
                            widget.beneficiary ?? "",
                            widget.typeOfTransfer ?? "",
                            widget.transferName ?? "",
                            widget.accNo ?? "",
                            kPriceFormatter(double.parse(widget.amount ?? "0")),
                            widget.transactionTime!, widget.tag ?? ""),
                        filename:
                            'receipt_${DateTime.now().millisecondsSinceEpoch}.pdf',
                      );
                    }),
              )
              : Container(
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
                                      kPriceFormatter(
                                          double.parse(widget.amount ?? "0")),
                                      DateTime.now(), widget.tag ?? "No Tag"),
                                  pages: [0, 1],
                                  dpi: 72)) {
                                final imagee = page.toPng();
                                await Printing.sharePdf(
                                  bytes: await imagee,
                                  filename:
                                      'receipt_${DateTime.now().millisecondsSinceEpoch}.png',
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
                                    kPriceFormatter(
                                        double.parse(widget.amount ?? "0")),
                                    DateTime.now(), widget.tag ?? "No Tag"),
                                filename:
                                    'receipt_${DateTime.now().millisecondsSinceEpoch}.pdf',
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
