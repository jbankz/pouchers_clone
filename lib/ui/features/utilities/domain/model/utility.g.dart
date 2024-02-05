// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'utility.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UtilityImpl _$$UtilityImplFromJson(Map<String, dynamic> json) =>
    _$UtilityImpl(
      responseCode: json['responseCode'] == null
          ? 0
          : const StringToNumSerializer().fromJson(json['responseCode']),
      responseCategoryCode: json['responseCategoryCode'] as num? ?? 0,
      message: json['message'] as String?,
      referenceNumber: json['referenceNumber'] as String?,
      transactionId: json['transactionId'] as String?,
      currency: json['currency'] as String?,
      exchangeRate: json['exchangeRate'] as String?,
      fee: json['fee'] == null
          ? 0
          : const StringToNumSerializer().fromJson(json['fee']),
      integrationStatus: json['integrationStatus'] as String?,
      additionalProperties: json['additionalProperties'] == null
          ? null
          : AdditionalProperties.fromJson(
              json['additionalProperties'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$UtilityImplToJson(_$UtilityImpl instance) =>
    <String, dynamic>{
      'responseCode':
          const StringToNumSerializer().toJson(instance.responseCode),
      'responseCategoryCode': instance.responseCategoryCode,
      'message': instance.message,
      'referenceNumber': instance.referenceNumber,
      'transactionId': instance.transactionId,
      'currency': instance.currency,
      'exchangeRate': instance.exchangeRate,
      'fee': const StringToNumSerializer().toJson(instance.fee),
      'integrationStatus': instance.integrationStatus,
      'additionalProperties': instance.additionalProperties,
    };

_$AdditionalPropertiesImpl _$$AdditionalPropertiesImplFromJson(
        Map<String, dynamic> json) =>
    _$AdditionalPropertiesImpl(
      debtBalance: json['debtBalance'] as num? ?? 0,
      unitsPayment: json['unitsPayment'] as num? ?? 0,
      paymentAmount: json['paymentAmount'] as num? ?? 0,
      arrearsBalance: json['arrearsBalance'] as num? ?? 0,
      totalPayment: json['totalPayment'] as num? ?? 0,
      completedTimestamp: json['completedTimestamp'] as String?,
      tariffRate: json['tariffRate'] as num? ?? 0,
      receiptNumber: json['receiptNumber'] as String?,
      merchantCustomerAccountName:
          json['merchantCustomerAccountName'] as String?,
      address: json['address'] as String?,
      customerAccountNumber: json['customerAccountNumber'] as String?,
      customerName: json['customerName'] as String?,
      paymentDate: json['paymentDate'] as String?,
      customerPhoneNumber: json['customerPhoneNumber'] as String?,
    );

Map<String, dynamic> _$$AdditionalPropertiesImplToJson(
        _$AdditionalPropertiesImpl instance) =>
    <String, dynamic>{
      'debtBalance': instance.debtBalance,
      'unitsPayment': instance.unitsPayment,
      'paymentAmount': instance.paymentAmount,
      'arrearsBalance': instance.arrearsBalance,
      'totalPayment': instance.totalPayment,
      'completedTimestamp': instance.completedTimestamp,
      'tariffRate': instance.tariffRate,
      'receiptNumber': instance.receiptNumber,
      'merchantCustomerAccountName': instance.merchantCustomerAccountName,
      'address': instance.address,
      'customerAccountNumber': instance.customerAccountNumber,
      'customerName': instance.customerName,
      'paymentDate': instance.paymentDate,
      'customerPhoneNumber': instance.customerPhoneNumber,
    };
