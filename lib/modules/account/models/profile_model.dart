class EditProfileResponse {
  EditProfileResponse({
    this.status,
    this.message,
    this.code,
    this.data,
  });

  String? status;
  String? message;
  int? code;
  EditProfileData? data;

  factory EditProfileResponse.fromJson(Map<String, dynamic> json) =>
      EditProfileResponse(
        status: json["status"],
        message: json["message"],
        code: json["code"],
        data: EditProfileData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "code": code,
        "data": data!.toJson(),
      };

  @override
  String toString() {
    return 'EditProfileResponse{status: $status, message: $message, code: $code, data: $data}';
  }
}

class Biometric {
  Biometric({this.isLoginBiometricActive, this.isPaymentBiometricActive});

  bool? isLoginBiometricActive;
  bool? isPaymentBiometricActive;

  factory Biometric.fromJson(Map<String, dynamic> json) => Biometric(
      isPaymentBiometricActive: json["is_payment_biometric_active"],
      isLoginBiometricActive: json["is_login_biometric_active"]);

  Map<String, dynamic> toJson() => {
        "is_login_biometric_active": isLoginBiometricActive,
        "is_payment_biometric_active": isPaymentBiometricActive
      };

  Biometric copyWith(
          {bool? isLoginBiometricActive, bool? isPaymentBiometricActive}) =>
      Biometric(
          isLoginBiometricActive:
              isLoginBiometricActive ?? this.isLoginBiometricActive,
          isPaymentBiometricActive:
              isPaymentBiometricActive ?? this.isPaymentBiometricActive);
}

class EditProfileData {
  EditProfileData(
      {this.id,
      this.userId,
      this.phoneNumber,
      this.email,
      this.firstName,
      this.lastName,
      this.tierLevels,
      this.status,
      this.deviceToken,
      this.fcmToken,
      this.isUploadedIdentityCard,
      this.referralCode,
      this.tag,
      this.dob,
      this.profilePicture,
      this.address,
      this.gender,
      this.utilityBill,
      this.isLoginBiometricActive,
      this.isPaymentBiometricActive});

  int? id;
  String? userId;
  String? phoneNumber;
  String? email;
  String? firstName;
  String? lastName;
  int? tierLevels;
  String? status;
  dynamic deviceToken;
  dynamic fcmToken;
  bool? isUploadedIdentityCard;
  String? referralCode;
  String? tag;
  String? dob;
  String? profilePicture;
  String? address;
  String? gender;
  String? utilityBill;
  bool? isLoginBiometricActive;
  bool? isPaymentBiometricActive;

  factory EditProfileData.fromJson(Map<String, dynamic> json) =>
      EditProfileData(
          id: json["id"],
          userId: json["user_id"],
          phoneNumber: json["phone_number"],
          email: json["email"],
          firstName: json["first_name"],
          lastName: json["last_name"],
          tierLevels: json["tier_levels"],
          status: json["status"],
          deviceToken: json["device_token"],
          fcmToken: json["fcm_token"],
          isUploadedIdentityCard: json["is_uploaded_identity_card"],
          referralCode: json["referral_code"],
          tag: json["tag"],
          dob: json["dob"],
          profilePicture: json["profile_picture"],
          address: json["address"],
          gender: json["gender"],
          utilityBill: json["utility_bill"],
          isPaymentBiometricActive: json["is_payment_biometric_active"],
          isLoginBiometricActive: json["is_login_biometric_active"]);

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "phone_number": phoneNumber,
        "email": email,
        "first_name": firstName,
        "last_name": lastName,
        "tier_levels": tierLevels,
        "status": status,
        "device_token": deviceToken,
        "fcm_token": fcmToken,
        "is_uploaded_identity_card": isUploadedIdentityCard,
        "referral_code": referralCode,
        "tag": tag,
        "dob": dob,
        "profile_picture": profilePicture,
        "address": address,
        "gender": gender,
        "utility_bill": utilityBill,
        "is_login_biometric_active": isLoginBiometricActive,
        "is_payment_biometric_active": isPaymentBiometricActive
      };

  EditProfileData copyWith(
          {int? id,
          String? userId,
          String? phoneNumber,
          String? email,
          String? firstName,
          String? lastName,
          int? tierLevels,
          String? status,
          dynamic deviceToken,
          dynamic fcmToken,
          bool? isUploadedIdentityCard,
          String? referralCode,
          String? tag,
          String? dob,
          dynamic profilePicture,
          String? address,
          String? gender,
          String? utilityBill,
          bool? isLoginBiometricActive,
          bool? isPaymentBiometricActive}) =>
      EditProfileData(
          id: id ?? this.id,
          userId: userId ?? this.userId,
          phoneNumber: phoneNumber ?? this.phoneNumber,
          email: email ?? this.email,
          firstName: firstName ?? this.firstName,
          lastName: lastName ?? this.lastName,
          tierLevels: tierLevels ?? this.tierLevels,
          status: status ?? this.status,
          deviceToken: deviceToken ?? this.deviceToken,
          fcmToken: fcmToken ?? this.fcmToken,
          isUploadedIdentityCard:
              isUploadedIdentityCard ?? this.isUploadedIdentityCard,
          referralCode: referralCode ?? this.referralCode,
          tag: tag ?? this.tag,
          dob: dob ?? this.dob,
          profilePicture: profilePicture ?? this.profilePicture,
          address: address ?? this.address,
          gender: gender ?? this.gender,
          utilityBill: utilityBill ?? this.utilityBill,
          isLoginBiometricActive:
              isLoginBiometricActive ?? this.isLoginBiometricActive,
          isPaymentBiometricActive:
              isPaymentBiometricActive ?? this.isPaymentBiometricActive);

  @override
  String toString() {
    return 'EditProfileData{id: $id, userId: $userId, phoneNumber: $phoneNumber, email: $email, firstName: $firstName, lastName: $lastName, tierLevels: $tierLevels, status: $status, deviceToken: $deviceToken, fcmToken: $fcmToken, isUploadedIdentityCard: $isUploadedIdentityCard, referralCode: $referralCode, tag: $tag, dob: $dob, profilePicture: $profilePicture, address: $address, gender: $gender, utilityBill: $utilityBill, isLoginBiometricActive: $isLoginBiometricActive, isPaymentBiometricActive: $isPaymentBiometricActive}';
  }
}

List<String> idMethodList = ["Driver’s license", "VNIN", "Voter’s card", "International passport"];
