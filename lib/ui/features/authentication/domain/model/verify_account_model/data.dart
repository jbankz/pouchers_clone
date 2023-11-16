import 'package:freezed_annotation/freezed_annotation.dart';

part 'data.freezed.dart';
part 'data.g.dart';

@freezed
class Data with _$Data {
  factory Data(
      {int? id,
      @JsonKey(name: 'phone_number') String? phoneNumber,
      @JsonKey(name: 'user_id') String? userId,
      String? email,
      @JsonKey(name: 'first_name') String? firstName,
      @JsonKey(name: 'last_name') String? lastName,
      @JsonKey(name: 'verification_token') dynamic verificationToken,
      @JsonKey(name: 'verification_token_expires')
      dynamic verificationTokenExpires,
      @JsonKey(name: 'tier_levels') int? tierLevels,
      @JsonKey(name: 'password_reset_token') dynamic passwordResetToken,
      @JsonKey(name: 'password_reset_token_expires')
      dynamic passwordResetTokenExpires,
      @JsonKey(name: 'pin_reset_token') String? pinResetToken,
      @JsonKey(name: 'pin_reset_token_expires') String? pinResetTokenExpires,
      String? status,
      @JsonKey(name: 'device_token') String? deviceToken,
      @JsonKey(name: 'fcm_token') String? fcmToken,
      @JsonKey(name: 'is_uploaded_identity_card') bool? isUploadedIdentityCard,
      @JsonKey(name: 'is_deleted') bool? isDeleted,
      @JsonKey(name: 'referral_code') String? referralCode,
      dynamic tag,
      String? token,
      String? refreshToken,
      String? tokenExpireAt}) = _Data;

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}
