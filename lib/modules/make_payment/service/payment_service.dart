import 'dart:convert';
import 'dart:io';

import 'package:Pouchers/app/helpers/service_constants.dart';
import 'package:Pouchers/app/helpers/service_response.dart';
import 'package:Pouchers/modules/make_payment/models/make_payment_model.dart';
import 'package:Pouchers/utils/extras.dart';
import 'package:Pouchers/utils/logger.dart';
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
        return serveSuccess<Map<String, dynamic>>(data: {
          "phoneNumber": responseBody["data"]["phone_number"],
          "firstName": responseBody["data"]["first_name"],
          "lastName": responseBody["data"]["last_name"],
          "profilePicture": responseBody["data"]["profile_picture"],
          "tag": responseBody["data"]["tag"]
        }, message: responseBody["message"]);
      }
    } catch (error, stack) {
      logPrint(error);
      logPrint(stack);
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

    logPrint(url);
    logPrint(contacts);
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
      logPrint(error);
      logPrint(stack);
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

    logPrint(url);
    logPrint(tag);
    logPrint(amount);
    logPrint(note);

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
      logPrint(error);
      logPrint(stack);
      return processServiceError<RequestResponse>(error, stack);
    }
  }

  static Future<ServiceResponse<P2PResponse>> p2p(
      {required String token,
      required String tag,
      required String amount,
      required String note,
      required String transactionPin}) async {
    Map<String, String> _authHeaders = {
      HttpHeaders.connectionHeader: "keep-alive",
      HttpHeaders.contentTypeHeader: "application/json",
      HttpHeaders.authorizationHeader: "Bearer $token"
    };

    String url = "${baseUrl()}/payment/p2p-transfer";

    logPrint(url);
    logPrint(tag);
    logPrint(amount);
    logPrint(note);

    Map<String, dynamic> body = {
      "tag": tag,
      "amount": amount,
      "note": note,
      "transactionPin": transactionPin
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
      logPrint(error);
      logPrint(stack);
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

    String url =
        "${baseUrl()}/payment/bank-account?account_number=$accountNumber&amount=$amount&bank_name=$bankName";

    logPrint(url);
    logPrint(accountNumber);
    logPrint(amount);

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
        return serveSuccess<AccountDetailsResponse>(
            data: AccountDetailsResponse.fromJson(responseBody),
            message: responseBody["message"]);
      }
    } catch (error, stack) {
      logPrint(error);
      logPrint(stack);
      return processServiceError<AccountDetailsResponse>(error, stack);
    }
  }

  static Future<ServiceResponse<GetAllBanksResponse>> getAllBanks() async {
    Map<String, String> _authHeaders = {
      HttpHeaders.connectionHeader: "keep-alive",
      HttpHeaders.contentTypeHeader: "application/json",
    };

    String url = "${baseUrl()}/payment/banks";

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
        return serveSuccess<GetAllBanksResponse>(
            data: GetAllBanksResponse.fromJson(responseBody),
            message: responseBody["message"]);
      }
    } catch (error, stack) {
      logPrint(error);
      logPrint(stack);
      return processServiceError<GetAllBanksResponse>(error, stack);
    }
  }

  static Future<ServiceResponse<LocalTransferResponse>> localBankTransfer(
      {required String token,
      required String accountNumber,
      required String bankName,
      required String amount,
      required String transactionPin}) async {
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
      "transactionPin": transactionPin
    };

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
        return serveSuccess<LocalTransferResponse>(
            data: LocalTransferResponse.fromJson(responseBody),
            message: responseBody["message"]);
      }
    } catch (error, stack) {
      logPrint(error);
      logPrint(stack);
      return processServiceError<LocalTransferResponse>(error, stack);
    }
  }

  static Future<ServiceResponse<GetWalletResponse>> getWalletDetails({
    required String token,
  }) async {
    Map<String, String> _authHeaders = {
      HttpHeaders.connectionHeader: "keep-alive",
      HttpHeaders.contentTypeHeader: "application/json",
      HttpHeaders.authorizationHeader: "Bearer $token"
    };

    String url = "${baseUrl()}/payment/wallet";

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
        return serveSuccess<GetWalletResponse>(
            data: GetWalletResponse.fromJson(responseBody),
            message: responseBody["message"]);
      }
    } catch (error, stack) {
      logPrint(error);
      logPrint(stack);
      return processServiceError<GetWalletResponse>(error, stack);
    }
  }

  static Future<ServiceResponse<NotificationResponse>> getNotifications({
    required String token,
  }) async {
    Map<String, String> _authHeaders = {
      HttpHeaders.connectionHeader: "keep-alive",
      HttpHeaders.contentTypeHeader: "application/json",
      HttpHeaders.authorizationHeader: "Bearer $token"
    };

    String url = "${baseUrl()}/notification/";

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
        return serveSuccess<NotificationResponse>(
            data: NotificationResponse.fromJson(responseBody),
            message: responseBody["message"]);
      }
    } catch (error, stack) {
      logPrint(error);
      logPrint(stack);
      return processServiceError<NotificationResponse>(error, stack);
    }
  }

  static Future<ServiceResponse<MoneyRequestResponse>> moneyRequestStatus({
    required String token,
    required String action,
    required double amount,
    required String requestId,
    required String pin,
    String? note,
  }) async {
    Map<String, String> _authHeaders = {
      HttpHeaders.connectionHeader: "keep-alive",
      HttpHeaders.contentTypeHeader: "application/json",
      HttpHeaders.authorizationHeader: "Bearer $token"
    };

    String url = "${baseUrl()}/payment/request";

    logPrint(url);
    logPrint(requestId);

    Map<String, dynamic> body = {
      "action": action,
      "amount": amount,
      "requestId": requestId,
      "transactionPin": pin
    };
    if (note != null) {
      body["reason"] = note;
    }
    logPrint(body);

    try {
      http.Response response = await http.patch(Uri.parse(url),
          headers: _authHeaders, body: jsonEncode(body));
      logResponse(response);
      var responseBody = jsonDecode(response.body);
      if (response.statusCode >= 300 && response.statusCode <= 520) {
        throw Failure.fromJson(responseBody);
      } else {
        return serveSuccess<MoneyRequestResponse>(
            data: MoneyRequestResponse.fromJson(responseBody),
            message: responseBody["message"]);
      }
    } catch (error, stack) {
      logPrint(error);
      logPrint(stack);
      return processServiceError<MoneyRequestResponse>(error, stack);
    }
  }
}
