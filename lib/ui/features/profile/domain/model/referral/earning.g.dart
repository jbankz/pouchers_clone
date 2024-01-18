// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'earning.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class EarningAdapter extends TypeAdapter<Earning> {
  @override
  final int typeId = 3;

  @override
  Earning read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Earning(
      totalEarnings: fields[0] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Earning obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.totalEarnings);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EarningAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EarningImpl _$$EarningImplFromJson(Map<String, dynamic> json) =>
    _$EarningImpl(
      totalEarnings: json['total_earnings'] as String?,
    );

Map<String, dynamic> _$$EarningImplToJson(_$EarningImpl instance) =>
    <String, dynamic>{
      'total_earnings': instance.totalEarnings,
    };
