// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_cards.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GetCardsImpl _$$GetCardsImplFromJson(Map<String, dynamic> json) =>
    _$GetCardsImpl(
      status: json['status'] as String?,
      message: json['message'] as String?,
      code: json['code'] as int?,
      data: (json['data'] as List<dynamic>?)
              ?.map((e) => Data.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$$GetCardsImplToJson(_$GetCardsImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'code': instance.code,
      'data': instance.data,
    };
