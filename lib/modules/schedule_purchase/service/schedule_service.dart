import 'dart:convert';
import 'dart:io';

import 'package:pouchers/app/helpers/service_constants.dart';
import 'package:pouchers/app/helpers/service_response.dart';
import 'package:pouchers/modules/utilities/model/utilities_model.dart';
import 'package:pouchers/utils/extras.dart';
import 'package:pouchers/utils/logger.dart';
import 'package:http/http.dart' as http;

class ScheduleService {
  static Future<ServiceResponse<String>> scheduleP2PTransfer(
      {required String category,
      required String subCategory,
      required String frequency,
      required String token,
      required String tag,
      required double amount,
      required String note,
      required String transactionPin,
      String? status,
      String? scheduleId}) async {
    Map<String, String> _authHeaders = {
      HttpHeaders.connectionHeader: "keep-alive",
      HttpHeaders.contentTypeHeader: "application/json",
      HttpHeaders.authorizationHeader: "Bearer $token"
    };

    String url = scheduleId != null
        ? "${baseUrl()}/payment/p2p/schedule/$scheduleId"
        : "${baseUrl()}/payment/p2p/schedule";

    logPrint(url);

    Map<String, dynamic> body = scheduleId != null
        ? {
            "frequency": frequency,
            "transactionPin": transactionPin,
            "status": status
          }
        : {
            "category": category,
            "sub_category": subCategory,
            "frequency": frequency,
            "tag": tag,
            "amount": amount,
            "note": note,
            "transactionPin": transactionPin
          };

    logPrint("what is body $body");

    try {
      http.Response response = scheduleId != null
          ? await http.patch(
              Uri.parse(url),
              headers: _authHeaders,
              body: jsonEncode(body),
            )
          : await http.post(
              Uri.parse(url),
              headers: _authHeaders,
              body: jsonEncode(body),
            );
      logResponse(response);
      var responseBody = jsonDecode(response.body);
      print("error${response.statusCode}");
      if (response.statusCode >= 300 && response.statusCode <= 520) {
        throw Failure.fromJson(responseBody);
      } else {
        return serveSuccess<String>(
            data: responseBody["message"], message: responseBody["message"]);
      }
    } catch (error, stack) {
      logPrint(error);
      logPrint(stack);
      return processServiceError<String>(error, stack);
    }
  }

  static Future<ServiceResponse<String>> scheduleUtility({
    required String category,
    required String subCategory,
    required String frequency,
    required String token,
    required String customerId,
    required String amount,
    required String paymentCode,
    required String serviceId,
    required String transactionPin,
  }) async {
    Map<String, String> _authHeaders = {
      HttpHeaders.connectionHeader: "keep-alive",
      HttpHeaders.contentTypeHeader: "application/json",
      HttpHeaders.authorizationHeader: "Bearer $token"
    };

    String url = "${baseUrl()}/utility/schedule";

    logPrint(url);

    Map<String, dynamic> body = {
      "category": category,
      "sub_category": subCategory,
      "frequency": frequency,
      "destinationPhoneNumber": customerId,
      "amount": amount,
      "mobileOperatorPublicId": paymentCode,
      "transactionPin": transactionPin,
      "mobileOperatorServiceId": serviceId,
    };

    logPrint("what is body $body");

    try {
      http.Response response = await http.post(
        Uri.parse(url),
        headers: _authHeaders,
        body: jsonEncode(body),
      );
      logResponse(response);
      var responseBody = jsonDecode(response.body);
      print("error${response.statusCode}");
      if (response.statusCode >= 300 && response.statusCode <= 520) {
        throw Failure.fromJson(responseBody);
      } else {
        return serveSuccess<String>(
            data: responseBody["message"], message: responseBody["message"]);
      }
    } catch (error, stack) {
      logPrint(error);
      logPrint(stack);
      return processServiceError<String>(error, stack);
    }
  }

