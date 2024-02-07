// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wallet.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WalletAdapter extends TypeAdapter<Wallet> {
  @override
  final int typeId = 5;

  @override
  Wallet read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Wallet(
      walletId: fields[0] as String?,
      userId: fields[1] as String?,
      credit: fields[2] as String?,
      debit: fields[3] as String?,
      balance: fields[4] as String?,
      walletType: fields[5] as String?,
      accountName: fields[6] as String?,
      accountNumber: fields[7] as String?,
      bankProvider: fields[8] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Wallet obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.walletId)
      ..writeByte(1)
      ..write(obj.userId)
      ..writeByte(2)
      ..write(obj.credit)
      ..writeByte(3)
      ..write(obj.debit)
      ..writeByte(4)
      ..write(obj.balance)
      ..writeByte(5)
      ..write(obj.walletType)
      ..writeByte(6)
      ..write(obj.accountName)
      ..writeByte(7)
      ..write(obj.accountNumber)
      ..writeByte(8)
      ..write(obj.bankProvider);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WalletAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WalletImpl _$$WalletImplFromJson(Map<String, dynamic> json) => _$WalletImpl(
      walletId: json['wallet_id'] as String?,
      userId: json['user_id'] as String?,
      credit: json['credit'] as String?,
      debit: json['debit'] as String?,
      balance: json['balance'] as String?,
      walletType: json['wallet_type'] as String?,
      accountName: json['account_name'] as String?,
      accountNumber: json['account_number'] as String?,
      bankProvider: json['bank_provider'] as String?,
    );

Map<String, dynamic> _$$WalletImplToJson(_$WalletImpl instance) =>
    <String, dynamic>{
      'wallet_id': instance.walletId,
      'user_id': instance.userId,
      'credit': instance.credit,
      'debit': instance.debit,
      'balance': instance.balance,
      'wallet_type': instance.walletType,
      'account_name': instance.accountName,
      'account_number': instance.accountNumber,
      'bank_provider': instance.bankProvider,
    };
