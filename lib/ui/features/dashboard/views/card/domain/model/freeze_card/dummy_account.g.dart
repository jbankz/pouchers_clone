// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dummy_account.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DummyAccountImpl _$$DummyAccountImplFromJson(Map<String, dynamic> json) =>
    _$DummyAccountImpl(
      currency: json['currency'] as String?,
      bankCode: json['bankCode'] as String?,
      accountType: json['accountType'] as String?,
      accountNumber: json['accountNumber'] as String?,
      id: json['_id'] as String?,
    );

Map<String, dynamic> _$$DummyAccountImplToJson(_$DummyAccountImpl instance) =>
    <String, dynamic>{
      'currency': instance.currency,
      'bankCode': instance.bankCode,
      'accountType': instance.accountType,
      'accountNumber': instance.accountNumber,
      '_id': instance.id,
    };
