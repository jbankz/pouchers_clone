// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'funding_source.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FundingSourceImpl _$$FundingSourceImplFromJson(Map<String, dynamic> json) =>
    _$FundingSourceImpl(
      id: json['_id'] as String?,
      business: json['business'] as String?,
      type: json['type'] as String?,
      status: json['status'] as String?,
      jitGateway: json['jitGateway'],
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

Map<String, dynamic> _$$FundingSourceImplToJson(_$FundingSourceImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'business': instance.business,
      'type': instance.type,
      'status': instance.status,
      'jitGateway': instance.jitGateway,
      'isDefault': instance.isDefault,
      'isDeleted': instance.isDeleted,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      '__v': instance.v,
    };
