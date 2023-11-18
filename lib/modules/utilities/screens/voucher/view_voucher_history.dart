import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:Pouchers/app/common/listener.dart';
import 'package:Pouchers/app/helpers/size_config.dart';
import 'package:Pouchers/modules/utilities/model/utilities_model.dart';
import 'package:Pouchers/modules/utilities/screens/voucher/voucher_constants.dart';
import 'package:Pouchers/modules/utilities/screens/voucher/voucher_widgets.dart';
import 'package:Pouchers/utils/constant/theme_color_constants.dart';
import 'package:Pouchers/utils/strings.dart';
import 'package:Pouchers/utils/utils.dart';
import 'package:Pouchers/utils/widgets.dart';
import 'package:collection/collection.dart';

import '../../providers/utilities_provider.dart';

class VoucherHistory extends ConsumerStatefulWidget {
  static const String routeName = "voucherHistory";

  const VoucherHistory({Key? key}) : super(key: key);

  @override
  ConsumerState<VoucherHistory> createState() => _VoucherHistoryState();
}

class _VoucherHistoryState extends ConsumerState<VoucherHistory> {
  int currentIndex = 0;
  String dateFormatter = 'MMM dd, yyy';
  List<Voucher> vouchers = [];

  GetVoucherResponseData? currentPage;
  bool hasMoreItems = true, loadingTransaction = false;
  int? nextPage;
  //OrderHistoryStatus filterStatus = OrderHistoryStatus.all;

  // void onFilterStatus(OrderHistoryStatus? status) {
  //   nextPage = null;
  //   refreshTransaction(showLoading: true,pageNum: 1);
  // }

  void setVoucherList(GetVoucherResponseData? raw) {
    setState(() {
      loadingTransaction = false;
    });
    if (raw != null) {
      if (raw.page == "1") {
        vouchers.clear();
      }
      setState(() {
        vouchers.addAll(raw.vouchers);
      });
      currentPage = raw;
      if (vouchers.length >= int.parse(currentPage!.total!)) {
        setState(() {
          hasMoreItems = false;
        });
      }
    }
  }

  void refreshVouchers({bool showLoading = false, int pageNum = 1}) {
    setState(() {
      loadingTransaction = true;
    });
    ref.read(fetchVoucherProvider.notifier).fetchVoucher(
        showLoading: showLoading,
        status: "",
        page: pageNum,
        then: (val) {
          setVoucherList(val);
          if (val != null) {
            if (vouchers.length >= int.parse(val.total!)) {
              setState(() {
                hasMoreItems = false;
              });
              return;
            } else {
              int currenntPage = int.parse(val.page);
              //refreshTransaction(pageNum: ++currenntPage);
            }
          }
        });
  }

