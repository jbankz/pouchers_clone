// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wallet_details.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WalletDetailsAdapter extends TypeAdapter<WalletDetails> {
  @override
  final int typeId = 1;

  @override
  WalletDetails read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return WalletDetails(
      balance: fields[0] as String?,
      walletType: fields[1] as String?,
      accountName: fields[2] as String?,
      accountNumber: fields[3] as String?,
      bankProvider: fields[4] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, WalletDetails obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.balance)
      ..writeByte(1)
      ..write(obj.walletType)
      ..writeByte(2)
      ..write(obj.accountName)
      ..writeByte(3)
      ..write(obj.accountNumber)
      ..writeByte(4)
      ..write(obj.bankProvider);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WalletDetailsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
