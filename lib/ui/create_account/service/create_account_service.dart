import 'dart:convert';
import 'dart:io';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:pouchers/app/helpers/network_helpers.dart';
import 'package:pouchers/app/helpers/service_constants.dart';
import 'package:pouchers/app/helpers/service_response.dart';
import 'package:pouchers/ui/create_account/models/create_account_response.dart';
import 'package:pouchers/utils/extras.dart';
import 'package:pouchers/utils/logger.dart';
import 'package:pouchers/utils/strings.dart';

class CreateAccountService {
  static Future<ServiceResponse<CreateAccountResponse>> createAccount(
      {required String firstName,
      required String lastName,
      required String email,
      required String phoneNumber,
      required String password,
      String? referral}) async {
    Map<String, String> _authHeaders = {
      HttpHeaders.connectionHeader: "keep-alive",
      HttpHeaders.contentTypeHeader: "application/json",
    };

    String url = "${baseUrl()}/auth/signup";

    log(url);
    Map<String, dynamic> body = {
      "first_name": firstName,
      "last_name": lastName,
      "email": email,
      "phone_number": phoneNumber,
      "password": password
    };
    log("what is body $body");

    try {
      http.Response response = await http.post(
        Uri.parse(url),
        headers: _authHeaders,
        body: jsonEncode(body),
      );
      logResponse(response);
      var responseBody = jsonDecode(response.body);
      // logResponse(response);
      if (response.statusCode >= 300 && response.statusCode <= 520) {
        throw Failure.fromJson(responseBody);
      } else {
        return serveSuccess<CreateAccountResponse>(
            data: CreateAccountResponse.fromJson(responseBody),
            message: responseBody["message"]);
      }
    } catch (error, stack) {
      log(error);
      log(stack);
      return processServiceError<CreateAccountResponse>(error, stack);
    }
  }

  static Future<ServiceResponse<VerifyEmailResponse>> verifyEmail({
    required String otp,
  }) async {
    Map<String, String> _authHeaders = {
      HttpHeaders.connectionHeader: "keep-alive",
      HttpHeaders.contentTypeHeader: "application/json",
    };

    String url = "${baseUrl()}/auth/verify-email";

    log(url);

    log("what is body $otp");

    try {
      http.Response response = await http.post(
        Uri.parse(url),
        headers: _authHeaders,
        body: jsonEncode({"otp": otp}),
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

  static Future<ServiceResponse<TagResponse>> createTag(
      {required String tag, required String token}) async {
    Map<String, String> _authHeaders = {
      HttpHeaders.connectionHeader: "keep-alive",
      HttpHeaders.contentTypeHeader: "application/json",
      HttpHeaders.authorizationHeader: "Bearer $token"
    };

    String url = "${baseUrl()}/auth/create-tag";

    log(url);

    log("what is body $tag");

    try {
      http.Response response = await http.post(
        Uri.parse(url),
        headers: _authHeaders,
        body: jsonEncode({"tag": tag}),
      );
      logResponse(response);
      var responseBody = jsonDecode(response.body);
      if (response.statusCode >= 300 && response.statusCode <= 520) {
        throw Failure.fromJson(responseBody);
      } else {
        return serveSuccess<TagResponse>(
            data: TagResponse.fromJson(responseBody),
            message: responseBody["message"]);
      }
    } catch (error, stack) {
      log(error);
      log(stack);
      return processServiceError<TagResponse>(error, stack);
    }
  }

  static Future<ServiceResponse<String>> resendVerificationEmail({
    required String email,
  }) async {
    Map<String, String> _authHeaders = {
      HttpHeaders.connectionHeader: "keep-alive",
      HttpHeaders.contentTypeHeader: "application/json",
    };

    String url = "${baseUrl()}/auth/resend-confirmation";

    log(url);
    log("what is body $email");

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
}
