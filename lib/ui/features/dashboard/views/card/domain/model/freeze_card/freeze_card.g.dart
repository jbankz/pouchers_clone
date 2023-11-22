// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'freeze_card.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FreezeCardImpl _$$FreezeCardImplFromJson(Map<String, dynamic> json) =>
    _$FreezeCardImpl(
      status: json['status'] as String?,
      message: json['message'] as String?,
      code: json['code'] as int?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$FreezeCardImplToJson(_$FreezeCardImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'code': instance.code,
      'data': instance.data,
    };
