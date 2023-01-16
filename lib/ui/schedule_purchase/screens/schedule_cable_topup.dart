import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttercontactpicker/fluttercontactpicker.dart';
import 'package:pouchers/ui/account/disable_account/disable_modal.dart';
import 'package:pouchers/ui/schedule_purchase/schedule_modal.dart';
import 'package:pouchers/ui/schedule_purchase/schedule_widget_constants.dart';
import 'package:pouchers/ui/tab_layout/models/buy_cable_class.dart';
import 'package:pouchers/ui/tab_layout/models/ui_models_class.dart';
import 'package:pouchers/utils/assets_path.dart';
import 'package:pouchers/utils/components.dart';
import 'package:pouchers/utils/constant/theme_color_constants.dart';
import 'package:pouchers/utils/flushbar.dart';
import 'package:pouchers/utils/strings.dart';
import 'package:pouchers/utils/widgets.dart';

class ScheduleCableTopUp extends StatefulWidget {
  static const String routeName = "scheduleCableTopUp";
  final String? text;
  const ScheduleCableTopUp({Key? key, this.text}) : super(key: key);

  @override
  State<ScheduleCableTopUp> createState() => _ScheduleCableTopUpState();
}

class _ScheduleCableTopUpState extends State<ScheduleCableTopUp> {
  TextEditingController contactController = TextEditingController();
  String frequency = "";
  Widget prefixIcon = Padding(
    padding: EdgeInsets.symmetric(vertical: kMediumPadding),
    child: Text(selectProvider,
        style: TextStyle(
          fontWeight: FontWeight.w300,
          color: kSecondaryTextColor.withOpacity(0.7),
          fontFamily: "DMSans",
          fontSize: 18,
        )),
  );

  Widget prefixTypeIcon = Padding(
    padding: EdgeInsets.symmetric(vertical: kMediumPadding),
    child: Text(type,
        style: TextStyle(
          fontWeight: FontWeight.w300,
          color: kSecondaryTextColor.withOpacity(0.7),
          fontFamily: "DMSans",
          fontSize: 18,
        )),
  );

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return InitialPage(
      title: cable,
      child: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: kRegularPadding),
                  decoration: BoxDecoration(
                      color: kPrimaryTextColor,
                      borderRadius: BorderRadius.circular(kSmallPadding)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      prefixIcon,
                      inkWell(
                          onTap: () async {
                            final result = await buildShowModalBottomSheet(
                                context, CableModal());
                            if (result != SizedBox()) {
                              setState(() => prefixIcon = result);
                            }
                          },
                          child: Icon(
                            Icons.keyboard_arrow_down,
                            size: 30,
                            color: kSecondaryTextColor,
                          )),
                    ],
                  ),
                ),
                SizedBox(
                  height: kMediumPadding,
                ),
                TextInputNoIcon(
                  textTheme: textTheme,
                  text: cardNumber,
                  controller: contactController,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  icon: inkWell(
                    onTap: () async {
                      final PhoneContact contact =
                      await FlutterContactPicker.pickPhoneContact();
                      setState(() {
                        contactController.text = contact.phoneNumber!.number!;
                      });
                    },
                    child: SvgPicture.asset(
                      AssetPaths.contactBook,
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                ),
                SizedBox(
                  height: kSmallPadding,
                ),
                Text(
                  subType,
                  style: textTheme.headline6,
                ),
                SizedBox(
                  height: kSmallPadding,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: kRegularPadding),
                  decoration: BoxDecoration(
                      color: kBackgroundColor,
                      borderRadius: BorderRadius.circular(kSmallPadding)),
                  child: Row(
                    children: [
                      Expanded(child: prefixTypeIcon),
                      inkWell(
                        onTap: () async {
                          final result = await buildShowModalBottomSheet(
                              context, SubscriptionModal());
                          if (result != null) {
                            if (result != SizedBox()) {
                              setState(() => prefixTypeIcon = result);
                            }
                          }
                        },
                        child: Icon(
                          Icons.keyboard_arrow_down,
                          size: 30,
                          color: kSecondaryTextColor,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: kMicroPadding,
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
                        context, ScheduleOnlyMonth());
                    setState(() => frequency = result);
                  },
                ),
                widget.text == "viewSchedule" ? NextUpdateContainer(
                  textTheme: textTheme,
                  text: "Next top-up date is 12:00pm, Dec 5, 2022 ",
                ) : SizedBox(),
                SizedBox(
                  height: kMicroPadding,
                )
              ],
            ),
          ),

          SizedBox(
            height: kLargePadding,
          ),
          LargeButton(
              title: widget.text == "viewSchedule" ? save : confirm,
              onPressed: frequency == ""
                  ? () {}
                  : () {
                buildShowModalBottomSheet(
                  context,
                  TransactionPinContainer(
                    isSchedule: true,
                    isData: false,
                    isCard: false,
                    isFundCard: false,
                    doSchedule: () {
                      showSuccessBar(context,
                          "Auto top-up successfully created");
                    },
                  ),
                );
              }),
          SizedBox(
            height: kMicroPadding,
          ),
          widget.text == "viewSchedule"
              ? DeleteScheduleText(textTheme: textTheme, onTap: (){
            buildShowModalBottomSheet(
              context,
              DisableModal(
                  textTheme: textTheme,
                  buttonText: yesDelete,
                  title: deleteTopUp,
                  subTitle: deleteTopUpSub,
                  color: kLightOrange),
            );
          },)
              : SizedBox()
        ],
      ),
    );
  }
}
