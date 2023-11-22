// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_metadata.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TransactionMetadataImpl _$$TransactionMetadataImplFromJson(
        Map<String, dynamic> json) =>
    _$TransactionMetadataImpl(
      channel: json['channel'] as String?,
      type: json['type'] as String?,
      reference: json['reference'] as String?,
      id: json['_id'] as String?,
    );

Map<String, dynamic> _$$TransactionMetadataImplToJson(
        _$TransactionMetadataImpl instance) =>
    <String, dynamic>{
      'channel': instance.channel,
      'type': instance.type,
      'reference': instance.reference,
      '_id': instance.id,
    };
