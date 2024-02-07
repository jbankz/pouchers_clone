// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_merchants.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class GetMerchantAdapter extends TypeAdapter<GetMerchant> {
  @override
  final int typeId = 10;

  @override
  GetMerchant read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return GetMerchant(
      responseCode: fields[0] as num,
      responseCategoryCode: fields[1] as String?,
      referenceNumber: fields[2] as String?,
      merchants: (fields[3] as List).cast<Merchant>(),
    );
  }

  @override
  void write(BinaryWriter writer, GetMerchant obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.responseCode)
      ..writeByte(1)
      ..write(obj.responseCategoryCode)
      ..writeByte(2)
      ..write(obj.referenceNumber)
      ..writeByte(3)
      ..write(obj.merchants);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GetMerchantAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GetMerchantImpl _$$GetMerchantImplFromJson(Map<String, dynamic> json) =>
    _$GetMerchantImpl(
      responseCode: json['responseCode'] as num? ?? 0,
      responseCategoryCode: json['responseCategoryCode'] as String?,
      referenceNumber: json['referenceNumber'] as String?,
      merchants: (json['merchants'] as List<dynamic>?)
              ?.map((e) => Merchant.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$GetMerchantImplToJson(_$GetMerchantImpl instance) =>
    <String, dynamic>{
      'responseCode': instance.responseCode,
      'responseCategoryCode': instance.responseCategoryCode,
      'referenceNumber': instance.referenceNumber,
      'merchants': instance.merchants,
    };
