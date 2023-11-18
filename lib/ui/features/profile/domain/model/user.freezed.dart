// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

User _$UserFromJson(Map<String, dynamic> json) {
  return _User.fromJson(json);
}

/// @nodoc
mixin _$User {
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'phone_number')
  @HiveField(0)
  String? get phoneNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_id')
  @HiveField(1)
  String? get userId => throw _privateConstructorUsedError;
  @HiveField(2)
  String? get email => throw _privateConstructorUsedError;
  @JsonKey(name: 'first_name')
  @HiveField(3)
  String? get firstName => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_name')
  @HiveField(4)
  String? get lastName => throw _privateConstructorUsedError;
  @JsonKey(name: 'verification_token')
  @HiveField(5)
  String? get verificationToken => throw _privateConstructorUsedError;
  @JsonKey(name: 'verification_token_expires')
  @HiveField(6)
  String? get verificationTokenExpires => throw _privateConstructorUsedError;
  @JsonKey(name: 'tier_levels', defaultValue: 1)
  @HiveField(7)
  int? get tierLevels => throw _privateConstructorUsedError;
  @JsonKey(name: 'password_reset_token')
  @HiveField(8)
  String? get passwordResetToken => throw _privateConstructorUsedError;
  @JsonKey(name: 'password_reset_token_expires')
  @HiveField(9)
  String? get passwordResetTokenExpires => throw _privateConstructorUsedError;
  @JsonKey(name: 'pin_reset_token')
  @HiveField(10)
  String? get pinResetToken => throw _privateConstructorUsedError;
  @JsonKey(name: 'pin_reset_token_expires')
  @HiveField(11)
  String? get pinResetTokenExpires => throw _privateConstructorUsedError;
  @HiveField(12)
  String? get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'device_token')
  @HiveField(13)
  String? get deviceToken => throw _privateConstructorUsedError;
  @JsonKey(name: 'fcm_token')
  @HiveField(14)
  String? get fcmToken => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_uploaded_identity_card')
  @HiveField(15)
  bool get isUploadedIdentityCard => throw _privateConstructorUsedError;
  @JsonKey(name: 'referral_code')
  @HiveField(16)
  String? get referralCode => throw _privateConstructorUsedError;
  @HiveField(17)
  String? get tag => throw _privateConstructorUsedError;
  @HiveField(18)
  String? get dob => throw _privateConstructorUsedError;
  @JsonKey(name: 'profile_picture')
  @HiveField(19)
  String? get profilePicture => throw _privateConstructorUsedError;
  @HiveField(20)
  String? get address => throw _privateConstructorUsedError;
  @HiveField(21)
  String? get pin => throw _privateConstructorUsedError;
  @HiveField(22)
  String? get gender => throw _privateConstructorUsedError;
  @JsonKey(name: 'iscreatedpin', defaultValue: false)
  @HiveField(23)
  bool? get iscreatedpin => throw _privateConstructorUsedError;
  @JsonKey(name: 'two_factor_temp_secret')
  @HiveField(24)
  String? get twoFactorTempSecret => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_2fa_active')
  bool? get is2faActive => throw _privateConstructorUsedError;
  @HiveField(25)
  @JsonKey(name: 'utility_bill')
  dynamic get utilityBill => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_login_biometric_active', defaultValue: false)
  bool? get isLoginBiometricActive => throw _privateConstructorUsedError;
  @HiveField(26)
  @JsonKey(name: 'is_payment_biometric_active', defaultValue: false)
  bool? get isPaymentBiometricActive => throw _privateConstructorUsedError;
  @HiveField(27)
  String? get token => throw _privateConstructorUsedError;
  @HiveField(28)
  String? get refreshToken => throw _privateConstructorUsedError;
  @HiveField(29)
  String? get tokenExpireAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserCopyWith<User> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res, User>;
  @useResult
  $Res call(
      {int? id,
      @JsonKey(name: 'phone_number') @HiveField(0) String? phoneNumber,
      @JsonKey(name: 'user_id') @HiveField(1) String? userId,
      @HiveField(2) String? email,
      @JsonKey(name: 'first_name') @HiveField(3) String? firstName,
      @JsonKey(name: 'last_name') @HiveField(4) String? lastName,
      @JsonKey(name: 'verification_token')
      @HiveField(5)
      String? verificationToken,
      @JsonKey(name: 'verification_token_expires')
      @HiveField(6)
      String? verificationTokenExpires,
      @JsonKey(name: 'tier_levels', defaultValue: 1)
      @HiveField(7)
      int? tierLevels,
      @JsonKey(name: 'password_reset_token')
      @HiveField(8)
      String? passwordResetToken,
      @JsonKey(name: 'password_reset_token_expires')
      @HiveField(9)
      String? passwordResetTokenExpires,
      @JsonKey(name: 'pin_reset_token') @HiveField(10) String? pinResetToken,
      @JsonKey(name: 'pin_reset_token_expires')
      @HiveField(11)
      String? pinResetTokenExpires,
      @HiveField(12) String? status,
      @JsonKey(name: 'device_token') @HiveField(13) String? deviceToken,
      @JsonKey(name: 'fcm_token') @HiveField(14) String? fcmToken,
      @JsonKey(name: 'is_uploaded_identity_card')
      @HiveField(15)
      bool isUploadedIdentityCard,
      @JsonKey(name: 'referral_code') @HiveField(16) String? referralCode,
      @HiveField(17) String? tag,
      @HiveField(18) String? dob,
      @JsonKey(name: 'profile_picture') @HiveField(19) String? profilePicture,
      @HiveField(20) String? address,
      @HiveField(21) String? pin,
      @HiveField(22) String? gender,
      @JsonKey(name: 'iscreatedpin', defaultValue: false)
      @HiveField(23)
      bool? iscreatedpin,
      @JsonKey(name: 'two_factor_temp_secret')
      @HiveField(24)
      String? twoFactorTempSecret,
      @JsonKey(name: 'is_2fa_active') bool? is2faActive,
      @HiveField(25) @JsonKey(name: 'utility_bill') dynamic utilityBill,
      @JsonKey(name: 'is_login_biometric_active', defaultValue: false)
      bool? isLoginBiometricActive,
      @HiveField(26)
      @JsonKey(name: 'is_payment_biometric_active', defaultValue: false)
      bool? isPaymentBiometricActive,
      @HiveField(27) String? token,
      @HiveField(28) String? refreshToken,
      @HiveField(29) String? tokenExpireAt});
}

