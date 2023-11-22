// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_history.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RequestHistoryImpl _$$RequestHistoryImplFromJson(Map<String, dynamic> json) =>
    _$RequestHistoryImpl(
      amount: json['amount'] as int?,
      currency: json['currency'] as String?,
      approved: json['approved'] as bool?,
      merchantAmount: json['merchantAmount'] as int?,
      merchantCurrency: json['merchantCurrency'] as String?,
      reason: json['reason'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      id: json['_id'] as String?,
    );

Map<String, dynamic> _$$RequestHistoryImplToJson(
        _$RequestHistoryImpl instance) =>
    <String, dynamic>{
      'amount': instance.amount,
      'currency': instance.currency,
      'approved': instance.approved,
      'merchantAmount': instance.merchantAmount,
      'merchantCurrency': instance.merchantCurrency,
      'reason': instance.reason,
      'createdAt': instance.createdAt?.toIso8601String(),
      '_id': instance.id,
    };
