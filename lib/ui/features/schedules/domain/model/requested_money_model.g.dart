// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'requested_money_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RequestedMoneyModelImpl _$$RequestedMoneyModelImplFromJson(
        Map<String, dynamic> json) =>
    _$RequestedMoneyModelImpl(
      id: json['id'] as num?,
      requestId: json['request_id'] as String?,
      requesteeUserId: json['requestee_user_id'] as String?,
      requesterUserId: json['requester_user_id'] as String?,
      amount: json['amount'] == null
          ? 0
          : const StringToNumSerializer().fromJson(json['amount']),
      fulfilledAmount: json['fulfilled_amount'] == null
          ? 0
          : const StringToNumSerializer().fromJson(json['fulfilled_amount']),
      createdAt: _$JsonConverterFromJson<String, DateTime>(
          json['created_at'], const DateTimeSerializer().fromJson),
      updatedAt: _$JsonConverterFromJson<String, DateTime>(
          json['updated_at'], const DateTimeSerializer().fromJson),
      note: json['note'] as String?,
      status: json['status'] as String?,
      reason: json['reason'] as String?,
    );

Map<String, dynamic> _$$RequestedMoneyModelImplToJson(
        _$RequestedMoneyModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'request_id': instance.requestId,
      'requestee_user_id': instance.requesteeUserId,
      'requester_user_id': instance.requesterUserId,
      'amount': const StringToNumSerializer().toJson(instance.amount),
      'fulfilled_amount':
          const StringToNumSerializer().toJson(instance.fulfilledAmount),
      'created_at': _$JsonConverterToJson<String, DateTime>(
          instance.createdAt, const DateTimeSerializer().toJson),
      'updated_at': _$JsonConverterToJson<String, DateTime>(
          instance.updatedAt, const DateTimeSerializer().toJson),
      'note': instance.note,
      'status': instance.status,
      'reason': instance.reason,
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
