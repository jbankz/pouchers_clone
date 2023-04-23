import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:Pouchers/app/common/listener.dart';
import 'package:Pouchers/app/navigators/navigators.dart';
import 'package:Pouchers/modules/schedule_purchase/provider/schedule_provider.dart';
import 'package:Pouchers/modules/schedule_purchase/schedule_widget_constants.dart';
import 'package:Pouchers/modules/schedule_purchase/screens/schedule_airtime_topup.dart';
import 'package:Pouchers/modules/schedule_purchase/screens/schedule_cable_topup.dart';
import 'package:Pouchers/modules/schedule_purchase/screens/schedule_data_topup.dart';
import 'package:Pouchers/modules/schedule_purchase/screens/schedule_electricity_topup.dart';
import 'package:Pouchers/modules/schedule_purchase/screens/schedule_transfer.dart';
import 'package:Pouchers/modules/utilities/model/utilities_model.dart';
import 'package:Pouchers/modules/utilities/providers/utilities_provider.dart';
import 'package:Pouchers/modules/utilities/screens/voucher/voucher_widgets.dart';
import 'package:Pouchers/utils/components.dart';
import 'package:Pouchers/utils/constant/theme_color_constants.dart';
import 'package:Pouchers/utils/input_formatters.dart';
import 'package:Pouchers/utils/strings.dart';
import 'package:Pouchers/utils/utils.dart';
import 'package:Pouchers/utils/widgets.dart';
import 'package:collection/collection.dart';

class SchedulePayments extends ConsumerStatefulWidget {
  static const String routeName = "schedulePayments";

  const SchedulePayments({Key? key}) : super(key: key);

  @override
  ConsumerState<SchedulePayments> createState() => _SchedulePaymentsState();
}

