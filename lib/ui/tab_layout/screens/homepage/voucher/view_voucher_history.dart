import 'package:flutter/material.dart';
import 'package:pouchers/app/helpers/size_config.dart';
import 'package:pouchers/ui/tab_layout/screens/homepage/voucher/voucher_constants.dart';
import 'package:pouchers/ui/tab_layout/screens/homepage/voucher/voucher_widgets.dart';
import 'package:pouchers/utils/constant/theme_color_constants.dart';
import 'package:pouchers/utils/strings.dart';
import 'package:pouchers/utils/utils.dart';
import 'package:pouchers/utils/widgets.dart';
import 'package:collection/collection.dart';

class VoucherHistory extends StatefulWidget {
  static const String routeName = "voucherHistory";

  const VoucherHistory({Key? key}) : super(key: key);

  @override
  State<VoucherHistory> createState() => _VoucherHistoryState();
}

class _VoucherHistoryState extends State<VoucherHistory> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return InitialPage(
      title: voucherHistory,
      child: Column(
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
          Expanded(
            child: ListView.builder(
                itemCount: filterBy().length,
                itemBuilder: (_, index) {
                  bool isSameDate = true;
                  final String dateString = filterBy()[index].expiry;
                  final DateTime date = DateTime.parse(dateString);
                  final item = filterBy()[index];
                  if (index == 0) {
                    isSameDate = false;
                  } else {
                    final String prevDateString =
                        filterBy()[index - 1].expiry;
                    final DateTime prevDate = DateTime.parse(prevDateString);
                    isSameDate = date.isSameDate(prevDate);
                  }
                  var _widget = Padding(
                    padding: EdgeInsets.symmetric(vertical: kPadding),
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              item.code,
                              style: textTheme.subtitle1!.copyWith(
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: [
                                NairaWidget(
                                  text: item.value,
                                  textStyle1: TextStyle(
                                      fontSize: 16,
                                      color: item.image == "Redeemed"
                                          ? kSecondaryTextColor
                                          : item.image == "Gifted"
                                          ? kColorRed
                                          : kColorGreen),
                                  textStyle2: textTheme.headline3!
                                      .copyWith(
                                      color: item.image ==
                                          "Redeemed"
                                          ? kSecondaryTextColor
                                          : item.image == "Gifted"
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
                                    borderRadius: BorderRadius.circular(
                                      kRegularPadding,
                                    ),
                                    color: item.image == "Redeemed"
                                        ? kBackgroundColor
                                        : item.image == "Gifted"
                                        ? kBlueColor
                                        : kLightPurple,
                                  ),
                                  child: Text(
                                    item.image,
                                    style:
                                    textTheme.headline6!.copyWith(
                                      color: item.image == "Redeemed"
                                          ? kPrimaryTextColor
                                          : item.image == "Gifted"
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            date.formatDate(),
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
      ),
    );
  }

  List<VoucherItems> filterBy() {
    List<VoucherItems> service = [];
    if (currentIndex == 0) {
      service = voucherHistoryDummy;
      return service;
    } else {
      service = voucherHistoryDummy.where((element) {
        return element.image == historyTypes[currentIndex];
      }).toList();
      return service;
    }
  }
}
