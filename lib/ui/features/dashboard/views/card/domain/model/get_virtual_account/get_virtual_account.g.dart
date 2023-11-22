// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_virtual_account.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GetVirtualAccountImpl _$$GetVirtualAccountImplFromJson(
        Map<String, dynamic> json) =>
    _$GetVirtualAccountImpl(
      status: json['status'] as String?,
      message: json['message'] as String?,
      code: json['code'] as int?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$GetVirtualAccountImplToJson(
        _$GetVirtualAccountImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'code': instance.code,
      'data': instance.data,
    };
