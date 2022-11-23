import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:pouchers/utils/constant/theme_color_constants.dart';

/// Redesign or replace your flushbar design here
void showErrorBar(BuildContext context, String value) {
  Flushbar(
    message: value,
    messageColor: kColorRed,
    flushbarPosition: FlushbarPosition.TOP,
    backgroundColor: kColorBackgroundRed,
    borderRadius: kBorderSmallRadius,
    borderWidth: 1,
    borderColor: kColorRed,
    icon: const Icon(
      CupertinoIcons.multiply_circle_fill,
      color: kColorRed,
    ),
    mainButton: InkWell(
      onTap: () => Navigator.pop(context),
      child: const Icon(
        Icons.close_rounded,
        color: kColorRed,
      ),
    ),
    margin: const EdgeInsets.all(20),
    padding: const EdgeInsets.only(left: 15, right: 20, top: 15, bottom: 15),
    duration: const Duration(seconds: 2),
  ).show(context);
}

void showSuccessBar(BuildContext context, String? value) {
  if (value != null) {
    Flushbar(
      message: value,
      messageColor: kPrimaryWhite,
      flushbarPosition: FlushbarPosition.TOP,
      backgroundColor: kPrimaryTextColor,
      borderRadius: kBorderSmallRadius,
      icon: const Icon(
        Icons.check_circle_rounded,
        color: kPrimaryWhite,
      ),
      mainButton: InkWell(
        onTap: () => Navigator.pop(context),
        child: const Icon(
          Icons.close_rounded,
          color: kPrimaryWhite,
        ),
      ),
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.only(left: 15, right: 20, top: 15, bottom: 15),
      duration: const Duration(seconds: 3),
    ).show(context);
  }
}

class FlutterSwitchClass extends StatelessWidget {
  final bool saveBeneficiary;
  final Function(bool) onToggle;

  const FlutterSwitchClass(
      {Key? key, required this.saveBeneficiary, required this.onToggle,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlutterSwitch(
        width:  65.0,
        height: 40.0,
        valueFontSize: 25.0,
        toggleSize: 30.0,
        activeColor: kPrimaryColor,
        inactiveColor: kLightColor500,
        value: saveBeneficiary,
        borderRadius: 30.0,
        padding: 5.0,
        onToggle: onToggle);
  }
}
