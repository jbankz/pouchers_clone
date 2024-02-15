// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'guest_local_bank.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GuestLocalBankImpl _$$GuestLocalBankImplFromJson(Map<String, dynamic> json) =>
    _$GuestLocalBankImpl(
      name: json['name'] as String?,
      uuid: json['uuid'] as String?,
      interInstitutionCode: json['interInstitutionCode'] == null
          ? 0
          : const StringToNumSerializer()
              .fromJson(json['interInstitutionCode']),
      sortCode: json['sortCode'] == null
          ? 0
          : const StringToNumSerializer().fromJson(json['sortCode']),
      ussdCode: json['ussdCode'] == null
          ? 0
          : const StringToNumSerializer().fromJson(json['ussdCode']),
    );

Map<String, dynamic> _$$GuestLocalBankImplToJson(
        _$GuestLocalBankImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'uuid': instance.uuid,
      'interInstitutionCode':
          const StringToNumSerializer().toJson(instance.interInstitutionCode),
      'sortCode': const StringToNumSerializer().toJson(instance.sortCode),
      'ussdCode': const StringToNumSerializer().toJson(instance.ussdCode),
    };
