// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DataImpl _$$DataImplFromJson(Map<String, dynamic> json) => _$DataImpl(
      id: json['id'] as int?,
      phoneNumber: json['phone_number'] as String?,
      userId: json['user_id'] as String?,
      email: json['email'] as String?,
      firstName: json['first_name'] as String?,
      lastName: json['last_name'] as String?,
      verificationToken: json['verification_token'],
      verificationTokenExpires: json['verification_token_expires'],
      tierLevels: json['tier_levels'] as int?,
      passwordResetToken: json['password_reset_token'],
      passwordResetTokenExpires: json['password_reset_token_expires'],
      pinResetToken: json['pin_reset_token'] as String?,
      pinResetTokenExpires: json['pin_reset_token_expires'] as String?,
      status: json['status'] as String?,
      deviceToken: json['device_token'] as String?,
      fcmToken: json['fcm_token'] as String?,
      isUploadedIdentityCard: json['is_uploaded_identity_card'] as bool?,
      isDeleted: json['is_deleted'] as bool?,
      referralCode: json['referral_code'] as String?,
      tag: json['tag'],
      token: json['token'] as String?,
      refreshToken: json['refreshToken'] as String?,
      tokenExpireAt: json['tokenExpireAt'] as String?,
    );

Map<String, dynamic> _$$DataImplToJson(_$DataImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'phone_number': instance.phoneNumber,
      'user_id': instance.userId,
      'email': instance.email,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'verification_token': instance.verificationToken,
      'verification_token_expires': instance.verificationTokenExpires,
      'tier_levels': instance.tierLevels,
      'password_reset_token': instance.passwordResetToken,
      'password_reset_token_expires': instance.passwordResetTokenExpires,
      'pin_reset_token': instance.pinResetToken,
      'pin_reset_token_expires': instance.pinResetTokenExpires,
      'status': instance.status,
      'device_token': instance.deviceToken,
      'fcm_token': instance.fcmToken,
      'is_uploaded_identity_card': instance.isUploadedIdentityCard,
      'is_deleted': instance.isDeleted,
      'referral_code': instance.referralCode,
      'tag': instance.tag,
      'token': instance.token,
      'refreshToken': instance.refreshToken,
      'tokenExpireAt': instance.tokenExpireAt,
    };
