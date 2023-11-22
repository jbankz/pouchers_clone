// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verification.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VerificationImpl _$$VerificationImplFromJson(Map<String, dynamic> json) =>
    _$VerificationImpl(
      billingAddressLine1: json['billingAddressLine1'] as String?,
      billingAddressPostalCode: json['billingAddressPostalCode'] as String?,
      cvv: json['cvv'] as String?,
      expiry: json['expiry'] as String?,
      pin: json['pin'] as String?,
      threeDSecure: json['threeDSecure'] as String?,
      safeToken: json['safeToken'] as String?,
      authentication: json['authentication'] as String?,
      id: json['_id'] as String?,
    );

Map<String, dynamic> _$$VerificationImplToJson(_$VerificationImpl instance) =>
    <String, dynamic>{
      'billingAddressLine1': instance.billingAddressLine1,
      'billingAddressPostalCode': instance.billingAddressPostalCode,
      'cvv': instance.cvv,
      'expiry': instance.expiry,
      'pin': instance.pin,
      'threeDSecure': instance.threeDSecure,
      'safeToken': instance.safeToken,
      'authentication': instance.authentication,
      '_id': instance.id,
    };
