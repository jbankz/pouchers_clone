import 'package:hive/hive.dart';
import 'package:pouchers/modules/login/models/wallet_details.dart';

class CreateAccountResponse {
  CreateAccountResponse({
    this.status,
    this.message,
    this.code,
    this.data,
  });

  String? status;
  String? message;
  int? code;
  CreateAccountResponseData? data;

  factory CreateAccountResponse.fromJson(Map<String, dynamic> json) =>
      CreateAccountResponse(
        status: json["status"],
        message: json["message"],
        code: json["code"],
        data: CreateAccountResponseData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "code": code,
        "data": data!.toJson(),
      };
}

class CreateAccountResponseData {
  CreateAccountResponseData({
    this.userId,
    this.firstName,
    this.lastName,
    this.email,
    this.phoneNumber,
    this.status,
    this.tierLevels,
    this.tag,
    this.referralCode,
    this.verificationToken,
    this.verificationTokenExpires,
    this.isDeleted,
    this.otp,
    this.expirationTime,
  });

  String? userId;
  String? firstName;
  String? lastName;
  String? email;
  String? phoneNumber;
  String? status;
  int? tierLevels;
  dynamic tag;
  dynamic referralCode;
  String? verificationToken;
  DateTime? verificationTokenExpires;
  bool? isDeleted;
  String? otp;
  DateTime? expirationTime;

  factory CreateAccountResponseData.fromJson(Map<String, dynamic> json) =>
      CreateAccountResponseData(
        userId: json["user_id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        email: json["email"],
        phoneNumber: json["phone_number"],
        status: json["status"],
        tierLevels: json["tier_levels"],
        tag: json["tag"],
        referralCode: json["referral_code"],
        verificationToken: json["verification_token"],
        verificationTokenExpires:
            DateTime.parse(json["verification_token_expires"]),
        isDeleted: json["is_deleted"],
        otp: json["otp"],
        expirationTime: DateTime.parse(json["expirationTime"]),
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "first_name": firstName,
        "last_name": lastName,
        "email": email,
        "phone_number": phoneNumber,
        "status": status,
        "tier_levels": tierLevels,
        "tag": tag,
        "referral_code": referralCode,
        "verification_token": verificationToken,
        "verification_token_expires":
            verificationTokenExpires!.toIso8601String(),
        "is_deleted": isDeleted,
        "otp": otp,
        "expirationTime": expirationTime!.toIso8601String(),
      };
}

class VerifyEmailResponse {
  VerifyEmailResponse({
    this.status,
    this.message,
    this.code,
    this.data,
  });

  String? status;
  String? message;
  int? code;
  VerifyEmailResponseData? data;

  factory VerifyEmailResponse.fromJson(Map<String, dynamic> json) =>
      VerifyEmailResponse(
        status: json["status"],
        message: json["message"],
        code: json["code"],
        data: VerifyEmailResponseData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "code": code,
        "data": data!.toJson(),
      };

  @override
  String toString() {
    return 'VerifyEmailResponse{status: $status, message: $message, code: $code, data: $data}';
  }
}

class VerifyEmailResponseData {
  VerifyEmailResponseData({
    this.id,
    this.phoneNumber,
    this.userId,
    this.email,
    this.firstName,
    this.lastName,
    this.verificationToken,
    this.verificationTokenExpires,
    this.tierLevels,
    this.passwordResetToken,
    this.passwordResetTokenExpires,
    this.pinResetToken,
    this.pinResetTokenExpires,
    this.status,
    this.deviceToken,
    this.fcmToken,
    this.isUploadedIdentityCard,
    this.isDeleted,
    this.referralCode,
    this.tag,
    this.token,
    this.refreshToken,
    this.tokenExpireAt,
    this.dob,
    this.address,
    this.profilePicture,
    this.gender,
    this.isCreatedPin,
    this.is2faActive,
    this.isLoginBiometricActive,
    this.isPaymentBiometricActive,
    this.walletDetails,
  });

  int? id;
  String? phoneNumber;
  String? userId;
  String? email;
  String? firstName;
  String? lastName;
  String? verificationToken;
  dynamic verificationTokenExpires;
  int? tierLevels;
  dynamic passwordResetToken;
  dynamic passwordResetTokenExpires;
  dynamic pinResetToken;
  dynamic pinResetTokenExpires;
  String? status;
  dynamic deviceToken;
  dynamic fcmToken;
  bool? isUploadedIdentityCard;
  bool? isDeleted;
  String? referralCode;
  dynamic tag;
  String? token;
  String? refreshToken;
  DateTime? tokenExpireAt;
  String? dob;
  String? profilePicture;
  String? address;
  String? gender;
  bool? isCreatedPin;
  bool? is2faActive;
  bool? isLoginBiometricActive;
  bool? isPaymentBiometricActive;
  WalletDetails? walletDetails;

