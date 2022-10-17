import 'dart:convert';
import 'dart:io';

import 'package:hive/hive.dart';
import 'package:pouchers/app/helpers/network_helpers.dart';
import 'package:pouchers/app/helpers/service_constants.dart';
import 'package:pouchers/app/helpers/service_response.dart';
import 'package:pouchers/ui/create_account/models/create_account_response.dart';
import 'package:pouchers/utils/extras.dart';
import 'package:pouchers/utils/logger.dart';
import 'package:pouchers/utils/strings.dart';
import 'package:http/http.dart' as http;

class LogInService {
  static Future<ServiceResponse<VerifyEmailResponse>> logIn(
      {required String phoneNumber,
      required String password,
      required bool isEmail,
      }) async {
    Map<String, String> _authHeaders = {
      HttpHeaders.connectionHeader: "keep-alive",
      HttpHeaders.contentTypeHeader: "application/json",
    };

    String url = "${baseUrl()}/auth/login";

    log(url);

    Map<String, dynamic> body = isEmail
        ? {"email": phoneNumber, "password": password}
        : {"phone_number": phoneNumber, "password": password};

    log("what is body $body");

    try {
      http.Response response = await http.post(
        Uri.parse(url),
        headers: _authHeaders,
        body: jsonEncode(body),
      );
      logResponse(response);
      var responseBody = jsonDecode(response.body);
      if (response.statusCode >= 300 && response.statusCode <= 520) {
        throw Failure.fromJson(responseBody);
      } else {
        //Start with new slate in case where a user account logs in on a new device that was in use by another device
        await Hive.box(kTokenBox).clear();
        await persistAccessToken(
            accessToken: responseBody["data"]["token"],
            tokenExpiry: DateTime.parse(responseBody["data"]["tokenExpireAt"]));
        await persistRefreshToken(responseBody["data"]["refreshToken"]);
        await Hive.box(kTokenBox).put("session_start", DateTime.now());

        return serveSuccess<VerifyEmailResponse>(
            data: VerifyEmailResponse.fromJson(responseBody),
            message: responseBody["message"]);
      }
    } catch (error, stack) {
      log(error);
      log(stack);
      return processServiceError<VerifyEmailResponse>(error, stack);
    }
  }

  static Future<ServiceResponse<String>> forgotPassword(
      {required String email, required String token}) async {
    Map<String, String> _authHeaders = {
      HttpHeaders.connectionHeader: "keep-alive",
      HttpHeaders.contentTypeHeader: "application/json",
      HttpHeaders.authorizationHeader: "Bearer $token"
    };

    String url = "${baseUrl()}/auth/forgot-password";

    log(url);

    try {
      http.Response response = await http.post(
        Uri.parse(url),
        headers: _authHeaders,
        body: jsonEncode({"email": email}),
      );
      logResponse(response);
      var responseBody = jsonDecode(response.body);
      if (response.statusCode >= 300 && response.statusCode <= 520) {
        throw Failure.fromJson(responseBody);
      } else {
        return serveSuccess<String>(
            data: responseBody["message"], message: responseBody["message"]);
      }
    } catch (error, stack) {
      log(error);
      log(stack);
      return processServiceError<String>(error, stack);
    }
  }

  static Future<ServiceResponse<String>> validateForgotPassword(
      {required String email,
      required String resetCode,
      required String token}) async {
    Map<String, String> _authHeaders = {
      HttpHeaders.connectionHeader: "keep-alive",
      HttpHeaders.contentTypeHeader: "application/json",
      HttpHeaders.authorizationHeader: "Bearer $token"
    };

    String url = "${baseUrl()}/auth/validate-password-reset-code";

    log(url);

    try {
      http.Response response = await http.post(
        Uri.parse(url),
        headers: _authHeaders,
        body: jsonEncode({
          "email": email,
          "reset_code": resetCode,
        }),
      );
      logResponse(response);
      var responseBody = jsonDecode(response.body);
      if (response.statusCode >= 300 && response.statusCode <= 520) {
        throw Failure.fromJson(responseBody);
      } else {
        return serveSuccess<String>(
            data: responseBody["message"], message: responseBody["message"]);
      }
    } catch (error, stack) {
      log(error);
      log(stack);
      return processServiceError<String>(error, stack);
    }
  }

  static Future<ServiceResponse<String>> resetPassword(
      {required String email,
        required String password,
        required String token}) async {
    Map<String, String> _authHeaders = {
      HttpHeaders.connectionHeader: "keep-alive",
      HttpHeaders.contentTypeHeader: "application/json",
      HttpHeaders.authorizationHeader: "Bearer $token"
    };

    String url = "${baseUrl()}/auth/reset-password";

    log(url);

    try {
      http.Response response = await http.put(
        Uri.parse(url),
        headers: _authHeaders,
        body: jsonEncode({
          "email": email,
          "password": password,
        }),
      );
      logResponse(response);
      var responseBody = jsonDecode(response.body);
      if (response.statusCode >= 300 && response.statusCode <= 520) {
        throw Failure.fromJson(responseBody);
      } else {
        return serveSuccess<String>(
            data: responseBody["message"], message: responseBody["message"]);
      }
    } catch (error, stack) {
      log(error);
      log(stack);
      return processServiceError<String>(error, stack);
    }
  }
}