  bool onScroll(ScrollUpdateNotification info) {
    if (info.metrics.pixels >= info.metrics.maxScrollExtent - 10) {
      if (hasMoreItems && !loadingTransaction) {
        int p = int.parse(currentPage!.page);
        refreshVouchers(pageNum: ++p, showLoading: false);
      }
      return true;
    }
    return false;
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref.read(fetchVoucherProvider.notifier).fetchVoucher(status: "");
    });
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return InitialPage(
        title: voucherHistory,
        child: ListenerPage(
          child: ref.watch(fetchVoucherProvider).when(
              done: (data) {
                if (data != null) {
                  vouchers = data.data!.vouchers;
                  return Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: historyTypes
                            .mapIndexed(
                              (index, element) => ViewVoucherHistoryHeading(
                                text: element,
                                color: currentIndex == index
                                    ? kBackgroundColor
                                    : kIconGrey,
                                bgColor: currentIndex == index
                                    ? kPrimaryTextColor
                                    : kBackgroundColor,
                                onTap: () {
                                  setState(() {
                                    currentIndex = index;
                                  });
                                },
                              ),
                            )
                            .toList(),
                      ),
                      SizedBox(
                        height: kMicroPadding,
                      ),
                      filterBy().isEmpty
                          ? Container(
                              height: 300,
                              child: NoVoucher(
                                textTheme: textTheme,
                                text: noVouchers,
                              ),
                            )
                          : Expanded(
                              child: NotificationListener<
                                  ScrollUpdateNotification>(
                                onNotification: onScroll,
                                child: RefreshIndicator(
                                  onRefresh: () async {
                                    refreshVouchers(
                                        showLoading: true, pageNum: 1);
                                  },
                                  child: ListView.builder(
                                      itemCount: filterBy().length + 1,
                                      itemBuilder: (_, index) {
                                        if (index == filterBy().length) {
                                          if (loadingTransaction)
                                            return SpinKitDemo();
                                          else
                                            return SizedBox();
                                        }
                                        bool isSameDate = true;
                                        final DateTime date =
                                            filterBy()[index].createdAt;
                                        final item = filterBy()[index];
                                        if (index == 0) {
                                          isSameDate = false;
                                        } else {
                                          final DateTime prevDate =
                                              filterBy()[index - 1].createdAt;
                                          isSameDate =
                                              date.isSameDate(prevDate);
                                        }
                                        var _widget = Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: kPadding),
                                          child: Column(
                                            children: [
                                              Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    item.code,
                                                    style: textTheme.subtitle1!
                                                        .copyWith(
                                                      fontWeight:
                                                          FontWeight.w700,
                                                    ),
                                                  ),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.end,
                                                    children: [
                                                      NairaWidget(
                                                        text: kPriceFormatter(
                                                            double.parse(
                                                                item.amount)),
                                                        textStyle1: TextStyle(
                                                            fontSize: 16,
                                                            color: item.redeemed
                                                                ? kColorGreen
                                                                : item.gifteeId !=
                                                                        null
                                                                    ? kColorRedDeep
                                                                    : kColorGreen),
                                                        textStyle2: textTheme
                                                            .headline3!
                                                            .copyWith(
                                                                color: item
                                                                        .redeemed
                                                                    ? kColorGreen
                                                                    : item.gifteeId !=
                                                                            null
                                                                        ? kColorRedDeep
                                                                        : kColorGreen),
                                                      ),
                                                      SizedBox(
                                                        height: kPadding,
                                                      ),
                                                      Container(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal:
                                                                    kRegularPadding,
                                                                vertical:
                                                                    kPadding),
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                            kRegularPadding,
                                                          ),
                                                          color: item.redeemed
                                                              ? kBackgroundColor
                                                              : item.gifteeId !=
                                                                      null
                                                                  ? kBlueColor
                                                                  : kLightPurple,
                                                        ),
                                                        child: Text(
                                                          item.redeemed
                                                              ? "Redeemed"
                                                              : item.gifteeId !=
                                                                      null
                                                                  ? "Gifted"
                                                                  : "Active",
                                                          style: textTheme
                                                              .headline6!
                                                              .copyWith(
                                                            color: item.redeemed
                                                                ? kPrimaryTextColor
                                                                : item.gifteeId !=
                                                                        null
                                                                    ? kPrimaryWhite
                                                                    : kPrimaryColor,
                                                          ),
                                                        ),
                                                      )
                                                    ],
                                                  )
                                                ],
                                              ),
                                              SizedBox(
                                                height: kSmallPadding,
                                              ),
                                              Divider(
                                                thickness: 1,
                                                color: kContainerColor,
                                              )
                                            ],
                                          ),
                                        );
                                        if (index == 0 || !(isSameDate)) {
                                          return Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  date.formatDate(
                                                      dateFormatter),
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
                                      }),
                                ),
                              ),
                            )
                    ],
                  );
                } else {
                  return SizedBox();
                }
              },
              loading: () => SpinKitDemo()),
        ));
  }

  List<Voucher> filterBy() {
    List<Voucher> service = [];
    if (currentIndex == 0) {
      service = vouchers;
      return service;
    } else {
      print(currentIndex);
      if (currentIndex == 3) {
        service = vouchers
            .where((element) =>
                element.gifteeId != null && element.redeemed != true)
            .toList();
      } else if (currentIndex == 2) {
        service =
            vouchers.where((element) => element.redeemed == true).toList();
      } else {
        service = vouchers
            .where((element) =>
                (element.gifteeId == null && element.redeemed == false))
            .toList();
      }
      return service;
    }
  }
}
