// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DataImpl _$$DataImplFromJson(Map<String, dynamic> json) => _$DataImpl(
      tier1: json['tier1'] == null
          ? null
          : Tier.fromJson(json['tier1'] as Map<String, dynamic>),
      tier2: json['tier2'] == null
          ? null
          : Tier.fromJson(json['tier2'] as Map<String, dynamic>),
      tier3: json['tier3'] == null
          ? null
          : Tier.fromJson(json['tier3'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$DataImplToJson(_$DataImpl instance) =>
    <String, dynamic>{
      'tier1': instance.tier1,
      'tier2': instance.tier2,
      'tier3': instance.tier3,
    };
