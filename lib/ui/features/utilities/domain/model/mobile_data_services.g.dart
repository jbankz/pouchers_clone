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
      code: json['code'] as String?,
      name: json['name'] as String?,
      shortCode: json['shortCode'] as String?,
      price: json['price'] == null
          ? 0
          : const StringToNumSerializer().fromJson(json['price']),
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
      'code': instance.code,
      'name': instance.name,
      'shortCode': instance.shortCode,
      'price': const StringToNumSerializer().toJson(instance.price),
      'serviceId': instance.serviceId,
    };