/// @nodoc
class _$UserCopyWithImpl<$Res, $Val extends User>
    implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? phoneNumber = freezed,
    Object? userId = freezed,
    Object? email = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? verificationToken = freezed,
    Object? verificationTokenExpires = freezed,
    Object? tierLevels = freezed,
    Object? passwordResetToken = freezed,
    Object? passwordResetTokenExpires = freezed,
    Object? pinResetToken = freezed,
    Object? pinResetTokenExpires = freezed,
    Object? status = freezed,
    Object? deviceToken = freezed,
    Object? fcmToken = freezed,
    Object? isUploadedIdentityCard = null,
    Object? referralCode = freezed,
    Object? tag = freezed,
    Object? dob = freezed,
    Object? profilePicture = freezed,
    Object? address = freezed,
    Object? pin = freezed,
    Object? gender = freezed,
    Object? iscreatedpin = freezed,
    Object? twoFactorTempSecret = freezed,
    Object? is2faActive = freezed,
    Object? utilityBill = freezed,
    Object? isLoginBiometricActive = freezed,
    Object? isPaymentBiometricActive = freezed,
    Object? token = freezed,
    Object? refreshToken = freezed,
    Object? tokenExpireAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      verificationToken: freezed == verificationToken
          ? _value.verificationToken
          : verificationToken // ignore: cast_nullable_to_non_nullable
              as String?,
      verificationTokenExpires: freezed == verificationTokenExpires
          ? _value.verificationTokenExpires
          : verificationTokenExpires // ignore: cast_nullable_to_non_nullable
              as String?,
      tierLevels: freezed == tierLevels
          ? _value.tierLevels
          : tierLevels // ignore: cast_nullable_to_non_nullable
              as int?,
      passwordResetToken: freezed == passwordResetToken
          ? _value.passwordResetToken
          : passwordResetToken // ignore: cast_nullable_to_non_nullable
              as String?,
      passwordResetTokenExpires: freezed == passwordResetTokenExpires
          ? _value.passwordResetTokenExpires
          : passwordResetTokenExpires // ignore: cast_nullable_to_non_nullable
              as String?,
      pinResetToken: freezed == pinResetToken
          ? _value.pinResetToken
          : pinResetToken // ignore: cast_nullable_to_non_nullable
              as String?,
      pinResetTokenExpires: freezed == pinResetTokenExpires
          ? _value.pinResetTokenExpires
          : pinResetTokenExpires // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      deviceToken: freezed == deviceToken
          ? _value.deviceToken
          : deviceToken // ignore: cast_nullable_to_non_nullable
              as String?,
      fcmToken: freezed == fcmToken
          ? _value.fcmToken
          : fcmToken // ignore: cast_nullable_to_non_nullable
              as String?,
      isUploadedIdentityCard: null == isUploadedIdentityCard
          ? _value.isUploadedIdentityCard
          : isUploadedIdentityCard // ignore: cast_nullable_to_non_nullable
              as bool,
      referralCode: freezed == referralCode
          ? _value.referralCode
          : referralCode // ignore: cast_nullable_to_non_nullable
              as String?,
      tag: freezed == tag
          ? _value.tag
          : tag // ignore: cast_nullable_to_non_nullable
              as String?,
      dob: freezed == dob
          ? _value.dob
          : dob // ignore: cast_nullable_to_non_nullable
              as String?,
      profilePicture: freezed == profilePicture
          ? _value.profilePicture
          : profilePicture // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      pin: freezed == pin
          ? _value.pin
          : pin // ignore: cast_nullable_to_non_nullable
              as String?,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String?,
      iscreatedpin: freezed == iscreatedpin
          ? _value.iscreatedpin
          : iscreatedpin // ignore: cast_nullable_to_non_nullable
              as bool?,
      twoFactorTempSecret: freezed == twoFactorTempSecret
          ? _value.twoFactorTempSecret
          : twoFactorTempSecret // ignore: cast_nullable_to_non_nullable
              as String?,
      is2faActive: freezed == is2faActive
          ? _value.is2faActive
          : is2faActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      utilityBill: freezed == utilityBill
          ? _value.utilityBill
          : utilityBill // ignore: cast_nullable_to_non_nullable
              as dynamic,
      isLoginBiometricActive: freezed == isLoginBiometricActive
          ? _value.isLoginBiometricActive
          : isLoginBiometricActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      isPaymentBiometricActive: freezed == isPaymentBiometricActive
          ? _value.isPaymentBiometricActive
          : isPaymentBiometricActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      token: freezed == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
      refreshToken: freezed == refreshToken
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String?,
      tokenExpireAt: freezed == tokenExpireAt
          ? _value.tokenExpireAt
          : tokenExpireAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserImplCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$$UserImplCopyWith(
          _$UserImpl value, $Res Function(_$UserImpl) then) =
      __$$UserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      @JsonKey(name: 'phone_number') @HiveField(0) String? phoneNumber,
      @JsonKey(name: 'user_id') @HiveField(1) String? userId,
      @HiveField(2) String? email,
      @JsonKey(name: 'first_name') @HiveField(3) String? firstName,
      @JsonKey(name: 'last_name') @HiveField(4) String? lastName,
      @JsonKey(name: 'verification_token')
      @HiveField(5)
      String? verificationToken,
      @JsonKey(name: 'verification_token_expires')
      @HiveField(6)
      String? verificationTokenExpires,
      @JsonKey(name: 'tier_levels', defaultValue: 1)
      @HiveField(7)
      int? tierLevels,
      @JsonKey(name: 'password_reset_token')
      @HiveField(8)
      String? passwordResetToken,
      @JsonKey(name: 'password_reset_token_expires')
      @HiveField(9)
      String? passwordResetTokenExpires,
      @JsonKey(name: 'pin_reset_token') @HiveField(10) String? pinResetToken,
      @JsonKey(name: 'pin_reset_token_expires')
      @HiveField(11)
      String? pinResetTokenExpires,
      @HiveField(12) String? status,
      @JsonKey(name: 'device_token') @HiveField(13) String? deviceToken,
      @JsonKey(name: 'fcm_token') @HiveField(14) String? fcmToken,
      @JsonKey(name: 'is_uploaded_identity_card')
      @HiveField(15)
      bool isUploadedIdentityCard,
      @JsonKey(name: 'referral_code') @HiveField(16) String? referralCode,
      @HiveField(17) String? tag,
      @HiveField(18) String? dob,
      @JsonKey(name: 'profile_picture') @HiveField(19) String? profilePicture,
      @HiveField(20) String? address,
      @HiveField(21) String? pin,
      @HiveField(22) String? gender,
      @JsonKey(name: 'iscreatedpin', defaultValue: false)
      @HiveField(23)
      bool? iscreatedpin,
      @JsonKey(name: 'two_factor_temp_secret')
      @HiveField(24)
      String? twoFactorTempSecret,
      @JsonKey(name: 'is_2fa_active') bool? is2faActive,
      @HiveField(25) @JsonKey(name: 'utility_bill') dynamic utilityBill,
      @JsonKey(name: 'is_login_biometric_active', defaultValue: false)
      bool? isLoginBiometricActive,
      @HiveField(26)
      @JsonKey(name: 'is_payment_biometric_active', defaultValue: false)
      bool? isPaymentBiometricActive,
      @HiveField(27) String? token,
      @HiveField(28) String? refreshToken,
      @HiveField(29) String? tokenExpireAt});
}

