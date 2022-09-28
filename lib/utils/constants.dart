import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Duration requestDuration = const Duration(seconds: 60);

bool isFirstTime = true;

RegExp onlyTextValues = RegExp(r'[a-zA-Z]');

bool isEmail(String? email) {
  if (email == null || email.isEmpty) {
    return false;
  } else {
    String p = "[a-zA-Z0-9\+\.\_\%\-\+]{1,256}" +
        "\\@" +
        "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,64}" +
        "(" +
        "\\." +
        "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,25}" +
        ")+";
    RegExp regExp = RegExp(p);

    return regExp.hasMatch(email);
  }
}

bool isValidName(String? name) {
  if (name == null || name.isEmpty) {
    return false;
  } else {
    String n = r"^[\\p{L} .'-]+$";
    RegExp regExp = RegExp(n);

    return regExp.hasMatch(name);
  }
}

String? validateField(String? text, {required String result}) {
  if (text == null || text.isEmpty) {
    return result;
  } else {
    return null;
  }
}

// Spacing
const double kPadding = 5;
const double kSmallPadding = 10;
const double kRegularPadding = 15;
const double kMediumPadding = 20;
const double kMicroPadding = 25;
const double kMacroPadding = 30;
const double kLargePadding = 40;
const double kFullPadding = 60;
const double kSupremePadding = 100;

const double kWidthRatio = 0.9;
const double kIconSize = 24;

double kCalculatedWidth(Size size) => size.width * kWidthRatio;

double kCalculatedMargin(Size size) => size.width * (1 - kWidthRatio) / 2;

// Colors
const Color kPrimaryColor = Color(0xff6D7A98);
const Color kPrimaryBlack = Color(0xff0B2253);
const Color kIconBlack = Color(0xFF3A434B);
const Color kPrimaryWhite = Colors.white;
const Color kPrimaryGrey = Color(0xff6D7A98);
const Color kPrimaryGreen = Color(0xff41DC65);
const Color kTransparent = Colors.transparent;

const Color kInnerBorderGrey = Color(0xFFE6E9F0);
const Color kIconBlueBackground = Color(0xFFE4ECFB);
const Color kIconBlue = Color(0xFF1844A3);
const Color kLightGrey = Color(0xFFC4C4C4);
const Color kGreyFill = Color(0xFFF7F9FB);
const Color kGreyDeepFill = Color(0xFFDEE3EB);

const Color kColorBackgroundColor = Color(0xffEDEDED);
const Color kColorBackgroundLight = Color(0xffF5F4F4);
const Color kColorRed = Color(0xFFFF5460);
const Color kColorBackgroundRed = Color(0xffFEF2F2);
const Color kColorBrown = Color(0xffA06262);
const Color kColorGreen = Color(0xff1AA551);
const Color kColorBackgroundGreen = Color(0xFFEAFBF1);
const Color kColorOrange = Color(0xffEDA345);
const Color kPurpleColor = Color(0xff9B8CFB);
const Color kColorGrey = Color(0xffC4C4C4);
const Color kColorDeepGrey = Colors.grey;

// Border
const double kBorderWidth = 1;
const double kThickBorderWidth = 3;
const BorderRadius kBorderRadius = BorderRadius.all(Radius.circular(kPadding));
const BorderRadius kBorderSmallRadius =
    BorderRadius.all(Radius.circular(8));
const BorderRadius kBorderMidRadius =
    BorderRadius.all(Radius.circular(kRegularPadding));
const BorderRadius kFullBorderRadius = BorderRadius.all(Radius.circular(100));
BoxDecoration kTextFieldBoxDecoration = const BoxDecoration(
    borderRadius: kBorderRadius, border: null, color: Colors.white);
BoxDecoration kBottomSheetBoxDecoration = const BoxDecoration(
  color: Colors.white,
  borderRadius: BorderRadius.only(
    topLeft: Radius.circular(25.0),
    topRight: Radius.circular(25.0),
  ),
);

InputBorder borderDesign = const OutlineInputBorder(
  borderSide: BorderSide(
    color: Colors.blueGrey,
  ),
);

InputBorder errorBorderDesign = const OutlineInputBorder(
  borderSide: BorderSide(
    color: Colors.red,
  ),
);

BoxShadow kBoxShadow(Color color) => BoxShadow(
      color: color,
      spreadRadius: 5,
      blurRadius: 7,
      offset: Offset(0, 2), // changes position of shadow
    );

BoxShadow kBoxShadowMid(Color color) => BoxShadow(
      color: color,
      spreadRadius: 2,
      blurRadius: 4,
      offset: Offset(0, 5), // changes position of shadow
    );

