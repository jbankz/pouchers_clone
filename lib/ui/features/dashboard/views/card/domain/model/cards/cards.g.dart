// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cards.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CardsAdapter extends TypeAdapter<Cards> {
  @override
  final int typeId = 27;

  @override
  Cards read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Cards(
      userId: fields[0] as String?,
      accountId: fields[1] as String?,
      accountType: fields[2] as String?,
      accountNumber: fields[3] as String?,
      accountName: fields[4] as String?,
      brand: fields[5] as CardBrand?,
      currency: fields[6] as Currency?,
      last4: fields[7] as String?,
      expiryMonth: fields[8] as String?,
      expiryYear: fields[9] as String?,
      cardStatus: fields[10] as String?,
      cardId: fields[11] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Cards obj) {
    writer
      ..writeByte(12)
      ..writeByte(0)
      ..write(obj.userId)
      ..writeByte(1)
      ..write(obj.accountId)
      ..writeByte(2)
      ..write(obj.accountType)
      ..writeByte(3)
      ..write(obj.accountNumber)
      ..writeByte(4)
      ..write(obj.accountName)
      ..writeByte(5)
      ..write(obj.brand)
      ..writeByte(6)
      ..write(obj.currency)
      ..writeByte(7)
      ..write(obj.last4)
      ..writeByte(8)
      ..write(obj.expiryMonth)
      ..writeByte(9)
      ..write(obj.expiryYear)
      ..writeByte(10)
      ..write(obj.cardStatus)
      ..writeByte(11)
      ..write(obj.cardId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CardsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CardsImpl _$$CardsImplFromJson(Map<String, dynamic> json) => _$CardsImpl(
      userId: json['user_id'] as String?,
      accountId: json['account_id'] as String?,
      accountType: json['account_type'] as String?,
      accountNumber: json['account_number'] as String?,
      accountName: json['account_name'] as String?,
      brand: $enumDecodeNullable(_$CardBrandEnumMap, json['brand']) ??
          CardBrand.verve,
      currency: $enumDecodeNullable(_$CurrencyEnumMap, json['currency']) ??
          Currency.ngn,
      last4: json['last4'] as String?,
      expiryMonth: json['expiry_month'] as String?,
      expiryYear: json['expiry_year'] as String?,
      cardStatus: json['card_status'] as String?,
      cardId: json['card_id'] as String?,
    );

Map<String, dynamic> _$$CardsImplToJson(_$CardsImpl instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'account_id': instance.accountId,
      'account_type': instance.accountType,
      'account_number': instance.accountNumber,
      'account_name': instance.accountName,
      'brand': _$CardBrandEnumMap[instance.brand],
      'currency': _$CurrencyEnumMap[instance.currency],
      'last4': instance.last4,
      'expiry_month': instance.expiryMonth,
      'expiry_year': instance.expiryYear,
      'card_status': instance.cardStatus,
      'card_id': instance.cardId,
    };

const _$CardBrandEnumMap = {
  CardBrand.verve: 'Verve',
  CardBrand.visa: 'Visa',
  CardBrand.masterCard: 'MasterCard',
};

const _$CurrencyEnumMap = {
  Currency.ngn: 'NGN',
  Currency.usd: 'USD',
};
