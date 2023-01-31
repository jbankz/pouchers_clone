import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttercontactpicker/fluttercontactpicker.dart';
import 'package:pouchers/modules/account/models/buy_electricity_class.dart';
import 'package:pouchers/modules/account/models/ui_models_class.dart';
import 'package:pouchers/modules/account/screens/disable_account/disable_modal.dart';
import 'package:pouchers/modules/schedule_purchase/schedule_modal.dart';
import 'package:pouchers/modules/schedule_purchase/schedule_widget_constants.dart';
import 'package:pouchers/utils/assets_path.dart';
import 'package:pouchers/utils/components.dart';
import 'package:pouchers/utils/constant/theme_color_constants.dart';
import 'package:pouchers/utils/flushbar.dart';
import 'package:pouchers/utils/strings.dart';
import 'package:pouchers/utils/widgets.dart';

class ScheduleElectricity extends ConsumerStatefulWidget {
  static const String routeName = "scheduleElectricity";
  final String? text;

  const ScheduleElectricity({Key? key, this.text}) : super(key: key);

  @override
  ConsumerState<ScheduleElectricity> createState() =>
      _ScheduleElectricityState();
}

class _ScheduleElectricityState extends ConsumerState<ScheduleElectricity> {
  bool _saveBeneficiary = false;
  TextEditingController contactController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  String _meterType = prepaid;
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

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return InitialPage(
      title: scheduleElectricity,
      child: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: kRegularPadding),
                  decoration: BoxDecoration(
                      color: kBackgroundColor,
                      borderRadius: BorderRadius.circular(kSmallPadding)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      prefixIcon,
                      inkWell(
                          onTap: () async {
                            final result = await buildShowModalBottomSheet(
                                context, ElectricityModal());
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
                  height: kMicroPadding,
                ),
                Text(
                  meterType,
                  style: textTheme.headline6,
                ),
                SizedBox(
                  height: kSmallPadding,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: inkWell(
                        onTap: () {
                          setState(() => _meterType = prepaid);
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: kMediumPadding,
                              vertical: kRegularPadding),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(kSmallPadding),
                            border: Border.all(
                              color: _meterType == prepaid
                                  ? kPrimaryColor
                                  : kLightPurple,
                              width: 1,
                            ),
                          ),
                          child: Row(
                            children: [
                              Container(
                                padding: EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: _meterType == prepaid
                                        ? kPrimaryColor
                                        : kPurpleColor400,
                                    width: 1.5,
                                  ),
                                ),
                                child: _meterType == prepaid
                                    ? Container(
                                        height: kSmallPadding,
                                        width: kSmallPadding,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: kPrimaryColor,
                                        ),
                                      )
                                    : SizedBox(
                                        height: kSmallPadding,
                                        width: kSmallPadding,
                                      ),
                              ),
                              SizedBox(
                                width: kMediumPadding,
                              ),
                              Text(
                                prepaid,
                                style: textTheme.subtitle1!
                                    .copyWith(fontWeight: FontWeight.w500),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: kMicroPadding,
                    ),
                    Expanded(
                      child: inkWell(
                        onTap: () {
                          setState(() => _meterType = postpaid);
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: kMediumPadding,
                              vertical: kRegularPadding),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(kSmallPadding),
                            border: Border.all(
                              color: _meterType == postpaid
                                  ? kPrimaryColor
                                  : kLightPurple,
                              width: 1,
                            ),
                          ),
                          child: Row(
                            children: [
                              Container(
                                padding: EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: _meterType == postpaid
                                        ? kPrimaryColor
                                        : kLightPurple,
                                    width: 1.5,
                                  ),
                                ),
                                child: _meterType == postpaid
                                    ? Container(
                                        height: kSmallPadding,
                                        width: kSmallPadding,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: kPrimaryColor,
                                        ),
                                      )
                                    : SizedBox(
                                        height: kSmallPadding,
                                        width: kSmallPadding,
                                      ),
                              ),
                              SizedBox(
                                width: kMediumPadding,
                              ),
                              Text(
                                postpaid,
                                style: textTheme.subtitle1!
                                    .copyWith(fontWeight: FontWeight.w500),
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: kMicroPadding,
                ),
                TextInputNoIcon(
                  textTheme: textTheme,
                  text: meterNo,
                  controller: contactController,
                  hintText: enterMeterNo,
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
                  amountText,
                  style: textTheme.headline6,
                ),
                SizedBox(
                  height: kSmallPadding,
                ),
                TextFormField(
                  keyboardType: TextInputType.text,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  style: textTheme.bodyText2!.copyWith(color: kPrimaryBlack),
                  cursorColor: kPrimaryColor,
                  controller: amountController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (val) {
                    if (val != null || val!.isNotEmpty) if (val
                        .startsWith("0")) {
                      return "Amount cannot start with zero";
                    } else
                      return null;
                  },
                  decoration: InputDecoration(
                    filled: true,
                    isDense: true,
                    hintText: enterAmount,
                    hintStyle: textTheme.headline6!.copyWith(
                        color: kSecondaryTextColor.withOpacity(0.7),
                        fontSize: 18),
                    prefixIcon: Padding(
                      padding: const EdgeInsets.only(left: kSmallPadding),
                      child: Align(
                        widthFactor: 0,
                        alignment: Alignment.centerLeft,
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            text: "₦  ",
                            style: TextStyle(
                              color: kPrimaryTextColor,
                              fontWeight: FontWeight.w700,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                    ),
                    fillColor: kBackgroundColor,
                    border: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(style: BorderStyle.none),
                      borderRadius: BorderRadius.circular(kSmallPadding),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: kPrimaryColor),
                      borderRadius: BorderRadius.circular(kSmallPadding),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(kSmallPadding),
                      borderSide: BorderSide(color: kColorRed),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(kSmallPadding),
                      borderSide: BorderSide(color: kColorRed),
                    ),
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
                        context, ScheduleModal());
                    setState(() => frequency = result);
                  },
                ),
                widget.text == "viewSchedule"
                    ? NextUpdateContainer(
                        textTheme: textTheme,
                        text: "Next top-up date is 12:00pm, Dec 5, 2022 ",
                      )
                    : SizedBox(),
                SizedBox(
                  height: kMicroPadding,
                )
              ],
            ),
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
                            showSuccessBar(
                                context, "Auto top-up successfully created");
                          },
                        ),
                      );
                    }),
          SizedBox(
            height: kMicroPadding,
          ),
          widget.text == "viewSchedule"
              ? DeleteScheduleText(
                  textTheme: textTheme,
                  onTap: () {
                    buildShowModalBottomSheet(
                      context,
                      CommonModal(
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
