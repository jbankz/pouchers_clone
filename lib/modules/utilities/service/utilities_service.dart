import 'dart:convert';
import 'dart:io';

import 'package:pouchers/app/helpers/service_constants.dart';
import 'package:pouchers/app/helpers/service_response.dart';
import 'package:pouchers/modules/utilities/model/utilities_model.dart';
import 'package:pouchers/utils/extras.dart';
import 'package:pouchers/utils/logger.dart';
import 'package:http/http.dart' as http;

class UtilitiesService {
  static Future<ServiceResponse<String>> buyVoucher(
      {required String amount,
      required String token,
      required String transactionPin}) async {
    Map<String, String> _authHeaders = {
      HttpHeaders.connectionHeader: "keep-alive",
      HttpHeaders.contentTypeHeader: "application/json",
      HttpHeaders.authorizationHeader: "Bearer $token"
    };

    String url = "${baseUrl()}/voucher/buy";

    log(url);
    log("what is body $amount");

    try {
      http.Response response = await http.post(
        Uri.parse(url),
        headers: _authHeaders,
        body: jsonEncode({"amount": amount, "transactionPin": transactionPin}),
      );
      logResponse(response);
      var responseBody = jsonDecode(response.body);
      if (response.statusCode >= 300 && response.statusCode <= 520) {
        throw Failure.fromJson(responseBody);
      } else {
        return serveSuccess<String>(
            data: responseBody["data"]["voucher_code"],
            message: responseBody["message"]);
      }
    } catch (error, stack) {
      log(error);
      log(stack);
      return processServiceError<String>(error, stack);
    }
  }

  static Future<ServiceResponse<GetVoucherResponse>> fetchVouchers(
      {required String status, required String token}) async {
    Map<String, String> _authHeaders = {
      HttpHeaders.connectionHeader: "keep-alive",
      HttpHeaders.contentTypeHeader: "application/json",
      HttpHeaders.authorizationHeader: "Bearer $token"
    };

    String url = status == "" ? "${baseUrl()}/voucher" : "${baseUrl()}/voucher?status=$status";

    log(url);
    log("what is body $status");

    try {
      http.Response response = await http.get(
        Uri.parse(url),
        headers: _authHeaders,
      );
      logResponse(response);
      var responseBody = jsonDecode(response.body);
      if (response.statusCode >= 300 && response.statusCode <= 520) {
        throw Failure.fromJson(responseBody);
      } else {
        return serveSuccess<GetVoucherResponse>(
          data: GetVoucherResponse.fromJson(
            responseBody,
          ),
          message: responseBody["message"],
        );
      }
    } catch (error, stack) {
      log(error);
      log(stack);
      return processServiceError<GetVoucherResponse>(error, stack);
    }
  }

  static Future<ServiceResponse<String>> giftVoucher(
      {required String code,
      String? email,
      String? tag,
      required String token,
      required String transactionPin}) async {
    Map<String, String> _authHeaders = {
      HttpHeaders.connectionHeader: "keep-alive",
      HttpHeaders.contentTypeHeader: "application/json",
      HttpHeaders.authorizationHeader: "Bearer $token"
    };

    String url = "${baseUrl()}/voucher/gift";

    Map<String, dynamic> body = email == ""
        ? {
            "tag": tag,
            "code": code,
            "transactionPin": transactionPin,
          }
        : {
            "email": email,
            "code": code,
            "transactionPin": transactionPin,
          };

    log(url);
    log("what is body $body");

    try {
      http.Response response = await http.patch(
        Uri.parse(url),
        headers: _authHeaders,
        body: jsonEncode(body),
      );
      logResponse(response);
      var responseBody = jsonDecode(response.body);
      if (response.statusCode >= 300 && response.statusCode <= 520) {
        throw Failure.fromJson(responseBody);
      } else {
        return serveSuccess<String>(
            data: responseBody["message"],
            message: responseBody["message"]);
      }
    } catch (error, stack) {
      log(error);
      log(stack);
      return processServiceError<String>(error, stack);
    }
  }

  static Future<ServiceResponse<String>> redeemVoucher(
      {required String code,
        required String token,
        required String transactionPin}) async {
    Map<String, String> _authHeaders = {
      HttpHeaders.connectionHeader: "keep-alive",
      HttpHeaders.contentTypeHeader: "application/json",
      HttpHeaders.authorizationHeader: "Bearer $token"
    };

    String url = "${baseUrl()}/voucher/redeem";


    log(url);
    log("what is body $code");

    try {
      http.Response response = await http.patch(
        Uri.parse(url),
        headers: _authHeaders,
        body: jsonEncode({"code" : code}),
      );
      logResponse(response);
      var responseBody = jsonDecode(response.body);
      if (response.statusCode >= 300 && response.statusCode <= 520) {
        throw Failure.fromJson(responseBody);
      } else {
        return serveSuccess<String>(
            data: responseBody["message"],
            message: responseBody["message"]);
      }
    } catch (error, stack) {
      log(error);
      log(stack);
      return processServiceError<String>(error, stack);
    }
  }
}
