import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:overlay_support/overlay_support.dart';

// Extension for String manipulation
extension StringExtensions on String {
  // Parses a formatted amount string into an integer
  int parseAmount() => int.parse(replaceAll(',', '').replaceAll('.00', ''));

  bool get isNull => toLowerCase() == 'null';

  // Capitalizes the first letter of the string
  String get capitalizeFirst => isEmpty ? '' : this[0].toUpperCase();

  // Converts the string to title case
  String get toCapitalized =>
      length > 0 ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}' : '';

  // Converts the string to title case with spaces
  String get titleCase => replaceAll(RegExp(' +'), ' ')
      .split(' ')
      .map((str) => str.toCapitalized)
      .join(' ');

  // Replaces underscores with spaces
  String get removeUnderscore => replaceAll('_', ' ');

  // Format number to USA phone number format
  String _formatPhoneNumber(num phoneNumber) {
    // Convert the number to a string
    final String phoneNumberStr = phoneNumber.toString();

    // Check if the phone number has 10 digits
    if (phoneNumberStr.length != 10) {
      throw ArgumentError("Phone number must have 10 digits");
    }

    // Format the phone number
    return "(${phoneNumberStr.substring(0, 3)}) ${phoneNumberStr.substring(3, 6)} - ${phoneNumberStr.substring(6)}";
  }

  String get formattedPhoneNumber => _formatPhoneNumber(num.parse(this));

  // Reversed USA phone number format to number
  String _reverseFormatPhoneNumber(String formattedPhoneNumber) {
    // Remove any non-digit characters
    final String phoneNumberDigits =
        formattedPhoneNumber.replaceAll(RegExp(r'\D'), '');

    // Ensure the phone number has 10 digits
    if (phoneNumberDigits.length != 10) {
      throw ArgumentError("Invalid formatted phone number");
    }

    // Reconstruct the original phone number
    return phoneNumberDigits;
  }

  String get reversedFormattedPhoneNumber => _reverseFormatPhoneNumber(this);
}

// Extension for currency formatting
extension CurrencyExtensions on num {
  // Formats the number as US Dollar currency
  String get toDollar => NumberFormat.simpleCurrency(name: 'USD')
      .format(this)
      .replaceAll('.00', '');

  // Formats the number as Nigerian Naira currency

  String get toNaira => NumberFormat.simpleCurrency(name: 'NGN').format(this);
}

extension DateTimeExtensions on DateTime {
  // Formats the time in 12-hour format with AM/PM
  String get toTime => DateFormat('hh:mm a').format(this);

  // Date formatting extensions
  String get dateFormatter => 'MMMM dd, y';

  // Formats the date as a string
  String formatDate() {
    final formatter = DateFormat(dateFormatter);
    return formatter.format(this);
  }

  // Checks if two dates are the same
  bool isSameDate(DateTime other) =>
      year == other.year && month == other.month && day == other.day;

  // Calculates the difference in days between this date and now
  int getDifferenceInDaysWithNow() {
    final now = DateTime.now();
    return now.difference(this).inDays;
  }

  // Formats the date as "dd MMM yyyy"
  String get dayMonthYear => DateFormat('dd MMM yyyy').format(this);

  // Formats the date as "yyyy-M-dd" for reminders
  String get reminderFormat => DateFormat('yyyy-M-dd').format(this);

  // Formats the time in 12-hour format with AM/PM
  String get timeAloneWithMeridian12 => DateFormat('hh:mm a').format(this);

  // Formats the time in 24-hour format with AM/PM
  String get timeAloneWithMeridian24 => DateFormat('HH:mm a').format(this);

  // Formats the date and time with "EEE, dd MMM, yyyy - hh:mm a"
  String get countTime =>
      DateFormat('EEE, dd MMM, yyyy - hh:mm a').format(this);

  // Formats the date and time as "dd MMM, hh:mm a"
  String get dayMonthTime => DateFormat('dd MMM, hh:mm a').format(this);

  // Formats the date and time as "MM dd, hh:mm a"
  String get monthDayTime => DateFormat('MMM dd, hh:mm a').format(this);

  // Formats the month MMMM"
  String get getFullMonth => DateFormat('MMMM').format(this);

  // Formats the month MMM"
  String get getFullYear => DateFormat('yyyy').format(this);

  // Formats the month MMM"
  String get dateWithSlashes => DateFormat('MM/dd/yyyy').format(this);

// Function to format a given DateTime object to the desired format
  String get monthDateYear => _getOrdinalIndicator(this);

// Function to determine the correct ordinal indicator for a given day
  String _getOrdinalIndicator(DateTime dateTime) {
    String suffix = 'th';
    final int digit = dateTime.day % 10;
    if ((digit > 0 && digit < 4) && (dateTime.day < 11 || dateTime.day > 13)) {
      suffix = <String>['st', 'nd', 'rd'][digit - 1];
    }
    return DateFormat("MMMM d'$suffix' y").format(dateTime); // 'Month Day Year'
  }
}

