import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pouchers/app/helpers/size_config.dart';
import 'package:pouchers/app/navigators/navigators.dart';
import 'package:pouchers/modules/make_payment/screens/transaction_receipt.dart';
import 'package:pouchers/modules/transactions/model/transaction_model.dart';
import 'package:pouchers/modules/transactions/providers/transaction_provider.dart';
import 'package:pouchers/modules/transactions/screens/history_detail.dart';
import 'package:pouchers/modules/transactions/transactions_widgets.dart';
import 'package:pouchers/modules/utilities/screens/voucher/voucher_widgets.dart';
import 'package:pouchers/utils/assets_path.dart';
import 'package:pouchers/utils/components.dart';
import 'package:pouchers/utils/constant/theme_color_constants.dart';
import 'package:collection/collection.dart';
import 'package:pouchers/utils/strings.dart';
import 'package:pouchers/utils/utils.dart';
import 'package:pouchers/utils/widgets.dart';

class History extends ConsumerStatefulWidget {
  static const String routeName = "history";

  const History({Key? key}) : super(key: key);

  @override
  ConsumerState<History> createState() => _HistoryState();
}

class _HistoryState extends ConsumerState<History> {
  int currentIndex = 0;
  String dateFormatter = 'MMM, dd, yyy';
  List<GetTransactionsData> transactionData = [];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref
          .read(getTransactionHistoryProvider.notifier)
          .getTransactionHistory(status: "");
    });
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Column(
      children: [
        Container(
          height: kMacroPadding,
          margin: EdgeInsets.only(top: kSmallPadding),
          child: transactionHistoryTypes.isEmpty
              ? Column(
                  children: [
                    SizedBox(
                      height: kSupremePadding,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: kBackgroundColor,
                      ),
                      padding: EdgeInsets.all(kMacroPadding),
                      child: SvgPicture.asset(
                        AssetPaths.voucherIcon,
                        color: kIconGrey,
                        height: 35,
                        width: 35,
                      ),
                    ),
                    SizedBox(
                      height: kRegularPadding,
                    ),
                    Text(
                      noTrans,
                      style: textTheme.headline3!.copyWith(
                        color: kIconGrey,
                      ),
                    )
                  ],
                )
              : ListView(
                  scrollDirection: Axis.horizontal,
                  children: transactionHistoryTypes
                      .mapIndexed(
                        (index, element) => inkWell(
                          onTap: () {
                            setState(() {
                              currentIndex = index;
                            });
                            switch (currentIndex) {
                              case 0:
                                ref
                                    .read(
                                        getTransactionHistoryProvider.notifier)
                                    .getTransactionHistory(status: "");
                                break;
                              case 1:
                                ref
                                    .read(
                                        getTransactionHistoryProvider.notifier)
                                    .getTransactionHistory(status: "transfer");
                                break;
                              case 2:
                                ref
                                    .read(
                                        getTransactionHistoryProvider.notifier)
                                    .getTransactionHistory(status: "airtime");
                                break;
                              case 3:
                                ref
                                    .read(
                                        getTransactionHistoryProvider.notifier)
                                    .getTransactionHistory(status: "data");
                                break;
                              case 4:
                                ref
                                    .read(
                                        getTransactionHistoryProvider.notifier)
                                    .getTransactionHistory(status: "cable");
                                break;
                              case 5:
                                ref
                                    .read(
                                        getTransactionHistoryProvider.notifier)
                                    .getTransactionHistory(
                                        status: "electricity");
                                break;
                              case 6:
                                ref
                                    .read(
                                        getTransactionHistoryProvider.notifier)
                                    .getTransactionHistory(status: "internet");
                                break;
                              case 7:
                                ref
                                    .read(
                                        getTransactionHistoryProvider.notifier)
                                    .getTransactionHistory(status: "voucher");
                                break;
                            }
                          },
                          child: Container(
                            alignment: Alignment.center,
                            margin: EdgeInsets.only(right: kSmallPadding),
                            padding: EdgeInsets.symmetric(
                                vertical: kPadding,
                                horizontal: kRegularPadding),
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(kRegularPadding),
                              color: currentIndex == index
                                  ? kPrimaryTextColor
                                  : kBackgroundColor,
                            ),
                            child: Text(
                              element,
                              style: textTheme.headline6!.copyWith(
                                  color: currentIndex == index
                                      ? kBackgroundColor
                                      : kIconGrey),
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
        ),
        SizedBox(
          height: kMicroPadding,
        ),
        ref.watch(getTransactionHistoryProvider).when(
            done: (data) {
              if (data != null) {
                transactionData = data.data!.toList();
                return transactionData.isEmpty
                    ? Container(
                        height: 300,
                        child: NoVoucher(
                          textTheme: textTheme,
                          text: noTrans,
                        ),
                      )
                    : Expanded(
                        child: ListView.builder(
                          itemCount: transactionData.length,
                          itemBuilder: (_, index) {
                            bool isSameDate = true;
                            final DateTime date =
                                transactionData[index].createdAt!;
                            final item = transactionData[index];
                            if (index == 0) {
                              isSameDate = false;
                            } else {
                              final DateTime prevDate =
                                  transactionData[index - 1].createdAt!;
                              isSameDate = date.isSameDate(prevDate);
                            }
                            var _widget = inkWell(
                              onTap: () {
                                if (transactionData[index]
                                    .transactionCategory!
                                    .contains("p2p")) {
                                  if (transactionData[index].transactionType ==
                                      "debit") {
                                    pushTo(
                                        context,
                                        TransactionReceipt(
                                            typeOfTransfer: "p2p",
                                            accNo: "",
                                            fromWhere: "history",
                                            tag: transactionData[index]
                                                .extraDetails!
                                                .senderTag,
                                            transactionId: transactionData[index].transactionId,
                                            transactionTime:
                                            transactionData[index]
                                                .createdAt!,
                                            senderName: transactionData[index]
                                                .extraDetails!.senderName,
                                            amount:
                                            transactionData[index].amount,
                                            transferName: "",
                                            beneficiary: transactionData[index]
                                                .beneficiaryName ??
                                                "No name"),
                                        settings: RouteSettings(
                                            name: TransactionReceipt.routeName));
                                  }
                                }else{
                                  pushTo(
                                      context,
                                      HistoryDetail(
                                        item: transactionData[index],
                                      ),
                                      settings: RouteSettings(
                                          name: HistoryDetail.routeName));
                                }
                              },
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          item.transactionCategory!
                                                  .contains("transfer")
                                              ? item.beneficiaryName ??
                                                  item.transactionCategory
                                              : item.transactionCategory!,
                                          style: textTheme.bodyText1!.copyWith(
                                            color: kBlueColorDark,
                                          ),
                                        ),
                                      ),
                                      NairaWidget(
                                        text: kPriceFormatter(
                                            double.parse(item.amount!)),
                                        textStyle1: TextStyle(
                                            fontSize: 16,
                                            color:
                                                item.transactionType == "debit"
                                                    ? kColorRedDeep
                                                    : kColorGreen),
                                        textStyle2: textTheme.headline3!
                                            .copyWith(
                                                color: item.transactionType ==
                                                        "debit"
                                                    ? kColorRedDeep
                                                    : kColorGreen),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: kRegularPadding,
                                  ),
                                  Divider(
                                    thickness: 1,
                                    color: kContainerColor,
                                  ),
                                  SizedBox(
                                    height: kRegularPadding,
                                  ),
                                ],
                              ),
                            );
                            if (index == 0 || !(isSameDate)) {
                              return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      date.formatDate(dateFormatter),
                                      style: textTheme.headline6,
                                    ),
                                    SizedBox(
                                      height: kPadding,
                                    ),
                                    Divider(
                                      thickness: 1,
                                      color: kContainerColor,
                                    ),
                                    SizedBox(
                                      height: kPadding,
                                    ),
                                    _widget,
                                  ]);
                            } else {
                              return _widget;
                            }
                          },
                        ),
                      );
              } else {
                return SizedBox();
              }
            },
            loading: () => SpinKitDemo())
      ],
    );
  }
}
