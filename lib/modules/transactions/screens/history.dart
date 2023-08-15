import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:Pouchers/app/helpers/size_config.dart';
import 'package:Pouchers/app/navigators/navigators.dart';
import 'package:Pouchers/modules/make_payment/screens/transaction_receipt.dart';
import 'package:Pouchers/modules/transactions/components/transaction_components.dart';
import 'package:Pouchers/modules/transactions/model/transaction_model.dart';
import 'package:Pouchers/modules/transactions/providers/transaction_provider.dart';
import 'package:Pouchers/modules/transactions/screens/history_detail.dart';
import 'package:Pouchers/modules/transactions/transactions_widgets.dart';
import 'package:Pouchers/modules/utilities/screens/voucher/voucher_widgets.dart';
import 'package:Pouchers/utils/assets_path.dart';
import 'package:Pouchers/utils/components.dart';
import 'package:Pouchers/utils/constant/theme_color_constants.dart';
import 'package:collection/collection.dart';
import 'package:Pouchers/utils/input_formatters.dart';
import 'package:Pouchers/utils/strings.dart';
import 'package:Pouchers/utils/utils.dart';
import 'package:Pouchers/utils/widgets.dart';

class History extends ConsumerStatefulWidget {
  static const String routeName = "history";

  const History({Key? key}) : super(key: key);

  @override
  ConsumerState<History> createState() => _HistoryState();
}

class _HistoryState extends ConsumerState<History> {
  int currentIndex = 0;
  String dateFormatter = 'MMM dd, yyy';
  List<GetTransactionsData> transactionData = [];
  GetTransactions? currentPage;
  bool hasMoreItems = true, loadingTransaction = false;
  int? nextPage;
  OrderHistoryStatus filterStatus = OrderHistoryStatus.all;


  void onFilterStatus(OrderHistoryStatus? status) {
    nextPage = null;
    refreshTransaction(showLoading: true,pageNum: 1);
  }


  void setTransactionList(GetTransactions? raw) {
    setState(() {
      loadingTransaction = false;
    });
    if (raw != null) {
      if (raw.page == "1") {
        transactionData.clear();
      }
      setState(() {
        transactionData.addAll(raw.history!);
      });
      currentPage = raw;
      if (transactionData.length >= int.parse(currentPage!.total!)) {
        setState(() {
          hasMoreItems = false;
        });
      }
    }
  }

  void refreshTransaction({bool showLoading = false, int pageNum = 1,OrderHistoryStatus? status}) {
    setState(() {
      loadingTransaction = true;
    });
    ref
        .read(getTransactionHistoryProvider.notifier)
        .getTransactionHistory(status:filterStatus,page: pageNum,then: (val){
      setTransactionList(val.data);
      if (val != null) {
        if (transactionData.length >= int.parse(val.data!.total!)) {
          setState(() {
            hasMoreItems = false;
          });
          return;
        } else {
          int currenntPage = int.parse(val.data!.page!);
          //refreshTransaction(pageNum: ++currenntPage);
        }
      }
    });
  }

