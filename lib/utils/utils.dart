import 'dart:async';
import 'dart:io';

import 'package:flutter_boilerplate/utils/logger.dart';
import 'package:intl/intl.dart';

class Utils {
  static String handleRequestError(Exception e) {
    if (e is SocketException) {
      logSocketException(e);
      return "No internet connection, please try again";
    } else if (e is TimeoutException) {
      logTimeoutException(e);
      return "Request timed out, please try again";
    } else if (e is FormatException || e is ClientException) {
      log(e);
      return "Something went wrong, please try again";
    } else {
      return e.toString();
    }
  }
}

String capitalize(String s) => s[0].toUpperCase() + s.substring(1);

String kPriceFormatter(double price) =>
    NumberFormat("#,##0.00", "en_US").format(price);

String formatTime(int seconds) =>
    '${(Duration(seconds: seconds))}'.split('.').first.substring(2);

class ClientException implements Exception {
  final String message;
  final Uri uri;

  ClientException(this.message, this.uri);

  @override
  String toString() => message;
}