  factory VerifyEmailResponseData.fromJson(Map<String, dynamic> json) =>
      VerifyEmailResponseData(
        id: json["id"],
        phoneNumber: json["phone_number"],
        userId: json["user_id"],
        email: json["email"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        verificationToken: json["verification_token"],
        verificationTokenExpires: json["verification_token_expires"],
        tierLevels: json["tier_levels"],
        passwordResetToken: json["password_reset_token"],
        passwordResetTokenExpires: json["password_reset_token_expires"],
        pinResetToken: json["pin_reset_token"],
        pinResetTokenExpires: json["pin_reset_token_expires"],
        status: json["status"],
        deviceToken: json["device_token"],
        fcmToken: json["fcm_token"],
        isUploadedIdentityCard: json["is_uploaded_identity_card"],
        isDeleted: json["is_deleted"],
        referralCode: json["referral_code"],
        tag: json["tag"],
        token: json["token"],
        refreshToken: json["refreshToken"],
        tokenExpireAt: DateTime.parse(json["tokenExpireAt"]),
        dob: json["dob"],
        address: json["address"],
        profilePicture: json["profile_picture"],
        gender: json["gender"],
        isCreatedPin: json["iscreatedpin"],
        is2faActive: json["is_2fa_active"],
        isLoginBiometricActive: json["is_login_biometric_active"],
        isPaymentBiometricActive: json["is_payment_biometric_active"],
        walletDetails: json["walletDetails"] == null
            ? null
            : WalletDetails.fromJson(json["walletDetails"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "phone_number": phoneNumber,
        "user_id": userId,
        "email": email,
        "first_name": firstName,
        "last_name": lastName,
        "verification_token": verificationToken,
        "verification_token_expires": verificationTokenExpires,
        "tier_levels": tierLevels,
        "password_reset_token": passwordResetToken,
        "password_reset_token_expires": passwordResetTokenExpires,
        "pin_reset_token": pinResetToken,
        "pin_reset_token_expires": pinResetTokenExpires,
        "status": status,
        "device_token": deviceToken,
        "fcm_token": fcmToken,
        "is_uploaded_identity_card": isUploadedIdentityCard,
        "is_deleted": isDeleted,
        "referral_code": referralCode,
        "tag": tag,
        "token": token,
        "refreshToken": refreshToken,
        "tokenExpireAt": tokenExpireAt!.toIso8601String(),
        "gender": gender,
        "iscreatedpin": isCreatedPin,
        "dob": dob,
        "profile_picture": profilePicture,
        "is_2fa_active": is2faActive,
        "is_login_biometric_active": isLoginBiometricActive,
        "is_payment_biometric_active": isPaymentBiometricActive,
    "walletDetails": walletDetails!.toJson(),

  };

  @override
  String toString() {
    return 'VerifyEmailResponseData{id: $id, phoneNumber: $phoneNumber, userId: $userId, email: $email, firstName: $firstName, lastName: $lastName, verificationToken: $verificationToken, verificationTokenExpires: $verificationTokenExpires, tierLevels: $tierLevels, passwordResetToken: $passwordResetToken, passwordResetTokenExpires: $passwordResetTokenExpires, pinResetToken: $pinResetToken, pinResetTokenExpires: $pinResetTokenExpires, status: $status, deviceToken: $deviceToken, fcmToken: $fcmToken, isUploadedIdentityCard: $isUploadedIdentityCard, isDeleted: $isDeleted, referralCode: $referralCode, tag: $tag, token: $token, refreshToken: $refreshToken, tokenExpireAt: $tokenExpireAt, dob: $dob, profilePicture: $profilePicture, address: $address, gender: $gender, isCreatedPin: $isCreatedPin, is2faActive: $is2faActive, isLoginBiometricActive: $isLoginBiometricActive, isPaymentBiometricActive: $isPaymentBiometricActive}';
  }
}

class TagResponse {
  TagResponse({
    this.status,
    this.message,
    this.code,
    this.data,
  });

  String? status;
  String? message;
  int? code;
  TagResponseData? data;

  factory TagResponse.fromJson(Map<String, dynamic> json) => TagResponse(
        status: json["status"],
        message: json["message"],
        code: json["code"],
        data: TagResponseData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "code": code,
        "data": data!.toJson(),
      };
}

class TagResponseData {
  TagResponseData({
    this.userId,
    this.firstName,
    this.lastName,
    this.email,
    this.phoneNumber,
    this.referralCode,
    this.status,
    this.isDeleted,
    this.tag,
  });

  String? userId;
  String? firstName;
  String? lastName;
  String? email;
  String? phoneNumber;
  String? referralCode;
  String? status;
  bool? isDeleted;
  String? tag;

  factory TagResponseData.fromJson(Map<String, dynamic> json) =>
      TagResponseData(
        userId: json["user_id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        email: json["email"],
        phoneNumber: json["phone_number"],
        referralCode: json["referral_code"],
        status: json["status"],
        isDeleted: json["is_deleted"],
        tag: json["tag"],
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "first_name": firstName,
        "last_name": lastName,
        "email": email,
        "phone_number": phoneNumber,
        "referral_code": referralCode,
        "status": status,
        "is_deleted": isDeleted,
        "tag": tag,
      };
}