  static Future<ServiceResponse<String>> scheduleLocalTransfer(
      {required String frequency,
      required String token,
      required String accountNumber,
      required String bankName,
      required double amount,
      required String transactionPin,
      String? status,
      String? scheduleId}) async {
    Map<String, String> _authHeaders = {
      HttpHeaders.connectionHeader: "keep-alive",
      HttpHeaders.contentTypeHeader: "application/json",
      HttpHeaders.authorizationHeader: "Bearer $token"
    };

    String url = scheduleId != null
        ? "${baseUrl()}/payment/local-bank-transfer/schedule/$scheduleId"
        : "${baseUrl()}/payment/local-bank-transfer/schedule";

    logPrint(url);

    Map<String, dynamic> body = scheduleId != null
        ? {
            "frequency": frequency,
            "transactionPin": transactionPin,
            "bank_name": bankName,
            "status": status
          }
        : {
            "category": "local-bank-transfer",
            "sub_category": "none",
            "bank_name": bankName,
            "frequency": frequency,
            "account_number": accountNumber,
            "amount": amount,
            "note": "",
            "transactionPin": transactionPin
          };

    logPrint("what is body $body");

    try {
      http.Response response = scheduleId != null
          ? await http.patch(
              Uri.parse(url),
              headers: _authHeaders,
              body: jsonEncode(body),
            )
          : await http.post(
              Uri.parse(url),
              headers: _authHeaders,
              body: jsonEncode(body),
            );
      logResponse(response);
      var responseBody = jsonDecode(response.body);
      print("error${response.statusCode}");
      if (response.statusCode >= 300 && response.statusCode <= 520) {
        throw Failure.fromJson(responseBody);
      } else {
        return serveSuccess<String>(
            data: responseBody["message"], message: responseBody["message"]);
      }
    } catch (error, stack) {
      logPrint(error);
      logPrint(stack);
      return processServiceError<String>(error, stack);
    }
  }

  static Future<ServiceResponse<GetAllScheduleResponse>> getSchedule({
    required String token,
    required String category,
  }) async {
    Map<String, String> _authHeaders = {
      HttpHeaders.connectionHeader: "keep-alive",
      HttpHeaders.contentTypeHeader: "application/json",
      HttpHeaders.authorizationHeader: "Bearer $token"
    };

    String url = category == ""
        ? "${baseUrl()}/user/schedules"
        : "${baseUrl()}/user/schedules?category=$category";

    logPrint(url);

    try {
      http.Response response = await http.get(
        Uri.parse(url),
        headers: _authHeaders,
      );
      logResponse(response);
      var responseBody = jsonDecode(response.body);
      print("error${response.statusCode}");
      if (response.statusCode >= 300 && response.statusCode <= 520) {
        throw Failure.fromJson(responseBody);
      } else {
        return serveSuccess<GetAllScheduleResponse>(
            data: GetAllScheduleResponse.fromJson(responseBody),
            message: responseBody["message"]);
      }
    } catch (error, stack) {
      logPrint(error);
      logPrint(stack);
      return processServiceError<GetAllScheduleResponse>(error, stack);
    }
  }

  static Future<ServiceResponse<String>> editSchedule(
      {required String token,
      required String frequency,
      required String transactionPin,
      required String scheduleId,
      required String status}) async {
    Map<String, String> _authHeaders = {
      HttpHeaders.connectionHeader: "keep-alive",
      HttpHeaders.contentTypeHeader: "application/json",
      HttpHeaders.authorizationHeader: "Bearer $token"
    };

    Map<String, dynamic> body = {
      "frequency": frequency,
      "status": status,
      "transactionPin": transactionPin
    };

    String url = "${baseUrl()}/utility/schedule/$scheduleId";

    logPrint(url);
    logPrint(body);

    try {
      http.Response response = await http.patch(Uri.parse(url),
          headers: _authHeaders, body: jsonEncode(body));
      logResponse(response);
      var responseBody = jsonDecode(response.body);
      print("error${response.statusCode}");
      if (response.statusCode >= 300 && response.statusCode <= 520) {
        throw Failure.fromJson(responseBody);
      } else {
        return serveSuccess<String>(
            data: responseBody["message"], message: responseBody["message"]);
      }
    } catch (error, stack) {
      logPrint(error);
      logPrint(stack);
      return processServiceError<String>(error, stack);
    }
  }
}
