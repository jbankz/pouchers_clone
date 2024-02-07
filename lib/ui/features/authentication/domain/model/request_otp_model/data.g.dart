// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DataImpl _$$DataImplFromJson(Map<String, dynamic> json) => _$DataImpl(
      userId: json['user_id'] as String?,
      firstName: json['first_name'] as String?,
      lastName: json['last_name'] as String?,
      email: json['email'] as String?,
      phoneNumber: json['phone_number'] as String?,
      referralCode: json['referral_code'] as String?,
      status: json['status'] as String?,
      verificationToken: json['verification_token'] as String?,
      verificationTokenExpires: json['verification_token_expires'] == null
          ? null
          : DateTime.parse(json['verification_token_expires'] as String),
      tag: json['tag'] as String?,
    );

Map<String, dynamic> _$$DataImplToJson(_$DataImpl instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'email': instance.email,
      'phone_number': instance.phoneNumber,
      'referral_code': instance.referralCode,
      'status': instance.status,
      'verification_token': instance.verificationToken,
      'verification_token_expires':
          instance.verificationTokenExpires?.toIso8601String(),
      'tag': instance.tag,
    };
