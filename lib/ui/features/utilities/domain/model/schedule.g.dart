// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schedule.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ScheduleImpl _$$ScheduleImplFromJson(Map<String, dynamic> json) =>
    _$ScheduleImpl(
      id: json['id'] as num? ?? 0,
      scheduleId: json['schedule_id'] as String?,
      userId: json['user_id'] as String?,
      amount: json['amount'] as String?,
      recipient: json['recipient'] as String?,
      category: json['category'] as String?,
      subCategory: json['sub_category'] as String?,
      frequency: json['frequency'] as String?,
      createdAt: _$JsonConverterFromJson<String, DateTime>(
          json['created_at'], const DateTimeSerializer().fromJson),
      updatedAt: _$JsonConverterFromJson<String, DateTime>(
          json['updated_at'], const DateTimeSerializer().fromJson),
      mappedFrequency: json['mapped_frequency'] as String?,
      bankName: json['bank_name'] as String?,
      note: json['note'] as String?,
      status: json['status'] as String?,
      mobileOperatorPublicId: json['mobile_operator_public_id'] as String?,
      mobileOperatorServiceId: json['mobile_operator_service_id'] as String?,
      merchantAccount: json['merchant_account'] as String?,
      merchantService: json['merchant_service'] as String?,
    );

Map<String, dynamic> _$$ScheduleImplToJson(_$ScheduleImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'schedule_id': instance.scheduleId,
      'user_id': instance.userId,
      'amount': instance.amount,
      'recipient': instance.recipient,
      'category': instance.category,
      'sub_category': instance.subCategory,
      'frequency': instance.frequency,
      'created_at': _$JsonConverterToJson<String, DateTime>(
          instance.createdAt, const DateTimeSerializer().toJson),
      'updated_at': _$JsonConverterToJson<String, DateTime>(
          instance.updatedAt, const DateTimeSerializer().toJson),
      'mapped_frequency': instance.mappedFrequency,
      'bank_name': instance.bankName,
      'note': instance.note,
      'status': instance.status,
      'mobile_operator_public_id': instance.mobileOperatorPublicId,
      'mobile_operator_service_id': instance.mobileOperatorServiceId,
      'merchant_account': instance.merchantAccount,
      'merchant_service': instance.merchantService,
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);
