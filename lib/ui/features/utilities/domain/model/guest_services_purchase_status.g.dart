// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'guest_services_purchase_status.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GuestServicesPurchaseStatusImpl _$$GuestServicesPurchaseStatusImplFromJson(
        Map<String, dynamic> json) =>
    _$GuestServicesPurchaseStatusImpl(
      referenceNumber: json['referenceNumber'] as String?,
      statusCode: const StringToNumSerializer().fromJson(json['statusCode']),
      statusMessage: json['statusMessage'] as String?,
      requestAmount: json['requestAmount'] as num?,
      totalPaymentAmount: json['totalPaymentAmount'] as num?,
      currency: $enumDecodeNullable(_$CurrencyEnumMap, json['currency']),
      expiryDateTimeUTC: json['expiryDateTimeUTC'] as String?,
    );

Map<String, dynamic> _$$GuestServicesPurchaseStatusImplToJson(
        _$GuestServicesPurchaseStatusImpl instance) =>
    <String, dynamic>{
      'referenceNumber': instance.referenceNumber,
      'statusCode': _$JsonConverterToJson<dynamic, num>(
          instance.statusCode, const StringToNumSerializer().toJson),
      'statusMessage': instance.statusMessage,
      'requestAmount': instance.requestAmount,
      'totalPaymentAmount': instance.totalPaymentAmount,
      'currency': _$CurrencyEnumMap[instance.currency],
      'expiryDateTimeUTC': instance.expiryDateTimeUTC,
    };

const _$CurrencyEnumMap = {
  Currency.NGN: 'NGN',
  Currency.USD: 'USD',
};

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);
