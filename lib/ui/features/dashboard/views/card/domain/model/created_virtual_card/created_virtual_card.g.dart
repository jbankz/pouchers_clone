// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'created_virtual_card.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CreatedVirtualCardImpl _$$CreatedVirtualCardImplFromJson(
        Map<String, dynamic> json) =>
    _$CreatedVirtualCardImpl(
      status: json['status'] as String?,
      message: json['message'] as String?,
      code: json['code'] as int?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$CreatedVirtualCardImplToJson(
        _$CreatedVirtualCardImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'code': instance.code,
      'data': instance.data,
    };
