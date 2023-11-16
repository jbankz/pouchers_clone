// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'validate_reset_password_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ValidateResetPasswordModelImpl _$$ValidateResetPasswordModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ValidateResetPasswordModelImpl(
      status: json['status'] as String?,
      message: json['message'] as String?,
      code: json['code'] as int?,
      data: json['data'] == null
          ? null
          : User.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ValidateResetPasswordModelImplToJson(
        _$ValidateResetPasswordModelImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'code': instance.code,
      'data': instance.data,
    };
