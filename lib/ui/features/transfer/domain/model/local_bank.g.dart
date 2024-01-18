// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_bank.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LocalBankAdapter extends TypeAdapter<LocalBank> {
  @override
  final int typeId = 6;

  @override
  LocalBank read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LocalBank(
      id: fields[0] as String?,
      type: fields[1] as String?,
      attributes: fields[2] as Attributes?,
    );
  }

  @override
  void write(BinaryWriter writer, LocalBank obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.type)
      ..writeByte(2)
      ..write(obj.attributes);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LocalBankAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LocalBankImpl _$$LocalBankImplFromJson(Map<String, dynamic> json) =>
    _$LocalBankImpl(
      id: json['id'] as String?,
      type: json['type'] as String?,
      attributes: json['attributes'] == null
          ? null
          : Attributes.fromJson(json['attributes'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$LocalBankImplToJson(_$LocalBankImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'attributes': instance.attributes,
    };
