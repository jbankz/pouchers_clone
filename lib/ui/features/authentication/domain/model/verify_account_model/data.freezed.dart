// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Data _$DataFromJson(Map<String, dynamic> json) {
  return _Data.fromJson(json);
}

/// @nodoc
mixin _$Data {
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'phone_number')
  String? get phoneNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_id')
  String? get userId => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  @JsonKey(name: 'first_name')
  String? get firstName => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_name')
  String? get lastName => throw _privateConstructorUsedError;
  @JsonKey(name: 'verification_token')
  dynamic get verificationToken => throw _privateConstructorUsedError;
  @JsonKey(name: 'verification_token_expires')
  dynamic get verificationTokenExpires => throw _privateConstructorUsedError;
  @JsonKey(name: 'tier_levels')
  int? get tierLevels => throw _privateConstructorUsedError;
  @JsonKey(name: 'password_reset_token')
  dynamic get passwordResetToken => throw _privateConstructorUsedError;
  @JsonKey(name: 'password_reset_token_expires')
  dynamic get passwordResetTokenExpires => throw _privateConstructorUsedError;
  @JsonKey(name: 'pin_reset_token')
  String? get pinResetToken => throw _privateConstructorUsedError;
  @JsonKey(name: 'pin_reset_token_expires')
  String? get pinResetTokenExpires => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'device_token')
  String? get deviceToken => throw _privateConstructorUsedError;
  @JsonKey(name: 'fcm_token')
  String? get fcmToken => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_uploaded_identity_card')
  bool? get isUploadedIdentityCard => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_deleted')
  bool? get isDeleted => throw _privateConstructorUsedError;
  @JsonKey(name: 'referral_code')
  String? get referralCode => throw _privateConstructorUsedError;
  dynamic get tag => throw _privateConstructorUsedError;
  String? get token => throw _privateConstructorUsedError;
  String? get refreshToken => throw _privateConstructorUsedError;
  String? get tokenExpireAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DataCopyWith<Data> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DataCopyWith<$Res> {
  factory $DataCopyWith(Data value, $Res Function(Data) then) =
      _$DataCopyWithImpl<$Res, Data>;
  @useResult
  $Res call(
      {int? id,
      @JsonKey(name: 'phone_number') String? phoneNumber,
      @JsonKey(name: 'user_id') String? userId,
      String? email,
      @JsonKey(name: 'first_name') String? firstName,
      @JsonKey(name: 'last_name') String? lastName,
      @JsonKey(name: 'verification_token') dynamic verificationToken,
      @JsonKey(name: 'verification_token_expires')
      dynamic verificationTokenExpires,
      @JsonKey(name: 'tier_levels') int? tierLevels,
      @JsonKey(name: 'password_reset_token') dynamic passwordResetToken,
      @JsonKey(name: 'password_reset_token_expires')
      dynamic passwordResetTokenExpires,
      @JsonKey(name: 'pin_reset_token') String? pinResetToken,
      @JsonKey(name: 'pin_reset_token_expires') String? pinResetTokenExpires,
      String? status,
      @JsonKey(name: 'device_token') String? deviceToken,
      @JsonKey(name: 'fcm_token') String? fcmToken,
      @JsonKey(name: 'is_uploaded_identity_card') bool? isUploadedIdentityCard,
      @JsonKey(name: 'is_deleted') bool? isDeleted,
      @JsonKey(name: 'referral_code') String? referralCode,
      dynamic tag,
      String? token,
      String? refreshToken,
      String? tokenExpireAt});
}

