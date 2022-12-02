import 'dart:convert';
import 'dart:io';

import 'package:pouchers/app/helpers/service_constants.dart';
import 'package:pouchers/app/helpers/service_response.dart';
import 'package:pouchers/ui/make_payment/models/make_payment_model.dart';
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
          "profilePicture" : responseBody["data"]["profile_picture"]
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
}
