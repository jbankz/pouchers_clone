// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cable_service.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CableServiceAdapter extends TypeAdapter<CableService> {
  @override
  final int typeId = 14;

  @override
  CableService read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CableService(
      name: fields[0] as String?,
      code: fields[1] as String?,
      category: fields[2] as String?,
      status: fields[3] as String?,
      price: fields[4] as num,
      shortCode: fields[5] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, CableService obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.code)
      ..writeByte(2)
      ..write(obj.category)
      ..writeByte(3)
      ..write(obj.status)
      ..writeByte(4)
      ..write(obj.price)
      ..writeByte(5)
      ..write(obj.shortCode);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CableServiceAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CableServiceImpl _$$CableServiceImplFromJson(Map<String, dynamic> json) =>
    _$CableServiceImpl(
      name: json['name'] as String?,
      code: json['code'] as String?,
      category: json['category'] as String?,
      status: json['status'] as String?,
      price: json['price'] == null
          ? 0
          : const StringToNumSerializer().fromJson(json['price']),
      shortCode: json['shortCode'] as String?,
    );

Map<String, dynamic> _$$CableServiceImplToJson(_$CableServiceImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'code': instance.code,
      'category': instance.category,
      'status': instance.status,
      'price': const StringToNumSerializer().toJson(instance.price),
      'shortCode': instance.shortCode,
    };
