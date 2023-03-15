import 'dart:convert';
import 'dart:io';

import 'package:pouchers/app/helpers/service_constants.dart';
import 'package:pouchers/app/helpers/service_response.dart';
import 'package:pouchers/modules/onboarding/model/onboarding_model.dart';
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

    logPrint(url);
    logPrint("what is body $amount");

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
      logPrint(error);
      logPrint(stack);
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

    String url = status == ""
        ? "${baseUrl()}/voucher"
        : "${baseUrl()}/voucher?status=$status";

    logPrint(url);
    logPrint("what is body $status");

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
      logPrint(error);
      logPrint(stack);
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

    logPrint(url);
    logPrint("what is body $body");

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
            data: responseBody["message"], message: responseBody["message"]);
      }
    } catch (error, stack) {
      logPrint(error);
      logPrint(stack);
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

    logPrint(url);
    logPrint("what is body $code");

    try {
      http.Response response = await http.patch(
        Uri.parse(url),
        headers: _authHeaders,
        body: jsonEncode({"code": code}),
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
      logPrint(error);
      logPrint(stack);
      return processServiceError<String>(error, stack);
    }
  }

  static Future<ServiceResponse<GetUtilitiesResponse>> getUtilities(
      {required String utility}) async {
    Map<String, String> _authHeaders = {
      HttpHeaders.connectionHeader: "keep-alive",
      HttpHeaders.contentTypeHeader: "application/json",
    };

    String url = "${baseUrl()}/utility/billers/$utility";

    logPrint(url);
    logPrint("what is body $utility");

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
        return serveSuccess<GetUtilitiesResponse>(
          data: GetUtilitiesResponse.fromJson(
            responseBody,
          ),
          message: responseBody["message"],
        );
      }
    } catch (error, stack) {
      logPrint(error);
      logPrint(stack);
      return processServiceError<GetUtilitiesResponse>(error, stack);
    }
  }

  static Future<ServiceResponse<DiscountResponse>> getDiscount(
      {required String utility, required String token}) async {
    Map<String, String> _authHeaders = {
      HttpHeaders.connectionHeader: "keep-alive",
      HttpHeaders.contentTypeHeader: "application/json",
      HttpHeaders.authorizationHeader: "Bearer $token"
    };

    String url = "${baseUrl()}/utility/discount/value/$utility";

    logPrint(url);
    logPrint("what is body $utility");

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
        return serveSuccess<DiscountResponse>(
          data: DiscountResponse.fromJson(responseBody),
          message: responseBody["message"],
        );
      }
    } catch (error, stack) {
      logPrint(error);
      logPrint(stack);
      return processServiceError<DiscountResponse>(error, stack);
    }
  }

  static Future<ServiceResponse<GetUtilitiesTypesResponse>> getUtilitiesType(
      {required String merchantServiceId}) async {
    Map<String, String> _authHeaders = {
      HttpHeaders.connectionHeader: "keep-alive",
      HttpHeaders.contentTypeHeader: "application/json",
    };

    String url = "${baseUrl()}/utility/merchantServices/$merchantServiceId";

    logPrint(url);
    logPrint("what is body $merchantServiceId");

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
        return serveSuccess<GetUtilitiesTypesResponse>(
          data: GetUtilitiesTypesResponse.fromJson(
            responseBody,
          ),
          message: responseBody["message"],
        );
      }
    } catch (error, stack) {
      logPrint(error);
      logPrint(stack);
      return processServiceError<GetUtilitiesTypesResponse>(error, stack);
    }
  }

  static Future<ServiceResponse<String>> buyUtilities(
      {required List<String> merchantService,
      required double amount,
      required String merchantAccount,
      required String transactionPin,
      required String subCategory,
      required String merchantReferenceNumber,
      required String category,
      String? frequency,
      required String token,
      required bool isSchedule,
     }) async {
    Map<String, String> _authHeaders = {
      HttpHeaders.connectionHeader: "keep-alive",
      HttpHeaders.contentTypeHeader: "application/json",
      HttpHeaders.authorizationHeader: "Bearer $token"
    };

    String url = isSchedule
        ? "${baseUrl()}/utility/schedule"
        :  "${baseUrl()}/utility/merchantPayment";
    Map<String, dynamic> _body =  {
            "category": category,
            "amount": amount,
            "merchantAccount": merchantAccount,
            "transactionPin": transactionPin,
            "sub_category": subCategory,
            "merchantReferenceNumber": merchantReferenceNumber,
          };

    if (frequency != null) {
      _body["frequency"] = frequency;
      _body["merchantService"] = merchantService[0];
    } else {
      _body["merchantService"] = merchantService;
    }

    logPrint(url);
    logPrint("what is body $_body");

    try {
      http.Response response = await http.post(Uri.parse(url),
          headers: _authHeaders, body: jsonEncode(_body));
      logResponse(response);
      var responseBody = jsonDecode(response.body);
      if (response.statusCode >= 300 && response.statusCode <= 520) {
        throw Failure.fromJson(responseBody);
      } else {
        return serveSuccess<String>(
          data: responseBody["message"],
          message: responseBody["message"],
        );
      }
    } catch (error, stack) {
      logPrint(error);
      logPrint(stack);
      return processServiceError<String>(error, stack);
    }
  }

  static Future<ServiceResponse<String>> buyAirtime(
      {required String subCategory,
      required String category,
      required String amount,
      required String destinationPhoneNumber,
      required String transactionPin,
      required String mobileOperatorPublicId,
      required bool isAirtime,
      String? mobileOperatorServiceId,
      required String token}) async {
    Map<String, String> _authHeaders = {
      HttpHeaders.connectionHeader: "keep-alive",
      HttpHeaders.contentTypeHeader: "application/json",
      HttpHeaders.authorizationHeader: "Bearer $token"
    };

    String url = "${baseUrl()}/utility/mobile";
    Map<String, dynamic> _body = {
      "category": category,
      "amount": double.parse(amount),
      "sub_category": subCategory,
      "transactionPin": transactionPin,
      "destinationPhoneNumber": destinationPhoneNumber,
      "mobileOperatorPublicId": mobileOperatorPublicId
    };
    if (!isAirtime) {
      _body["mobileOperatorServiceId"] = mobileOperatorServiceId;
      _body["isDataBundle"] = true;
    }
    logPrint(url);
    logPrint("what is body $_body");

    try {
      http.Response response = await http.post(Uri.parse(url),
          headers: _authHeaders, body: jsonEncode(_body));
      logResponse(response);
      var responseBody = jsonDecode(response.body);
      if (response.statusCode >= 300 && response.statusCode <= 520) {
        throw Failure.fromJson(responseBody);
      } else {
        return serveSuccess<String>(
          data: responseBody["message"],
          message: responseBody["message"],
        );
      }
    } catch (error, stack) {
      logPrint(error);
      logPrint(stack);
      return processServiceError<String>(error, stack);
    }
  }

  static Future<ServiceResponse<String>> isGuestBuyAirtime({
    required String subCategory,
    required String category,
    required String amount,
    required String destinationPhoneNumber,
    required String mobileOperatorPublicId,
    required bool isAirtime,
    String? mobileOperatorServiceId,
    email,
    name,
    bank,
  }) async {
    Map<String, String> _authHeaders = {
      HttpHeaders.connectionHeader: "keep-alive",
      HttpHeaders.contentTypeHeader: "application/json",
    };

    String url = "${baseUrl()}/guest-user/utility/card/pay";

    Map<String, dynamic> _body = {
      "amount": double.parse(amount),
      "currency": "NGN",
      "email": email,
      "payer": {"name": name, "email": email},
      "phone_number": destinationPhoneNumber,
      "mobileOperatorPublicId": mobileOperatorPublicId,
      "category": category,
      "sub_category": subCategory
    };

    if (!isAirtime) {
      _body["mobileOperatorServiceId"] = mobileOperatorServiceId;
      _body["isDataBundle"] = true;
    }

    logPrint(url);
    logPrint("what is body $_body");

    try {
      http.Response response = await http.post(Uri.parse(url),
          headers: _authHeaders, body: jsonEncode(_body));
      logResponse(response);
      var responseBody = jsonDecode(response.body);
      if (response.statusCode >= 300 && response.statusCode <= 520) {
        throw Failure.fromJson(responseBody);
      } else {
        return serveSuccess<String>(
          data: responseBody["data"]["paymentMethods"][0]["properties"]
              ["WebPaymentLink"],
          message: responseBody["message"],
        );
      }
    } catch (error, stack) {
      logPrint(error);
      logPrint(stack);
      return processServiceError<String>(error, stack);
    }
  }

  static Future<ServiceResponse<UssdResponse>> isGuestUssd({
    required String subCategory,
    required String category,
    required String amount,
    required String destinationPhoneNumber,
    required String mobileOperatorPublicId,
    required bool isAirtime,
    String? mobileOperatorServiceId,
    email,
    name,
    bank,
  }) async {
    Map<String, String> _authHeaders = {
      HttpHeaders.connectionHeader: "keep-alive",
      HttpHeaders.contentTypeHeader: "application/json",
    };

    String url = "${baseUrl()}/guest-user/utility/ussd/pay";

    Map<String, dynamic> _body = {
      "amount": double.parse(amount),
      "currency": "NGN",
      "email": email,
      "payer": {"name": name, "email": email},
      "phone_number": destinationPhoneNumber,
      "mobileOperatorPublicId": mobileOperatorPublicId,
      "category": category,
      "sub_category": subCategory,
      "bank": bank
    };
    logPrint(category);

    if (!isAirtime) {
      _body["mobileOperatorServiceId"] = mobileOperatorServiceId;
    }

    logPrint(url);
    logPrint("what is body $_body");

    try {
      http.Response response = await http.post(Uri.parse(url),
          headers: _authHeaders, body: jsonEncode(_body));
      logResponse(response);
      var responseBody = jsonDecode(response.body);
      if (response.statusCode >= 300 && response.statusCode <= 520) {
        throw Failure.fromJson(responseBody);
      } else {
        return serveSuccess<UssdResponse>(
          data: UssdResponse.fromJson(responseBody),
          message: responseBody["message"],
        );
      }
    } catch (error, stack) {
      logPrint(error);
      logPrint(stack);
      return processServiceError<UssdResponse>(error, stack);
    }
  }

  static Future<ServiceResponse<UssdResponse>> isGuestUtilityUssd({
    required List<String> merchantService,
    required double amount,
    required String merchantAccount,
    required String subCategory,
    required String merchantReferenceNumber,
    required String category,
    String? email,
    name,
    bank,
  }) async {
    Map<String, String> _authHeaders = {
      HttpHeaders.connectionHeader: "keep-alive",
      HttpHeaders.contentTypeHeader: "application/json",
    };

    String url = "${baseUrl()}/guest-user/utility/ussd/pay";
    Map<String, dynamic> _body = {
      "category": category,
      "amount": amount,
      "merchantAccount": merchantAccount,
      "sub_category": subCategory,
      "currency": "NGN",
      "merchantReferenceNumber": merchantReferenceNumber,
      "merchantService": merchantService[0],
      "email": email,
      "payer": {"name": name, "email": email},
      "bank": bank
    };

    logPrint(url);
    logPrint("what is body $_body");

    try {
      http.Response response = await http.post(Uri.parse(url),
          headers: _authHeaders, body: jsonEncode(_body));
      logResponse(response);
      var responseBody = jsonDecode(response.body);
      if (response.statusCode >= 300 && response.statusCode <= 520) {
        throw Failure.fromJson(responseBody);
      } else {
        return serveSuccess<UssdResponse>(
          data: UssdResponse.fromJson(responseBody),
          message: responseBody["message"],
        );
      }
    } catch (error, stack) {
      logPrint(error);
      logPrint(stack);
      return processServiceError<UssdResponse>(error, stack);
    }
  }

  static Future<ServiceResponse<DataBundleResponse>> getDataBundles({
    required String merchantServiceId,
  }) async {
    Map<String, String> _authHeaders = {
      HttpHeaders.connectionHeader: "keep-alive",
      HttpHeaders.contentTypeHeader: "application/json",
    };

    String url = "${baseUrl()}/utility/data/operators/$merchantServiceId";

    logPrint(url);
    logPrint("what is body $merchantServiceId");

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
        return serveSuccess<DataBundleResponse>(
          data: DataBundleResponse.fromJson(
            responseBody,
          ),
          message: responseBody["message"],
        );
      }
    } catch (error, stack) {
      logPrint(error);
      logPrint(stack);
      return processServiceError<DataBundleResponse>(error, stack);
    }
  }

  static Future<ServiceResponse<String>> checkPaymentStatus(
      {required String reference}) async {
    Map<String, String> _authHeaders = {
      HttpHeaders.connectionHeader: "keep-alive",
      HttpHeaders.contentTypeHeader: "application/json",
    };

    String url = "${baseUrl()}/payment/status";

    logPrint(url);
    logPrint("what is body $reference");

    try {
      http.Response response = await http.post(Uri.parse(url),
          headers: _authHeaders,
          body: jsonEncode({"referenceNumber": reference}));
      logResponse(response);
      var responseBody = jsonDecode(response.body);
      if (response.statusCode >= 300 && response.statusCode <= 520) {
        throw Failure.fromJson(responseBody);
      } else {
        return serveSuccess<String>(
          data: responseBody["data"]["statusCode"],
          message: responseBody["message"],
        );
      }
    } catch (error, stack) {
      logPrint(error);
      logPrint(stack);
      return processServiceError<String>(error, stack);
    }
  }
}
