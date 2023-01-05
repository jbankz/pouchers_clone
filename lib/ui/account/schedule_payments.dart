import 'package:flutter/material.dart';
import 'package:pouchers/app/navigators/navigators.dart';
import 'package:pouchers/ui/schedule_purchase/schedule_widget_constants.dart';
import 'package:pouchers/ui/schedule_purchase/screens/schedule_airtime_topup.dart';
import 'package:pouchers/ui/schedule_purchase/screens/schedule_cable_topup.dart';
import 'package:pouchers/ui/schedule_purchase/screens/schedule_data_topup.dart';
import 'package:pouchers/ui/schedule_purchase/screens/schedule_electricity_topup.dart';
import 'package:pouchers/ui/schedule_purchase/screens/schedule_transfer.dart';
import 'package:pouchers/ui/tab_layout/screens/homepage/voucher/voucher_widgets.dart';
import 'package:pouchers/utils/components.dart';
import 'package:pouchers/utils/constant/theme_color_constants.dart';
import 'package:pouchers/utils/strings.dart';
import 'package:pouchers/utils/widgets.dart';
import 'package:collection/collection.dart';

class SchedulePayments extends StatefulWidget {
  static const String routeName = "schedulePayments";

  const SchedulePayments({Key? key}) : super(key: key);

  @override
  State<SchedulePayments> createState() => _SchedulePaymentsState();
}

class _SchedulePaymentsState extends State<SchedulePayments> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return InitialPage(
      color: kPurpleColor800,
      title: scheduledPayment,
      child: Column(
        children: [
          Container(
            height: kMacroPadding,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: schedulePaymentTypes
                  .mapIndexed(
                    (index, element) => inkWell(
                      onTap: () {
                        setState(() {
                          currentIndex = index;
                        });
                      },
                      child: Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(right: kMediumPadding),
                        padding: EdgeInsets.symmetric(
                            vertical: kPadding, horizontal: kRegularPadding),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(kRegularPadding),
                          color: currentIndex == index
                              ? kPrimaryTextColor
                              : kPrimaryWhite,
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
            height: kMediumPadding,
          ),
          Expanded(
            child: ListView.builder(
                itemCount: filterBy().length,
                itemBuilder: (_, index) {
                  final item = filterBy()[index];
                  var _widget = inkWell(
                    onTap: () {
                      pushTo(
                          context,
                          filterBy()[index].image == transfer
                              ? ScheduleTransfer(
                                  text: "viewSchedule",
                                )
                              : filterBy()[index].image == airtime
                                  ? ScheduleAirtimeTopUp(
                                      text: "viewSchedule",
                                    )
                                  : filterBy()[index].image == cableTv
                                      ? ScheduleCableTopUp(
                                          text: "viewSchedule",
                                        )
                                      : filterBy()[index].image == electricity
                                          ? ScheduleElectricity(
                                              text: "viewSchedule",
                                            )
                                          : ScheduleDataTopUp(
                                              text: "viewSchedule",
                                            ));
                      // filterBy()[index].image
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: kPrimaryWhite,
                          borderRadius: BorderRadius.circular(kSmallPadding),
                          border: Border.all(width: 1, color: kLightPurple)),
                      margin: EdgeInsets.symmetric(vertical: kSmallPadding),
                      padding: EdgeInsets.symmetric(
                          vertical: kRegularPadding,
                          horizontal: kMediumPadding),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.grey,
                            ),
                          ),
                          SizedBox(
                            width: kRegularPadding,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item.code,
                                style: textTheme.headline2!.copyWith(
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(
                                height: kPadding,
                              ),
                              Text(item.value, style: textTheme.headline6),
                              SizedBox(
                                height: kRegularPadding,
                              ),
                              Text("Top up ₦5,000 every 31st",
                                  style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      color: kSecondaryTextColor,
                                      fontSize: 14,
                                      fontFamily: "")),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                  return _widget;
                }),
          )
        ],
      ),
    );
  }

  List<VoucherItems> filterBy() {
    List<VoucherItems> schedule = [];
    if (currentIndex == 0) {
      schedule = schedulePaymentDummy;
      return schedule;
    } else {
      schedule = schedulePaymentDummy.where((element) {
        return element.image == schedulePaymentTypes[currentIndex];
      }).toList();
      return schedule;
    }
  }
}
