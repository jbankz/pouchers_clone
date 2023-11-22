// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_exchange_rate.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GetExchangeRateImpl _$$GetExchangeRateImplFromJson(
        Map<String, dynamic> json) =>
    _$GetExchangeRateImpl(
      status: json['status'] as String?,
      message: json['message'] as String?,
      code: json['code'] as int?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$GetExchangeRateImplToJson(
        _$GetExchangeRateImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'code': instance.code,
      'data': instance.data,
    };
