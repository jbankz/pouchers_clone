// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_otp_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RequestOtpModelImpl _$$RequestOtpModelImplFromJson(
        Map<String, dynamic> json) =>
    _$RequestOtpModelImpl(
      status: json['status'] as String?,
      message: json['message'] as String?,
      code: json['code'] as int?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$RequestOtpModelImplToJson(
        _$RequestOtpModelImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'code': instance.code,
      'data': instance.data,
    };
