// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_exchange_rate.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GetExchangeRateImpl _$$GetExchangeRateImplFromJson(
        Map<String, dynamic> json) =>
    _$GetExchangeRateImpl(
      rate: json['rate'] as String?,
      sell: json['sell'] as String?,
      buy: json['buy'] as String?,
    );

Map<String, dynamic> _$$GetExchangeRateImplToJson(
        _$GetExchangeRateImpl instance) =>
    <String, dynamic>{
      'rate': instance.rate,
      'sell': instance.sell,
      'buy': instance.buy,
    };
