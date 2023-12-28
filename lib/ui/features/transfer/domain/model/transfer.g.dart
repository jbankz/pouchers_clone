// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transfer.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AttributesAdapter extends TypeAdapter<_$TransferImpl> {
  @override
  final int typeId = 7;

  @override
  _$TransferImpl read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$TransferImpl();
  }

  @override
  void write(BinaryWriter writer, _$TransferImpl obj) {
    writer.writeByte(0);
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

_$TransferImpl _$$TransferImplFromJson(Map<String, dynamic> json) =>
    _$TransferImpl(
      transactionId: json['transaction_id'] as String?,
      senderName: json['sender_name'] as String?,
      receiverName: json['receiver_name'] as String?,
      receiverTag: _$JsonConverterFromJson<String, String>(
          json['receiver_tag'], const TagSerializer().fromJson),
      note: json['note'] as String?,
      amount: json['amount'] == null
          ? 0
          : const StringToNumSerializer().fromJson(json['amount']),
      transactionDate: json['transaction_date'] as String?,
      status: json['status'] as String?,
    );

Map<String, dynamic> _$$TransferImplToJson(_$TransferImpl instance) =>
    <String, dynamic>{
      'transaction_id': instance.transactionId,
      'sender_name': instance.senderName,
      'receiver_name': instance.receiverName,
      'receiver_tag': _$JsonConverterToJson<String, String>(
          instance.receiverTag, const TagSerializer().toJson),
      'note': instance.note,
      'amount': const StringToNumSerializer().toJson(instance.amount),
      'transaction_date': instance.transactionDate,
      'status': instance.status,
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
