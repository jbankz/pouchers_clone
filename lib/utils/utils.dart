import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:Pouchers/data/liveness_check_response.dart';
import 'package:Pouchers/utils/flushbar.dart';
import 'package:Pouchers/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dojah_kyc/flutter_dojah_kyc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:intl/intl.dart';
import 'package:Pouchers/utils/logger.dart';

class Utils {
  static String handleRequestError(Exception e) {
    if (e is SocketException) {
      logSocketException(e);
      return "No internet connection, please try again";
    } else if (e is TimeoutException) {
      logTimeoutException(e);
      return "Request timed out, please try again";
    } else if (e is FormatException || e is ClientException || e is HandshakeException) {
      logPrint(e);
      return "Something went wrong, please try again";
    } else {
      return e.toString();
    }
  }
}

String capitalize(String s) => s[0].toUpperCase() + s.substring(1);

String kPriceFormatter(double price) => NumberFormat("#,##0.00", "en_US").format(price);

String formatTime(int seconds) => '${(Duration(seconds: seconds))}'.split('.').first.substring(2);

class ClientException implements Exception {
  final String message;
  final Uri uri;

  ClientException(this.message, this.uri);

  @override
  String toString() => message;
}

Future<Map<String, dynamic>?> startDojahWidget(
  BuildContext context, {
  required String type,
  Map<String, dynamic>? userData,
  Map<String, dynamic>? config,
  Map<String, dynamic>? metadata,
  required bool govtDataVerification,
}) async {
  final DojahKYC dojahKyc = DojahKYC(
    appId: dotenv.get(kDojahAppId),
    publicKey: dotenv.get(kDojahPublicKey),
    type: type,
    userData: userData,
    config: config,
    metaData: metadata,
  );

  Map<String, dynamic>? result;
  final Completer<Map<String, dynamic>?> submittedSuccessfully = Completer<Map<String, dynamic>?>();

  debugPrint("user response: $userData");


  await dojahKyc.open(
    context,
    onSuccess: (response) {
      JsonEncoder encoder = const JsonEncoder.withIndent('  ');
      String prettyResponse = encoder.convert(response);
      debugPrint("dojah response: $prettyResponse");

      Navigator.of(context).pop();

      List<dynamic> responseList = response;
      Map<String, dynamic> responseBody = jsonDecode(jsonEncode(responseList[0]));

      result = responseBody;

      if (govtDataVerification) {
        final String? idType = responseBody["idType"];
        final String? idNumber = responseBody["value"];

        if (idType != null && idNumber != null) {
          submittedSuccessfully.complete({
            "firstName": responseBody["data"]["government-data"]["data"]["entity"]["first_name"],
            "lastName": responseBody["data"]["government-data"]["data"]["entity"]["last_name"],
            "dob": responseBody["data"]["government-data"]["data"]["entity"]["date_of_birth"],
            "docType": idType,
            "docNo": idNumber,
          });
        }
      } else {
        final idData = IdCheckResponse.fromJson(responseBody["idData"]);

        if (idData.documentType != null && idData.documentNumber != null) {
          submittedSuccessfully.complete({
            "firstName": responseBody["data"]["government-data"]["data"]["entity"]["first_name"],
            "lastName": responseBody["data"]["government-data"]["data"]["entity"]["last_name"],
            "dob": responseBody["data"]["government-data"]["data"]["entity"]["date_of_birth"],
            "docType": idData.documentType,
            "docNo": idData.documentNumber,
          });
        }
      }
    },
    onClose: (_) {
      if (result == null) {
        debugPrint("dojah close - window");
        Navigator.pop(context);
      } else {
        debugPrint("dojah close - success");
      }
    },
    //TODO test onError call back
    onError: (e) {
      debugPrint("dojah error: $e");
    },
  );

  debugPrint("returned function");
  return await submittedSuccessfully.future;
}

String dateFormatter2 = 'dd MMM yyy';

extension DateHelper on DateTime {
  String formatDate(String format) {
    final formatter = DateFormat(format);
    return formatter.format(this);
  }

  bool isSameDate(DateTime other) {
    return this.year == other.year && this.month == other.month && this.day == other.day;
  }

  int getDifferenceInDaysWithNow() {
    final now = DateTime.now();
    return now.difference(this).inDays;
  }

  String capitalize(String s) => s[0].toUpperCase() + s.substring(1);
}
