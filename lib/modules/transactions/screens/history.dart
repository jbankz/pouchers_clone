import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pouchers/app/helpers/size_config.dart';
import 'package:pouchers/app/navigators/navigators.dart';
import 'package:pouchers/modules/tab_layout/screens/homepage/voucher/voucher_widgets.dart';
import 'package:pouchers/modules/transactions/screens/history_detail.dart';
import 'package:pouchers/modules/transactions/transactions_widgets.dart';
import 'package:pouchers/utils/assets_path.dart';
import 'package:pouchers/utils/components.dart';
import 'package:pouchers/utils/constant/theme_color_constants.dart';
import 'package:collection/collection.dart';
import 'package:pouchers/utils/strings.dart';
import 'package:pouchers/utils/utils.dart';

class History extends StatefulWidget {
  static const String routeName = "history";

  const History({Key? key}) : super(key: key);

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  int currentIndex = 0;
   String dateFormatter = 'MMM, dd, yyy';


  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Column(
      children: [
        Container(
          height: kMacroPadding,
          margin: EdgeInsets.only(top: kSmallPadding),
          child: transactionHistoryTypes.isEmpty ? Column(
            children: [
              SizedBox(height: kSupremePadding,),
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
          ) :  ListView(
            scrollDirection: Axis.horizontal,
            children: transactionHistoryTypes
                .mapIndexed(
                  (index, element) => inkWell(
                    onTap: () {
                      setState(() {
                        currentIndex = index;
                      });
                    },
                    child: Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(right: kSmallPadding),
                      padding: EdgeInsets.symmetric(
                          vertical: kPadding, horizontal: kRegularPadding),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(kRegularPadding),
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
                  final String prevDateString = filterBy()[index - 1].expiry;
                  final DateTime prevDate = DateTime.parse(prevDateString);
                  isSameDate = date.isSameDate(prevDate);
                }
                var _widget = inkWell(
                  onTap: () {
                    pushTo(
                        context,
                        HistoryDetail(
                          item: filterBy()[index],
                        ),
                        settings: RouteSettings(name: HistoryDetail.routeName));
                  },
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            height: 45,
                            width: 45,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: kIconGrey,
                            ),
                          ),
                          SizedBox(
                            width: kRegularPadding,
                          ),
                          Expanded(
                            child: Text(
                              item.code,
                              style: textTheme.bodyText1!.copyWith(
                                color: kBlueColorDark,
                              ),
                            ),
                          ),
                          NairaWidget(
                            sign: '+',
                            addSign: true,
                            text: item.value,
                            textStyle1: TextStyle(
                                fontSize: 16,
                                color: item.image == "Redeemed"
                                    ? kSecondaryTextColor
                                    : item.image == "Gifted"
                                        ? kColorRed
                                        : kColorGreen),
                            textStyle2: textTheme.headline3!.copyWith(
                                color: item.image == "Redeemed"
                                    ? kSecondaryTextColor
                                    : item.image == "Gifted"
                                        ? kColorRed
                                        : kColorGreen),
                          ),
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
  }

  List<VoucherItems> filterBy() {
    List<VoucherItems> service = [];
    if (currentIndex == 0) {
      service = transactionHistoryDummy;
      return service;
    } else {
      service = transactionHistoryDummy.where((element) {
        return element.image == transactionHistoryTypes[currentIndex];
      }).toList();
      return service;
    }
  }
}