/// @nodoc
class __$$UserImplCopyWithImpl<$Res>
    extends _$UserCopyWithImpl<$Res, _$UserImpl>
    implements _$$UserImplCopyWith<$Res> {
  __$$UserImplCopyWithImpl(_$UserImpl _value, $Res Function(_$UserImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? phoneNumber = freezed,
    Object? userId = freezed,
    Object? email = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? verificationToken = freezed,
    Object? verificationTokenExpires = freezed,
    Object? tierLevels = freezed,
    Object? passwordResetToken = freezed,
    Object? passwordResetTokenExpires = freezed,
    Object? pinResetToken = freezed,
    Object? pinResetTokenExpires = freezed,
    Object? status = freezed,
    Object? deviceToken = freezed,
    Object? fcmToken = freezed,
    Object? isUploadedIdentityCard = null,
    Object? referralCode = freezed,
    Object? tag = freezed,
    Object? dob = freezed,
    Object? profilePicture = freezed,
    Object? address = freezed,
    Object? pin = freezed,
    Object? gender = freezed,
    Object? iscreatedpin = freezed,
    Object? twoFactorTempSecret = freezed,
    Object? is2faActive = freezed,
    Object? utilityBill = freezed,
    Object? isLoginBiometricActive = freezed,
    Object? isPaymentBiometricActive = freezed,
    Object? token = freezed,
    Object? refreshToken = freezed,
    Object? tokenExpireAt = freezed,
  }) {
    return _then(_$UserImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      verificationToken: freezed == verificationToken
          ? _value.verificationToken
          : verificationToken // ignore: cast_nullable_to_non_nullable
              as String?,
      verificationTokenExpires: freezed == verificationTokenExpires
          ? _value.verificationTokenExpires
          : verificationTokenExpires // ignore: cast_nullable_to_non_nullable
              as String?,
      tierLevels: freezed == tierLevels
          ? _value.tierLevels
          : tierLevels // ignore: cast_nullable_to_non_nullable
              as int?,
      passwordResetToken: freezed == passwordResetToken
          ? _value.passwordResetToken
          : passwordResetToken // ignore: cast_nullable_to_non_nullable
              as String?,
      passwordResetTokenExpires: freezed == passwordResetTokenExpires
          ? _value.passwordResetTokenExpires
          : passwordResetTokenExpires // ignore: cast_nullable_to_non_nullable
              as String?,
      pinResetToken: freezed == pinResetToken
          ? _value.pinResetToken
          : pinResetToken // ignore: cast_nullable_to_non_nullable
              as String?,
      pinResetTokenExpires: freezed == pinResetTokenExpires
          ? _value.pinResetTokenExpires
          : pinResetTokenExpires // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      deviceToken: freezed == deviceToken
          ? _value.deviceToken
          : deviceToken // ignore: cast_nullable_to_non_nullable
              as String?,
      fcmToken: freezed == fcmToken
          ? _value.fcmToken
          : fcmToken // ignore: cast_nullable_to_non_nullable
              as String?,
      isUploadedIdentityCard: null == isUploadedIdentityCard
          ? _value.isUploadedIdentityCard
          : isUploadedIdentityCard // ignore: cast_nullable_to_non_nullable
              as bool,
      referralCode: freezed == referralCode
          ? _value.referralCode
          : referralCode // ignore: cast_nullable_to_non_nullable
              as String?,
      tag: freezed == tag
          ? _value.tag
          : tag // ignore: cast_nullable_to_non_nullable
              as String?,
      dob: freezed == dob
          ? _value.dob
          : dob // ignore: cast_nullable_to_non_nullable
              as String?,
      profilePicture: freezed == profilePicture
          ? _value.profilePicture
          : profilePicture // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      pin: freezed == pin
          ? _value.pin
          : pin // ignore: cast_nullable_to_non_nullable
              as String?,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String?,
      iscreatedpin: freezed == iscreatedpin
          ? _value.iscreatedpin
          : iscreatedpin // ignore: cast_nullable_to_non_nullable
              as bool?,
      twoFactorTempSecret: freezed == twoFactorTempSecret
          ? _value.twoFactorTempSecret
          : twoFactorTempSecret // ignore: cast_nullable_to_non_nullable
              as String?,
      is2faActive: freezed == is2faActive
          ? _value.is2faActive
          : is2faActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      utilityBill: freezed == utilityBill
          ? _value.utilityBill
          : utilityBill // ignore: cast_nullable_to_non_nullable
              as dynamic,
      isLoginBiometricActive: freezed == isLoginBiometricActive
          ? _value.isLoginBiometricActive
          : isLoginBiometricActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      isPaymentBiometricActive: freezed == isPaymentBiometricActive
          ? _value.isPaymentBiometricActive
          : isPaymentBiometricActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      token: freezed == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
      refreshToken: freezed == refreshToken
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String?,
      tokenExpireAt: freezed == tokenExpireAt
          ? _value.tokenExpireAt
          : tokenExpireAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@HiveType(typeId: 1, adapterName: 'UserAdapter')
class _$UserImpl implements _User {
  _$UserImpl(
      {this.id,
      @JsonKey(name: 'phone_number') @HiveField(0) this.phoneNumber,
      @JsonKey(name: 'user_id') @HiveField(1) this.userId,
      @HiveField(2) this.email,
      @JsonKey(name: 'first_name') @HiveField(3) this.firstName,
      @JsonKey(name: 'last_name') @HiveField(4) this.lastName,
      @JsonKey(name: 'verification_token') @HiveField(5) this.verificationToken,
      @JsonKey(name: 'verification_token_expires')
      @HiveField(6)
      this.verificationTokenExpires,
      @JsonKey(name: 'tier_levels', defaultValue: 1)
      @HiveField(7)
      this.tierLevels,
      @JsonKey(name: 'password_reset_token')
      @HiveField(8)
      this.passwordResetToken,
      @JsonKey(name: 'password_reset_token_expires')
      @HiveField(9)
      this.passwordResetTokenExpires,
      @JsonKey(name: 'pin_reset_token') @HiveField(10) this.pinResetToken,
      @JsonKey(name: 'pin_reset_token_expires')
      @HiveField(11)
      this.pinResetTokenExpires,
      @HiveField(12) this.status,
      @JsonKey(name: 'device_token') @HiveField(13) this.deviceToken,
      @JsonKey(name: 'fcm_token') @HiveField(14) this.fcmToken,
      @JsonKey(name: 'is_uploaded_identity_card')
      @HiveField(15)
      this.isUploadedIdentityCard = false,
      @JsonKey(name: 'referral_code') @HiveField(16) this.referralCode,
      @HiveField(17) this.tag,
      @HiveField(18) this.dob,
      @JsonKey(name: 'profile_picture') @HiveField(19) this.profilePicture,
      @HiveField(20) this.address,
      @HiveField(21) this.pin,
      @HiveField(22) this.gender,
      @JsonKey(name: 'iscreatedpin', defaultValue: false)
      @HiveField(23)
      this.iscreatedpin,
      @JsonKey(name: 'two_factor_temp_secret')
      @HiveField(24)
      this.twoFactorTempSecret,
      @JsonKey(name: 'is_2fa_active') this.is2faActive,
      @HiveField(25) @JsonKey(name: 'utility_bill') this.utilityBill,
      @JsonKey(name: 'is_login_biometric_active', defaultValue: false)
      this.isLoginBiometricActive,
      @HiveField(26)
      @JsonKey(name: 'is_payment_biometric_active', defaultValue: false)
      this.isPaymentBiometricActive,
      @HiveField(27) this.token,
      @HiveField(28) this.refreshToken,
      @HiveField(29) this.tokenExpireAt});

  factory _$UserImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserImplFromJson(json);

  @override
  final int? id;
  @override
  @JsonKey(name: 'phone_number')
  @HiveField(0)
  final String? phoneNumber;
  @override
  @JsonKey(name: 'user_id')
  @HiveField(1)
  final String? userId;
  @override
  @HiveField(2)
  final String? email;
  @override
  @JsonKey(name: 'first_name')
  @HiveField(3)
  final String? firstName;
  @override
  @JsonKey(name: 'last_name')
  @HiveField(4)
  final String? lastName;
  @override
  @JsonKey(name: 'verification_token')
  @HiveField(5)
  final String? verificationToken;
  @override
  @JsonKey(name: 'verification_token_expires')
  @HiveField(6)
  final String? verificationTokenExpires;
  @override
  @JsonKey(name: 'tier_levels', defaultValue: 1)
  @HiveField(7)
  final int? tierLevels;
  @override
  @JsonKey(name: 'password_reset_token')
  @HiveField(8)
  final String? passwordResetToken;
  @override
  @JsonKey(name: 'password_reset_token_expires')
  @HiveField(9)
  final String? passwordResetTokenExpires;
  @override
  @JsonKey(name: 'pin_reset_token')
  @HiveField(10)
  final String? pinResetToken;
  @override
  @JsonKey(name: 'pin_reset_token_expires')
  @HiveField(11)
  final String? pinResetTokenExpires;
  @override
  @HiveField(12)
  final String? status;
  @override
  @JsonKey(name: 'device_token')
  @HiveField(13)
  final String? deviceToken;
  @override
  @JsonKey(name: 'fcm_token')
  @HiveField(14)
  final String? fcmToken;
  @override
  @JsonKey(name: 'is_uploaded_identity_card')
  @HiveField(15)
  final bool isUploadedIdentityCard;
  @override
  @JsonKey(name: 'referral_code')
  @HiveField(16)
  final String? referralCode;
  @override
  @HiveField(17)
  final String? tag;
  @override
  @HiveField(18)
  final String? dob;
  @override
  @JsonKey(name: 'profile_picture')
  @HiveField(19)
  final String? profilePicture;
  @override
  @HiveField(20)
  final String? address;
  @override
  @HiveField(21)
  final String? pin;
  @override
  @HiveField(22)
  final String? gender;
  @override
  @JsonKey(name: 'iscreatedpin', defaultValue: false)
  @HiveField(23)
  final bool? iscreatedpin;
  @override
  @JsonKey(name: 'two_factor_temp_secret')
  @HiveField(24)
  final String? twoFactorTempSecret;
  @override
  @JsonKey(name: 'is_2fa_active')
  final bool? is2faActive;
  @override
  @HiveField(25)
  @JsonKey(name: 'utility_bill')
  final dynamic utilityBill;
  @override
  @JsonKey(name: 'is_login_biometric_active', defaultValue: false)
  final bool? isLoginBiometricActive;
  @override
  @HiveField(26)
  @JsonKey(name: 'is_payment_biometric_active', defaultValue: false)
  final bool? isPaymentBiometricActive;
  @override
  @HiveField(27)
  final String? token;
  @override
  @HiveField(28)
  final String? refreshToken;
  @override
  @HiveField(29)
  final String? tokenExpireAt;

  @override
  String toString() {
    return 'User(id: $id, phoneNumber: $phoneNumber, userId: $userId, email: $email, firstName: $firstName, lastName: $lastName, verificationToken: $verificationToken, verificationTokenExpires: $verificationTokenExpires, tierLevels: $tierLevels, passwordResetToken: $passwordResetToken, passwordResetTokenExpires: $passwordResetTokenExpires, pinResetToken: $pinResetToken, pinResetTokenExpires: $pinResetTokenExpires, status: $status, deviceToken: $deviceToken, fcmToken: $fcmToken, isUploadedIdentityCard: $isUploadedIdentityCard, referralCode: $referralCode, tag: $tag, dob: $dob, profilePicture: $profilePicture, address: $address, pin: $pin, gender: $gender, iscreatedpin: $iscreatedpin, twoFactorTempSecret: $twoFactorTempSecret, is2faActive: $is2faActive, utilityBill: $utilityBill, isLoginBiometricActive: $isLoginBiometricActive, isPaymentBiometricActive: $isPaymentBiometricActive, token: $token, refreshToken: $refreshToken, tokenExpireAt: $tokenExpireAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.verificationToken, verificationToken) ||
                other.verificationToken == verificationToken) &&
            (identical(other.verificationTokenExpires, verificationTokenExpires) ||
                other.verificationTokenExpires == verificationTokenExpires) &&
            (identical(other.tierLevels, tierLevels) ||
                other.tierLevels == tierLevels) &&
            (identical(other.passwordResetToken, passwordResetToken) ||
                other.passwordResetToken == passwordResetToken) &&
            (identical(other.passwordResetTokenExpires,
                    passwordResetTokenExpires) ||
                other.passwordResetTokenExpires == passwordResetTokenExpires) &&
            (identical(other.pinResetToken, pinResetToken) ||
                other.pinResetToken == pinResetToken) &&
            (identical(other.pinResetTokenExpires, pinResetTokenExpires) ||
                other.pinResetTokenExpires == pinResetTokenExpires) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.deviceToken, deviceToken) ||
                other.deviceToken == deviceToken) &&
            (identical(other.fcmToken, fcmToken) ||
                other.fcmToken == fcmToken) &&
            (identical(other.isUploadedIdentityCard, isUploadedIdentityCard) ||
                other.isUploadedIdentityCard == isUploadedIdentityCard) &&
            (identical(other.referralCode, referralCode) ||
                other.referralCode == referralCode) &&
            (identical(other.tag, tag) || other.tag == tag) &&
            (identical(other.dob, dob) || other.dob == dob) &&
            (identical(other.profilePicture, profilePicture) ||
                other.profilePicture == profilePicture) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.pin, pin) || other.pin == pin) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.iscreatedpin, iscreatedpin) ||
                other.iscreatedpin == iscreatedpin) &&
            (identical(other.twoFactorTempSecret, twoFactorTempSecret) ||
                other.twoFactorTempSecret == twoFactorTempSecret) &&
            (identical(other.is2faActive, is2faActive) ||
                other.is2faActive == is2faActive) &&
            const DeepCollectionEquality()
                .equals(other.utilityBill, utilityBill) &&
            (identical(other.isLoginBiometricActive, isLoginBiometricActive) ||
                other.isLoginBiometricActive == isLoginBiometricActive) &&
            (identical(
                    other.isPaymentBiometricActive, isPaymentBiometricActive) ||
                other.isPaymentBiometricActive == isPaymentBiometricActive) &&
            (identical(other.token, token) || other.token == token) &&
            (identical(other.refreshToken, refreshToken) ||
                other.refreshToken == refreshToken) &&
            (identical(other.tokenExpireAt, tokenExpireAt) ||
                other.tokenExpireAt == tokenExpireAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        phoneNumber,
        userId,
        email,
        firstName,
        lastName,
        verificationToken,
        verificationTokenExpires,
        tierLevels,
        passwordResetToken,
        passwordResetTokenExpires,
        pinResetToken,
        pinResetTokenExpires,
        status,
        deviceToken,
        fcmToken,
        isUploadedIdentityCard,
        referralCode,
        tag,
        dob,
        profilePicture,
        address,
        pin,
        gender,
        iscreatedpin,
        twoFactorTempSecret,
        is2faActive,
        const DeepCollectionEquality().hash(utilityBill),
        isLoginBiometricActive,
        isPaymentBiometricActive,
        token,
        refreshToken,
        tokenExpireAt
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserImplCopyWith<_$UserImpl> get copyWith =>
      __$$UserImplCopyWithImpl<_$UserImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserImplToJson(
      this,
    );
  }
}

