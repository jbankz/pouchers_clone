import 'dart:convert';
import 'dart:io';

import 'package:Pouchers/app/helpers/service_constants.dart';
import 'package:Pouchers/app/helpers/service_response.dart';
import 'package:http/http.dart' as http;
import 'package:Pouchers/modules/cards/model/cards_model.dart';
import 'package:Pouchers/utils/extras.dart';
import 'package:Pouchers/utils/logger.dart';

class CardsService {
  static Future<ServiceResponse<String>> createVirtualCard(
      {required String token,
      // required String address,
      // required String city,
      // required String state,
      required String country,
     // required String postalCode,
      required String currency,
      required String bvn,
      required String brand,
      required double amount,
      required String transactionPin}) async {
    Map<String, String> _authHeaders = {
      HttpHeaders.connectionHeader: "keep-alive",
      HttpHeaders.contentTypeHeader: "application/json",
      HttpHeaders.authorizationHeader: "Bearer $token"
    };

    Map<String, dynamic> body = {
      // "line1": address,
      // "city": city,
      // "state": state,
      "country": country,
      // "postalCode": postalCode,
      "currency": currency,
      "brand": brand,
      "bvn": bvn,
      "amount": amount,
      "transactionPin": transactionPin
    };

    String url = "${baseUrl()}/card";

    logPrint(url);
    logPrint(body);

    try {
      http.Response response = await http.post(Uri.parse(url),
          headers: _authHeaders, body: jsonEncode(body));
      logResponse(response);
      var responseBody = jsonDecode(response.body);
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

  static Future<ServiceResponse<GetAllCardsResponse>> getAllVirtualCards(
      {required String token, required String userId}) async {
    Map<String, String> _authHeaders = {
      HttpHeaders.connectionHeader: "keep-alive",
      HttpHeaders.contentTypeHeader: "application/json",
      HttpHeaders.authorizationHeader: "Bearer $token"
    };

    String url = "${baseUrl()}/card/$userId/all";

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
        return serveSuccess<GetAllCardsResponse>(
            data: GetAllCardsResponse.fromJson(responseBody),
            message: responseBody["message"]);
      }
    } catch (error, stack) {
      logPrint(error);
      logPrint(stack);
      return processServiceError<GetAllCardsResponse>(error, stack);
    }
  }

  static Future<ServiceResponse<FetchEnvs>> getAllFees(
      {required String token, required double amount}) async {
    Map<String, String> _authHeaders = {
      HttpHeaders.connectionHeader: "keep-alive",
      HttpHeaders.contentTypeHeader: "application/json",
      HttpHeaders.authorizationHeader: "Bearer $token"
    };

    String url = "${baseUrl()}/admin-settings/envs?amount=$amount";

    logPrint("$url amount $amount");

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
        return serveSuccess<FetchEnvs>(
            data: FetchEnvs.fromJson(responseBody),
            message: responseBody["message"]);
      }
    } catch (error, stack) {
      logPrint(error);
      logPrint(stack);
      return processServiceError<FetchEnvs>(error, stack);
    }
  }

  static Future<ServiceResponse<String>> fundVirtualCard(
      {required String token,
      required String type,
      required double amount,
      required String transactionPin}) async {
    Map<String, String> _authHeaders = {
      HttpHeaders.connectionHeader: "keep-alive",
      HttpHeaders.contentTypeHeader: "application/json",
      HttpHeaders.authorizationHeader: "Bearer $token"
    };

    Map<String, dynamic> body = {
      "currency": type,
      "amount": amount,
      "transactionPin": transactionPin
    };

    String url = "${baseUrl()}/card/fund";

    logPrint(url);
    logPrint(body);

    try {
      http.Response response = await http.post(Uri.parse(url),
          headers: _authHeaders, body: jsonEncode(body));
      logResponse(response);
      var responseBody = jsonDecode(response.body);
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

  static Future<ServiceResponse<GetCardDetailsResponse>> getCardDetails(
      {required String token, required String cardId}) async {
    Map<String, String> _authHeaders = {
      HttpHeaders.connectionHeader: "keep-alive",
      HttpHeaders.contentTypeHeader: "application/json",
      HttpHeaders.authorizationHeader: "Bearer $token"
    };

    String url = "${baseUrl()}/card/$cardId/details";

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
        return serveSuccess<GetCardDetailsResponse>(
            data: GetCardDetailsResponse.fromJson(responseBody),
            message: responseBody["message"]);
      }
    } catch (error, stack) {
      logPrint(error);
      logPrint(stack);
      return processServiceError<GetCardDetailsResponse>(error, stack);
    }
  }

  static Future<ServiceResponse<String>> getCardToken(
      {required String token, required String cardId}) async {
    Map<String, String> _authHeaders = {
      HttpHeaders.connectionHeader: "keep-alive",
      HttpHeaders.contentTypeHeader: "application/json",
      HttpHeaders.authorizationHeader: "Bearer $token"
    };

    String url = "${baseUrl()}/card/$cardId/token";

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
        return serveSuccess<String>(
            data: responseBody["data"]["token"],
            message: responseBody["message"]);
      }
    } catch (error, stack) {
      logPrint(error);
      logPrint(stack);
      return processServiceError<String>(error, stack);
    }
  }

  static Future<ServiceResponse<String>> freezeCard({
    required String token,
    required String cardId,
    required String type,
    required String transactionPin,
  }) async {
    Map<String, String> _authHeaders = {
      HttpHeaders.connectionHeader: "keep-alive",
      HttpHeaders.contentTypeHeader: "application/json",
      HttpHeaders.authorizationHeader: "Bearer $token"
    };

    String url = "${baseUrl()}/card/$cardId";

    logPrint(url);

    Map<String, dynamic> body = {
      "status": "inactive",
      "currency": type,
      "transactionPin": transactionPin
    };

    logPrint(body);

    try {
      http.Response response = await http.patch(Uri.parse(url),
          headers: _authHeaders, body: jsonEncode(body));
      logResponse(response);
      var responseBody = jsonDecode(response.body);
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

  static Future<ServiceResponse<String>> getCardBalance(
      {required String token, required String cardId}) async {
    Map<String, String> _authHeaders = {
      HttpHeaders.connectionHeader: "keep-alive",
      HttpHeaders.contentTypeHeader: "application/json",
      HttpHeaders.authorizationHeader: "Bearer $token"
    };

    String url = "${baseUrl()}/card/accounts/$cardId/balance";

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
        return serveSuccess<String>(
            data: responseBody["data"]["availableBalance"].toString(),
            message: responseBody["message"]);
      }
    } catch (error, stack) {
      logPrint(error);
      logPrint(stack);
      return processServiceError<String>(error, stack);
    }
  }

}