/// @nodoc
class _$DataCopyWithImpl<$Res, $Val extends Data>
    implements $DataCopyWith<$Res> {
  _$DataCopyWithImpl(this._value, this._then);

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
    Object? isUploadedIdentityCard = freezed,
    Object? isDeleted = freezed,
    Object? referralCode = freezed,
    Object? tag = freezed,
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
              as dynamic,
      verificationTokenExpires: freezed == verificationTokenExpires
          ? _value.verificationTokenExpires
          : verificationTokenExpires // ignore: cast_nullable_to_non_nullable
              as dynamic,
      tierLevels: freezed == tierLevels
          ? _value.tierLevels
          : tierLevels // ignore: cast_nullable_to_non_nullable
              as int?,
      passwordResetToken: freezed == passwordResetToken
          ? _value.passwordResetToken
          : passwordResetToken // ignore: cast_nullable_to_non_nullable
              as dynamic,
      passwordResetTokenExpires: freezed == passwordResetTokenExpires
          ? _value.passwordResetTokenExpires
          : passwordResetTokenExpires // ignore: cast_nullable_to_non_nullable
              as dynamic,
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
      isUploadedIdentityCard: freezed == isUploadedIdentityCard
          ? _value.isUploadedIdentityCard
          : isUploadedIdentityCard // ignore: cast_nullable_to_non_nullable
              as bool?,
      isDeleted: freezed == isDeleted
          ? _value.isDeleted
          : isDeleted // ignore: cast_nullable_to_non_nullable
              as bool?,
      referralCode: freezed == referralCode
          ? _value.referralCode
          : referralCode // ignore: cast_nullable_to_non_nullable
              as String?,
      tag: freezed == tag
          ? _value.tag
          : tag // ignore: cast_nullable_to_non_nullable
              as dynamic,
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
abstract class _$$DataImplCopyWith<$Res> implements $DataCopyWith<$Res> {
  factory _$$DataImplCopyWith(
          _$DataImpl value, $Res Function(_$DataImpl) then) =
      __$$DataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      @JsonKey(name: 'phone_number') String? phoneNumber,
      @JsonKey(name: 'user_id') String? userId,
      String? email,
      @JsonKey(name: 'first_name') String? firstName,
      @JsonKey(name: 'last_name') String? lastName,
      @JsonKey(name: 'verification_token') dynamic verificationToken,
      @JsonKey(name: 'verification_token_expires')
      dynamic verificationTokenExpires,
      @JsonKey(name: 'tier_levels') int? tierLevels,
      @JsonKey(name: 'password_reset_token') dynamic passwordResetToken,
      @JsonKey(name: 'password_reset_token_expires')
      dynamic passwordResetTokenExpires,
      @JsonKey(name: 'pin_reset_token') String? pinResetToken,
      @JsonKey(name: 'pin_reset_token_expires') String? pinResetTokenExpires,
      String? status,
      @JsonKey(name: 'device_token') String? deviceToken,
      @JsonKey(name: 'fcm_token') String? fcmToken,
      @JsonKey(name: 'is_uploaded_identity_card') bool? isUploadedIdentityCard,
      @JsonKey(name: 'is_deleted') bool? isDeleted,
      @JsonKey(name: 'referral_code') String? referralCode,
      dynamic tag,
      String? token,
      String? refreshToken,
      String? tokenExpireAt});
}

