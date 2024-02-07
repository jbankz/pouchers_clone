// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'envs.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EnvsImpl _$$EnvsImplFromJson(Map<String, dynamic> json) => _$EnvsImpl(
      name: json['name'] as String?,
      value: json['value'] as String?,
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$$EnvsImplToJson(_$EnvsImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'value': instance.value,
      'updated_at': instance.updatedAt?.toIso8601String(),
    };
