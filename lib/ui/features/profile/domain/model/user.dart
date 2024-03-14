import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

import '../../../../../app/core/constants/db_constants.dart';
import '../../../../../app/serializer/tag_serializer.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
@HiveType(typeId: DbConstants.one)
class User with _$User {
  factory User(
      {int? id,
      @JsonKey(name: 'phone_number') @HiveField(0) String? phoneNumber,
      @JsonKey(name: 'user_id') @HiveField(1) String? userId,
      @HiveField(2) String? email,
      @JsonKey(name: 'first_name') @HiveField(3) String? firstName,
      @JsonKey(name: 'last_name') @HiveField(4) String? lastName,
      @JsonKey(name: 'verification_token')
      @HiveField(5)
      String? verificationToken,
      @JsonKey(name: 'verification_token_expires')
      @HiveField(6)
      String? verificationTokenExpires,
      @JsonKey(name: 'tier_levels') @Default(1) @HiveField(7) int tierLevels,
      @JsonKey(name: 'password_reset_token')
      @HiveField(8)
      String? passwordResetToken,
      @JsonKey(name: 'password_reset_token_expires')
      @HiveField(9)
      String? passwordResetTokenExpires,
      @JsonKey(name: 'pin_reset_token') @HiveField(10) String? pinResetToken,
      @JsonKey(name: 'pin_reset_token_expires')
      @HiveField(11)
      String? pinResetTokenExpires,
      @HiveField(12) String? status,
      @JsonKey(name: 'device_token') @HiveField(13) String? deviceToken,
      @JsonKey(name: 'fcm_token') @HiveField(14) String? fcmToken,
      @JsonKey(name: 'is_uploaded_identity_card')
      @Default(false)
      @HiveField(15)
      bool isUploadedIdentityCard,
      @JsonKey(name: 'referral_code') @HiveField(16) String? referralCode,
      @TagSerializer() @HiveField(17) String? tag,
      @HiveField(18) String? dob,
      @JsonKey(name: 'profile_picture') @HiveField(19) String? profilePicture,
      @HiveField(20) String? address,
      @HiveField(21) String? pin,
      @HiveField(22) String? gender,
      @JsonKey(name: 'iscreatedpin', defaultValue: false)
      @HiveField(23)
      bool? iscreatedpin,
      @JsonKey(name: 'two_factor_temp_secret')
      @HiveField(24)
      String? twoFactorTempSecret,
      @JsonKey(name: 'is_2fa_active') bool? is2faActive,
      @HiveField(25) @JsonKey(name: 'utility_bill') String? utilityBill,
      @JsonKey(name: 'is_login_biometric_active', defaultValue: false)
      bool? isLoginBiometricActive,
      @HiveField(26)
      @JsonKey(name: 'is_payment_biometric_active', defaultValue: false)
      bool? isPaymentBiometricActive,
      @HiveField(27) String? token,
      @HiveField(28) String? refreshToken,
      @HiveField(29) String? tokenExpireAt,
      @HiveField(30) String? state,
      @HiveField(31) @JsonKey(name: 'postal_code') String? postalCode,
      @HiveField(32)
      @JsonKey(name: 'is_completed_kyc')
      @Default(false)
      bool isCompletedKyc}) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
