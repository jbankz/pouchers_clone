// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mobile_data_services.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MobileOperatorServicesImpl _$$MobileOperatorServicesImplFromJson(
        Map<String, dynamic> json) =>
    _$MobileOperatorServicesImpl(
      mobileOperatorId: json['mobileOperatorId'] as num? ?? 0,
      servicePrice: json['servicePrice'] as num? ?? 0,
      validityPeriod: json['validityPeriod'] as String?,
      dataValue: json['dataValue'] as String?,
      serviceName: json['serviceName'] as String?,
      serviceId: json['serviceId'] as num? ?? 0,
    );

Map<String, dynamic> _$$MobileOperatorServicesImplToJson(
        _$MobileOperatorServicesImpl instance) =>
    <String, dynamic>{
      'mobileOperatorId': instance.mobileOperatorId,
      'servicePrice': instance.servicePrice,
      'validityPeriod': instance.validityPeriod,
      'dataValue': instance.dataValue,
      'serviceName': instance.serviceName,
      'serviceId': instance.serviceId,
    };
