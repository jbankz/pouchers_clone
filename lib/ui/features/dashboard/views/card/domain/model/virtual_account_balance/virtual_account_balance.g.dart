// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'virtual_account_balance.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VirtualAccountBalanceImpl _$$VirtualAccountBalanceImplFromJson(
        Map<String, dynamic> json) =>
    _$VirtualAccountBalanceImpl(
      status: json['status'] as String?,
      message: json['message'] as String?,
      code: json['code'] as int?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$VirtualAccountBalanceImplToJson(
        _$VirtualAccountBalanceImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'code': instance.code,
      'data': instance.data,
    };