abstract class _User implements User {
  factory _User(
      {final int? id,
      @JsonKey(name: 'phone_number') @HiveField(0) final String? phoneNumber,
      @JsonKey(name: 'user_id') @HiveField(1) final String? userId,
      @HiveField(2) final String? email,
      @JsonKey(name: 'first_name') @HiveField(3) final String? firstName,
      @JsonKey(name: 'last_name') @HiveField(4) final String? lastName,
      @JsonKey(name: 'verification_token')
      @HiveField(5)
      final String? verificationToken,
      @JsonKey(name: 'verification_token_expires')
      @HiveField(6)
      final String? verificationTokenExpires,
      @JsonKey(name: 'tier_levels', defaultValue: 1)
      @HiveField(7)
      final int? tierLevels,
      @JsonKey(name: 'password_reset_token')
      @HiveField(8)
      final String? passwordResetToken,
      @JsonKey(name: 'password_reset_token_expires')
      @HiveField(9)
      final String? passwordResetTokenExpires,
      @JsonKey(name: 'pin_reset_token')
      @HiveField(10)
      final String? pinResetToken,
      @JsonKey(name: 'pin_reset_token_expires')
      @HiveField(11)
      final String? pinResetTokenExpires,
      @HiveField(12) final String? status,
      @JsonKey(name: 'device_token') @HiveField(13) final String? deviceToken,
      @JsonKey(name: 'fcm_token') @HiveField(14) final String? fcmToken,
      @JsonKey(name: 'is_uploaded_identity_card')
      @HiveField(15)
      final bool isUploadedIdentityCard,
      @JsonKey(name: 'referral_code') @HiveField(16) final String? referralCode,
      @HiveField(17) final String? tag,
      @HiveField(18) final String? dob,
      @JsonKey(name: 'profile_picture')
      @HiveField(19)
      final String? profilePicture,
      @HiveField(20) final String? address,
      @HiveField(21) final String? pin,
      @HiveField(22) final String? gender,
      @JsonKey(name: 'iscreatedpin', defaultValue: false)
      @HiveField(23)
      final bool? iscreatedpin,
      @JsonKey(name: 'two_factor_temp_secret')
      @HiveField(24)
      final String? twoFactorTempSecret,
      @JsonKey(name: 'is_2fa_active') final bool? is2faActive,
      @HiveField(25) @JsonKey(name: 'utility_bill') final dynamic utilityBill,
      @JsonKey(name: 'is_login_biometric_active', defaultValue: false)
      final bool? isLoginBiometricActive,
      @HiveField(26)
      @JsonKey(name: 'is_payment_biometric_active', defaultValue: false)
      final bool? isPaymentBiometricActive,
      @HiveField(27) final String? token,
      @HiveField(28) final String? refreshToken,
      @HiveField(29) final String? tokenExpireAt}) = _$UserImpl;

