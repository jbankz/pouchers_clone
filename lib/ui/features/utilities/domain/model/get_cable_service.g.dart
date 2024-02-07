// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_cable_service.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class GetCableServiceAdapter extends TypeAdapter<GetCableService> {
  @override
  final int typeId = 13;

  @override
  GetCableService read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return GetCableService(
      referenceNumber: fields[0] as String?,
      services: (fields[1] as List).cast<CableService>(),
    );
  }

  @override
  void write(BinaryWriter writer, GetCableService obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.referenceNumber)
      ..writeByte(1)
      ..write(obj.services);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GetCableServiceAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GetCableServiceImpl _$$GetCableServiceImplFromJson(
        Map<String, dynamic> json) =>
    _$GetCableServiceImpl(
      referenceNumber: json['referenceNumber'] as String?,
      services: (json['services'] as List<dynamic>?)
              ?.map((e) => CableService.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$GetCableServiceImplToJson(
        _$GetCableServiceImpl instance) =>
    <String, dynamic>{
      'referenceNumber': instance.referenceNumber,
      'services': instance.services,
    };
