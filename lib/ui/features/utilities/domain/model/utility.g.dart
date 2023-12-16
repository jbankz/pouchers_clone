// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'utility.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UtilityImpl _$$UtilityImplFromJson(Map<String, dynamic> json) =>
    _$UtilityImpl(
      responseCode: json['responseCode'] as num? ?? 0,
      responseCategoryCode: json['responseCategoryCode'] as num? ?? 0,
      message: json['message'] as String?,
      referenceNumber: json['referenceNumber'] as String?,
      transactionId: json['transactionId'] as String?,
      currency: json['currency'] as String?,
      exchangeRate: json['exchangeRate'] as String?,
      fee: json['fee'] as String?,
    );

Map<String, dynamic> _$$UtilityImplToJson(_$UtilityImpl instance) =>
    <String, dynamic>{
      'responseCode': instance.responseCode,
      'responseCategoryCode': instance.responseCategoryCode,
      'message': instance.message,
      'referenceNumber': instance.referenceNumber,
      'transactionId': instance.transactionId,
      'currency': instance.currency,
      'exchangeRate': instance.exchangeRate,
      'fee': instance.fee,
    };
