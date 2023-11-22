// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DataImpl _$$DataImplFromJson(Map<String, dynamic> json) => _$DataImpl(
      id: json['_id'] as String?,
      type: json['type'] as String?,
      brand: json['brand'] as String?,
      number: json['number'] as String?,
      expiryMonth: json['expiryMonth'] as String?,
      expiryYear: json['expiryYear'] as String?,
      cvv: json['cvv'] as String?,
      cvv2: json['cvv2'] as String?,
      defaultPin: json['defaultPin'] as String?,
      status: json['status'] as String?,
    );

Map<String, dynamic> _$$DataImplToJson(_$DataImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'type': instance.type,
      'brand': instance.brand,
      'number': instance.number,
      'expiryMonth': instance.expiryMonth,
      'expiryYear': instance.expiryYear,
      'cvv': instance.cvv,
      'cvv2': instance.cvv2,
      'defaultPin': instance.defaultPin,
      'status': instance.status,
    };
