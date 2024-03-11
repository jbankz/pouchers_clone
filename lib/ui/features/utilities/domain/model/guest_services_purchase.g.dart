// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'guest_services_purchase.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GuestServicesPurchaseImpl _$$GuestServicesPurchaseImplFromJson(
        Map<String, dynamic> json) =>
    _$GuestServicesPurchaseImpl(
      referenceNumber: json['referenceNumber'] as String?,
      statusCode: const StringToNumSerializer().fromJson(json['statusCode']),
      statusMessage: json['statusMessage'] as String?,
      requestAmount: json['requestAmount'] as num?,
      totalPaymentAmount: json['totalPaymentAmount'] as num?,
      currency: $enumDecodeNullable(_$CurrencyEnumMap, json['currency']) ??
          Currency.ngn,
      paymentMethods: (json['paymentMethods'] as List<dynamic>?)
              ?.map((e) => PaymentMethod.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$GuestServicesPurchaseImplToJson(
        _$GuestServicesPurchaseImpl instance) =>
    <String, dynamic>{
      'referenceNumber': instance.referenceNumber,
      'statusCode': _$JsonConverterToJson<dynamic, num>(
          instance.statusCode, const StringToNumSerializer().toJson),
      'statusMessage': instance.statusMessage,
      'requestAmount': instance.requestAmount,
      'totalPaymentAmount': instance.totalPaymentAmount,
      'currency': _$CurrencyEnumMap[instance.currency]!,
      'paymentMethods': instance.paymentMethods,
    };

const _$CurrencyEnumMap = {
  Currency.ngn: 'NGN',
  Currency.usd: 'USD',
};

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);

_$PaymentMethodImpl _$$PaymentMethodImplFromJson(Map<String, dynamic> json) =>
    _$PaymentMethodImpl(
      name: json['name'] as String?,
      properties: json['properties'] == null
          ? null
          : Properties.fromJson(json['properties'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$PaymentMethodImplToJson(_$PaymentMethodImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'properties': instance.properties,
    };

_$PropertiesImpl _$$PropertiesImplFromJson(Map<String, dynamic> json) =>
    _$PropertiesImpl(
      webPaymentLink: json['WebPaymentLink'] as String?,
      uSSDShortCode: json['USSDShortCode'] as String?,
      paymentReference: json['PaymentReference'] as String?,
    );

Map<String, dynamic> _$$PropertiesImplToJson(_$PropertiesImpl instance) =>
    <String, dynamic>{
      'WebPaymentLink': instance.webPaymentLink,
      'USSDShortCode': instance.uSSDShortCode,
      'PaymentReference': instance.paymentReference,
    };