  factory _User.fromJson(Map<String, dynamic> json) = _$UserImpl.fromJson;

  @override
  int? get id;
  @override
  @JsonKey(name: 'phone_number')
  @HiveField(0)
  String? get phoneNumber;
  @override
  @JsonKey(name: 'user_id')
  @HiveField(1)
  String? get userId;
  @override
  @HiveField(2)
  String? get email;
  @override
  @JsonKey(name: 'first_name')
  @HiveField(3)
  String? get firstName;
  @override
  @JsonKey(name: 'last_name')
  @HiveField(4)
  String? get lastName;
  @override
  @JsonKey(name: 'verification_token')
  @HiveField(5)
  String? get verificationToken;
  @override
  @JsonKey(name: 'verification_token_expires')
  @HiveField(6)
  String? get verificationTokenExpires;
  @override
  @JsonKey(name: 'tier_levels', defaultValue: 1)
  @HiveField(7)
  int? get tierLevels;
  @override
  @JsonKey(name: 'password_reset_token')
  @HiveField(8)
  String? get passwordResetToken;
  @override
  @JsonKey(name: 'password_reset_token_expires')
  @HiveField(9)
  String? get passwordResetTokenExpires;
  @override
  @JsonKey(name: 'pin_reset_token')
  @HiveField(10)
  String? get pinResetToken;
  @override
  @JsonKey(name: 'pin_reset_token_expires')
  @HiveField(11)
  String? get pinResetTokenExpires;
  @override
  @HiveField(12)
  String? get status;
  @override
  @JsonKey(name: 'device_token')
  @HiveField(13)
  String? get deviceToken;
  @override
  @JsonKey(name: 'fcm_token')
  @HiveField(14)
  String? get fcmToken;
  @override
  @JsonKey(name: 'is_uploaded_identity_card')
  @HiveField(15)
  bool get isUploadedIdentityCard;
  @override
  @JsonKey(name: 'referral_code')
  @HiveField(16)
  String? get referralCode;
  @override
  @HiveField(17)
  String? get tag;
  @override
  @HiveField(18)
  String? get dob;
  @override
  @JsonKey(name: 'profile_picture')
  @HiveField(19)
  String? get profilePicture;
  @override
  @HiveField(20)
  String? get address;
  @override
  @HiveField(21)
  String? get pin;
  @override
  @HiveField(22)
  String? get gender;
  @override
  @JsonKey(name: 'iscreatedpin', defaultValue: false)
  @HiveField(23)
  bool? get iscreatedpin;
  @override
  @JsonKey(name: 'two_factor_temp_secret')
  @HiveField(24)
  String? get twoFactorTempSecret;
  @override
  @JsonKey(name: 'is_2fa_active')
  bool? get is2faActive;
  @override
  @HiveField(25)
  @JsonKey(name: 'utility_bill')
  dynamic get utilityBill;
  @override
  @JsonKey(name: 'is_login_biometric_active', defaultValue: false)
  bool? get isLoginBiometricActive;
  @override
  @HiveField(26)
  @JsonKey(name: 'is_payment_biometric_active', defaultValue: false)
  bool? get isPaymentBiometricActive;
  @override
  @HiveField(27)
  String? get token;
  @override
  @HiveField(28)
  String? get refreshToken;
  @override
  @HiveField(29)
  String? get tokenExpireAt;
  @override
  @JsonKey(ignore: true)
  _$$UserImplCopyWith<_$UserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
