import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pouchers/app/helpers/size_config.dart';
import 'package:pouchers/modules/utilities/model/utilities_model.dart';
import 'package:pouchers/modules/utilities/screens/voucher/voucher_constants.dart';
import 'package:pouchers/modules/utilities/screens/voucher/voucher_widgets.dart';
import 'package:pouchers/utils/constant/theme_color_constants.dart';
import 'package:pouchers/utils/strings.dart';
import 'package:pouchers/utils/utils.dart';
import 'package:pouchers/utils/widgets.dart';
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
  String dateFormatter = 'MMM, dd, yyy';
  List<Voucher> vouchers = [];

  @override
  void initState() {
    // TODO: implement initState
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
                            color: index == 0
                                ? kContainerColor
                                : index == 1
                                    ? kPrimaryColor
                                    : index == 2
                                        ? kPrimaryTextColor
                                        : kPrimaryWhite,
                            bgColor: index == 0
                                ? kPrimaryTextColor
                                : index == 1
                                    ? kLightPurple
                                    : index == 2
                                        ? kBackgroundColor
                                        : kBlueColor,
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
                          ),
                        )
                      : Expanded(
                          child: ListView.builder(
                              itemCount: filterBy().length,
                              itemBuilder: (_, index) {
                                bool isSameDate = true;
                                final DateTime date =
                                    filterBy()[index].createdAt;
                                final item = filterBy()[index];
                                if (index == 0) {
                                  isSameDate = false;
                                } else {
                                  final DateTime prevDate =
                                      filterBy()[index - 1].createdAt;
                                  isSameDate = date.isSameDate(prevDate);
                                }
                                var _widget = Padding(
                                  padding:
                                      EdgeInsets.symmetric(vertical: kPadding),
                                  child: Column(
                                    children: [
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            item.code,
                                            style:
                                                textTheme.subtitle1!.copyWith(
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              NairaWidget(
                                                text: kPriceFormatter(
                                                    double.parse(item.amount)),
                                                textStyle1: TextStyle(
                                                    fontSize: 16,
                                                    color: item.redeemed
                                                        ? kSecondaryTextColor
                                                        : item.gifteeId != null
                                                            ? kColorRed
                                                            : kColorGreen),
                                                textStyle2: textTheme.headline3!
                                                    .copyWith(
                                                        color: item.redeemed
                                                            ? kSecondaryTextColor
                                                            : item.gifteeId !=
                                                                    null
                                                                ? kColorRed
                                                                : kColorGreen),
                                              ),
                                              SizedBox(
                                                height: kPadding,
                                              ),
                                              Container(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: kRegularPadding,
                                                    vertical: kPadding),
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                    kRegularPadding,
                                                  ),
                                                  color: item.redeemed
                                                      ? kBackgroundColor
                                                      : item.gifteeId != null
                                                          ? kBlueColor
                                                          : kLightPurple,
                                                ),
                                                child: Text(
                                                  item.redeemed
                                                      ? "Redeemed"
                                                      : item.gifteeId != null
                                                          ? "Gifted"
                                                          : "Active",
                                                  style: textTheme.headline6!
                                                      .copyWith(
                                                    color: item.redeemed
                                                        ? kPrimaryTextColor
                                                        : item.gifteeId != null
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
                              }),
                        )
                ],
              );
            } else {
              return SizedBox();
            }
          },
          loading: () => SpinKitDemo()),
    );
  }

  List<Voucher> filterBy() {
    List<Voucher> service = [];
    if (currentIndex == 0) {
      service = vouchers;
      return service;
    } else {
      print(currentIndex);
      if (currentIndex == 3) {
        service =
            vouchers.where((element) => element.gifteeId != null).toList();
      } else if (currentIndex == 2) {
        service =
            vouchers.where((element) => element.redeemed == true).toList();
      } else {
        service = vouchers
            .where((element) =>
                (element.gifteeId == null && element.redeemed == false))
            .toList();
      }
      // service = voucherHistoryDummy.where((element) {
      //   return element.image == historyTypes[currentIndex];
      // }).toList();
      // service = vouchers.where((element) {
      // if(element.redeemed) return element.redeemed == true;
      // if(element.gifteeId != null) return element.gifteeId
      //  return element.image == historyTypes[currentIndex];
      // }).toList();
      return service;
    }
  }
}