/// @nodoc
class __$$DataImplCopyWithImpl<$Res>
    extends _$DataCopyWithImpl<$Res, _$DataImpl>
    implements _$$DataImplCopyWith<$Res> {
  __$$DataImplCopyWithImpl(_$DataImpl _value, $Res Function(_$DataImpl) _then)
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
    Object? isUploadedIdentityCard = freezed,
    Object? isDeleted = freezed,
    Object? referralCode = freezed,
    Object? tag = freezed,
    Object? token = freezed,
    Object? refreshToken = freezed,
    Object? tokenExpireAt = freezed,
  }) {
    return _then(_$DataImpl(
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
              as dynamic,
      verificationTokenExpires: freezed == verificationTokenExpires
          ? _value.verificationTokenExpires
          : verificationTokenExpires // ignore: cast_nullable_to_non_nullable
              as dynamic,
      tierLevels: freezed == tierLevels
          ? _value.tierLevels
          : tierLevels // ignore: cast_nullable_to_non_nullable
              as int?,
      passwordResetToken: freezed == passwordResetToken
          ? _value.passwordResetToken
          : passwordResetToken // ignore: cast_nullable_to_non_nullable
              as dynamic,
      passwordResetTokenExpires: freezed == passwordResetTokenExpires
          ? _value.passwordResetTokenExpires
          : passwordResetTokenExpires // ignore: cast_nullable_to_non_nullable
              as dynamic,
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
      isUploadedIdentityCard: freezed == isUploadedIdentityCard
          ? _value.isUploadedIdentityCard
          : isUploadedIdentityCard // ignore: cast_nullable_to_non_nullable
              as bool?,
      isDeleted: freezed == isDeleted
          ? _value.isDeleted
          : isDeleted // ignore: cast_nullable_to_non_nullable
              as bool?,
      referralCode: freezed == referralCode
          ? _value.referralCode
          : referralCode // ignore: cast_nullable_to_non_nullable
              as String?,
      tag: freezed == tag
          ? _value.tag
          : tag // ignore: cast_nullable_to_non_nullable
              as dynamic,
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
class _$DataImpl implements _Data {
  _$DataImpl(
      {this.id,
      @JsonKey(name: 'phone_number') this.phoneNumber,
      @JsonKey(name: 'user_id') this.userId,
      this.email,
      @JsonKey(name: 'first_name') this.firstName,
      @JsonKey(name: 'last_name') this.lastName,
      @JsonKey(name: 'verification_token') this.verificationToken,
      @JsonKey(name: 'verification_token_expires')
      this.verificationTokenExpires,
      @JsonKey(name: 'tier_levels') this.tierLevels,
      @JsonKey(name: 'password_reset_token') this.passwordResetToken,
      @JsonKey(name: 'password_reset_token_expires')
      this.passwordResetTokenExpires,
      @JsonKey(name: 'pin_reset_token') this.pinResetToken,
      @JsonKey(name: 'pin_reset_token_expires') this.pinResetTokenExpires,
      this.status,
      @JsonKey(name: 'device_token') this.deviceToken,
      @JsonKey(name: 'fcm_token') this.fcmToken,
      @JsonKey(name: 'is_uploaded_identity_card') this.isUploadedIdentityCard,
      @JsonKey(name: 'is_deleted') this.isDeleted,
      @JsonKey(name: 'referral_code') this.referralCode,
      this.tag,
      this.token,
      this.refreshToken,
      this.tokenExpireAt});

  factory _$DataImpl.fromJson(Map<String, dynamic> json) =>
      _$$DataImplFromJson(json);

  @override
  final int? id;
  @override
  @JsonKey(name: 'phone_number')
  final String? phoneNumber;
  @override
  @JsonKey(name: 'user_id')
  final String? userId;
  @override
  final String? email;
  @override
  @JsonKey(name: 'first_name')
  final String? firstName;
  @override
  @JsonKey(name: 'last_name')
  final String? lastName;
  @override
  @JsonKey(name: 'verification_token')
  final dynamic verificationToken;
  @override
  @JsonKey(name: 'verification_token_expires')
  final dynamic verificationTokenExpires;
  @override
  @JsonKey(name: 'tier_levels')
  final int? tierLevels;
  @override
  @JsonKey(name: 'password_reset_token')
  final dynamic passwordResetToken;
  @override
  @JsonKey(name: 'password_reset_token_expires')
  final dynamic passwordResetTokenExpires;
  @override
  @JsonKey(name: 'pin_reset_token')
  final String? pinResetToken;
  @override
  @JsonKey(name: 'pin_reset_token_expires')
  final String? pinResetTokenExpires;
  @override
  final String? status;
  @override
  @JsonKey(name: 'device_token')
  final String? deviceToken;
  @override
  @JsonKey(name: 'fcm_token')
  final String? fcmToken;
  @override
  @JsonKey(name: 'is_uploaded_identity_card')
  final bool? isUploadedIdentityCard;
  @override
  @JsonKey(name: 'is_deleted')
  final bool? isDeleted;
  @override
  @JsonKey(name: 'referral_code')
  final String? referralCode;
  @override
  final dynamic tag;
  @override
  final String? token;
  @override
  final String? refreshToken;
  @override
  final String? tokenExpireAt;

  @override
  String toString() {
    return 'Data(id: $id, phoneNumber: $phoneNumber, userId: $userId, email: $email, firstName: $firstName, lastName: $lastName, verificationToken: $verificationToken, verificationTokenExpires: $verificationTokenExpires, tierLevels: $tierLevels, passwordResetToken: $passwordResetToken, passwordResetTokenExpires: $passwordResetTokenExpires, pinResetToken: $pinResetToken, pinResetTokenExpires: $pinResetTokenExpires, status: $status, deviceToken: $deviceToken, fcmToken: $fcmToken, isUploadedIdentityCard: $isUploadedIdentityCard, isDeleted: $isDeleted, referralCode: $referralCode, tag: $tag, token: $token, refreshToken: $refreshToken, tokenExpireAt: $tokenExpireAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DataImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            const DeepCollectionEquality()
                .equals(other.verificationToken, verificationToken) &&
            const DeepCollectionEquality().equals(
                other.verificationTokenExpires, verificationTokenExpires) &&
            (identical(other.tierLevels, tierLevels) ||
                other.tierLevels == tierLevels) &&
            const DeepCollectionEquality()
                .equals(other.passwordResetToken, passwordResetToken) &&
            const DeepCollectionEquality().equals(
                other.passwordResetTokenExpires, passwordResetTokenExpires) &&
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
            (identical(other.isDeleted, isDeleted) ||
                other.isDeleted == isDeleted) &&
            (identical(other.referralCode, referralCode) ||
                other.referralCode == referralCode) &&
            const DeepCollectionEquality().equals(other.tag, tag) &&
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
        const DeepCollectionEquality().hash(verificationToken),
        const DeepCollectionEquality().hash(verificationTokenExpires),
        tierLevels,
        const DeepCollectionEquality().hash(passwordResetToken),
        const DeepCollectionEquality().hash(passwordResetTokenExpires),
        pinResetToken,
        pinResetTokenExpires,
        status,
        deviceToken,
        fcmToken,
        isUploadedIdentityCard,
        isDeleted,
        referralCode,
        const DeepCollectionEquality().hash(tag),
        token,
        refreshToken,
        tokenExpireAt
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DataImplCopyWith<_$DataImpl> get copyWith =>
      __$$DataImplCopyWithImpl<_$DataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DataImplToJson(
      this,
    );
  }
}

abstract class _Data implements Data {
  factory _Data(
      {final int? id,
      @JsonKey(name: 'phone_number') final String? phoneNumber,
      @JsonKey(name: 'user_id') final String? userId,
      final String? email,
      @JsonKey(name: 'first_name') final String? firstName,
      @JsonKey(name: 'last_name') final String? lastName,
      @JsonKey(name: 'verification_token') final dynamic verificationToken,
      @JsonKey(name: 'verification_token_expires')
      final dynamic verificationTokenExpires,
      @JsonKey(name: 'tier_levels') final int? tierLevels,
      @JsonKey(name: 'password_reset_token') final dynamic passwordResetToken,
      @JsonKey(name: 'password_reset_token_expires')
      final dynamic passwordResetTokenExpires,
      @JsonKey(name: 'pin_reset_token') final String? pinResetToken,
      @JsonKey(name: 'pin_reset_token_expires')
      final String? pinResetTokenExpires,
      final String? status,
      @JsonKey(name: 'device_token') final String? deviceToken,
      @JsonKey(name: 'fcm_token') final String? fcmToken,
      @JsonKey(name: 'is_uploaded_identity_card')
      final bool? isUploadedIdentityCard,
      @JsonKey(name: 'is_deleted') final bool? isDeleted,
      @JsonKey(name: 'referral_code') final String? referralCode,
      final dynamic tag,
      final String? token,
      final String? refreshToken,
      final String? tokenExpireAt}) = _$DataImpl;

  factory _Data.fromJson(Map<String, dynamic> json) = _$DataImpl.fromJson;

  @override
  int? get id;
  @override
  @JsonKey(name: 'phone_number')
  String? get phoneNumber;
  @override
  @JsonKey(name: 'user_id')
  String? get userId;
  @override
  String? get email;
  @override
  @JsonKey(name: 'first_name')
  String? get firstName;
  @override
  @JsonKey(name: 'last_name')
  String? get lastName;
  @override
  @JsonKey(name: 'verification_token')
  dynamic get verificationToken;
  @override
  @JsonKey(name: 'verification_token_expires')
  dynamic get verificationTokenExpires;
  @override
  @JsonKey(name: 'tier_levels')
  int? get tierLevels;
  @override
  @JsonKey(name: 'password_reset_token')
  dynamic get passwordResetToken;
  @override
  @JsonKey(name: 'password_reset_token_expires')
  dynamic get passwordResetTokenExpires;
  @override
  @JsonKey(name: 'pin_reset_token')
  String? get pinResetToken;
  @override
  @JsonKey(name: 'pin_reset_token_expires')
  String? get pinResetTokenExpires;
  @override
  String? get status;
  @override
  @JsonKey(name: 'device_token')
  String? get deviceToken;
  @override
  @JsonKey(name: 'fcm_token')
  String? get fcmToken;
  @override
  @JsonKey(name: 'is_uploaded_identity_card')
  bool? get isUploadedIdentityCard;
  @override
  @JsonKey(name: 'is_deleted')
  bool? get isDeleted;
  @override
  @JsonKey(name: 'referral_code')
  String? get referralCode;
  @override
  dynamic get tag;
  @override
  String? get token;
  @override
  String? get refreshToken;
  @override
  String? get tokenExpireAt;
  @override
  @JsonKey(ignore: true)
  _$$DataImplCopyWith<_$DataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
