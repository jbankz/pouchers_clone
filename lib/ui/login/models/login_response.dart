import 'package:hive_flutter/hive_flutter.dart';
part 'login_response.g.dart';

class HiveStoreResponse {
  HiveStoreResponse({
    this.status,
    this.message,
    this.code,
    this.data,
  });

  String? status;
  String? message;
  int? code;
  HiveStoreResponseData? data;

  factory HiveStoreResponse.fromJson(Map<String, dynamic> json) => HiveStoreResponse(
    status: json["status"],
    message: json["message"],
    code: json["code"],
    data: HiveStoreResponseData.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "code": code,
    "data": data!.toJson(),
  };
}

@HiveType(typeId: 0)
class HiveStoreResponseData {
  HiveStoreResponseData({
    this.id,
    this.phoneNumber,
    this.userId,
    this.email,
    this.firstName,
    this.lastName,
    this.verificationToken,
    this.verificationTokenExpires,
    this.tierLevels,
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
    this.gender,
    this.address,
    this.profilePicture,
    this.is2faActive,
    this.isLoginBiometricActive,
    this.isPaymentBiometricActive
  });

  @HiveField(0)
  int? id;
  @HiveField(1)
  String? phoneNumber;
  @HiveField(2)
  String? userId;
  @HiveField(3)
  String? email;
  @HiveField(4)
  String? firstName;
  @HiveField(5)
  String? lastName;
  @HiveField(6)
  String? verificationToken;
  @HiveField(7)
  dynamic verificationTokenExpires;
  @HiveField(8)
  int? tierLevels;
  @HiveField(9)
  String? status;
  @HiveField(10)
  dynamic deviceToken;
  @HiveField(11)
  dynamic fcmToken;
  @HiveField(12)
  bool? isUploadedIdentityCard;
  @HiveField(13)
  bool? isDeleted;
  @HiveField(14)
  String? referralCode;
  @HiveField(15)
  dynamic tag;
  @HiveField(16)
  String? token;
  @HiveField(17)
  String? refreshToken;
  @HiveField(18)
  DateTime? tokenExpireAt;
  @HiveField(19)
  String? dob;
  @HiveField(20)
  String? gender;
  @HiveField(21)
  String? address;
  @HiveField(22)
  String? profilePicture;
  @HiveField(23)
  bool? is2faActive;
  @HiveField(24)
  bool? isLoginBiometricActive;
  @HiveField(25)
  bool? isPaymentBiometricActive;

  factory HiveStoreResponseData.fromJson(Map<String, dynamic> json) => HiveStoreResponseData(
    id: json["id"],
    phoneNumber: json["phone_number"],
    userId: json["user_id"],
    email: json["email"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    verificationToken: json["verification_token"],
    verificationTokenExpires: json["verification_token_expires"],
    tierLevels: json["tier_levels"],
    status: json["status"],
    deviceToken: json["device_token"],
    fcmToken: json["fcm_token"],
    isUploadedIdentityCard: json["is_uploaded_identity_card"],
    isDeleted: json["is_deleted"],
    referralCode: json["referral_code"],
    tag: json["tag"],
    token: json["token"],
    refreshToken: json["refreshToken"],
    tokenExpireAt: json["tokenExpireAt"] == null ? null : DateTime.parse(json["tokenExpireAt"]),
    dob: json["dob"],
    gender: json["gender"],
    address: json["address"],
    profilePicture: json["profile_picture"],
    is2faActive: json["is_2fa_active"],
    isLoginBiometricActive: json["is_login_biometric_active"],
    isPaymentBiometricActive: json["is_payment_biometric_active"]
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
    "dob" : dob,
    "gender" : gender,
    "address" : address,
    "profile_picture" : profilePicture,
    "is_2fa_active" : is2faActive,
    "is_login_biometric_active" : isLoginBiometricActive,
    "is_payment_biometric_active" : isPaymentBiometricActive
  };

  @override
  String toString() {
    return 'HiveStoreResponseData{id: $id, phoneNumber: $phoneNumber, userId: $userId, email: $email, firstName: $firstName, lastName: $lastName, verificationToken: $verificationToken, verificationTokenExpires: $verificationTokenExpires, tierLevels: $tierLevels, status: $status, deviceToken: $deviceToken, fcmToken: $fcmToken, isUploadedIdentityCard: $isUploadedIdentityCard, isDeleted: $isDeleted, referralCode: $referralCode, tag: $tag, token: $token, refreshToken: $refreshToken, tokenExpireAt: $tokenExpireAt, dob: $dob, gender: $gender, address: $address, profilePicture: $profilePicture, is2faActive: $is2faActive, isLoginBiometricActive: $isLoginBiometricActive, isPaymentBiometricActive: $isPaymentBiometricActive}';
  }
}