// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reset_password_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ResetPasswordModelImpl _$$ResetPasswordModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ResetPasswordModelImpl(
      status: json['status'] as String?,
      message: json['message'] as String?,
      code: json['code'] as int?,
    );

Map<String, dynamic> _$$ResetPasswordModelImplToJson(
        _$ResetPasswordModelImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'code': instance.code,
    };
