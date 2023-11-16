// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wallet_details.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WalletDetailsAdapter extends TypeAdapter<_$WalletDetailsImpl> {
  @override
  final int typeId = 2;

  @override
  _$WalletDetailsImpl read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$WalletDetailsImpl(
      walletType: fields[0] as String?,
      accountName: fields[1] as String?,
      accountNumber: fields[2] as String?,
      bankProvider: fields[3] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, _$WalletDetailsImpl obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.walletType)
      ..writeByte(1)
      ..write(obj.accountName)
      ..writeByte(2)
      ..write(obj.accountNumber)
      ..writeByte(3)
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

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WalletDetailsImpl _$$WalletDetailsImplFromJson(Map<String, dynamic> json) =>
    _$WalletDetailsImpl(
      balance: json['balance'] as String?,
      walletType: json['wallet_type'] as String?,
      accountName: json['account_name'] as String?,
      accountNumber: json['account_number'] as String?,
      bankProvider: json['bank_provider'] as String?,
    );

Map<String, dynamic> _$$WalletDetailsImplToJson(_$WalletDetailsImpl instance) =>
    <String, dynamic>{
      'balance': instance.balance,
      'wallet_type': instance.walletType,
      'account_name': instance.accountName,
      'account_number': instance.accountNumber,
      'bank_provider': instance.bankProvider,
    };
