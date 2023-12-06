// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attributes.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AttributesAdapter extends TypeAdapter<_$AttributesImpl> {
  @override
  final int typeId = 7;

  @override
  _$AttributesImpl read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$AttributesImpl(
      nipCode: fields[0] as String?,
      name: fields[1] as String?,
      cbnCode: fields[2] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, _$AttributesImpl obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.nipCode)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.cbnCode);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AttributesAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AttributesImpl _$$AttributesImplFromJson(Map<String, dynamic> json) =>
    _$AttributesImpl(
      nipCode: json['nipCode'] as String?,
      name: json['name'] as String?,
      cbnCode: json['cbnCode'] as String?,
    );

Map<String, dynamic> _$$AttributesImplToJson(_$AttributesImpl instance) =>
    <String, dynamic>{
      'nipCode': instance.nipCode,
      'name': instance.name,
      'cbnCode': instance.cbnCode,
    };
