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
    } else if (e is FormatException ||
        e is ClientException ||
        e is HandshakeException) {
      logPrint(e);
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

Future<Map<String, dynamic>?> startDojahWidget(
  BuildContext context, {
  required String type,
  Map<String, dynamic>? userData,
  Map<String, dynamic>? config,
  Map<String, dynamic>? metadata,
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
  Map<String, dynamic> submittedSuccessfully = {};

  await dojahKyc.open(
    context,
    onSuccess: (response) {
      JsonEncoder encoder = const JsonEncoder.withIndent('  ');
      String prettyResponse = encoder.convert(response);
      debugPrint("dojah response: $prettyResponse");

      // exit kyc widget

      //context.popRoute();

      List<dynamic> responseList = response;
      Map<String, dynamic> responseBody =
          jsonDecode(jsonEncode(responseList[0]));

      result = responseBody;
      responseBody["status"];
      submittedSuccessfully = {
        "firstName": responseBody["data"]["id"]["data"]["idData"]["last_name"]
            .toString()
            .split(" ")
            .first,
        "lastName": responseBody["data"]["id"]["data"]["idData"]["first_name"],
        "dob": responseBody["data"]["id"]["data"]["idData"]["date_of_birth"],
        "docType": responseBody["data"]["id"]["data"]["idData"]["document_type"],
        "docNo": responseBody["data"]["id"]["data"]["idData"]["document_number"]

      };

      Navigator.pop(context, submittedSuccessfully);
      final idData = IdCheckResponse.fromJson(responseBody["idData"]);
      final String? idImageUrl = responseBody["idUrl"];
      final String? verificationUrl = responseBody["verificationUrl"];

      // no need to check if dateIssued and expiryDate are not null as some IDs may not have them
      if (idImageUrl != null &&
          verificationUrl != null &&
          idData.documentType != null &&
          idData.documentNumber != null) {
        ///send d info to backend
        // final payload = IdVerificationPayload(
        //   idType: idData.documentType!,
        //   cardNumber: idData.documentNumber!,
        //   imageUrl: idImageUrl,
        //   verificationUrl: verificationUrl,
        //   issuedDate: idData.dateIssued,
        //   expiryDate: idData.expiryDate,
        // );

        // context
        //     .pushRoute(
        //         HandleIdUploadRoute(payload: payload, onboarding: onboarding))
        //     .then((value) {
        //   if (value is bool) {
        //     submittedSuccessfully.complete(value);
        //   } else {
        //     submittedSuccessfully.complete(null);
        //   }
        // });
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
  // return submittedSuccessfully;
   return submittedSuccessfully;

}

final configObj = {
  "debug": false,
  "mobile": true,
  // "review_process": "Automatic",
  "pages": [
    {
      "page": "user-data",
      "config": {"enabled": false}
    },
    {
      "page": "countries",
      "config": {"enabled": false}
    },
    {
      "page": "id",
      "config": {
        "passport": true,
        "dl": true,
        "nin": true,
        "voter": true,
        "custom": true
      }
    }
  ]
};

String dateFormatter2 = 'dd MMM yyy';

extension DateHelper on DateTime {
  String formatDate(String format) {
    final formatter = DateFormat(format);
    return formatter.format(this);
  }

  bool isSameDate(DateTime other) {
    return this.year == other.year &&
        this.month == other.month &&
        this.day == other.day;
  }

  int getDifferenceInDaysWithNow() {
    final now = DateTime.now();
    return now.difference(this).inDays;
  }
}
