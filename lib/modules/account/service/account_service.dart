import 'dart:convert';
import 'dart:io';
import 'package:Pouchers/app/helpers/service_constants.dart';
import 'package:Pouchers/app/helpers/service_response.dart';
import 'package:Pouchers/modules/account/models/profile_model.dart';
import 'package:Pouchers/modules/account/models/referral_model.dart';
import 'package:Pouchers/modules/account/models/security_question.dart';
import 'package:Pouchers/modules/account/models/tier_list.dart';
import 'package:Pouchers/utils/extras.dart';
import 'package:Pouchers/utils/logger.dart';
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

    logPrint(url);
    logPrint("what is body $email");

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
      logPrint(error);
      logPrint(stack);
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

    logPrint(url);
    logPrint("what is body $email");

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
      logPrint(error);
      logPrint(stack);
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

    logPrint(url);
    logPrint("what is body $phoneNumber");

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
      logPrint(error);
      logPrint(stack);
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

    logPrint(url);

    logPrint("what is body $reason");

    try {
      http.Response response = await http.patch(
        Uri.parse(url),
        headers: _authHeaders,
        body: jsonEncode({"disable_reason": reason}),
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

  static Future<ServiceResponse<String>> deleteAccount(
      {required String token, required String reason}) async {
    Map<String, String> _authHeaders = {
      HttpHeaders.connectionHeader: "keep-alive",
      HttpHeaders.contentTypeHeader: "application/json",
      HttpHeaders.authorizationHeader: "Bearer $token"
    };

    String url = "${baseUrl()}/user/";

    logPrint(url);

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
      logPrint(error);
      logPrint(stack);
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
    String? fcmToken,
    bool? isLoginBiometricActive,
    isPaymentBiometricActive,
    String? city,
    String? userState,
    String? postalCode,
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
    if (city != null) body["city"] = city;
    if (userState != null) body["state"] = userState;
    if (postalCode != null) body["postal_code"] = postalCode;
    if (fcmToken != null) body["fcm_token"] = fcmToken;
    if (isLoginBiometricActive != null)
      body["is_login_biometric_active"] = isLoginBiometricActive;
    if (isPaymentBiometricActive != null)
      body["is_payment_biometric_active"] = isPaymentBiometricActive;

    logPrint(url);
    logPrint("bomkmkmkdy$body");

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
      logPrint(error);
      logPrint(stack);
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
        return serveSuccess<SecurityQuestionResponse>(
            data: SecurityQuestionResponse.fromJson(responseBody),
            message: responseBody["message"]);
      }
    } catch (error, stack) {
      logPrint(error);
      logPrint(stack);
      return processServiceError<SecurityQuestionResponse>(error, stack);
    }
  }

  static Future<ServiceResponse<String>> setSecurityQuestion({
    required String questionId,
    required String answer,
    required String token,
    required bool isValidate,
  }) async {
    Map<String, String> _authHeaders = {
      HttpHeaders.connectionHeader: "keep-alive",
      HttpHeaders.contentTypeHeader: "application/json",
      HttpHeaders.authorizationHeader: "Bearer $token"
    };

    String url = isValidate
        ? "${baseUrl()}/auth/validate-2fa"
        : "${baseUrl()}/auth/set-questions";

    Map<String, dynamic> body = {
      "question_id": questionId,
      "answer": answer,
    };

    logPrint(url);
    logPrint(questionId);
    logPrint(answer);

    try {
      http.Response response = await http.post(
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

  static Future<ServiceResponse<SelectedQuestionResponse>> getSelectedQuestion({
    required String token,
  }) async {
    Map<String, String> _authHeaders = {
      HttpHeaders.connectionHeader: "keep-alive",
      HttpHeaders.contentTypeHeader: "application/json",
      HttpHeaders.authorizationHeader: "Bearer $token"
    };

    String url = "${baseUrl()}/auth/selected-questions";

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
        return serveSuccess<SelectedQuestionResponse>(
            data: SelectedQuestionResponse.fromJson(responseBody),
            message: responseBody["message"]);
      }
    } catch (error, stack) {
      logPrint(error);
      logPrint(stack);
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
    logPrint(url);
    logPrint("body$body");
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

  static Future<ServiceResponse<String>> validatePin(
      {required String pin, required String token}) async {
    Map<String, String> _authHeaders = {
      HttpHeaders.connectionHeader: "keep-alive",
      HttpHeaders.contentTypeHeader: "application/json",
      HttpHeaders.authorizationHeader: "Bearer $token"
    };

    String url = "${baseUrl()}/auth/validate-pin";

    logPrint(url);
    logPrint("what is body $pin");

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
      logPrint(error);
      logPrint(stack);
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

    logPrint(url);
    logPrint("what is body $email");

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
      logPrint(error);
      logPrint(stack);
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

    logPrint(url);
    logPrint("what is body $otp");

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
      logPrint(error);
      logPrint(stack);
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

    logPrint(url);
    logPrint("what is body $bvn");

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
      logPrint(error);
      logPrint(stack);
      return processServiceError<EditProfileResponse>(error, stack);
    }
  }

  static Future<ServiceResponse<EditProfileResponse>> validateId(
      {required String idType,
      required String idNumber,
      required bool isUpload,
      String? surname,
      firstName,
      lastName,
      dob,
      required String token}) async {
    Map<String, String> _authHeaders = {
      HttpHeaders.connectionHeader: "keep-alive",
      HttpHeaders.contentTypeHeader: "application/json",
      HttpHeaders.authorizationHeader: "Bearer $token"
    };

    String url = "${baseUrl()}/user/validate-id";
    Map<String, dynamic> body = {
      "id_type": idType,
      "id_number": idNumber,
      "is_upload_id": isUpload
    };
    if (idType == "passport") {
      body["surname"] = surname;
    }

    if (isUpload) {
      body["dojah_response"] = {
        "first_name": firstName,
        "last_name": lastName,
        "dateOfBirth": dob
      };
    }

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
        return serveSuccess<EditProfileResponse>(
            data: EditProfileResponse.fromJson(responseBody),
            message: responseBody["message"]);
      }
    } catch (error, stack) {
      logPrint(error);
      logPrint(stack);
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

    String url = "${baseUrl()}/admin-settings/envs";

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
        return serveSuccess<TierListResponse>(
            data: TierListResponse.fromJson(responseBody),
            message: responseBody["message"]);
      }
    } catch (error, stack) {
      logPrint(error);
      logPrint(stack);
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

    logPrint(url);

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
      logPrint(error);
      logPrint(stack);
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

    logPrint(url);

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
      logPrint(error);
      logPrint(stack);
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

    logPrint(url);

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
      logPrint(error);
      logPrint(stack);
      return processServiceError<bool>(error, stack);
    }
  }

  static Future<ServiceResponse<bool>> disable2FA(
      {required String token, required String transactionPin}) async {
    Map<String, String> _authHeaders = {
      HttpHeaders.connectionHeader: "keep-alive",
      HttpHeaders.contentTypeHeader: "application/json",
      HttpHeaders.authorizationHeader: "Bearer $token"
    };

    String url = "${baseUrl()}/user/disable-2fa";

    logPrint(url);

    try {
      http.Response response = await http.patch(Uri.parse(url),
          headers: _authHeaders,
          body: jsonEncode({"transactionPin": transactionPin}));
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
      logPrint(error);
      logPrint(stack);
      return processServiceError<bool>(error, stack);
    }
  }

  static Future<ServiceResponse<GetReferralResponse>> getReferralTrail({
    required String token,
  }) async {
    Map<String, String> _authHeaders = {
      HttpHeaders.connectionHeader: "keep-alive",
      HttpHeaders.contentTypeHeader: "application/json",
      HttpHeaders.authorizationHeader: "Bearer $token"
    };

    String url = "${baseUrl()}/user/referral-trail";

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
        return serveSuccess<GetReferralResponse>(
            data: GetReferralResponse.fromJson(responseBody),
            message: responseBody["message"]);
      }
    } catch (error, stack) {
      logPrint(error);
      logPrint(stack);
      return processServiceError<GetReferralResponse>(error, stack);
    }
  }

  static Future<ServiceResponse<BannerResponse>> getBanner({
    required String token,
  }) async {
    Map<String, String> _authHeaders = {
      HttpHeaders.connectionHeader: "keep-alive",
      HttpHeaders.contentTypeHeader: "application/json",
      HttpHeaders.authorizationHeader: "Bearer $token"
    };

    String url = "${baseUrl()}/admin-settings/banners";

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
        return serveSuccess<BannerResponse>(
            data: BannerResponse.fromJson(responseBody),
            message: responseBody["message"]);
      }
    } catch (error, stack) {
      logPrint(error);
      logPrint(stack);
      return processServiceError<BannerResponse>(error, stack);
    }
  }

  static Future<ServiceResponse<EditProfileResponse>> getUserProfile({
    required String token,
  }) async {
    Map<String, String> _authHeaders = {
      HttpHeaders.connectionHeader: "keep-alive",
      HttpHeaders.contentTypeHeader: "application/json",
      HttpHeaders.authorizationHeader: "Bearer $token"
    };

    String url = "${baseUrl()}/user/profile";

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
        return serveSuccess<EditProfileResponse>(
            data: EditProfileResponse.fromJson(responseBody),
            message: responseBody["message"]);
      }
    } catch (error, stack) {
      logPrint(error);
      logPrint(stack);
      return processServiceError<EditProfileResponse>(error, stack);
    }
  }

  static Future<ServiceResponse<ManageRequestResponse>> manageRequest({
    required String token,
    required String type,
    String? status,
    required int page,
  }) async {
    Map<String, String> _authHeaders = {
      HttpHeaders.connectionHeader: "keep-alive",
      HttpHeaders.contentTypeHeader: "application/json",
      HttpHeaders.authorizationHeader:
          "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoidXNlci0xNWUzNWRmMmFmOWUxMWVlODFhODVmMTkxYjFhNTNmZSIsImlhdCI6MTcwNTQzOTYxOSwiZXhwIjoxNzA1NTI2MDE5fQ.NRw_qFGjPUqQqwEnYpSGCJGFlGclggGrFdxFcCgYoOg"
    };

    String url = status == null
        ? "https://api.pouchers.io/api/v1/payment/requests?page=$page&type=$type"
        : "https://api.pouchers.io/api/v1/payment/requests?page=$page&type=$type&status=$status";

    logPrint("Jayceee========${_authHeaders}");

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
        return serveSuccess<ManageRequestResponse>(
            data: ManageRequestResponse.fromJson(responseBody),
            message: responseBody["message"]);
      }
    } catch (error, stack) {
      logPrint(error);
      logPrint(stack);
      return processServiceError<ManageRequestResponse>(error, stack);
    }
  }
}
