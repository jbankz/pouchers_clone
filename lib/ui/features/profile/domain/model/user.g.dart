// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserAdapter extends TypeAdapter<User> {
  @override
  final int typeId = 1;

  @override
  User read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return User(
      phoneNumber: fields[0] as String?,
      userId: fields[1] as String?,
      email: fields[2] as String?,
      firstName: fields[3] as String?,
      lastName: fields[4] as String?,
      verificationToken: fields[5] as String?,
      verificationTokenExpires: fields[6] as String?,
      tierLevels: fields[7] as int,
      passwordResetToken: fields[8] as String?,
      passwordResetTokenExpires: fields[9] as String?,
      pinResetToken: fields[10] as String?,
      pinResetTokenExpires: fields[11] as String?,
      status: fields[12] as String?,
      deviceToken: fields[13] as String?,
      fcmToken: fields[14] as String?,
      isUploadedIdentityCard: fields[15] as bool,
      referralCode: fields[16] as String?,
      tag: fields[17] as String?,
      dob: fields[18] as String?,
      profilePicture: fields[19] as String?,
      address: fields[20] as String?,
      pin: fields[21] as String?,
      gender: fields[22] as String?,
      iscreatedpin: fields[23] as bool?,
      twoFactorTempSecret: fields[24] as String?,
      utilityBill: fields[25] as dynamic,
      isPaymentBiometricActive: fields[26] as bool?,
      token: fields[27] as String?,
      refreshToken: fields[28] as String?,
      tokenExpireAt: fields[29] as String?,
      state: fields[30] as String?,
      postalCode: fields[31] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, User obj) {
    writer
      ..writeByte(32)
      ..writeByte(0)
      ..write(obj.phoneNumber)
      ..writeByte(1)
      ..write(obj.userId)
      ..writeByte(2)
      ..write(obj.email)
      ..writeByte(3)
      ..write(obj.firstName)
      ..writeByte(4)
      ..write(obj.lastName)
      ..writeByte(5)
      ..write(obj.verificationToken)
      ..writeByte(6)
      ..write(obj.verificationTokenExpires)
      ..writeByte(7)
      ..write(obj.tierLevels)
      ..writeByte(8)
      ..write(obj.passwordResetToken)
      ..writeByte(9)
      ..write(obj.passwordResetTokenExpires)
      ..writeByte(10)
      ..write(obj.pinResetToken)
      ..writeByte(11)
      ..write(obj.pinResetTokenExpires)
      ..writeByte(12)
      ..write(obj.status)
      ..writeByte(13)
      ..write(obj.deviceToken)
      ..writeByte(14)
      ..write(obj.fcmToken)
      ..writeByte(15)
      ..write(obj.isUploadedIdentityCard)
      ..writeByte(16)
      ..write(obj.referralCode)
      ..writeByte(17)
      ..write(obj.tag)
      ..writeByte(18)
      ..write(obj.dob)
      ..writeByte(19)
      ..write(obj.profilePicture)
      ..writeByte(20)
      ..write(obj.address)
      ..writeByte(21)
      ..write(obj.pin)
      ..writeByte(22)
      ..write(obj.gender)
      ..writeByte(23)
      ..write(obj.iscreatedpin)
      ..writeByte(24)
      ..write(obj.twoFactorTempSecret)
      ..writeByte(25)
      ..write(obj.utilityBill)
      ..writeByte(26)
      ..write(obj.isPaymentBiometricActive)
      ..writeByte(27)
      ..write(obj.token)
      ..writeByte(28)
      ..write(obj.refreshToken)
      ..writeByte(29)
      ..write(obj.tokenExpireAt)
      ..writeByte(30)
      ..write(obj.state)
      ..writeByte(31)
      ..write(obj.postalCode);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
      id: json['id'] as int?,
      phoneNumber: json['phone_number'] as String?,
      userId: json['user_id'] as String?,
      email: json['email'] as String?,
      firstName: json['first_name'] as String?,
      lastName: json['last_name'] as String?,
      verificationToken: json['verification_token'] as String?,
      verificationTokenExpires: json['verification_token_expires'] as String?,
      tierLevels: json['tier_levels'] as int? ?? 1,
      passwordResetToken: json['password_reset_token'] as String?,
      passwordResetTokenExpires:
          json['password_reset_token_expires'] as String?,
      pinResetToken: json['pin_reset_token'] as String?,
      pinResetTokenExpires: json['pin_reset_token_expires'] as String?,
      status: json['status'] as String?,
      deviceToken: json['device_token'] as String?,
      fcmToken: json['fcm_token'] as String?,
      isUploadedIdentityCard:
          json['is_uploaded_identity_card'] as bool? ?? false,
      referralCode: json['referral_code'] as String?,
      tag: _$JsonConverterFromJson<String, String>(
          json['tag'], const TagSerializer().fromJson),
      dob: json['dob'] as String?,
      profilePicture: json['profile_picture'] as String?,
      address: json['address'] as String?,
      pin: json['pin'] as String?,
      gender: json['gender'] as String?,
      iscreatedpin: json['iscreatedpin'] as bool? ?? false,
      twoFactorTempSecret: json['two_factor_temp_secret'] as String?,
      is2faActive: json['is_2fa_active'] as bool?,
      utilityBill: json['utility_bill'],
      isLoginBiometricActive:
          json['is_login_biometric_active'] as bool? ?? false,
      isPaymentBiometricActive:
          json['is_payment_biometric_active'] as bool? ?? false,
      token: json['token'] as String?,
      refreshToken: json['refreshToken'] as String?,
      tokenExpireAt: json['tokenExpireAt'] as String?,
      state: json['state'] as String?,
      postalCode: json['postal_code'] as String?,
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'phone_number': instance.phoneNumber,
      'user_id': instance.userId,
      'email': instance.email,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'verification_token': instance.verificationToken,
      'verification_token_expires': instance.verificationTokenExpires,
      'tier_levels': instance.tierLevels,
      'password_reset_token': instance.passwordResetToken,
      'password_reset_token_expires': instance.passwordResetTokenExpires,
      'pin_reset_token': instance.pinResetToken,
      'pin_reset_token_expires': instance.pinResetTokenExpires,
      'status': instance.status,
      'device_token': instance.deviceToken,
      'fcm_token': instance.fcmToken,
      'is_uploaded_identity_card': instance.isUploadedIdentityCard,
      'referral_code': instance.referralCode,
      'tag': _$JsonConverterToJson<String, String>(
          instance.tag, const TagSerializer().toJson),
      'dob': instance.dob,
      'profile_picture': instance.profilePicture,
      'address': instance.address,
      'pin': instance.pin,
      'gender': instance.gender,
      'iscreatedpin': instance.iscreatedpin,
      'two_factor_temp_secret': instance.twoFactorTempSecret,
      'is_2fa_active': instance.is2faActive,
      'utility_bill': instance.utilityBill,
      'is_login_biometric_active': instance.isLoginBiometricActive,
      'is_payment_biometric_active': instance.isPaymentBiometricActive,
      'token': instance.token,
      'refreshToken': instance.refreshToken,
      'tokenExpireAt': instance.tokenExpireAt,
      'state': instance.state,
      'postal_code': instance.postalCode,
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);
