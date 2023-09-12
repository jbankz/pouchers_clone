import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:Pouchers/modules/login/models/login_response.dart';
import 'package:Pouchers/modules/reuseables/components.dart';
import 'package:Pouchers/modules/transactions/components/transaction_components.dart';
import 'package:Pouchers/utils/assets_path.dart';
import 'package:Pouchers/utils/components.dart';
import 'package:Pouchers/utils/flushbar.dart';
import 'package:Pouchers/utils/input_formatters.dart';
import 'package:Pouchers/utils/strings.dart';
import 'package:Pouchers/utils/utils.dart';
import 'package:Pouchers/utils/widgets.dart';
import 'package:printing/printing.dart';
import '../../../utils/constant/theme_color_constants.dart';

class TransactionReceipt extends StatefulWidget {
  static const String routeName = "transactionReceipt";
  final String? typeOfTransfer;
  final String? transferName, accNo, amount, beneficiary, senderName, status, transactionId;
  final DateTime? transactionTime;
  final String? tag;
  final String? fromWhere, transferStatus;
  final double? transactionFee ;


  const TransactionReceipt(
      {Key? key,
      this.typeOfTransfer,
      this.amount,
      this.accNo,
      this.tag,
        this.transactionId,
      this.transferName,
        this.status,
        this.senderName,
      this.transactionTime,
        this.transferStatus,
      this.fromWhere,
        this.transactionFee,
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
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(
                              kMediumPadding,
                            )),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Align(
                              alignment: Alignment.topRight,
                              child: SvgPicture.asset(
                                AssetPaths.poucherLogo,
                                height: 80,
                              ),
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
                              subText: widget.senderName?.toTitleCase2() ?? "No name",
                            ),
                            TransactionReceiptItems(
                              text: beneficiary,
                              subText: widget.beneficiary?.toTitleCase2() ?? "No name",
                            ),
                            // widget.typeOfTransfer == "localBank"
                            //     ? TransactionReceiptItems(
                            //         text: beneficiary,
                            //         subText: widget.beneficiary ?? "",
                            //       )
                            //     : SizedBox(),
                            widget.typeOfTransfer == "localBank"
                                ? Column(
                                    children: [
                                      TransactionReceiptItems(
                                        text: bankName,
                                        subText: widget.transferName?.toCapitalized() ?? "",
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
                                    subText: widget.status ?? "Sent",
                                    color: kColorGreen,
                                  ),
                            widget.typeOfTransfer == "localBank"
                                ? TransactionReceiptItems(
                                    text: transactionFee,
                                    subText: widget.transactionFee?.toString() ?? "0",
                                    hasSymbol: true,
                                  )
                                : SizedBox(),
                            Center(
                              child: Column(
                                children: [
                                  Text(
                                    "Transaction Number",
                                    style: textTheme.headline3!.copyWith(
                                      fontWeight: FontWeight.w500,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  SizedBox(height: kPadding,),
                                  inkWell(
                                    onTap: (){
                                      Clipboard.setData(ClipboardData(
                                          text: widget.transactionId ?? ""));
                                      showSuccessBar(context, "Copied");
                                    },

                                    child: Text(
                                      widget.transactionId ?? "",
                                      style: textTheme.subtitle1!.copyWith(
                                        fontWeight: FontWeight.w500,
                                        color:  kPrimaryTextColor,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
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
                      // Positioned(
                      //     left: 0,
                      //     top: 0,
                      //     bottom: 0,
                      //     child: Center(
                      //       child: Container(
                      //           height: kLargePadding,
                      //           width: kLargePadding,
                      //           decoration: BoxDecoration(
                      //             color: kBackgroundColor,
                      //             shape: BoxShape.circle,
                      //           )),
                      //     )),
                      // Positioned(
                      //     right: 0,
                      //     top: 0,
                      //     bottom: 0,
                      //     child: Center(
                      //       child: Container(
                      //           height: kLargePadding,
                      //           width: kLargePadding,
                      //           decoration: BoxDecoration(
                      //             color: kBackgroundColor,
                      //             shape: BoxShape.circle,
                      //           )),
                      //     )),
                      // Positioned(
                      //   bottom: 0,
                      //   left: 30,
                      //   right: 30,
                      //   child: Container(
                      //     width: size / 1.2,
                      //     //color: Colors.red,
                      //     child: Row(
                      //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //         children: List.generate(
                      //           5,
                      //           (index) => Container(
                      //               height: kLargePadding,
                      //               width: kLargePadding,
                      //               decoration: BoxDecoration(
                      //                 color: kBackgroundColor,
                      //                 shape: BoxShape.circle,
                      //               )),
                      //         )),
                      //   ),
                      // )
                    ],
                  ),
                ],
              ),
            ),
          ),

                  widget.transferStatus == "debit" ?
          widget.fromWhere == "history"
              ? Padding(
                  padding: const EdgeInsets.all(kMediumPadding),
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
                              kPriceFormatter(
                                  double.parse(widget.amount ?? "0")),
                              widget.transactionTime!,
                              widget.tag ?? "", widget.transactionId ?? "", widget.transactionFee ?? 0  ),
                          filename:
                              'receipt_${DateTime.now().millisecondsSinceEpoch}.pdf',
                        );
                      }),
                )
              : SizedBox():
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
                                      kPriceFormatter(
                                          double.parse(widget.amount ?? "0")),
                                      DateTime.now(),
                                      widget.tag ?? "No Tag", widget.transactionId ?? "", widget.transactionFee ?? 0),
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
                                    DateTime.now(),
                                    widget.tag ?? "No Tag", widget.transactionId ?? "", widget.transactionFee ?? 0),
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