BoxShadow kBoxShadowCondensed(Color color) => BoxShadow(
      color: color,
      spreadRadius: 1,
      blurRadius: 1,
      offset: Offset(0, 3), // changes position of shadow
    );

// Text
TextStyle kHeadline1TextStyle = const TextStyle(
  fontWeight: FontWeight.bold,
  height: 1.5,
  color: kPrimaryColor,
  fontSize: 26,
);

TextStyle kHeadline2TextStyle = const TextStyle(
  fontWeight: FontWeight.w800,
  color: kPrimaryColor,
  fontSize: 24,
);
TextStyle kHeadline3TextStyle = const TextStyle(
  fontWeight: FontWeight.w700,
  color: kPrimaryColor,
  fontSize: 22,
);

TextStyle kHeadline4TextStyle = const TextStyle(
  fontWeight: FontWeight.w500,
  color: kPrimaryBlack,
  fontSize: 17,
);

TextStyle kBodyText1Style = const TextStyle(
  fontWeight: FontWeight.w600,
  color: kPrimaryColor,
  fontSize: 18,
);

TextStyle kBodyText2Style = const TextStyle(
  fontWeight: FontWeight.w400,
  color: kPrimaryColor,
  fontSize: 16,
);

TextStyle kSubtitle1Style = const TextStyle(
  fontWeight: FontWeight.w400,
  color: kPrimaryColor,
  fontSize: 14,
);

TextStyle kSubtitle2Style = const TextStyle(
  fontWeight: FontWeight.w600,
  color: kPrimaryGrey,
  fontSize: 12,
);

ThemeData kThemeData = ThemeData.light().copyWith(
  visualDensity: VisualDensity.adaptivePlatformDensity,
  scaffoldBackgroundColor: kPrimaryWhite,
  iconTheme: const IconThemeData(size: kIconSize, color: kPrimaryColor),
  dividerColor: kLightGrey,
  primaryColor: kPrimaryColor,
  canvasColor: kPrimaryWhite,
  backgroundColor: kPrimaryWhite,
  textSelectionTheme: const TextSelectionThemeData(
    selectionHandleColor: kColorGreen,
    cursorColor: kPrimaryColor,
    selectionColor: kLightGrey,
  ),
  dialogBackgroundColor: kPrimaryBlack,
  appBarTheme: AppBarTheme(
    color: kPrimaryWhite,
    systemOverlayStyle: SystemUiOverlayStyle.light,
    elevation: 0,
    iconTheme: const IconThemeData(size: kIconSize, color: kPrimaryColor),
    titleTextStyle: kBodyText1Style,
  ),
  textTheme: TextTheme(
    headline1: kHeadline1TextStyle,
    headline2: kHeadline2TextStyle,
    headline3: kHeadline3TextStyle,
    headline4: kHeadline4TextStyle,
    bodyText1: kBodyText1Style,
    bodyText2: kBodyText2Style,
    subtitle1: kSubtitle1Style,
    subtitle2: kSubtitle2Style,
  ),
);

ThemeData kThemeDataDark = ThemeData.dark().copyWith(
  visualDensity: VisualDensity.adaptivePlatformDensity,
  scaffoldBackgroundColor: kPrimaryBlack,
  iconTheme: const IconThemeData(size: kIconSize, color: kPrimaryWhite),
  dividerColor: kLightGrey,
  primaryColor: kPrimaryColor,
  canvasColor: kPrimaryWhite,
  backgroundColor: kPrimaryBlack,
  textSelectionTheme: const TextSelectionThemeData(
    selectionHandleColor: kColorGreen,
    cursorColor: kPrimaryColor,
    selectionColor: kLightGrey,
  ),
  dialogBackgroundColor: kPrimaryColor,
  appBarTheme: AppBarTheme(
    color: kPrimaryColor,
    systemOverlayStyle: SystemUiOverlayStyle.dark,
    elevation: 0,
    iconTheme: const IconThemeData(size: kIconSize, color: kPrimaryWhite),
    titleTextStyle: kBodyText1Style.copyWith(color: kPrimaryWhite),
  ),
  textTheme: TextTheme(
    headline1: kHeadline1TextStyle.copyWith(color: kPrimaryWhite),
    headline2: kHeadline2TextStyle.copyWith(color: kPrimaryWhite),
    headline3: kHeadline3TextStyle.copyWith(color: kPrimaryWhite),
    headline4: kHeadline4TextStyle.copyWith(color: kPrimaryWhite),
    bodyText1: kBodyText1Style.copyWith(color: kPrimaryWhite),
    bodyText2: kBodyText2Style.copyWith(color: kPrimaryWhite),
    subtitle1: kSubtitle1Style.copyWith(color: kPrimaryWhite),
    subtitle2: kSubtitle2Style.copyWith(color: kPrimaryWhite),
  ),
);
