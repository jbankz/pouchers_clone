// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'virtual_card_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VirtualCardDetailsImpl _$$VirtualCardDetailsImplFromJson(
        Map<String, dynamic> json) =>
    _$VirtualCardDetailsImpl(
      status: json['status'] as String?,
      message: json['message'] as String?,
      code: json['code'] as int?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$VirtualCardDetailsImplToJson(
        _$VirtualCardDetailsImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'code': instance.code,
      'data': instance.data,
    };
