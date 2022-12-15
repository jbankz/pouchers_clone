import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pouchers/app/navigators/navigators.dart';
import 'package:pouchers/ui/account/disable_account/disable_modal.dart';
import 'package:pouchers/ui/schedule_purchase/screens/schedule_airtime_topup.dart';
import 'package:pouchers/ui/tab_layout/screens/homepage/voucher/voucher_widgets.dart';
import 'package:pouchers/utils/assets_path.dart';
import 'package:pouchers/utils/components.dart';
import 'package:pouchers/utils/constant/theme_color_constants.dart';
import 'package:pouchers/utils/strings.dart';
import 'dart:math' as math;

import 'package:pouchers/utils/widgets.dart';

List<String> category = [dayText, monthText];
List<String> days = [
  "Monday",
  "Tuesday",
  "Wednesday",
  "Thursday",
  "Friday",
  "Saturday",
  "Sunday"
];

List<VoucherItems> scheduleDummy = [
  VoucherItems(
      code: "08157684502",
      value: "Top up ₦100 every Monday",
      image: "glo",
      expiry: "Next top-up date is 12:00pm, Dec 5, 2022 "),
  VoucherItems(
      code: "09182342433",
      value: "Top up ₦100 every 10th",
      image: "etisalat",
      expiry: "Next top-up date is 12:00pm, Dec 5, 2022 "),
];

List<int> generateNumbers() {
  List<int> generatedNo = [];
  for (int i = 1; i < 32; i++) {
    generatedNo.add(i);
  }
  return generatedNo;
}

String ordinal_suffix_of(int i) {
  var j = i % 10,
      k = i % 100;
  if (j == 1 && k != 11) {
    return "${i}st";
  }
  if (j == 2 && k != 12) {
    return "${i}nd";
  }
  if (j == 3 && k != 13) {
    return "${i}rd";
  }
  return "${i}th";
}

