import 'dart:convert';
import 'dart:io';
import 'package:pouchers/app/helpers/service_constants.dart';
import 'package:pouchers/app/helpers/service_response.dart';
import 'package:pouchers/ui/tab_layout/models/profile_model.dart';
import 'package:pouchers/ui/tab_layout/models/security_question.dart';
import 'package:pouchers/ui/tab_layout/models/tier_list.dart';
import 'package:pouchers/utils/extras.dart';
import 'package:pouchers/utils/logger.dart';
import 'package:http/http.dart' as http;

class AccountService {
  static Future<ServiceResponse<String>> requestPasswordChange(
      {required String email, required String token}) async {
    Map<String, String> _authHeaders = {
      HttpHeaders.connectionHeader: "keep-alive",
      HttpHeaders.contentTypeHeader: "application/json",
      HttpHeaders.authorizationHeader: "Bearer $token"
    };

    String url = "${baseUrl()}/auth/request-password-change";

    log(url);
    log("what is body $email");

    try {
      http.Response response = await http.patch(
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

  static Future<ServiceResponse<String>> requestPhoneChange(
      {required String email, required String token}) async {
    Map<String, String> _authHeaders = {
      HttpHeaders.connectionHeader: "keep-alive",
      HttpHeaders.contentTypeHeader: "application/json",
      HttpHeaders.authorizationHeader: "Bearer $token"
    };

    String url = "${baseUrl()}/user/request-phone-change";

    log(url);
    log("what is body $email");

    try {
      http.Response response = await http.patch(
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

  static Future<ServiceResponse<EditProfileResponse>> changePhoneNumber(
      {required String phoneNumber, required String token}) async {
    Map<String, String> _authHeaders = {
      HttpHeaders.connectionHeader: "keep-alive",
      HttpHeaders.contentTypeHeader: "application/json",
      HttpHeaders.authorizationHeader: "Bearer $token"
    };

    String url = "${baseUrl()}/user/change-phone";

    log(url);
    log("what is body $phoneNumber");

    try {
      http.Response response = await http.patch(
        Uri.parse(url),
        headers: _authHeaders,
        body: jsonEncode({"phone_number": phoneNumber}),
      );
      logResponse(response);
      var responseBody = jsonDecode(response.body);
      if (response.statusCode >= 300 && response.statusCode <= 520) {
        throw Failure.fromJson(responseBody);
      } else {
        return serveSuccess<EditProfileResponse>(
            data: EditProfileResponse.fromJson(responseBody),
            message: responseBody["message"]);
      }
    } catch (error, stack) {
      log(error);
      log(stack);
      return processServiceError<EditProfileResponse>(error, stack);
    }
  }

  static Future<ServiceResponse<String>> disableAccount(
      {required String reason,
      required String token,
      required String password}) async {
    Map<String, String> _authHeaders = {
      HttpHeaders.connectionHeader: "keep-alive",
      HttpHeaders.contentTypeHeader: "application/json",
      HttpHeaders.authorizationHeader: "Bearer $token"
    };

    String url = "${baseUrl()}/user/disable";

    log(url);

    log("what is body $reason");

    try {
      http.Response response = await http.patch(
        Uri.parse(url),
        headers: _authHeaders,
        body: jsonEncode({"disable_reason": reason, "password": password}),
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

  static Future<ServiceResponse<String>> deleteAccount(
      {required String token, required String reason}) async {
    Map<String, String> _authHeaders = {
      HttpHeaders.connectionHeader: "keep-alive",
      HttpHeaders.contentTypeHeader: "application/json",
      HttpHeaders.authorizationHeader: "Bearer $token"
    };

    String url = "${baseUrl()}/user/";

    log(url);

    try {
      http.Response response = await http.delete(
        Uri.parse(url),
        headers: _authHeaders,
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

  static Future<ServiceResponse<EditProfileResponse>> editProfile({
    String? firstName,
    lastName,
    tag,
    address,
    gender,
    String? dob,
    String? profilePicture,
    String? utilityBill,
    bool? isLoginBiometricActive,
    isPaymentBiometricActive,
    required String token,
  }) async {
    Map<String, String> _authHeaders = {
      HttpHeaders.connectionHeader: "keep-alive",
      HttpHeaders.contentTypeHeader: "application/json",
      HttpHeaders.authorizationHeader: "Bearer $token"
    };

    String url = "${baseUrl()}/user/profile";

    Map<String, dynamic> body = {};

    if (firstName != null) body["first_name"] = firstName;
    if (lastName != null) body["last_name"] = lastName;
    if (tag != null) body["tag"] = tag;
    if (dob != null) body["dob"] = dob;
    if (address != null) body["address"] = address;
    if (gender != null) body["gender"] = gender;
    if (profilePicture != null) body["profile_picture"] = profilePicture;
    if (utilityBill != null) body["utility_bill"] = utilityBill;
    if(isLoginBiometricActive != null) body["is_login_biometric_active"] = isLoginBiometricActive;
    if(isPaymentBiometricActive != null) body["is_payment_biometric_active"] = isPaymentBiometricActive;

    log(url);
    log("body$body");

    try {
      http.Response response = await http.patch(Uri.parse(url),
          headers: _authHeaders, body: jsonEncode(body));
      logResponse(response);
      var responseBody = jsonDecode(response.body);
      if (response.statusCode >= 300 && response.statusCode <= 520) {
        throw Failure.fromJson(responseBody);
      } else {
        print("response body ${responseBody["is_login_biometric_active"]}");
        return serveSuccess<EditProfileResponse>(
            data: EditProfileResponse.fromJson(responseBody),
            message: responseBody["message"]);
      }
    } catch (error, stack) {
      log(error);
      log(stack);
      return processServiceError<EditProfileResponse>(error, stack);
    }
  }

  static Future<ServiceResponse<SecurityQuestionResponse>> getSecurityQuestion({
    required String token,
  }) async {
    Map<String, String> _authHeaders = {
      HttpHeaders.connectionHeader: "keep-alive",
      HttpHeaders.contentTypeHeader: "application/json",
      HttpHeaders.authorizationHeader: "Bearer $token"
    };

    String url = "${baseUrl()}/auth/security-questions";

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
        return serveSuccess<SecurityQuestionResponse>(
            data: SecurityQuestionResponse.fromJson(responseBody),
            message: responseBody["message"]);
      }
    } catch (error, stack) {
      log(error);
      log(stack);
      return processServiceError<SecurityQuestionResponse>(error, stack);
    }
  }

  static Future<ServiceResponse<String>> setSecurityQuestion(
      {required String questionId,
      required String answer,
      required String token,
      required bool isValidate}) async {
    Map<String, String> _authHeaders = {
      HttpHeaders.connectionHeader: "keep-alive",
      HttpHeaders.contentTypeHeader: "application/json",
      HttpHeaders.authorizationHeader: "Bearer $token"
    };

    String url = isValidate
        ? "${baseUrl()}/auth/validate-2fa"
        : "${baseUrl()}/auth/set-questions";

    log(url);
    log(questionId);
    log(answer);

    try {
      http.Response response = await http.post(Uri.parse(url),
          headers: _authHeaders,
          body: jsonEncode({"question_id": questionId, "answer": answer}));
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

  static Future<ServiceResponse<SelectedQuestionResponse>> getSelectedQuestion({
    required String token,
  }) async {
    Map<String, String> _authHeaders = {
      HttpHeaders.connectionHeader: "keep-alive",
      HttpHeaders.contentTypeHeader: "application/json",
      HttpHeaders.authorizationHeader: "Bearer $token"
    };

    String url = "${baseUrl()}/auth/selected-questions";

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
        return serveSuccess<SelectedQuestionResponse>(
            data: SelectedQuestionResponse.fromJson(responseBody),
            message: responseBody["message"]);
      }
    } catch (error, stack) {
      log(error);
      log(stack);
      return processServiceError<SelectedQuestionResponse>(error, stack);
    }
  }

  static Future<ServiceResponse<String>> resetPin(
      {required String oldPin,
      required String newPin,
      required String token}) async {
    Map<String, String> _authHeaders = {
      HttpHeaders.connectionHeader: "keep-alive",
      HttpHeaders.contentTypeHeader: "application/json",
      HttpHeaders.authorizationHeader: "Bearer $token"
    };

    String url = "${baseUrl()}/user/reset-pin";

    Map<String, dynamic> body = {
      "oldPin": oldPin,
      "pin": newPin,
    };
    log(url);
    log("body$body");
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
      log(error);
      log(stack);
      return processServiceError<String>(error, stack);
    }
  }

  static Future<ServiceResponse<String>> validatePin(
      {required String pin, required String token}) async {
    Map<String, String> _authHeaders = {
      HttpHeaders.connectionHeader: "keep-alive",
      HttpHeaders.contentTypeHeader: "application/json",
      HttpHeaders.authorizationHeader: "Bearer $token"
    };

    String url = "${baseUrl()}/auth/validate-pin";

    log(url);
    log("what is body $pin");

    try {
      http.Response response = await http.post(
        Uri.parse(url),
        headers: _authHeaders,
        body: jsonEncode({"transactionPin": pin}),
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

  static Future<ServiceResponse<String>> resendOtp(
      {required String email, required String token}) async {
    Map<String, String> _authHeaders = {
      HttpHeaders.connectionHeader: "keep-alive",
      HttpHeaders.contentTypeHeader: "application/json",
      HttpHeaders.authorizationHeader: "Bearer $token"
    };

    String url = "${baseUrl()}/auth/resend-otp";

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

  static Future<ServiceResponse<String>> validateResendOtp(
      {required String otp, required String token}) async {
    Map<String, String> _authHeaders = {
      HttpHeaders.connectionHeader: "keep-alive",
      HttpHeaders.contentTypeHeader: "application/json",
      HttpHeaders.authorizationHeader: "Bearer $token"
    };

    String url = "${baseUrl()}/auth/validate-otp";

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
        return serveSuccess<String>(
            data: responseBody["message"], message: responseBody["message"]);
      }
    } catch (error, stack) {
      log(error);
      log(stack);
      return processServiceError<String>(error, stack);
    }
  }

  static Future<ServiceResponse<EditProfileResponse>> validateBvn(
      {required String bvn, required String token}) async {
    Map<String, String> _authHeaders = {
      HttpHeaders.connectionHeader: "keep-alive",
      HttpHeaders.contentTypeHeader: "application/json",
      HttpHeaders.authorizationHeader: "Bearer $token"
    };

    String url = "${baseUrl()}/user/validate-bvn";

    log(url);
    log("what is body $bvn");

    try {
      http.Response response = await http.patch(
        Uri.parse(url),
        headers: _authHeaders,
        body: jsonEncode({"bvn": bvn}),
      );
      logResponse(response);
      var responseBody = jsonDecode(response.body);
      if (response.statusCode >= 300 && response.statusCode <= 520) {
        throw Failure.fromJson(responseBody);
      } else {
        return serveSuccess<EditProfileResponse>(
            data: EditProfileResponse.fromJson(responseBody),
            message: responseBody["message"]);
      }
    } catch (error, stack) {
      log(error);
      log(stack);
      return processServiceError<EditProfileResponse>(error, stack);
    }
  }

  static Future<ServiceResponse<EditProfileResponse>> validateId(
      {required String idType,
      required String idNumber,
      required String token}) async {
    Map<String, String> _authHeaders = {
      HttpHeaders.connectionHeader: "keep-alive",
      HttpHeaders.contentTypeHeader: "application/json",
      HttpHeaders.authorizationHeader: "Bearer $token"
    };

    String url = "${baseUrl()}/user/validate-id";
    Map<String, dynamic> body = {"id_type": idType, "id_number": idNumber};

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
        return serveSuccess<EditProfileResponse>(
            data: EditProfileResponse.fromJson(responseBody),
            message: responseBody["message"]);
      }
    } catch (error, stack) {
      log(error);
      log(stack);
      return processServiceError<EditProfileResponse>(error, stack);
    }
  }

  static Future<ServiceResponse<TierListResponse>> getTierList(
      {required String token}) async {
    Map<String, String> _authHeaders = {
      HttpHeaders.connectionHeader: "keep-alive",
      HttpHeaders.contentTypeHeader: "application/json",
      HttpHeaders.authorizationHeader: "Bearer $token"
    };

    String url = "${baseUrl()}/user/tiers";

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
        return serveSuccess<TierListResponse>(
            data: TierListResponse.fromJson(responseBody),
            message: responseBody["message"]);
      }
    } catch (error, stack) {
      log(error);
      log(stack);
      return processServiceError<TierListResponse>(error, stack);
    }
  }

  static Future<ServiceResponse<String>> getSignedUrl(
      {required String token,
      required String fileName,
      required bool isPhoto}) async {
    Map<String, String> _authHeaders = {
      HttpHeaders.connectionHeader: "keep-alive",
      HttpHeaders.contentTypeHeader: "application/json",
      HttpHeaders.authorizationHeader: "Bearer $token"
    };

    String url = "${baseUrl()}/user/pre-signed-url";

    log(url);

    Map<String, dynamic> photoBody = {"profile_picture": fileName};
    Map<String, dynamic> utilityBody = {"utility_bill": fileName};

    try {
      http.Response response = await http.patch(Uri.parse(url),
          headers: _authHeaders,
          body: jsonEncode(isPhoto ? photoBody : utilityBody));
      logResponse(response);
      var responseBody = jsonDecode(response.body);
      if (response.statusCode >= 300 && response.statusCode <= 520) {
        throw Failure.fromJson(responseBody);
      } else {
        return serveSuccess<String>(
            data: responseBody["data"], message: responseBody["message"]);
      }
    } catch (error, stack) {
      log(error);
      log(stack);
      return processServiceError<String>(error, stack);
    }
  }

  static Future<ServiceResponse<String>> generate2FAToken({
    required String token,
  }) async {
    Map<String, String> _authHeaders = {
      HttpHeaders.connectionHeader: "keep-alive",
      HttpHeaders.contentTypeHeader: "application/json",
      HttpHeaders.authorizationHeader: "Bearer $token"
    };

    String url = "${baseUrl()}/user/generate-2fa-token";

    log(url);

    try {
      http.Response response = await http.post(
        Uri.parse(url),
        headers: _authHeaders,
      );
      logResponse(response);
      var responseBody = jsonDecode(response.body);
      if (response.statusCode >= 300 && response.statusCode <= 520) {
        throw Failure.fromJson(responseBody);
      } else {
        return serveSuccess<String>(
            data: responseBody["data"]["two_factor_temp_secret"],
            message: responseBody["message"]);
      }
    } catch (error, stack) {
      log(error);
      log(stack);
      return processServiceError<String>(error, stack);
    }
  }

  static Future<ServiceResponse<bool>> validate2FAToken(
      {required String token, required String userToken}) async {
    Map<String, String> _authHeaders = {
      HttpHeaders.connectionHeader: "keep-alive",
      HttpHeaders.contentTypeHeader: "application/json",
      HttpHeaders.authorizationHeader: "Bearer $token"
    };

    String url = "${baseUrl()}/user/validate-2fa-token";

    log(url);

    try {
      http.Response response = await http.post(Uri.parse(url),
          headers: _authHeaders, body: jsonEncode({"user2faToken": userToken}));
      logResponse(response);
      var responseBody = jsonDecode(response.body);
      if (response.statusCode >= 300 && response.statusCode <= 520) {
        throw Failure.fromJson(responseBody);
      } else {
        return serveSuccess<bool>(
            data: responseBody["data"]["is_2fa_active"],
            message: responseBody["message"]);
      }
    } catch (error, stack) {
      log(error);
      log(stack);
      return processServiceError<bool>(error, stack);
    }
  }

  static Future<ServiceResponse<bool>> disable2FA({
    required String token,
  }) async {
    Map<String, String> _authHeaders = {
      HttpHeaders.connectionHeader: "keep-alive",
      HttpHeaders.contentTypeHeader: "application/json",
      HttpHeaders.authorizationHeader: "Bearer $token"
    };

    String url = "${baseUrl()}/user/disable-2fa";

    log(url);

    try {
      http.Response response = await http.patch(
        Uri.parse(url),
        headers: _authHeaders,
      );
      logResponse(response);
      var responseBody = jsonDecode(response.body);
      if (response.statusCode >= 300 && response.statusCode <= 520) {
        throw Failure.fromJson(responseBody);
      } else {
        return serveSuccess<bool>(
            data: responseBody["data"]["is_2fa_active"],
            message: responseBody["message"]);
      }
    } catch (error, stack) {
      log(error);
      log(stack);
      return processServiceError<bool>(error, stack);
    }
  }
}
