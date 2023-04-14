import 'dart:convert';
import 'dart:io';

import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pouchers/app/helpers/service_constants.dart';
import 'package:pouchers/app/helpers/service_response.dart';
import 'package:pouchers/app/helpers/session_manager.dart';
import 'package:pouchers/data/hive_data.dart';
import 'package:pouchers/modules/login/models/login_response.dart';
import 'package:pouchers/utils/extras.dart';
import 'package:pouchers/utils/logger.dart';
import 'package:pouchers/utils/strings.dart';
import 'package:http/http.dart' as http;

DateTime nowDate = DateTime.now().add(Duration(minutes: 5));

Future<void> persistAccessToken(
    {required String accessToken, required DateTime tokenExpiry}) async {
  try {
    await Hive.box(kTokenBox).put(kAccessTokenKey, accessToken);
    await Hive.box(kTokenBox).put(kAccessTokenExpiryKey, tokenExpiry);
    await Hive.box(kTokenBox).listenable();
  } catch (e) {
    throw "An error occurred.";
  }
}

Future<void> persistRefreshToken(String refreshToken) async {
  try {
    await Hive.box(kTokenBox).put(kRefreshTokenKey, refreshToken);
    await Hive.box(kTokenBox).listenable();
  } catch (e) {
    throw "An error occurred.";
  }
}

Future refreshToken({
  required String refreshToken,
}) async {
  Map<String, String> _authHeaders = {
    HttpHeaders.connectionHeader: "keep-alive",
    HttpHeaders.contentTypeHeader: "application/json",
  };

  String url = "${baseUrl()}/auth/refresh-token";

  logPrint(url);
  logPrint(refreshToken);

  try {
    http.Response response = await http.put(Uri.parse(url),
        headers: _authHeaders,
        body: jsonEncode({"refresh_token": refreshToken}));
    logResponse(response);
    var responseBody = jsonDecode(response.body);
    if (response.statusCode >= 300 && response.statusCode <= 520) {
      throw Failure.fromJson(responseBody);
    } else {
      logPrint("refresh ${responseBody["data"]["refreshToken"]}");
      await cacheUserProfile(HiveStoreResponseData.fromJson(responseBody["data"]));

      await persistAccessToken(
          accessToken: responseBody["data"]["token"],
          tokenExpiry: DateTime.parse(responseBody["data"]["tokenExpireAt"]));

      await persistRefreshToken(responseBody["data"]["refreshToken"]);
      SessionManager.setAccessToken(responseBody["data"]["token"]);
      SessionManager.setRefreshAccessToken(
          responseBody["data"]["refreshToken"]);
      print("network token${responseBody["data"]["refreshToken"]}");
      //b709eee202a
      return serveSuccess(
          data: responseBody["message"], message: responseBody["message"]);
    }
  } catch (error, stack) {
    logPrint(error);
    logPrint(stack);
    return processServiceError(error, stack);
  }
}

Future<String?> getAccessToken() async {
  await Hive.openBox(kTokenBox);
  var expiredToken = await Hive.box(kTokenBox).get(kAccessTokenExpiryKey);
  // await Hive.box(kTokenBox).listenable();
  if (Hive.box(kTokenBox).get("session_start") != null &&
      DateTime.now().isAfter(Hive.box(kTokenBox).get("session_start").add(
          Duration(hours: expiredToken.hour, minutes: expiredToken.minute)))) {
    try {
      // await AuthRepositoryImpl().refreshToken();
      String? token = Hive.box(kTokenBox).get(kAccessTokenKey);

      if (token != null) {
        return Future.value(token);
      } else {
        throw "Token error occurred.";
      }
    } catch (e, s) {
      print(e);
      print(s);
      throw "Something went wrong.";
    }
  } else {
    String? token = Hive.box(kTokenBox).get(kAccessTokenKey);

    if (token != null) {
      return Future.value(token);
    } else {
      throw "An error occurred.";
    }
  }
}

Future<String?> getRefreshToken() async {
  await Hive.openBox(kTokenBox);

  try {
    String? token = Hive.box(kTokenBox).get(kRefreshTokenKey);

    if (token != null) {
      return Future.value(token);
    } else {
      throw "Token error occurred.";
    }
  } catch (e, s) {
    print(e);
    print(s);
    throw "Something went wrong.";
  }
}
