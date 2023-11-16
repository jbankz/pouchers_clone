// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_tag_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CreateTagModelImpl _$$CreateTagModelImplFromJson(Map<String, dynamic> json) =>
    _$CreateTagModelImpl(
      status: json['status'] as String?,
      message: json['message'] as String?,
      code: json['code'] as int?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$CreateTagModelImplToJson(
        _$CreateTagModelImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'code': instance.code,
      'data': instance.data,
    };
