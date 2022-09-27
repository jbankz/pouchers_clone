import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/utils/constants.dart';


/// Redesign or replace your flushbar design here
void showErrorBar(BuildContext context, String value) {
  Flushbar(
    message: value,
    messageColor: kColorRed,
    flushbarPosition: FlushbarPosition.BOTTOM,
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
      messageColor: kColorGreen,
      flushbarPosition: FlushbarPosition.BOTTOM,
      backgroundColor: kColorBackgroundGreen,
      borderRadius: kBorderSmallRadius,
      icon: const Icon(
        Icons.check_circle_rounded,
        color: kColorGreen,
      ),
      mainButton: InkWell(
        onTap: () => Navigator.pop(context),
        child: const Icon(
          Icons.close_rounded,
          color: kColorGreen,
        ),
      ),
      borderWidth: 1,
      borderColor: kColorGreen,
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.only(left: 15, right: 20, top: 15, bottom: 15),
      duration: const Duration(seconds: 3),
    ).show(context);
  }
}