class _SchedulePaymentsState extends ConsumerState<SchedulePayments> {
  int currentIndex = 0;
  List<GetAllScheduleData> allSchedule = [];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref.read(getScheduleProvider.notifier).getSchedule(category: "");
    });
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return InitialPage(
        color: kPurpleColor800,
        title: scheduledPayment,
        child: ListenerPage(
       child: ref.watch(getScheduleProvider).when(
            loading: () => SpinKitDemo(),
            done: (data) {
              if (data != null) {
                allSchedule = data.data!;
                return Column(
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
                                  if (currentIndex == 0) {
                                    ref
                                        .read(getScheduleProvider.notifier)
                                        .getSchedule(category: "");
                                  } else {
                                    ref
                                        .read(getScheduleProvider.notifier)
                                        .getSchedule(
                                            category: element.toLowerCase());
                                  }
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  margin:
                                      EdgeInsets.only(right: kMediumPadding),
                                  padding: EdgeInsets.symmetric(
                                      vertical: kPadding,
                                      horizontal: kRegularPadding),
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.circular(kRegularPadding),
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
                      child: allSchedule.isEmpty
                          ? Center(
                              child: Text(
                                "No Schedule Payments here yet",
                                style: TextStyle(color: Colors.red),
                              ),
                            )
                          : ListView.builder(
                              itemCount: allSchedule.length,
                              itemBuilder: (_, index) {
                                final item = allSchedule[index];
                                var _widget = inkWell(
                                  onTap: () {
                                    pushTo(
                                      context,
                                      item.category! == "p2p-transfer"
                                          ? ScheduleTransfer(
                                              text: "viewSchedule",
                                              typeOfTransfer: "p2p",
                                              tag: item.recipient,
                                              id: item.scheduleId,
                                              frequency: item.frequency,
                                              beneficiary:
                                                  item.beneficiaryAccountName,
                                              amount: item.amount,
                                            )
                                          : item.category! ==
                                                  "local-bank-transfer"
                                              ? ScheduleTransfer(
                                                  text: "viewSchedule",
                                                  typeOfTransfer: "localBank",
                                                  transferName: item.bankName,
                                                  accNo: item.recipient,
                                                  beneficiary: item
                                                      .beneficiaryAccountName,
                                                  id: item.scheduleId,
                                                  frequency: item.frequency,
                                                  amount: item.amount)
                                              : item.category!
                                                      .contains("airtime")
                                                  ? ScheduleAirtimeTopUp(
                                                      text: "viewSchedule",
                                                      contactNumber:
                                                          item.recipient,
                                                      frequency: item.frequency,
                                                      id: item.scheduleId,
                                                      amount: kPriceFormatter(
                                                        double.parse(
                                                            item.amount ?? "0"),
                                                      ),
                                                    )
                                                  : item.category!
                                                          .contains("cable")
                                                      ? ScheduleCableTopUp(
                                                          text: "viewSchedule",
                                                          cardNo:
                                                              item.recipient,
                                                          frequency:
                                                              item.frequency,
                                                          id: item.scheduleId,
                                                        )
                                                      : item.category!.contains(
                                                              "electricity")
                                                          ? ScheduleElectricity(
                                                              text:
                                                                  "viewSchedule",
                                                              cardNo: item
                                                                  .recipient,
                                                              frequency: item
                                                                  .frequency,
                                                              id: item
                                                                  .scheduleId,
                                                            )
                                                          : ScheduleDataTopUp(
                                                              text:
                                                                  "viewSchedule",
                                                              contactNumber:
                                                                  item.recipient,
                                                              frequency: item
                                                                  .frequency,
                                                              id: item
                                                                  .scheduleId,
                                                            ),
                                    ).then((value) => ref
                                        .read(getScheduleProvider.notifier)
                                        .getSchedule(category: ""));
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: kPrimaryWhite,
                                        borderRadius: BorderRadius.circular(
                                            kSmallPadding),
                                        border: Border.all(
                                            width: 1, color: kLightPurple)),
                                    margin: EdgeInsets.symmetric(
                                        vertical: kSmallPadding),
                                    padding: EdgeInsets.symmetric(
                                        vertical: kRegularPadding,
                                        horizontal: kMediumPadding),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        // Container(
                                        //   height: 50,
                                        //   width: 50,
                                        //   decoration: BoxDecoration(
                                        //     shape: BoxShape.circle,
                                        //     color: Colors.grey,
                                        //   ),
                                        // ),
                                        // SizedBox(
                                        //   width: kRegularPadding,
                                        // ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              item.recipient ?? "",
                                              style:
                                                  textTheme.headline2!.copyWith(
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                            SizedBox(
                                              height: kPadding,
                                            ),
                                            Text(
                                                "${item.category!.toTitleCase()}",
                                                style: textTheme.headline6),
                                            SizedBox(
                                              height: kRegularPadding,
                                            ),
                                            item.frequency!
                                                    .contains(onlyTextValues)
                                                ? Text(

                                                 "Top up ₦${kPriceFormatter(double.parse(item.amount ?? "0"))} every ${item.frequency}",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        color:
                                                            kSecondaryTextColor,
                                                        fontSize: 14,
                                                        fontFamily: ""))
                                                : Text(
                                                    "Top up ₦${kPriceFormatter(double.parse(item.amount ?? "0"))} every ${ordinal_suffix_of(int.parse(item.frequency ?? "0"))}",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        color:
                                                            kSecondaryTextColor,
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
                );
              } else {
                return SizedBox();
              }
            })));
  }

  List<GetAllScheduleData> filterBy() {
    List<GetAllScheduleData> service = [];
    if (currentIndex == 0) {
      service = allSchedule;
      return service;
    } else {
      // print(currentIndex);
      // if (currentIndex == 1) {
      //   service =
      //       allSchedule.where((element) => element.gifteeId != null).toList();
      // } else if (currentIndex == 2) {
      //   service =
      //       allSchedule.where((element) => element.redeemed == true).toList();
      // } else {
      //   service = allSchedule
      //       .where((element) =>
      //           (element.gifteeId == null && element.redeemed == false))
      //       .toList();
      // }
      return service;
    }
  }
}
