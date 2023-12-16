// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'billers.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BillersImpl _$$BillersImplFromJson(Map<String, dynamic> json) =>
    _$BillersImpl(
      name: json['name'] as String?,
      displayName: json['display_name'] as String?,
      category: json['category'] as String?,
      status: json['status'] as String?,
      logoUrl: json['logo_url'] as String?,
      operatorpublicid: json['operatorpublicid'] as String?,
    );

Map<String, dynamic> _$$BillersImplToJson(_$BillersImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'display_name': instance.displayName,
      'category': instance.category,
      'status': instance.status,
      'logo_url': instance.logoUrl,
      'operatorpublicid': instance.operatorpublicid,
    };
