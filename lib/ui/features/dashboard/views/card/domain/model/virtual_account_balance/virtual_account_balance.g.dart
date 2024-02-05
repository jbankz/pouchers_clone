// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'virtual_account_balance.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VirtualAccountBalanceImpl _$$VirtualAccountBalanceImplFromJson(
        Map<String, dynamic> json) =>
    _$VirtualAccountBalanceImpl(
      currentBalance: json['currentBalance'] as num? ?? 0,
      availableBalance: json['availableBalance'] as num? ?? 0,
    );

Map<String, dynamic> _$$VirtualAccountBalanceImplToJson(
        _$VirtualAccountBalanceImpl instance) =>
    <String, dynamic>{
      'currentBalance': instance.currentBalance,
      'availableBalance': instance.availableBalance,
    };
