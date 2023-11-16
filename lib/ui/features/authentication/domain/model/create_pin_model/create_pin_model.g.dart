// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_pin_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CreatePinModelImpl _$$CreatePinModelImplFromJson(Map<String, dynamic> json) =>
    _$CreatePinModelImpl(
      status: json['status'] as String?,
      message: json['message'] as String?,
      code: json['code'] as int?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$CreatePinModelImplToJson(
        _$CreatePinModelImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'code': instance.code,
      'data': instance.data,
    };
