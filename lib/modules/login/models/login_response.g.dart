// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveStoreResponseDataAdapter extends TypeAdapter<HiveStoreResponseData> {
  @override
  final int typeId = 0;

  @override
  HiveStoreResponseData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveStoreResponseData(
      id: fields[0] as int?,
      phoneNumber: fields[1] as String?,
      userId: fields[2] as String?,
      email: fields[3] as String?,
      firstName: fields[4] as String?,
      lastName: fields[5] as String?,
      verificationToken: fields[6] as String?,
      verificationTokenExpires: fields[7] as dynamic,
      tierLevels: fields[8] as int?,
      status: fields[9] as String?,
      deviceToken: fields[10] as dynamic,
      fcmToken: fields[11] as dynamic,
      isUploadedIdentityCard: fields[12] as bool?,
      isDeleted: fields[13] as bool?,
      referralCode: fields[14] as String?,
      tag: fields[15] as dynamic,
      token: fields[16] as String?,
      refreshToken: fields[17] as String?,
      tokenExpireAt: fields[18] as DateTime?,
      dob: fields[19] as String?,
      gender: fields[20] as String?,
      address: fields[21] as String?,
      profilePicture: fields[22] as String?,
      is2faActive: fields[23] as bool?,
      isLoginBiometricActive: fields[24] as bool?,
      isPaymentBiometricActive: fields[25] as bool?,
      walletDetails: fields[26] as WalletDetails?,
    );
  }

  @override
  void write(BinaryWriter writer, HiveStoreResponseData obj) {
    writer
      ..writeByte(27)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.phoneNumber)
      ..writeByte(2)
      ..write(obj.userId)
      ..writeByte(3)
      ..write(obj.email)
      ..writeByte(4)
      ..write(obj.firstName)
      ..writeByte(5)
      ..write(obj.lastName)
      ..writeByte(6)
      ..write(obj.verificationToken)
      ..writeByte(7)
      ..write(obj.verificationTokenExpires)
      ..writeByte(8)
      ..write(obj.tierLevels)
      ..writeByte(9)
      ..write(obj.status)
      ..writeByte(10)
      ..write(obj.deviceToken)
      ..writeByte(11)
      ..write(obj.fcmToken)
      ..writeByte(12)
      ..write(obj.isUploadedIdentityCard)
      ..writeByte(13)
      ..write(obj.isDeleted)
      ..writeByte(14)
      ..write(obj.referralCode)
      ..writeByte(15)
      ..write(obj.tag)
      ..writeByte(16)
      ..write(obj.token)
      ..writeByte(17)
      ..write(obj.refreshToken)
      ..writeByte(18)
      ..write(obj.tokenExpireAt)
      ..writeByte(19)
      ..write(obj.dob)
      ..writeByte(20)
      ..write(obj.gender)
      ..writeByte(21)
      ..write(obj.address)
      ..writeByte(22)
      ..write(obj.profilePicture)
      ..writeByte(23)
      ..write(obj.is2faActive)
      ..writeByte(24)
      ..write(obj.isLoginBiometricActive)
      ..writeByte(25)
      ..write(obj.isPaymentBiometricActive)
      ..writeByte(26)
      ..write(obj.walletDetails);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveStoreResponseDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
