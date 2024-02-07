// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DataImpl _$$DataImplFromJson(Map<String, dynamic> json) => _$DataImpl(
      userId: json['user_id'] as String?,
      sudoId: json['sudo_id'] as String?,
      accountType: json['account_type'] as String?,
      accountNumber: json['account_number'] as String?,
      accountName: json['account_name'] as String?,
      brand: $enumDecodeNullable(_$CardBrandEnumMap, json['brand']) ??
          CardBrand.Verve,
      currency: $enumDecodeNullable(_$CurrencyEnumMap, json['currency']) ??
          Currency.NGN,
    );

Map<String, dynamic> _$$DataImplToJson(_$DataImpl instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'sudo_id': instance.sudoId,
      'account_type': instance.accountType,
      'account_number': instance.accountNumber,
      'account_name': instance.accountName,
      'brand': _$CardBrandEnumMap[instance.brand],
      'currency': _$CurrencyEnumMap[instance.currency],
    };

const _$CardBrandEnumMap = {
  CardBrand.Verve: 'Verve',
  CardBrand.Visa: 'Visa',
  CardBrand.MasterCard: 'MasterCard',
};

const _$CurrencyEnumMap = {
  Currency.NGN: 'NGN',
  Currency.USD: 'USD',
};
