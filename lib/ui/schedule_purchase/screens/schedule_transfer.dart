import 'package:flutter/material.dart';
import 'package:pouchers/app/navigators/navigators.dart';
import 'package:pouchers/ui/account/disable_account/disable_modal.dart';
import 'package:pouchers/ui/schedule_purchase/schedule_modal.dart';
import 'package:pouchers/ui/schedule_purchase/schedule_widget_constants.dart';
import 'package:pouchers/ui/tab_layout/models/ui_models_class.dart';
import 'package:pouchers/ui/tab_layout/screens/tab_layout.dart';
import 'package:pouchers/utils/components.dart';
import 'package:pouchers/utils/constant/theme_color_constants.dart';
import 'package:pouchers/utils/strings.dart';
import 'package:pouchers/utils/widgets.dart';

class ScheduleTransfer extends StatefulWidget {
  static const String routeName = "scheduleTransfer";
  final String? text;

  const ScheduleTransfer({Key? key, this.text}) : super(key: key);

  @override
  State<ScheduleTransfer> createState() => _ScheduleTransferState();
}

class _ScheduleTransferState extends State<ScheduleTransfer> {
  String frequency = "";

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return InitialPage(
      title: scheduleTransfer,
      child: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                Stack(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: kRegularPadding, vertical: kMacroPadding),
                      margin: EdgeInsets.only(top: kMacroPadding),
                      decoration: BoxDecoration(
                        color: kContainerColor,
                        borderRadius: BorderRadius.circular(kSmallPadding),
                      ),
                      child: Column(
                        children: [
                          AirtimeRow(
                            textTheme: textTheme,
                            text: accName,
                            subText: "Tola Adewumi",
                            isCopyIcon: false,
                            noSymbol: true,
                            style: textTheme.headline4!.copyWith(
                                fontSize: 16, fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            height: widget.text == "bank" ? kMacroPadding : 0,
                          ),
                          widget.text == "bank"
                              ? AirtimeRow(
                                  textTheme: textTheme,
                                  text: bankName,
                                  subText: "Access Bank",
                                  isCopyIcon: false,
                                  noSymbol: true,
                                  style: textTheme.headline4!.copyWith(
                                    fontSize: 16,
                                  ),
                                )
                              : SizedBox(),
                          SizedBox(
                            height: widget.text == "bank" ? kMacroPadding : 0,
                          ),
                          widget.text == "bank"
                              ? AirtimeRow(
                                  textTheme: textTheme,
                                  text: accNumber,
                                  subText: "0123456789",
                                  isCopyIcon: false,
                                  noSymbol: true,
                                  style: textTheme.headline4!.copyWith(
                                    fontSize: 16,
                                  ),
                                )
                              : SizedBox(),
                          SizedBox(
                            height: widget.text == "bank" ? 0 : kMacroPadding,
                          ),
                          widget.text == "bank"
                              ? SizedBox()
                              : AirtimeRow(
                                  textTheme: textTheme,
                                  text: poucherTag,
                                  subText: "@slingerbae",
                                  isCopyIcon: false,
                                  noSymbol: true,
                                  style: textTheme.headline4!.copyWith(
                                    fontSize: 16,
                                  ),
                                ),
                          SizedBox(
                            height: kMacroPadding,
                          ),
                          AirtimeRow(
                            textTheme: textTheme,
                            text: amountText,
                            subText: "22,400.00",
                            isCopyIcon: false,
                            noSymbol: false,
                            isNaira: true,
                            style: textTheme.headline4!.copyWith(
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      left: 0,
                      right: 0,
                      child: Container(
                        height: 65,
                        width: 65,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Colors.grey),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: kMacroPadding,
                ),
                TextInputNoIcon(
                  textTheme: textTheme,
                  text: choosePeriod,
                  hintText: selectFrequency,
                  read: true,
                  suffixIcon: frequency == ""
                      ? SizedBox()
                      : Container(
                          width: 200,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                "Every $frequency",
                                style: textTheme.headline2!.copyWith(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 18,
                                ),
                              ),
                              Icon(
                                Icons.keyboard_arrow_down,
                                color: kSecondaryTextColor,
                              )
                            ],
                          ),
                        ),
                  onTap: () async {
                    final result = await buildShowModalBottomSheet(
                        context, ScheduleModal());
                    setState(() => frequency = result);
                  },
                ),
                SizedBox(
                  height: kRegularPadding,
                ),
                NextUpdateContainer(
                  textTheme: textTheme,
                  text: "Next top-up date is 12:00pm, Dec 5, 2022 ",
                )
              ],
            ),
          ),
          LargeButton(
            title: save,
            onPressed: () {
              pushTo(
                context,
                SuccessMessage(
                  text: dataSuccess,
                  subText: scheduleTransferSuccess,
                  onTap: () {
                    pushToAndClearStack(
                        context,
                        TabLayout(
                          gottenIndex: 0,
                        ));
                  },
                ),
              );
            },
          ),
          SizedBox(
            height: kMicroPadding,
          ),
          widget.text == "viewSchedule"
              ? DeleteScheduleText(
                  textTheme: textTheme,
                  onTap: () {
                    buildShowModalBottomSheet(
                      context,
                      DisableModal(
                          textTheme: textTheme,
                          buttonText: yesDelete,
                          title: deleteTopUp,
                          subTitle: deleteTopUpSub,
                          color: kLightOrange),
                    );
                  },
                )
              : SizedBox()
        ],
      ),
    );
  }
}