// File extensions for handling files
extension FileExtensions on File {
  // Formats the file size
  String get fileSize {
    const suffixes = ["b", "kb", "mb", "gb", "tb"];
    final int sizeInBytes = lengthSync();
    if (sizeInBytes == 0) return '0${suffixes[0]}';
    final int i = (log(sizeInBytes) / log(1024)).floor();
    return ((sizeInBytes / pow(1024, i)).toStringAsFixed(0)) + suffixes[i];
  }

  // Extracts the file extension from the path
  String get fileExtension => path.split('.').last;
}

// Extension for BuildContext (placeholder)
extension ContextExtensions on BuildContext {
  bool get isMobile => MediaQuery.of(this).size.width <= 500.0;

  bool get isTablet =>
      MediaQuery.of(this).size.width < 1024.0 &&
      MediaQuery.of(this).size.width >= 650.0;

  bool get isSmallTablet =>
      MediaQuery.of(this).size.width < 650.0 &&
      MediaQuery.of(this).size.width > 500.0;

  bool get isDesktop => MediaQuery.of(this).size.width >= 1024.0;

  bool get isSmall =>
      MediaQuery.of(this).size.width < 850.0 &&
      MediaQuery.of(this).size.width >= 560.0;

  double get width => MediaQuery.of(this).size.width;

  double get height => MediaQuery.of(this).size.height;

  Size get size => MediaQuery.of(this).size;

  TextStyle? get displayMedium => Theme.of(this).textTheme.displayMedium;

  TextStyle? get displaySmall => Theme.of(this).textTheme.displaySmall;

  TextStyle? get displayLarge => Theme.of(this).textTheme.displayLarge;

  TextStyle? get headlineLarge => Theme.of(this).textTheme.headlineLarge;

  TextStyle? get headlineMedium => Theme.of(this).textTheme.headlineMedium;

  TextStyle? get titleLarge => Theme.of(this).textTheme.titleLarge;

  TextStyle? get titleMedium => Theme.of(this).textTheme.titleMedium;

  TextStyle? get titleSmall => Theme.of(this).textTheme.titleSmall;

  TextStyle? get labelLarge => Theme.of(this).textTheme.labelLarge;

  TextStyle? get bodySmall => Theme.of(this).textTheme.bodySmall;

  TextStyle? get titleTextStyle => Theme.of(this).appBarTheme.titleTextStyle;

  TextStyle? get bodyExtraSmall =>
      bodySmall?.copyWith(fontSize: 10, height: 1.6, letterSpacing: .5);

  TextStyle? get bodyLarge => Theme.of(this).textTheme.bodyLarge;

  TextStyle? get headlineSmall => Theme.of(this).textTheme.headlineSmall;

  TextStyle? get bodyMedium => Theme.of(this).textTheme.bodyMedium;

  TextStyle? get dividerTextSmall => bodySmall?.copyWith(
      letterSpacing: 0.5, fontWeight: FontWeight.w700, fontSize: 12.0);

  TextStyle? get dividerTextLarge => bodySmall?.copyWith(
      letterSpacing: 1.5,
      fontWeight: FontWeight.w700,
      fontSize: 13.0,
      height: 1.23);

  ThemeData get theme => Theme.of(this);

  Color get primaryColor => Theme.of(this).primaryColor;

  Color get primaryColorDark => Theme.of(this).primaryColorDark;

  Color get primaryColorLight => Theme.of(this).primaryColorLight;

  Color get primary => Theme.of(this).colorScheme.primary;

  Color get onPrimary => Theme.of(this).colorScheme.onPrimary;

  Color get secondary => Theme.of(this).colorScheme.secondary;

  Color get onSecondary => Theme.of(this).colorScheme.onSecondary;

  Color get cardColor => Theme.of(this).cardColor;

  Color get errorColor => Theme.of(this).colorScheme.error;
  InputDecorationTheme get inputDecorationTheme =>
      Theme.of(this).inputDecorationTheme;

  Color get background => Theme.of(this).colorScheme.background;
  Color get dialogBackgroundColor => Theme.of(this).dialogBackgroundColor;

  void nextFocus([FocusNode? node]) => FocusScope.of(this).requestFocus(node);
  void unfocus({UnfocusDisposition disposition = UnfocusDisposition.scope}) =>
      FocusScope.of(this).unfocus();

  void dismissTrey() => OverlaySupportEntry.of(this)!.dismiss();
}
