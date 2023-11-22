// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'channels.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChannelsImpl _$$ChannelsImplFromJson(Map<String, dynamic> json) =>
    _$ChannelsImpl(
      atm: json['atm'] as bool?,
      pos: json['pos'] as bool?,
      web: json['web'] as bool?,
      mobile: json['mobile'] as bool?,
      id: json['_id'] as String?,
    );

Map<String, dynamic> _$$ChannelsImplToJson(_$ChannelsImpl instance) =>
    <String, dynamic>{
      'atm': instance.atm,
      'pos': instance.pos,
      'web': instance.web,
      'mobile': instance.mobile,
      '_id': instance.id,
    };
