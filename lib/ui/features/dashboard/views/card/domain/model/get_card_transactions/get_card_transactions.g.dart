// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_card_transactions.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GetCardTransactionsImpl _$$GetCardTransactionsImplFromJson(
        Map<String, dynamic> json) =>
    _$GetCardTransactionsImpl(
      status: json['status'] as String?,
      message: json['message'] as String?,
      code: json['code'] as int?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Datum.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$GetCardTransactionsImplToJson(
        _$GetCardTransactionsImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'code': instance.code,
      'data': instance.data,
    };
