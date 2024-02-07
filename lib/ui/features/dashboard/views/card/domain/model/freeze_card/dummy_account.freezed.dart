// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dummy_account.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DummyAccount _$DummyAccountFromJson(Map<String, dynamic> json) {
  return _DummyAccount.fromJson(json);
}

/// @nodoc
mixin _$DummyAccount {
  String? get currency => throw _privateConstructorUsedError;
  String? get bankCode => throw _privateConstructorUsedError;
  String? get accountType => throw _privateConstructorUsedError;
  String? get accountNumber => throw _privateConstructorUsedError;
  @JsonKey(name: '_id')
  String? get id => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DummyAccountCopyWith<DummyAccount> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DummyAccountCopyWith<$Res> {
  factory $DummyAccountCopyWith(
          DummyAccount value, $Res Function(DummyAccount) then) =
      _$DummyAccountCopyWithImpl<$Res, DummyAccount>;
  @useResult
  $Res call(
      {String? currency,
      String? bankCode,
      String? accountType,
      String? accountNumber,
      @JsonKey(name: '_id') String? id});
}

/// @nodoc
class _$DummyAccountCopyWithImpl<$Res, $Val extends DummyAccount>
    implements $DummyAccountCopyWith<$Res> {
  _$DummyAccountCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currency = freezed,
    Object? bankCode = freezed,
    Object? accountType = freezed,
    Object? accountNumber = freezed,
    Object? id = freezed,
  }) {
    return _then(_value.copyWith(
      currency: freezed == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String?,
      bankCode: freezed == bankCode
          ? _value.bankCode
          : bankCode // ignore: cast_nullable_to_non_nullable
              as String?,
      accountType: freezed == accountType
          ? _value.accountType
          : accountType // ignore: cast_nullable_to_non_nullable
              as String?,
      accountNumber: freezed == accountNumber
          ? _value.accountNumber
          : accountNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DummyAccountImplCopyWith<$Res>
    implements $DummyAccountCopyWith<$Res> {
  factory _$$DummyAccountImplCopyWith(
          _$DummyAccountImpl value, $Res Function(_$DummyAccountImpl) then) =
      __$$DummyAccountImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? currency,
      String? bankCode,
      String? accountType,
      String? accountNumber,
      @JsonKey(name: '_id') String? id});
}

/// @nodoc
class __$$DummyAccountImplCopyWithImpl<$Res>
    extends _$DummyAccountCopyWithImpl<$Res, _$DummyAccountImpl>
    implements _$$DummyAccountImplCopyWith<$Res> {
  __$$DummyAccountImplCopyWithImpl(
      _$DummyAccountImpl _value, $Res Function(_$DummyAccountImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currency = freezed,
    Object? bankCode = freezed,
    Object? accountType = freezed,
    Object? accountNumber = freezed,
    Object? id = freezed,
  }) {
    return _then(_$DummyAccountImpl(
      currency: freezed == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String?,
      bankCode: freezed == bankCode
          ? _value.bankCode
          : bankCode // ignore: cast_nullable_to_non_nullable
              as String?,
      accountType: freezed == accountType
          ? _value.accountType
          : accountType // ignore: cast_nullable_to_non_nullable
              as String?,
      accountNumber: freezed == accountNumber
          ? _value.accountNumber
          : accountNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DummyAccountImpl implements _DummyAccount {
  _$DummyAccountImpl(
      {this.currency,
      this.bankCode,
      this.accountType,
      this.accountNumber,
      @JsonKey(name: '_id') this.id});

  factory _$DummyAccountImpl.fromJson(Map<String, dynamic> json) =>
      _$$DummyAccountImplFromJson(json);

  @override
  final String? currency;
  @override
  final String? bankCode;
  @override
  final String? accountType;
  @override
  final String? accountNumber;
  @override
  @JsonKey(name: '_id')
  final String? id;

  @override
  String toString() {
    return 'DummyAccount(currency: $currency, bankCode: $bankCode, accountType: $accountType, accountNumber: $accountNumber, id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DummyAccountImpl &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.bankCode, bankCode) ||
                other.bankCode == bankCode) &&
            (identical(other.accountType, accountType) ||
                other.accountType == accountType) &&
            (identical(other.accountNumber, accountNumber) ||
                other.accountNumber == accountNumber) &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, currency, bankCode, accountType, accountNumber, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DummyAccountImplCopyWith<_$DummyAccountImpl> get copyWith =>
      __$$DummyAccountImplCopyWithImpl<_$DummyAccountImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DummyAccountImplToJson(
      this,
    );
  }
}

abstract class _DummyAccount implements DummyAccount {
  factory _DummyAccount(
      {final String? currency,
      final String? bankCode,
      final String? accountType,
      final String? accountNumber,
      @JsonKey(name: '_id') final String? id}) = _$DummyAccountImpl;

  factory _DummyAccount.fromJson(Map<String, dynamic> json) =
      _$DummyAccountImpl.fromJson;

  @override
  String? get currency;
  @override
  String? get bankCode;
  @override
  String? get accountType;
  @override
  String? get accountNumber;
  @override
  @JsonKey(name: '_id')
  String? get id;
  @override
  @JsonKey(ignore: true)
  _$$DummyAccountImplCopyWith<_$DummyAccountImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
