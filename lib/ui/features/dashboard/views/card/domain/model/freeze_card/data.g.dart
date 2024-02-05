// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DataImpl _$$DataImplFromJson(Map<String, dynamic> json) => _$DataImpl(
      id: json['_id'] as String?,
      business: json['business'] as String?,
      customer: json['customer'] == null
          ? null
          : Customer.fromJson(json['customer'] as Map<String, dynamic>),
      account: json['account'] as String?,
      fundingSource: json['fundingSource'] as String?,
      type: json['type'] as String?,
      brand: json['brand'] as String?,
      currency: json['currency'] as String?,
      maskedPan: json['maskedPan'] as String?,
      last4: json['last4'] as String?,
      expiryMonth: json['expiryMonth'] as String?,
      expiryYear: json['expiryYear'] as String?,
      status: $enumDecodeNullable(_$CardStatusEnumMap, json['status']) ??
          CardStatus.active,
      dummyAccount: json['dummyAccount'] == null
          ? null
          : DummyAccount.fromJson(json['dummyAccount'] as Map<String, dynamic>),
      is2FaEnrolled: json['is2FAEnrolled'] as bool?,
      spendingControls: json['spendingControls'] == null
          ? null
          : SpendingControls.fromJson(
              json['spendingControls'] as Map<String, dynamic>),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$DataImplToJson(_$DataImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'business': instance.business,
      'customer': instance.customer,
      'account': instance.account,
      'fundingSource': instance.fundingSource,
      'type': instance.type,
      'brand': instance.brand,
      'currency': instance.currency,
      'maskedPan': instance.maskedPan,
      'last4': instance.last4,
      'expiryMonth': instance.expiryMonth,
      'expiryYear': instance.expiryYear,
      'status': _$CardStatusEnumMap[instance.status],
      'dummyAccount': instance.dummyAccount,
      'is2FAEnrolled': instance.is2FaEnrolled,
      'spendingControls': instance.spendingControls,
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };

const _$CardStatusEnumMap = {
  CardStatus.active: 'active',
  CardStatus.inactive: 'inactive',
  CardStatus.success: 'success',
};
