import 'package:Pouchers/ui/common/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Duration requestDuration = const Duration(seconds: 60);

bool isFirstTime = true;

RegExp onlyTextValues = RegExp(r'[a-zA-Z]');
RegExp onlyTextDashValues = RegExp(r'^[A-Za-z\-]+$');

bool isPassword(String password) {
  const String pattern = r'^(?=.*?[a-zA-Z])(?=.*?[0-9]).{6,}$';
  final RegExp regExp = RegExp(pattern);
  return regExp.hasMatch(password);
}

bool isEmail(String? email) {
  const String p =
      "[a-zA-Z0-9+._%-+]{1,256}\\@[a-zA-Z0-9][a-zA-Z0-9\\-]{0,64}(\\.[a-zA-Z0-9][a-zA-Z0-9\\-]{0,25})+";
  final RegExp regExp = RegExp(p);
  return regExp.hasMatch(email!);
}

bool isValidName(String? name) {
  if (name == null || name.isEmpty) {
    return false;
  } else {
    const String n = r"^[\\p{L} .'-]+$";
    final RegExp regExp = RegExp(n);

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
const Color kPrimaryTextColor = Color(0xff060628);
const Color kPurpleDeep = Color(0xff2C1D6D);
const Color kPurpleDeep200 = Color(0xff130F26);

const Color kSecondaryTextColor = Color(0xFF8F8E9B);
const Color kPrimaryColor = Color(0xff5034C4);
const Color kPrimaryGrey = Color(0xff6D7A98);
const Color kBrightPurple = Color(0xff7F61DB);
const Color kPrimaryWhite = Colors.white;
const Color kPurple100 = Color(0xff6248CA);
const Color kPurple400 = Color(0xff8365DC);
const Color kBackgroundColor = Color(0xFFF4F4FB);
const Color kBlueColor = Color(0xFF4680FB);
const Color kBlueColorDark = Color(0xFF2B2B2B);
const Color kBlueColor200 = Color(0xFF1E65FA);
const Color kIconPink = Color(0xFFFF5FCD);
const Color kPurpleColor = Color(0xff5034C4);
const Color kColorGreen = Color(0xff00BB64);
const Color kLightColorGreen = Color(0xffF4FBF6);
const Color kColorOrange = Color(0xffFF6414);
const Color kColorOrange100 = Color(0xffFF8264);
const Color kColorYellow200 = Color(0xffE8A706);
const Color kColorBackgroundLight = Color(0xffEEEBFA);
const Color kColorBackgroundLight100 = Color(0xffF8F9FD);
const Color kColorBackgroundLight200 = Color(0xffF7F9FB);
const Color kColorBackgroundLight300 = Color(0xffD9D9D9);
const Color kPurpleLight300 = Color(0xffD3BCFF);
const Color kLightPurple = Color(0xffE9E6FD);
const Color kDarkGrey = Color(0xFF9B9BA5);
const Color kDarkGrey100 = Color(0xFFA2A7B1);
const Color kDarkFill = Color(0xFF160808);
const Color kPurpleLight = Color(0xffC3C3FE);
const Color kPurpleLight100 = Color(0xff5142AB);
const Color kColorBackgroundRed = Color(0xffFEF2F2);
const Color kColorBackgroundGreen = Color(0xFFEAFBF1);
const Color kColorRed = Color(0xFFFF5460);
const Color kColorRedDeep = Color(0xFFAE1313);
const Color kColorLightRed = Color(0xFFFFEEE6);
const Color kColorLightYellow = Color(0xFFFCF7EB);
const Color kColorLightGreen = Color(0xff1AC274);
const Color kPurple200 = Color(0xFFDCDCFF);
const Color kPurple300 = Color(0xffE4E1F5);
const Color kOffWhite = Color(0xffF4F4F4);
const Color kTransparent = Colors.transparent;
const Color kPrimaryBlack = Color(0xff0B2253);
const Color kDeepPurple = Color(0xff110E2F);

const Color kIconGrey = Color(0xFF6D6D6F);
const Color kContainerColor = Color(0xFFF7F7F8);
const Color kPurpleColor100 = Color(0xFFC7C7E1);
const Color kPurpleColor200 = Color(0xFFD9DBE9);
const Color kDarkFill100 = Color(0xFF14142B);
const Color kPurpleColor300 = Color(0xFFEFF0F7);
const Color kGreenColor = Color(0xff27BE63);
const Color kGreen100Color = Color(0xff227B41);
const Color kPurpleColor400 = Color(0xffA5ADC0);
const Color kLightColor500 = Color(0xffDEE3EB);
const Color kLightOrange = Color(0xffCE4C09);
const Color kSecondaryPurple = Color(0xff6463FD);
const Color kLightOrange100 = Color(0xffFFF5DB);
const Color kLight100 = Color(0xffF4F4F5);
const Color kLightOrange200 = Color(0xffF8B64C);
const Color kLightYellow100 = Color(0xffFED066);
const Color kLightYellow200 = Color(0xffD8F042);
const Color kLightOrange300 = Color(0xff996600);
const Color kPurpleColor500 = Color(0xFFDDDBF5);
const Color kPurpleColor600 = Color(0xFFE8E8F1);
const Color kPurpleColor700 = Color(0xFF8A76DB);
const Color kPurpleColor800 = Color(0xFFF8F7FC);
const Color kLightColor200 = Color(0xFFC8C8C8);
const Color kLightColor300 = Color(0xFFE6E9F0);
const Color kLightColor400 = Color(0xFF525A6C);
const Color kLightColor600 = Color(0xFF84868C);
const Color kLightColor700 = Color(0xFF9F9F9F);

// Border
const double kBorderWidth = 1;
const double kThickBorderWidth = 3;
const BorderRadius kBorderRadius = BorderRadius.all(Radius.circular(kPadding));
const BorderRadius kBorderSmallRadius = BorderRadius.all(Radius.circular(8));
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
      offset: const Offset(0, 2), // changes position of shadow
    );

BoxShadow kBoxShadowMid(Color color) => BoxShadow(
      color: color,
      spreadRadius: 2,
      blurRadius: 4,
      offset: const Offset(0, 5), // changes position of shadow
    );

BoxShadow kBoxShadowCondensed(Color color) => BoxShadow(
      color: color,
      spreadRadius: 1,
      blurRadius: 1,
      offset: const Offset(0, 3), // changes position of shadow
    );

// Text
TextStyle kHeadline1TextStyle = const TextStyle(
  fontWeight: FontWeight.w700,
  fontFamily: "Altone",
  color: AppColors.kPrimaryTextColor,
  fontSize: 24,
);

TextStyle kHeadline2TextStyle = const TextStyle(
  fontWeight: FontWeight.normal,
  color: kPrimaryColor,
  fontFamily: "DMSans",
  fontSize: 16,
);

TextStyle kHeadline3TextStyle = const TextStyle(
  fontWeight: FontWeight.normal,
  color: kSecondaryTextColor,
  fontFamily: "DMSans",
  fontSize: 16,
);

TextStyle kHeadline4TextStyle = const TextStyle(
  fontWeight: FontWeight.normal,
  color: kPrimaryTextColor,
  fontFamily: "DMSans",
  fontSize: 14,
);

TextStyle kBodyText1Style = const TextStyle(
  fontWeight: FontWeight.normal,
  color: kSecondaryTextColor,
  fontFamily: "DMSans",
  fontSize: 18,
);

TextStyle kBodyText2Style = const TextStyle(
  fontWeight: FontWeight.w500,
  color: kPrimaryWhite,
  fontSize: 18,
  fontFamily: "Altone",
);

TextStyle kSubtitle1Style = const TextStyle(
  fontWeight: FontWeight.normal,
  color: kPrimaryTextColor,
  fontFamily: "DMSans",
  fontSize: 18,
);

TextStyle kSubtitle2Style = const TextStyle(
  fontWeight: FontWeight.w500,
  color: AppColors.kPrimaryColor,
  fontFamily: "Altone",
  fontSize: 16,
);

TextStyle kHeadline5Style = const TextStyle(
  fontWeight: FontWeight.normal,
  color: kSecondaryTextColor,
  fontFamily: "Altone",
  fontSize: 14,
);
TextStyle kHeadline6Style = const TextStyle(
  fontWeight: FontWeight.w400,
  color: kSecondaryTextColor,
  fontFamily: "DMSans",
  fontSize: 14,
);

ThemeData kThemeData = ThemeData.light().copyWith(
    visualDensity: VisualDensity.adaptivePlatformDensity,
    scaffoldBackgroundColor: AppColors.white,
    iconTheme: const IconThemeData(size: kIconSize, color: kPrimaryColor),
    dividerColor: kDarkGrey,
    primaryColor: kPrimaryColor,
    canvasColor: AppColors.white,
    dividerTheme:
        const DividerThemeData(color: AppColors.kLightPurple, thickness: 0.5),
    textSelectionTheme: const TextSelectionThemeData(
      selectionHandleColor: kColorGreen,
      cursorColor: kPrimaryColor,
      selectionColor: kDarkGrey,
    ),
    dialogBackgroundColor: AppColors.kPrimaryTextColor.withOpacity(30 / 100),
    appBarTheme: AppBarTheme(
      color: kPrimaryWhite,
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      elevation: 0,
      iconTheme: const IconThemeData(size: kIconSize, color: kPrimaryGrey),
      titleTextStyle: kBodyText1Style.copyWith(
          color: kPrimaryTextColor, fontSize: 15, fontWeight: FontWeight.w500),
    ),
    bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: AppColors.white,
        modalBarrierColor: AppColors.kPrimaryTextColor.withOpacity(.30),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(24))),
        showDragHandle: true,
        dragHandleColor: AppColors.kPurpleColor200,
        dragHandleSize: const Size(24, 1.53),
        clipBehavior: Clip.none),
    textTheme: TextTheme(
        displayLarge: kHeadline1TextStyle,
        displayMedium: kHeadline2TextStyle,
        displaySmall: kHeadline3TextStyle,
        headlineMedium: kHeadline4TextStyle,
        bodyLarge: kBodyText1Style,
        bodyMedium: kBodyText2Style,
        titleMedium: kSubtitle1Style,
        titleSmall: kSubtitle2Style,
        headlineSmall: kHeadline5Style,
        titleLarge: kHeadline6Style),
    colorScheme: const ColorScheme(
            brightness: Brightness.light,
            primary: AppColors.white,
            onPrimary: AppColors.kPrimaryColor,
            secondary: Colors.blue,
            onSecondary: Colors.yellow,
            error: Colors.red,
            onError: Colors.redAccent,
            background: Colors.purple,
            onBackground: Colors.pinkAccent,
            surface: Colors.pink,
            onSurface: Colors.amber)
        .copyWith(background: Colors.black),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
            elevation: MaterialStateProperty.resolveWith((states) => 0),
            enableFeedback: true,
            backgroundColor: MaterialStateProperty.resolveWith((states) {
              if (states.contains(MaterialState.disabled)) {
                return AppColors.kPurpleColor100;
              }
              return AppColors.kPrimaryColor;
            }),
            textStyle: MaterialStateProperty.resolveWith((states) =>
                kHeadline6Style.copyWith(
                    fontWeight: FontWeight.w700,
                    color: AppColors.white,
                    fontSize: 16)),
            shape: MaterialStateProperty.resolveWith((states) => RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.r))),
            foregroundColor:
                MaterialStateColor.resolveWith((states) => AppColors.white),
            side: MaterialStateBorderSide.resolveWith((states) {
              if (states.contains(MaterialState.disabled)) {
                return BorderSide(width: 1.w, color: AppColors.kPurpleColor100);
              }
              return BorderSide(width: 1.w, color: AppColors.kPrimaryColor);
            }))),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: ButtonStyle(
        backgroundColor:
            MaterialStateProperty.resolveWith((states) => Colors.transparent),
        elevation: MaterialStateProperty.resolveWith((states) => 0),
        enableFeedback: true,
        textStyle: MaterialStateProperty.resolveWith((states) =>
            kHeadline6Style.copyWith(
                fontWeight: FontWeight.w700,
                color: AppColors.kPrimaryTextColor,
                fontSize: 16)),
        shape: MaterialStateProperty.resolveWith((states) =>
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r))),
        foregroundColor: MaterialStateColor.resolveWith(
            (states) => AppColors.kPrimaryTextColor),
        side: MaterialStateBorderSide.resolveWith(
          (states) => BorderSide(width: 1.w, color: AppColors.kPrimaryColor),
        ),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      labelStyle: kHeadline3TextStyle,
      floatingLabelBehavior: FloatingLabelBehavior.never,
      fillColor: AppColors.kBackgroundColor,
      filled: true,
      errorMaxLines: 2,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      errorStyle: kHeadline5Style.copyWith(
          color: kColorRed, fontSize: 12, overflow: TextOverflow.visible),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(style: BorderStyle.none)),
      errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: AppColors.kColorRed)),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: AppColors.kPrimaryColor)),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(style: BorderStyle.none)),
      focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: AppColors.kColorRed)),
      disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: AppColors.kBackgroundColor)),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        elevation: 5,
        enableFeedback: true,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        backgroundColor: AppColors.white,
        selectedItemColor: AppColors.kPrimaryColor,
        unselectedItemColor: AppColors.kSecondaryTextColor,
        type: BottomNavigationBarType.fixed,
        unselectedLabelStyle: kSubtitle1Style.copyWith(color: AppColors.kPrimaryColor, fontSize: 10, fontWeight: FontWeight.w500),
        selectedLabelStyle: kSubtitle1Style.copyWith(color: AppColors.kPrimaryColor, fontSize: 10, fontWeight: FontWeight.w500)),
    dialogTheme: const DialogTheme(backgroundColor: AppColors.white),
    datePickerTheme: DatePickerThemeData(),
    switchTheme: SwitchThemeData());

ThemeData kThemeDataDark = ThemeData.dark().copyWith(
  visualDensity: VisualDensity.adaptivePlatformDensity,
  scaffoldBackgroundColor: kPrimaryBlack,
  iconTheme: const IconThemeData(size: kIconSize, color: kPrimaryWhite),
  dividerColor: kDarkGrey,
  primaryColor: kPrimaryColor,
  canvasColor: kPrimaryWhite,
  textSelectionTheme: const TextSelectionThemeData(
    selectionHandleColor: kColorGreen,
    cursorColor: kPrimaryColor,
    selectionColor: kDarkGrey,
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
    headline5: kHeadline5Style,
    headline6: kHeadline6Style,
  ),
);
