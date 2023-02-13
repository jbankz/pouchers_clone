import 'dart:convert';
import 'dart:io';

import 'package:pouchers/app/helpers/service_constants.dart';
import 'package:pouchers/app/helpers/service_response.dart';
import 'package:pouchers/modules/transactions/model/transaction_model.dart';
import 'package:pouchers/utils/extras.dart';
import 'package:pouchers/utils/logger.dart';
import 'package:http/http.dart' as http;

class TransactionService {
  static Future<ServiceResponse<GetTransactionsResponse>>
      getTransactionHistory({
    required String status,
    required String token,
  }) async {
    Map<String, String> _authHeaders = {
      HttpHeaders.connectionHeader: "keep-alive",
      HttpHeaders.contentTypeHeader: "application/json",
      HttpHeaders.authorizationHeader: "Bearer $token"
    };

    String url = status == ""
        ? "${baseUrl()}/user/transaction-history"
        : "${baseUrl()}/user/transaction-history?category=$status";

    logPrint(url);

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
        return serveSuccess<GetTransactionsResponse>(
            data: GetTransactionsResponse.fromJson(responseBody),
            message: responseBody["message"]);
      }
    } catch (error, stack) {
      logPrint(error);
      logPrint(stack);
      return processServiceError<GetTransactionsResponse>(error, stack);
    }
  }

  static Future<ServiceResponse<TransactionAnalyticsResponse>>
  getTransactionAnalytics({
    required String month,
    required String year,
    required String token,
  }) async {
    Map<String, String> _authHeaders = {
      HttpHeaders.connectionHeader: "keep-alive",
      HttpHeaders.contentTypeHeader: "application/json",
      HttpHeaders.authorizationHeader: "Bearer $token"
    };

    String url = "${baseUrl()}/user/transaction-analytics?month=$month&year=$year";

    logPrint(url);

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
        return serveSuccess<TransactionAnalyticsResponse>(
            data: TransactionAnalyticsResponse.fromJson(responseBody),
            message: responseBody["message"]);
      }
    } catch (error, stack) {
      logPrint(error);
      logPrint(stack);
      return processServiceError<TransactionAnalyticsResponse>(error, stack);
    }
  }
}