  bool onScroll(ScrollUpdateNotification info) {
    if (info.metrics.pixels >= info.metrics.maxScrollExtent - 10) {
      if (hasMoreItems && !loadingTransaction) {
        int p = int.parse(currentPage!.page!);
        refreshTransaction(pageNum: ++p,showLoading: false);
      }
      return true;
    }
    return false;
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
     refreshTransaction(showLoading: true,pageNum: 1);
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
                            checkingIndex();
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
               // transactionData = data.data!.history!.toList();
                return transactionData.isEmpty
                    ? Container(
                        height: 300,
                        child: NoVoucher(
                          textTheme: textTheme,
                          text: noTrans,
                        ),
                      )
                    : Expanded(
                        child: NotificationListener<ScrollUpdateNotification>(
                          onNotification: onScroll,
                          child: RefreshIndicator(
                            onRefresh:  refresh,
                            color: kPrimaryColor,
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
                                      // if (transactionData[index]
                                      //         .transactionType ==
                                      //     "debit") {
                                        pushTo(
                                            context,
                                            TransactionReceipt(
                                                typeOfTransfer: "p2p",
                                                accNo: "",
                                                fromWhere: "history",
                                                status: transactionData[index]
                                                    .status!
                                                    .toCapitalized(),
                                                tag: transactionData[index]
                                                    .extraDetails!
                                                    .receiverTag,
                                                transactionId:
                                                    transactionData[index]
                                                        .transactionId,
                                                transactionTime:
                                                    transactionData[index]
                                                        .createdAt!,
                                                senderName: transactionData[index]
                                                    .extraDetails!
                                                    .senderName,
                                                transferStatus: transactionData[index].transactionType,
                                                amount:
                                                    transactionData[index].amount,
                                                transferName: "",
                                                beneficiary:
                                                    transactionData[index]
                                                            .beneficiaryName ??
                                                        "No name"),
                                            settings: RouteSettings(
                                                name: TransactionReceipt
                                                    .routeName));
                                     // }
                                    } else {
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
                                              // item.transactionCategory!
                                              //         .contains("transfer")
                                              //     ? item.beneficiaryName ??
                                                  changeCatNme(item
                                                          .transactionCategory ?? "", item.currency ?? "", item.extraDetails!.subCategory ?? "", item.beneficiaryName ?? "" ),
                                                  // : changeCatNme(
                                                  //  item.transactionCategory!, item.currency!, item.extraDetails!.subCategory ?? "" ),
                                              style:
                                                  textTheme.bodyText1!.copyWith(
                                                color: kBlueColorDark,
                                              ),
                                            ),
                                          ),
                                          NairaWidget(
                                            text: kPriceFormatter(
                                                double.parse(item.amount!)),
                                            textStyle1: TextStyle(
                                                fontSize: 16,
                                                color: item.transactionType ==
                                                        "debit"
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                          ),
                        ),
                      );
              } else {
                return SizedBox();
              }
            },
            loading: () => Expanded(child: Align(alignment: Alignment.bottomCenter, child: SpinKitDemo())))
      ],
    );
  }



  checkingIndex(){
    switch (currentIndex) {
      case 0:
        refreshTransaction(showLoading: true,pageNum: 1);
        break;
      case 1:
        filterStatus = OrderHistoryStatus.transfer;
        onFilterStatus(filterStatus);
        break;
      case 2:
        filterStatus = OrderHistoryStatus.airtime;
        onFilterStatus(filterStatus);
        break;
      case 3:
        filterStatus = OrderHistoryStatus.data;
        onFilterStatus(filterStatus);
        break;
      case 4:
        filterStatus = OrderHistoryStatus.cable;
        onFilterStatus(filterStatus);
        break;
      case 5:
        filterStatus = OrderHistoryStatus.electricity;
        onFilterStatus(filterStatus);
        break;
      case 6:
        filterStatus = OrderHistoryStatus.internet;
        onFilterStatus(filterStatus);
        break;
      case 7:
        filterStatus = OrderHistoryStatus.voucher;
        onFilterStatus(filterStatus);
        break;
      case 8:
        filterStatus = OrderHistoryStatus.betting;
        onFilterStatus(filterStatus);
        break;
    }
  }

  Future refresh() async {
    switch (currentIndex) {
      case 0:
        refreshTransaction(showLoading: true,pageNum: 1);
        break;
      case 1:
        refreshTransaction(showLoading: true,pageNum: 1,status: OrderHistoryStatus.transfer);
        break;
      case 2:
        refreshTransaction(showLoading: true,pageNum: 1,status: OrderHistoryStatus.airtime);
        break;
      case 3:
        refreshTransaction(showLoading: true,pageNum: 1,status: OrderHistoryStatus.data);
        break;
      case 4:
        refreshTransaction(showLoading: true,pageNum: 1,status: OrderHistoryStatus.cable);
        break;
      case 5:
        refreshTransaction(showLoading: true,pageNum: 1,status: OrderHistoryStatus.electricity);
        break;
      case 6:
        refreshTransaction(showLoading: true,pageNum: 1,status: OrderHistoryStatus.internet);
        break;
      case 7:
        refreshTransaction(showLoading: true,pageNum: 1,status:OrderHistoryStatus.voucher);
        break;
      case 8:
        refreshTransaction(showLoading: true,pageNum: 1,status: OrderHistoryStatus.betting);
        break;
    }

  }
}



enum OrderHistoryStatus {
  all,
  data,
  cable,
  electricity,
  internet,
  voucher,
  betting,
  airtime,
  transfer

}

String orderStatusToString(OrderHistoryStatus? stat, {bool isParam = false}) {
  switch (stat) {
    case OrderHistoryStatus.data:
      return "data";
    case OrderHistoryStatus.internet:
      return "internet";
    case OrderHistoryStatus.voucher:
      return "voucher";
    case OrderHistoryStatus.betting:
      return "betting";
    case OrderHistoryStatus.electricity:
      return "electricity";
    case OrderHistoryStatus.cable:
      return "cable";
    case OrderHistoryStatus.airtime:
      return "airtime";
    case OrderHistoryStatus.transfer:
      return "transfer";
    default:
      return "" ;
  }
}
