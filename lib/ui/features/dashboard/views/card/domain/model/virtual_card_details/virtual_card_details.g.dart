// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'virtual_card_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VirtualCardDetailsImpl _$$VirtualCardDetailsImplFromJson(
        Map<String, dynamic> json) =>
    _$VirtualCardDetailsImpl(
      id: json['_id'] as String?,
      type: json['type'] as String?,
      brand: json['brand'] as String?,
      number: json['number'] as String?,
      expiryMonth: json['expiryMonth'] as String?,
      expiryYear: json['expiryYear'] as String?,
      cvv: json['cvv'] as String?,
      cvv2: json['cvv2'] as String?,
      defaultPin: json['defaultPin'] as String?,
      status: $enumDecodeNullable(_$CardStatusEnumMap, json['status']) ??
          CardStatus.active,
    );

Map<String, dynamic> _$$VirtualCardDetailsImplToJson(
        _$VirtualCardDetailsImpl instance) =>
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
      'status': _$CardStatusEnumMap[instance.status],
    };

const _$CardStatusEnumMap = {
  CardStatus.active: 'active',
  CardStatus.inactive: 'inactive',
};
