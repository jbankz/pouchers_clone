// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'billers.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BillersAdapter extends TypeAdapter<Billers> {
  @override
  final int typeId = 12;

  @override
  Billers read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Billers(
      name: fields[0] as String?,
      displayName: fields[1] as String?,
      category: fields[2] as String?,
      status: fields[3] as String?,
      logoUrl: fields[4] as String?,
      operatorpublicid: fields[5] as String?,
      isAvailable: fields[6] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, Billers obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.displayName)
      ..writeByte(2)
      ..write(obj.category)
      ..writeByte(3)
      ..write(obj.status)
      ..writeByte(4)
      ..write(obj.logoUrl)
      ..writeByte(5)
      ..write(obj.operatorpublicid)
      ..writeByte(6)
      ..write(obj.isAvailable);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BillersAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

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
      isAvailable: json['isAvailable'] as bool? ?? false,
    );

Map<String, dynamic> _$$BillersImplToJson(_$BillersImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'display_name': instance.displayName,
      'category': instance.category,
      'status': instance.status,
      'logo_url': instance.logoUrl,
      'operatorpublicid': instance.operatorpublicid,
      'isAvailable': instance.isAvailable,
    };
