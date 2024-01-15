import 'dart:io';
import 'package:flutter/widgets.dart';

class FieldValidator {
  static String? Function(String?) validateAlphaNumeric({String? error}) =>
      (String? value) {
        if (value!.isEmpty) {
          return error ?? 'Name is required.';
        }
        final RegExp nameExp = RegExp(r'^\w+$');
        if (!nameExp.hasMatch(value)) {
          return error ?? 'Please enter only alphanumeric characters.';
        }
        return null;
      };

  static String? Function(String?) validateAlpha({String? error}) =>
      (String? value) {
        if (value!.isEmpty) {
          return error ?? 'Name is required.';
        }
        final RegExp nameExp = RegExp(r'^[A-Za-z ]+$');
        if (!nameExp.hasMatch(value)) {
          return error ?? 'Please enter only alphabetical characters.';
        }
        return null;
      };

  static String? Function(String?) validateDouble({String? error}) =>
      (String? value) {
        if (value == null || value.isEmpty) {
          return error ?? 'Field is required.';
        }
        if ((double.tryParse(value) ?? 0.0) <= 0.0) {
          return error ?? 'Not a valid number.';
        }
        return null;
      };

  static String? Function(String?) validateNum(
          {String? error, int min = 1, int max = 10000}) =>
      (String? value) {
        if (value == null || value.isEmpty) {
          return error ?? 'Field is required.';
        }
        if (num.parse(value) < min) {
          return error ?? 'Expected minimum value is $min';
        }
        if (num.parse(value) > max) {
          return error ?? 'Expected maximum value is $max';
        }
        return null;
      };

  static String? Function(String?) validateCreditCard({String? error}) =>
      (String? value) {
        if (value == null || value.isEmpty) {
          return error ?? 'Field is required.';
        }
        value = getCleanedNumber(value);

        if (value.length < 16) return 'Invalid card number';

        return null;
      };

  static String? Function(String?) validateSmartCard(
          {String? error, int cardLength = 5}) =>
      (String? value) {
        if (value == null || value.isEmpty) {
          return error ?? 'Field is required.';
        }
        if (value.length < cardLength) {
          return 'Invalid smart card number';
        }
        if (error != null) return error;

        return null;
      };

  static String? Function(String?) validateMeterNumber(
          {String? error, int cardLength = 0}) =>
      (String? value) {
        if (value == null || value.isEmpty) {
          return error ?? 'Field is required.';
        }
        if (value.length != cardLength) {
          return 'Invalid meter number';
        }
        if (error != null) return error;

        return null;
      };

  static String? Function(String?) validateInt(
          {String? error,
          int? limit,
          TextEditingController? textEditingController}) =>
      (String? value) {
        if (value == null || value.isEmpty) {
          return error ?? 'Field is required.';
        }
        if ((int.tryParse(value) ?? 0.0) <= 0) {
          return error ?? 'Not a valid number.';
        }
        if (limit != null) {
          if (value.length < limit) {
            return error ?? 'Not a valid number';
          }
        }
        if (textEditingController != null) {
          if (textEditingController.text.isEmpty) {
            return 'Please fill in the above field.';
          }
        }
        return null;
      };

  static String? Function(String?) validateCVV({String? error}) =>
      (String? value) {
        if (value == null || value.isEmpty) {
          return error ?? 'Field is required.';
        }
        if (value.length < 3 || value.length > 4) {
          return "CVV is invalid";
        }
        return null;
      };

  static String? Function(String?) validateDate({String? error}) =>
      (String? value) {
        if (value == null || value.isEmpty) {
          return error ?? 'Field is required.';
        }

        int year;
        int month;
        // The value contains a forward slash if the month and year has been
        // entered.

        if (value.contains(RegExp(r'(/)'))) {
          final split = value.split(RegExp(r'(/)'));
          // The value before the slash is the month while the value to right of
          // it is the year.
          month = int.parse(split[0]);
          year = int.parse(split[1]);
        } else {
          // Only the month was entered
          month = int.parse(value.substring(0, (value.length)));
          year = -1; // Lets use an invalid year intentionally
        }

        if ((month < 1) || (month > 12)) {
          // A valid month is between 1 (January) and 12 (December)
          return 'Expiry month is invalid';
        }

        final fourDigitsYear = convertYearTo4Digits(year);
        if ((fourDigitsYear < 1) || (fourDigitsYear > 2099)) {
          // We are assuming a valid should be between 1 and 2099.
          // Note that, it's valid doesn't mean that it has not expired.
          return 'Expiry year is invalid';
        }

        if (!hasDateExpired(month, year)) {
          return "Card has expired";
        }
        return null;
      };

  static String? Function(String?) validateEmail({String? error}) =>
      (String? value) {
        if (value!.isEmpty) {
          return error ?? 'Enter a valid email address';
        }
        if (!value.contains('@')) {
          return error ?? 'Not a valid email.';
        }
        if (value.contains(' ')) {
          return error ?? 'Spaces are not allowed';
        }
        if (error != null) return error;

        /*   if (!value.contains('@gmail.com') &&
          !value.contains('@yahoo.com') &&
          !value.contains('@hotmail.com')) {
        return error ?? 'Invalid email addresses not allowed';
      } */
        return null;
      };

  static String? Function(String?) validatePhone(
          {String? error, int maximum = 11}) =>
      (String? value) {
        if (value!.isEmpty) {
          return error ?? 'Enter a valid phone number';
        }
        if (!RegExp(r'^\d+?$').hasMatch(value) ||
            !value.startsWith(RegExp("0[1789]")) ||
            // Land lines eg 01
            (value.startsWith("01") && value.length != 9) ||
            // Land lines eg 080
            (value.startsWith(RegExp("0[789]")) && value.length != maximum)) {
          return error ?? 'Not a valid phone number.';
        }
        return null;
      };

