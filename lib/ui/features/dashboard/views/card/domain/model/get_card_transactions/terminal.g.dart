// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'terminal.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TerminalImpl _$$TerminalImplFromJson(Map<String, dynamic> json) =>
    _$TerminalImpl(
      rrn: json['rrn'] as String?,
      stan: json['stan'] as String?,
      terminalId: json['terminalId'] as String?,
      terminalOperatingEnvironment:
          json['terminalOperatingEnvironment'] as String?,
      terminalAttendance: json['terminalAttendance'] as String?,
      terminalType: json['terminalType'] as String?,
      panEntryMode: json['panEntryMode'] as String?,
      pinEntryMode: json['pinEntryMode'] as String?,
      cardHolderPresence: json['cardHolderPresence'] as bool?,
      cardPresence: json['cardPresence'] as bool?,
      id: json['_id'] as String?,
    );

Map<String, dynamic> _$$TerminalImplToJson(_$TerminalImpl instance) =>
    <String, dynamic>{
      'rrn': instance.rrn,
      'stan': instance.stan,
      'terminalId': instance.terminalId,
      'terminalOperatingEnvironment': instance.terminalOperatingEnvironment,
      'terminalAttendance': instance.terminalAttendance,
      'terminalType': instance.terminalType,
      'panEntryMode': instance.panEntryMode,
      'pinEntryMode': instance.pinEntryMode,
      'cardHolderPresence': instance.cardHolderPresence,
      'cardPresence': instance.cardPresence,
      '_id': instance.id,
    };