class Scheduling extends StatelessWidget {
  final String text, subtext;
  final Function() onTap;
  const Scheduling({Key? key, required this.text, required this.subtext, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return  inkWell(
      onTap: onTap ,
      child: Container(
        padding: EdgeInsets.symmetric(
            vertical: kSmallPadding, horizontal: kRegularPadding),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(kSmallPadding),
            border: Border.all(color: kLightPurple, width: 0.5),
            color: kPrimaryWhite),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Transform(
              transform: Matrix4(
                1,0,0,0,
                0,1,0,0,
                0,0,1,0,
                0,0,0,1,
              )..rotateX(math.pi),
              alignment: Alignment.center,
              child: RotationTransition(
                turns: AlwaysStoppedAnimation(0.87),
                child: Icon(
                  Icons.sync,
                  color: kColorOrange100,
                ),
              ),
            ),
            SizedBox(
              width: kRegularPadding,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    text,
                    style: textTheme.headline4!.copyWith(
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(
                    height: kPadding,
                  ),
                  Text(
                    subtext,
                    style:
                    textTheme.headline4!.copyWith(color: kIconGrey),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ScheduleList extends StatelessWidget {
  const ScheduleList({
    Key? key,
    required this.scheduleDummy,
    required this.textTheme,
  }) : super(key: key);

  final List<VoucherItems> scheduleDummy;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: ListView(
              children: scheduleDummy
                  .map((e) => Container(
                padding: EdgeInsets.only(top: kSmallPadding),
                margin: EdgeInsets.symmetric(vertical: 13),
                decoration: BoxDecoration(
                  border: Border.all(color: kLightPurple),
                  borderRadius:
                  BorderRadius.circular(kSmallPadding),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: kSmallPadding),
                      child: Row(
                        children: [
                          Container(
                            padding:
                            EdgeInsets.all(kSmallPadding),
                            height: kLargePadding,
                            width: kLargePadding,
                            decoration: BoxDecoration(
                                color: kContainerColor,
                                shape: BoxShape.circle),
                            child: SvgPicture.asset(
                              e.image == "glo"
                                  ? AssetPaths.gloIcon
                                  : AssetPaths.mobile9Icon,
                            ),
                          ),
                          SizedBox(
                            width: kSmallPadding,
                          ),
                          Column(
                            crossAxisAlignment:
                            CrossAxisAlignment.start,
                            children: [
                              Text(
                                e.code,
                                style: textTheme.subtitle1!
                                    .copyWith(
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              RichText(
                                text: TextSpan(
                                    text: "Top up ",
                                    children: [
                                      TextSpan(
                                          text: "₦",
                                          style: TextStyle(
                                            fontWeight:
                                            FontWeight
                                                .normal,
                                            color: kBlueColor,
                                            fontSize: 16,
                                          )),
                                      TextSpan(
                                        text: "100 every 10th",
                                        style: textTheme
                                            .headline2!
                                            .copyWith(
                                            color:
                                            kBlueColor),
                                      ),
                                    ],
                                    style: TextStyle(
                                      fontWeight:
                                      FontWeight.normal,
                                      color: kBlueColor,
                                      fontSize: 16,
                                    )),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: kRegularPadding,
                    ),
                    Text(
                      e.expiry,
                      style: textTheme.headline6,
                    ),
                    SizedBox(
                      height: kSmallPadding,
                    ),
                    Row(
                      children: [
                        ScheduleWidget(
                          icon: AssetPaths.deleteIcon,
                          text: yesDelete,
                          onTap: () {
                            buildShowModalBottomSheet(
                                context,
                                DisableModal(
                                    textTheme: textTheme,
                                    buttonText: yesDelete,
                                    title: deleteTopUp,
                                    subTitle: deleteTopUpSub,
                                    color: kLightOrange));
                          },
                          boxDecoration: BoxDecoration(
                            border:
                            Border.all(color: kLightPurple),
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(
                                    kSmallPadding)),
                          ),
                        ),
                        ScheduleWidget(
                          icon: AssetPaths.editIcon,
                          onTap: () {},
                          text: edit,
                          boxDecoration: BoxDecoration(
                            border:
                            Border.all(color: kLightPurple),
                            borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(
                                    kSmallPadding)),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ))
                  .toList(),
            )),
      ],
    );
  }
}

class ScheduleBottomWidget extends StatelessWidget {
  const ScheduleBottomWidget({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Container(
      margin: EdgeInsets.only(top: 3),
      decoration: BoxDecoration(
          boxShadow: const [BoxShadow(color: Colors.grey, blurRadius: 5)],
          color: kPrimaryWhite),
      padding: EdgeInsets.symmetric(
          horizontal: kMediumPadding, vertical: kRegularPadding),
      child: inkWell(
        onTap: onTap,
        child: Container(
          height: 56,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(kSmallPadding),
              color: kPrimaryColor),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Transform(
                transform: Matrix4(
                  1,
                  0,
                  0,
                  0,
                  0,
                  1,
                  0,
                  0,
                  0,
                  0,
                  1,
                  0,
                  0,
                  0,
                  0,
                  1,
                )..rotateX(math.pi),
                alignment: Alignment.center,
                child: RotationTransition(
                  turns: AlwaysStoppedAnimation(0.87),
                  child: Icon(
                    Icons.sync,
                    color: kPrimaryWhite,
                  ),
                ),
              ),
              SizedBox(
                width: kRegularPadding,
              ),
              Text(
                scheduleTopUp,
                style: textTheme.bodyText2!.copyWith(
                  fontWeight: FontWeight.w700,
                  fontFamily: "DMSans",
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ScheduleWidget extends StatelessWidget {
  final BoxDecoration boxDecoration;
  final String icon, text;
  final Function() onTap;

  const ScheduleWidget(
      {Key? key,
        required this.boxDecoration,
        required this.onTap,
        required this.icon,
        required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Expanded(
      child: inkWell(
        onTap: onTap,
        child: Container(
          decoration: boxDecoration,
          padding: EdgeInsets.symmetric(vertical: kSmallPadding),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(icon),
              SizedBox(
                width: kPadding,
              ),
              Text(
                text,
                style: textTheme.headline2!.copyWith(
                    color: text == "Delete" ? kColorOrange : kPrimaryTextColor),
              )
            ],
          ),
        ),
      ),
    );
  }
}

