// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vouchers.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class VouchersAdapter extends TypeAdapter<Vouchers> {
  @override
  final int typeId = 15;

  @override
  Vouchers read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Vouchers(
      code: fields[0] as String?,
      amount: fields[1] as num,
      buyerId: fields[2] as String?,
      gifteeId: fields[3] as String?,
      status: fields[4] as VoucherStatus,
      redeemed: fields[5] as bool,
      createdAt: fields[6] as DateTime?,
    );
  }

  @override
  void write(BinaryWriter writer, Vouchers obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.code)
      ..writeByte(1)
      ..write(obj.amount)
      ..writeByte(2)
      ..write(obj.buyerId)
      ..writeByte(3)
      ..write(obj.gifteeId)
      ..writeByte(4)
      ..write(obj.status)
      ..writeByte(5)
      ..write(obj.redeemed)
      ..writeByte(6)
      ..write(obj.createdAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is VouchersAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VouchersImpl _$$VouchersImplFromJson(Map<String, dynamic> json) =>
    _$VouchersImpl(
      code: json['code'] as String?,
      amount: json['amount'] == null
          ? 0
          : const StringToNumSerializer().fromJson(json['amount']),
      buyerId: json['buyer_id'] as String?,
      gifteeId: json['giftee_id'] as String?,
      status: $enumDecodeNullable(_$VoucherStatusEnumMap, json['status']) ??
          VoucherStatus.inactive,
      redeemed: json['redeemed'] as bool? ?? false,
      createdAt: _$JsonConverterFromJson<String, DateTime>(
          json['created_at'], const DateTimeSerializer().fromJson),
    );

Map<String, dynamic> _$$VouchersImplToJson(_$VouchersImpl instance) =>
    <String, dynamic>{
      'code': instance.code,
      'amount': const StringToNumSerializer().toJson(instance.amount),
      'buyer_id': instance.buyerId,
      'giftee_id': instance.gifteeId,
      'status': _$VoucherStatusEnumMap[instance.status]!,
      'redeemed': instance.redeemed,
      'created_at': _$JsonConverterToJson<String, DateTime>(
          instance.createdAt, const DateTimeSerializer().toJson),
    };

const _$VoucherStatusEnumMap = {
  VoucherStatus.inactive: 'inactive',
  VoucherStatus.active: 'active',
  VoucherStatus.allType: 'allType',
  VoucherStatus.redeemed: 'redeemed',
  VoucherStatus.gifted: 'gifted',
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
