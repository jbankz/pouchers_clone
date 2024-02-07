// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'generate_2fa_token.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Generate2faToken _$Generate2faTokenFromJson(Map<String, dynamic> json) {
  return _Generate2faToken.fromJson(json);
}

/// @nodoc
mixin _$Generate2faToken {
  @JsonKey(name: 'two_factor_temp_secret')
  String? get twoFactorTempSecret => throw _privateConstructorUsedError;
  String? get qrCodeUrl => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $Generate2faTokenCopyWith<Generate2faToken> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $Generate2faTokenCopyWith<$Res> {
  factory $Generate2faTokenCopyWith(
          Generate2faToken value, $Res Function(Generate2faToken) then) =
      _$Generate2faTokenCopyWithImpl<$Res, Generate2faToken>;
  @useResult
  $Res call(
      {@JsonKey(name: 'two_factor_temp_secret') String? twoFactorTempSecret,
      String? qrCodeUrl});
}

/// @nodoc
class _$Generate2faTokenCopyWithImpl<$Res, $Val extends Generate2faToken>
    implements $Generate2faTokenCopyWith<$Res> {
  _$Generate2faTokenCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? twoFactorTempSecret = freezed,
    Object? qrCodeUrl = freezed,
  }) {
    return _then(_value.copyWith(
      twoFactorTempSecret: freezed == twoFactorTempSecret
          ? _value.twoFactorTempSecret
          : twoFactorTempSecret // ignore: cast_nullable_to_non_nullable
              as String?,
      qrCodeUrl: freezed == qrCodeUrl
          ? _value.qrCodeUrl
          : qrCodeUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$Generate2faTokenImplCopyWith<$Res>
    implements $Generate2faTokenCopyWith<$Res> {
  factory _$$Generate2faTokenImplCopyWith(_$Generate2faTokenImpl value,
          $Res Function(_$Generate2faTokenImpl) then) =
      __$$Generate2faTokenImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'two_factor_temp_secret') String? twoFactorTempSecret,
      String? qrCodeUrl});
}

/// @nodoc
class __$$Generate2faTokenImplCopyWithImpl<$Res>
    extends _$Generate2faTokenCopyWithImpl<$Res, _$Generate2faTokenImpl>
    implements _$$Generate2faTokenImplCopyWith<$Res> {
  __$$Generate2faTokenImplCopyWithImpl(_$Generate2faTokenImpl _value,
      $Res Function(_$Generate2faTokenImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? twoFactorTempSecret = freezed,
    Object? qrCodeUrl = freezed,
  }) {
    return _then(_$Generate2faTokenImpl(
      twoFactorTempSecret: freezed == twoFactorTempSecret
          ? _value.twoFactorTempSecret
          : twoFactorTempSecret // ignore: cast_nullable_to_non_nullable
              as String?,
      qrCodeUrl: freezed == qrCodeUrl
          ? _value.qrCodeUrl
          : qrCodeUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$Generate2faTokenImpl implements _Generate2faToken {
  _$Generate2faTokenImpl(
      {@JsonKey(name: 'two_factor_temp_secret') this.twoFactorTempSecret,
      this.qrCodeUrl});

  factory _$Generate2faTokenImpl.fromJson(Map<String, dynamic> json) =>
      _$$Generate2faTokenImplFromJson(json);

  @override
  @JsonKey(name: 'two_factor_temp_secret')
  final String? twoFactorTempSecret;
  @override
  final String? qrCodeUrl;

  @override
  String toString() {
    return 'Generate2faToken(twoFactorTempSecret: $twoFactorTempSecret, qrCodeUrl: $qrCodeUrl)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Generate2faTokenImpl &&
            (identical(other.twoFactorTempSecret, twoFactorTempSecret) ||
                other.twoFactorTempSecret == twoFactorTempSecret) &&
            (identical(other.qrCodeUrl, qrCodeUrl) ||
                other.qrCodeUrl == qrCodeUrl));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, twoFactorTempSecret, qrCodeUrl);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$Generate2faTokenImplCopyWith<_$Generate2faTokenImpl> get copyWith =>
      __$$Generate2faTokenImplCopyWithImpl<_$Generate2faTokenImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$Generate2faTokenImplToJson(
      this,
    );
  }
}

abstract class _Generate2faToken implements Generate2faToken {
  factory _Generate2faToken(
      {@JsonKey(name: 'two_factor_temp_secret')
      final String? twoFactorTempSecret,
      final String? qrCodeUrl}) = _$Generate2faTokenImpl;

  factory _Generate2faToken.fromJson(Map<String, dynamic> json) =
      _$Generate2faTokenImpl.fromJson;

  @override
  @JsonKey(name: 'two_factor_temp_secret')
  String? get twoFactorTempSecret;
  @override
  String? get qrCodeUrl;
  @override
  @JsonKey(ignore: true)
  _$$Generate2faTokenImplCopyWith<_$Generate2faTokenImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
