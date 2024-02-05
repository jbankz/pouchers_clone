// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card_brand.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CardBrandAdapter extends TypeAdapter<CardBrand> {
  @override
  final int typeId = 28;

  @override
  CardBrand read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return CardBrand.verve;
      case 1:
        return CardBrand.visa;
      case 2:
        return CardBrand.masterCard;
      default:
        return CardBrand.verve;
    }
  }

  @override
  void write(BinaryWriter writer, CardBrand obj) {
    switch (obj) {
      case CardBrand.verve:
        writer.writeByte(0);
        break;
      case CardBrand.visa:
        writer.writeByte(1);
        break;
      case CardBrand.masterCard:
        writer.writeByte(2);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CardBrandAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
