// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_card_token.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GetCardTokenImpl _$$GetCardTokenImplFromJson(Map<String, dynamic> json) =>
    _$GetCardTokenImpl(
      status: json['status'] as String?,
      message: json['message'] as String?,
      code: json['code'] as int?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$GetCardTokenImplToJson(_$GetCardTokenImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'code': instance.code,
      'data': instance.data,
    };
