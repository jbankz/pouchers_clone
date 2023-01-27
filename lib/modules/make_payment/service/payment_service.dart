import 'dart:convert';
import 'dart:io';

import 'package:pouchers/app/helpers/service_constants.dart';
import 'package:pouchers/app/helpers/service_response.dart';
import 'package:pouchers/modules/make_payment/models/make_payment_model.dart';
import 'package:pouchers/utils/extras.dart';
import 'package:pouchers/utils/logger.dart';
import 'package:http/http.dart' as http;

class PaymentService {
  static Future<ServiceResponse<Map<String, dynamic>>> getContactByPoucherTag({
    required String token,
    required String poucherTag,
  }) async {
    Map<String, String> _authHeaders = {
      HttpHeaders.connectionHeader: "keep-alive",
      HttpHeaders.contentTypeHeader: "application/json",
      HttpHeaders.authorizationHeader: "Bearer $token"
    };

    String url = "${baseUrl()}/user/profile/$poucherTag";

    log(url);

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
        return serveSuccess<Map<String, dynamic>>(data: {
          "phoneNumber": responseBody["data"]["phone_number"],
          "firstName": responseBody["data"]["first_name"],
          "lastName": responseBody["data"]["last_name"],
          "profilePicture": responseBody["data"]["profile_picture"],
          "tag": responseBody["data"]["tag"]
        }, message: responseBody["message"]);
      }
    } catch (error, stack) {
      log(error);
      log(stack);
      return processServiceError<Map<String, dynamic>>(error, stack);
    }
  }

  static Future<ServiceResponse<ContactListResponse>> getAllContacts({
    required String token,
    required List<String> contacts,
  }) async {
    Map<String, String> _authHeaders = {
      HttpHeaders.connectionHeader: "keep-alive",
      HttpHeaders.contentTypeHeader: "application/json",
      HttpHeaders.authorizationHeader: "Bearer $token"
    };

    String url = "${baseUrl()}/user/pouchers-contacts";

    log(url);
    log(contacts);
    try {
      http.Response response = await http.post(Uri.parse(url),
          headers: _authHeaders, body: jsonEncode({"contacts": contacts}));
      logResponse(response);
      var responseBody = jsonDecode(response.body);
      if (response.statusCode >= 300 && response.statusCode <= 520) {
        throw Failure.fromJson(responseBody);
      } else {
        return serveSuccess<ContactListResponse>(
            data: ContactListResponse.fromJson(responseBody),
            message: responseBody["message"]);
      }
    } catch (error, stack) {
      log(error);
      log(stack);
      return processServiceError<ContactListResponse>(error, stack);
    }
  }

  static Future<ServiceResponse<RequestResponse>> requestMoney({
    required String token,
    required String tag,
    required String amount,
    required String note,
  }) async {
    Map<String, String> _authHeaders = {
      HttpHeaders.connectionHeader: "keep-alive",
      HttpHeaders.contentTypeHeader: "application/json",
      HttpHeaders.authorizationHeader: "Bearer $token"
    };

    String url = "${baseUrl()}/payment/request-money";

    log(url);
    log(tag);
    log(amount);
    log(note);

    Map<String, dynamic> body = {
      "tag": tag,
      "amount": amount,
      "note": note,
    };

    try {
      http.Response response = await http.post(Uri.parse(url),
          headers: _authHeaders, body: jsonEncode(body));
      logResponse(response);
      var responseBody = jsonDecode(response.body);
      if (response.statusCode >= 300 && response.statusCode <= 520) {
        throw Failure.fromJson(responseBody);
      } else {
        return serveSuccess<RequestResponse>(
            data: RequestResponse.fromJson(responseBody),
            message: responseBody["message"]);
      }
    } catch (error, stack) {
      log(error);
      log(stack);
      return processServiceError<RequestResponse>(error, stack);
    }
  }

  static Future<ServiceResponse<P2PResponse>> p2p({
    required String token,
    required String tag,
    required String amount,
    required String note,
  }) async {
    Map<String, String> _authHeaders = {
      HttpHeaders.connectionHeader: "keep-alive",
      HttpHeaders.contentTypeHeader: "application/json",
      HttpHeaders.authorizationHeader: "Bearer $token"
    };

    String url = "${baseUrl()}/payment/p2p-transfer";

    log(url);
    log(tag);
    log(amount);
    log(note);

    Map<String, dynamic> body = {
      "tag": tag,
      "amount": amount,
      "note": note,
    };

    try {
      http.Response response = await http.post(Uri.parse(url),
          headers: _authHeaders, body: jsonEncode(body));
      logResponse(response);
      var responseBody = jsonDecode(response.body);
      if (response.statusCode >= 300 && response.statusCode <= 520) {
        throw Failure.fromJson(responseBody);
      } else {
        return serveSuccess<P2PResponse>(
            data: P2PResponse.fromJson(responseBody),
            message: responseBody["message"]);
      }
    } catch (error, stack) {
      log(error);
      log(stack);
      return processServiceError<P2PResponse>(error, stack);
    }
  }


  static Future<ServiceResponse<AccountDetailsResponse>> accountDetails({
    required String token,
    required String accountNumber,
    required String bankName,
    required String amount,
  }) async {
    Map<String, String> _authHeaders = {
      HttpHeaders.connectionHeader: "keep-alive",
      HttpHeaders.contentTypeHeader: "application/json",
      HttpHeaders.authorizationHeader: "Bearer $token"
    };

    String url = "${baseUrl()}/payment/bank-account?account_number=$accountNumber&amount=$amount&bank_name=$bankName";

    log(url);
    log(accountNumber);
    log(amount);

    try {
      http.Response response = await http.get(Uri.parse(url),
        headers: _authHeaders,);
      logResponse(response);
      var responseBody = jsonDecode(response.body);
      if (response.statusCode >= 300 && response.statusCode <= 520) {
        throw Failure.fromJson(responseBody);
      } else {
        return serveSuccess<AccountDetailsResponse>(
            data: AccountDetailsResponse.fromJson(responseBody),
            message: responseBody["message"]);
      }
    } catch (error, stack) {
      log(error);
      log(stack);
      return processServiceError<AccountDetailsResponse>(error, stack);
    }
  }

  static Future<ServiceResponse<GetAllBanksResponse>> getAllBanks({
    required String token,
  }) async {
    Map<String, String> _authHeaders = {
      HttpHeaders.connectionHeader: "keep-alive",
      HttpHeaders.contentTypeHeader: "application/json",
      HttpHeaders.authorizationHeader: "Bearer $token"
    };

    String url = "${baseUrl()}/payment/banks";

    log(url);

    try {
      http.Response response = await http.get(Uri.parse(url),
          headers: _authHeaders,);
      logResponse(response);
      var responseBody = jsonDecode(response.body);
      if (response.statusCode >= 300 && response.statusCode <= 520) {
        throw Failure.fromJson(responseBody);
      } else {
        return serveSuccess<GetAllBanksResponse>(
            data: GetAllBanksResponse.fromJson(responseBody),
            message: responseBody["message"]);
      }
    } catch (error, stack) {
      log(error);
      log(stack);
      return processServiceError<GetAllBanksResponse>(error, stack);
    }
  }

  static Future<ServiceResponse> localBankTransfer({
    required String token,
    required String accountNumber,
    required String bankName,
    required String amount,
  }) async {
    Map<String, String> _authHeaders = {
      HttpHeaders.connectionHeader: "keep-alive",
      HttpHeaders.contentTypeHeader: "application/json",
      HttpHeaders.authorizationHeader: "Bearer $token"
    };

    String url = "${baseUrl()}/payment/local-bank-transfer";

    Map<String, dynamic> body = {
      "account_number": accountNumber,
      "amount": amount,
      "bank_name": bankName,
    };

    log(url);
    log(body);

    try {
      http.Response response = await http.post(Uri.parse(url),
        headers: _authHeaders, body: jsonEncode(body));
      logResponse(response);
      var responseBody = jsonDecode(response.body);
      if (response.statusCode >= 300 && response.statusCode <= 520) {
        throw Failure.fromJson(responseBody);
      } else {
        return serveSuccess(
            data: responseBody["message"],
            message: responseBody["message"]);
      }
    } catch (error, stack) {
      log(error);
      log(stack);
      return processServiceError(error, stack);
    }
  }
}
