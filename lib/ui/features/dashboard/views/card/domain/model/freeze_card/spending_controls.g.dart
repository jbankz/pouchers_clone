// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'spending_controls.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SpendingControlsImpl _$$SpendingControlsImplFromJson(
        Map<String, dynamic> json) =>
    _$SpendingControlsImpl(
      channels: json['channels'] == null
          ? null
          : Channels.fromJson(json['channels'] as Map<String, dynamic>),
      allowedCategories: json['allowedCategories'] as List<dynamic>?,
      blockedCategories: json['blockedCategories'] as List<dynamic>?,
      spendingLimits: json['spendingLimits'] as List<dynamic>?,
      id: json['_id'] as String?,
    );

Map<String, dynamic> _$$SpendingControlsImplToJson(
        _$SpendingControlsImpl instance) =>
    <String, dynamic>{
      'channels': instance.channels,
      'allowedCategories': instance.allowedCategories,
      'blockedCategories': instance.blockedCategories,
      'spendingLimits': instance.spendingLimits,
      '_id': instance.id,
    };
