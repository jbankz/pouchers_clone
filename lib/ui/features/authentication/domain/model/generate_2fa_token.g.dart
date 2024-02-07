// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generate_2fa_token.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$Generate2faTokenImpl _$$Generate2faTokenImplFromJson(
        Map<String, dynamic> json) =>
    _$Generate2faTokenImpl(
      twoFactorTempSecret: json['two_factor_temp_secret'] as String?,
      qrCodeUrl: json['qrCodeUrl'] as String?,
    );

Map<String, dynamic> _$$Generate2faTokenImplToJson(
        _$Generate2faTokenImpl instance) =>
    <String, dynamic>{
      'two_factor_temp_secret': instance.twoFactorTempSecret,
      'qrCodeUrl': instance.qrCodeUrl,
    };
