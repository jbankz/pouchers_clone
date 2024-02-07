// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AccountImpl _$$AccountImplFromJson(Map<String, dynamic> json) =>
    _$AccountImpl(
      id: json['_id'] as String?,
      business: json['business'] as String?,
      type: json['type'] as String?,
      currency: json['currency'] as String?,
      accountName: json['accountName'] as String?,
      bankCode: json['bankCode'] as String?,
      accountType: json['accountType'] as String?,
      accountNumber: json['accountNumber'] as String?,
      currentBalance: json['currentBalance'] as int?,
      availableBalance: json['availableBalance'] as int?,
      provider: json['provider'] as String?,
      providerReference: json['providerReference'] as String?,
      referenceCode: json['referenceCode'] as String?,
      isDefault: json['isDefault'] as bool?,
      isDeleted: json['isDeleted'] as bool?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      v: json['__v'] as int?,
    );

Map<String, dynamic> _$$AccountImplToJson(_$AccountImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'business': instance.business,
      'type': instance.type,
      'currency': instance.currency,
      'accountName': instance.accountName,
      'bankCode': instance.bankCode,
      'accountType': instance.accountType,
      'accountNumber': instance.accountNumber,
      'currentBalance': instance.currentBalance,
      'availableBalance': instance.availableBalance,
      'provider': instance.provider,
      'providerReference': instance.providerReference,
      'referenceCode': instance.referenceCode,
      'isDefault': instance.isDefault,
      'isDeleted': instance.isDeleted,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      '__v': instance.v,
    };
