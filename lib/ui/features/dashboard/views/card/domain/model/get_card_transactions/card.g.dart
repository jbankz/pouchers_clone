// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CardImpl _$$CardImplFromJson(Map<String, dynamic> json) => _$CardImpl(
      id: json['_id'] as String?,
      business: json['business'] as String?,
      customer: json['customer'] as String?,
      account: json['account'] as String?,
      fundingSource: json['fundingSource'] as String?,
      type: json['type'] as String?,
      brand: json['brand'] as String?,
      currency: json['currency'] as String?,
      maskedPan: json['maskedPan'] as String?,
      expiryMonth: json['expiryMonth'] as String?,
      expiryYear: json['expiryYear'] as String?,
      status: json['status'] as String?,
      is2FaEnrolled: json['is2FAEnrolled'] as bool?,
      isDefaultPinChanged: json['isDefaultPINChanged'] as bool?,
      isDeleted: json['isDeleted'] as bool?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      v: json['__v'] as int?,
    );

Map<String, dynamic> _$$CardImplToJson(_$CardImpl instance) =>
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
      'expiryMonth': instance.expiryMonth,
      'expiryYear': instance.expiryYear,
      'status': instance.status,
      'is2FAEnrolled': instance.is2FaEnrolled,
      'isDefaultPINChanged': instance.isDefaultPinChanged,
      'isDeleted': instance.isDeleted,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      '__v': instance.v,
    };
