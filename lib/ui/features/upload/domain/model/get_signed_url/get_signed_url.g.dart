// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_signed_url.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GetSignedUrlImpl _$$GetSignedUrlImplFromJson(Map<String, dynamic> json) =>
    _$GetSignedUrlImpl(
      status: json['status'] as String?,
      message: json['message'] as String?,
      code: json['code'] as int?,
      data: json['data'] as String?,
    );

Map<String, dynamic> _$$GetSignedUrlImplToJson(_$GetSignedUrlImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'code': instance.code,
      'data': instance.data,
    };
