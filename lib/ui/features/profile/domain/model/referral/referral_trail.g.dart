// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'referral_trail.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ReferralTrailAdapter extends TypeAdapter<_$ReferralTrailImpl> {
  @override
  final int typeId = 4;

  @override
  _$ReferralTrailImpl read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$ReferralTrailImpl(
      id: fields[0] as int?,
      referredUserId: fields[1] as String?,
      isPaid: fields[2] as bool?,
      referralAmount: fields[3] as String?,
      firstName: fields[4] as String?,
      lastName: fields[5] as String?,
      createdAt: fields[6] as DateTime?,
      updatedAt: fields[7] as DateTime?,
    );
  }

  @override
  void write(BinaryWriter writer, _$ReferralTrailImpl obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.referredUserId)
      ..writeByte(2)
      ..write(obj.isPaid)
      ..writeByte(3)
      ..write(obj.referralAmount)
      ..writeByte(4)
      ..write(obj.firstName)
      ..writeByte(5)
      ..write(obj.lastName)
      ..writeByte(6)
      ..write(obj.createdAt)
      ..writeByte(7)
      ..write(obj.updatedAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ReferralTrailAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ReferralTrailImpl _$$ReferralTrailImplFromJson(Map<String, dynamic> json) =>
    _$ReferralTrailImpl(
      id: json['id'] as int?,
      referredUserId: json['referred_user_id'] as String?,
      isPaid: json['is_paid'] as bool?,
      referralAmount: json['referral_amount'] as String?,
      firstName: json['first_name'] as String?,
      lastName: json['last_name'] as String?,
      createdAt: _$JsonConverterFromJson<String, DateTime>(
          json['created_at'], const DateTimeSerializer().fromJson),
      updatedAt: _$JsonConverterFromJson<String, DateTime>(
          json['updated_at'], const DateTimeSerializer().fromJson),
    );

Map<String, dynamic> _$$ReferralTrailImplToJson(_$ReferralTrailImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'referred_user_id': instance.referredUserId,
      'is_paid': instance.isPaid,
      'referral_amount': instance.referralAmount,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'created_at': _$JsonConverterToJson<String, DateTime>(
          instance.createdAt, const DateTimeSerializer().toJson),
      'updated_at': _$JsonConverterToJson<String, DateTime>(
          instance.updatedAt, const DateTimeSerializer().toJson),
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