  static String? Function(String?) validateFrequency(String frequency) =>
      (String? value) {
        if (frequency.trim().isEmpty) {
          'Please select a frequency rate';
        }
        return null;
      };

  static String? Function(String?) validateString(
          {String? error, int? min, int? max}) =>
      (String? value) {
        if (value == null || value.isEmpty || value.trim().isEmpty) {
          return error ?? 'Field is required.';
        }
        if (error != null && error.isNotEmpty) {
          return error;
        }
        if ((min != null) && (value.length < min)) {
          return error ?? 'Minimum length should be $min';
        }
        if ((max != null) && (value.length > max)) {
          return error ?? 'Maximum length should be $max';
        }
        return null;
      };

  static String? Function(String?) validateOTP({String? error}) =>
      (String? value) {
        if (value == null || value.isEmpty || value.trim().isEmpty) {
          return error ?? 'OTP field is required.';
        }
        if (value.length < 4) {
          return 'Invalid Code';
        }
        if (error != null) return error;
        return null;
      };

  static String? Function(String?) validateSpecialPassword({String? error}) =>
      (String? value) {
        if (value == null || value.isEmpty || value.trim().isEmpty) {
          return error ?? 'Password must contain alphabets and numbers';
        }

        if (!RegExp(r'^(?=.*[A-Z])').hasMatch(value)) {
          return error ?? 'Should contain at least one upper case';
        }

        if (!RegExp(r'^(?=.*[a-z])').hasMatch(value)) {
          return error ?? 'Should contain at least one lower case';
        }

        if (!RegExp(r'^(?=.*?[0-9])').hasMatch(value)) {
          return error ?? 'Should contain at least one digit';
        }

        if (!RegExp(r'^(?=.*?[!@.,<>#\$&*~])').hasMatch(value)) {
          return error ?? 'Should contain at least one Special character';
        }
        if (!RegExp(r'^.{8,}').hasMatch(value)) {
          return error ?? 'Must be at least 8 characters in length';
        }
        return null;
      };

  static String? Function(String?) validatePlainPass({String? error}) =>
      (String? value) {
        if (value == null || value.isEmpty || value.trim().isEmpty) {
          return 'Password is required';
        } else if (value.length < 8 || value.length > 255) {
          return 'Password must be a minimum 8 characters';
        }
        return null;
      };

  static String? Function(File) validateFile({String? error}) => (File file) {
        if (file.path.isEmpty) {
          return error ?? 'Invalid File.';
        }
        return null;
      };

  static String? Function(String?) validateAmount(
          {String? error,
          double? minAmount = 100,
          double? maxAmount = 10000000000}) =>
      (String? value) {
        value = value?.replaceAll(",", "");

        if (value?.isEmpty ?? false) {
          return error ?? 'Amount is required.';
        }
        if (double.tryParse(value ?? '0') == null) {
          return error ?? 'Invalid Amount.';
        }
        if (!RegExp(r'^\d+(\.\d{1,2})?$').hasMatch(value ?? '0')) {
          return error ?? 'Not a valid amount.';
        }
        if (double.tryParse(value ?? '0')! <= 0.0) {
          return error ?? 'Zero Amount is not allowed.';
        }
        if (double.tryParse(value ?? '0')! < minAmount!) {
          return error ?? 'Minimum amount allow is $minAmount';
        }
        if (double.tryParse(value ?? '0')! > maxAmount!) {
          return 'Maximum amount allow is $maxAmount';
        }
        return null;
      };

  static String? Function(String?) validateDiffChange(
          TextEditingController field,
          [String? error]) =>
      (String? value) {
        if (field.text != value) return error ?? 'Passwords don\'t match';

        return null;
      };

  static String? Function(String?) validatePassword(
          TextEditingController passwordController,
          {String? error}) =>
      (String? value) {
        if (value == null || value.isEmpty)
          return error ?? 'Please enter a password.';

        return validateDiffChange(
            passwordController, error ?? 'The passwords don\'t match')(value);
      };

  /// Convert the two-digit year to four-digit year if necessary
  static int convertYearTo4Digits(int year) {
    if (year < 100 && year >= 0) {
      final now = DateTime.now();
      final String currentYear = now.year.toString();
      final String prefix = currentYear.substring(0, currentYear.length - 2);
      year = int.parse('$prefix${year.toString().padLeft(2, '0')}');
    }
    return year;
  }

  static bool hasDateExpired(int month, int year) => isNotExpired(year, month);

  // It has not expired if both the year and date has not passed
  static bool isNotExpired(int year, int month) =>
      !hasYearPassed(year) && !hasMonthPassed(year, month);

  static List<int> getExpiryDate(String value) {
    final split = value.split(RegExp(r'(/)'));
    return [int.parse(split[0]), int.parse(split[1])];
  }

  static bool hasMonthPassed(int year, int month) {
    final now = DateTime.now();
    // The month has passed if:
    // 1. The year is in the past. In that case, we just assume that the month
    // has passed
    // 2. Card's month (plus another month) is more than current month.
    return hasYearPassed(year) ||
        convertYearTo4Digits(year) == now.year && (month < now.month + 1);
  }

  static bool hasYearPassed(int year) {
    final int fourDigitsYear = convertYearTo4Digits(year);
    final now = DateTime.now();
    // The year has passed if the year we are currently is more than card's
    // year
    return fourDigitsYear < now.year;
  }

  static String getCleanedNumber(String text) {
    final RegExp regExp = RegExp(r"[^0-9]");
    return text.replaceAll(regExp, '');
  }
}
