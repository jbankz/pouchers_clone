// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_account_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VerifyAccountModelImpl _$$VerifyAccountModelImplFromJson(
        Map<String, dynamic> json) =>
    _$VerifyAccountModelImpl(
      status: json['status'] as String?,
      message: json['message'] as String?,
      code: json['code'] as int?,
      data: json['data'] == null
          ? null
          : User.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$VerifyAccountModelImplToJson(
        _$VerifyAccountModelImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'code': instance.code,
      'data': instance.data,
    };
