// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fee_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FeeDetailImpl _$$FeeDetailImplFromJson(Map<String, dynamic> json) =>
    _$FeeDetailImpl(
      contract: json['contract'] as String?,
      currency: json['currency'] as String?,
      amount: json['amount'] as int?,
      description: json['description'] as String?,
      id: json['_id'] as String?,
    );

Map<String, dynamic> _$$FeeDetailImplToJson(_$FeeDetailImpl instance) =>
    <String, dynamic>{
      'contract': instance.contract,
      'currency': instance.currency,
      'amount': instance.amount,
      'description': instance.description,
      '_id': instance.id,
    };
