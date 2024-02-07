// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fund_virtual_account.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FundVirtualAccountImpl _$$FundVirtualAccountImplFromJson(
        Map<String, dynamic> json) =>
    _$FundVirtualAccountImpl(
      status: json['status'] as String?,
      message: json['message'] as String?,
      code: json['code'] as int?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$FundVirtualAccountImplToJson(
        _$FundVirtualAccountImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'code': instance.code,
      'data': instance.data,
    };
