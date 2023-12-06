// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bank_account_details.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

BankAccountDetails _$BankAccountDetailsFromJson(Map<String, dynamic> json) {
  return _BankAccountDetails.fromJson(json);
}

/// @nodoc
mixin _$BankAccountDetails {
  String? get accountName => throw _privateConstructorUsedError;
  @JsonKey(name: 'counterPartyId')
  String? get counterPartyId => throw _privateConstructorUsedError;
  @JsonKey(name: 'depositAccountId')
  String? get depositAccountId => throw _privateConstructorUsedError;
  @JsonKey(name: 'bankCode')
  String? get bankCode => throw _privateConstructorUsedError;
  num get transactionFee => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BankAccountDetailsCopyWith<BankAccountDetails> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BankAccountDetailsCopyWith<$Res> {
  factory $BankAccountDetailsCopyWith(
          BankAccountDetails value, $Res Function(BankAccountDetails) then) =
      _$BankAccountDetailsCopyWithImpl<$Res, BankAccountDetails>;
  @useResult
  $Res call(
      {String? accountName,
      @JsonKey(name: 'counterPartyId') String? counterPartyId,
      @JsonKey(name: 'depositAccountId') String? depositAccountId,
      @JsonKey(name: 'bankCode') String? bankCode,
      num transactionFee});
}

/// @nodoc
class _$BankAccountDetailsCopyWithImpl<$Res, $Val extends BankAccountDetails>
    implements $BankAccountDetailsCopyWith<$Res> {
  _$BankAccountDetailsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accountName = freezed,
    Object? counterPartyId = freezed,
    Object? depositAccountId = freezed,
    Object? bankCode = freezed,
    Object? transactionFee = null,
  }) {
    return _then(_value.copyWith(
      accountName: freezed == accountName
          ? _value.accountName
          : accountName // ignore: cast_nullable_to_non_nullable
              as String?,
      counterPartyId: freezed == counterPartyId
          ? _value.counterPartyId
          : counterPartyId // ignore: cast_nullable_to_non_nullable
              as String?,
      depositAccountId: freezed == depositAccountId
          ? _value.depositAccountId
          : depositAccountId // ignore: cast_nullable_to_non_nullable
              as String?,
      bankCode: freezed == bankCode
          ? _value.bankCode
          : bankCode // ignore: cast_nullable_to_non_nullable
              as String?,
      transactionFee: null == transactionFee
          ? _value.transactionFee
          : transactionFee // ignore: cast_nullable_to_non_nullable
              as num,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BankAccountDetailsImplCopyWith<$Res>
    implements $BankAccountDetailsCopyWith<$Res> {
  factory _$$BankAccountDetailsImplCopyWith(_$BankAccountDetailsImpl value,
          $Res Function(_$BankAccountDetailsImpl) then) =
      __$$BankAccountDetailsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? accountName,
      @JsonKey(name: 'counterPartyId') String? counterPartyId,
      @JsonKey(name: 'depositAccountId') String? depositAccountId,
      @JsonKey(name: 'bankCode') String? bankCode,
      num transactionFee});
}

/// @nodoc
class __$$BankAccountDetailsImplCopyWithImpl<$Res>
    extends _$BankAccountDetailsCopyWithImpl<$Res, _$BankAccountDetailsImpl>
    implements _$$BankAccountDetailsImplCopyWith<$Res> {
  __$$BankAccountDetailsImplCopyWithImpl(_$BankAccountDetailsImpl _value,
      $Res Function(_$BankAccountDetailsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accountName = freezed,
    Object? counterPartyId = freezed,
    Object? depositAccountId = freezed,
    Object? bankCode = freezed,
    Object? transactionFee = null,
  }) {
    return _then(_$BankAccountDetailsImpl(
      accountName: freezed == accountName
          ? _value.accountName
          : accountName // ignore: cast_nullable_to_non_nullable
              as String?,
      counterPartyId: freezed == counterPartyId
          ? _value.counterPartyId
          : counterPartyId // ignore: cast_nullable_to_non_nullable
              as String?,
      depositAccountId: freezed == depositAccountId
          ? _value.depositAccountId
          : depositAccountId // ignore: cast_nullable_to_non_nullable
              as String?,
      bankCode: freezed == bankCode
          ? _value.bankCode
          : bankCode // ignore: cast_nullable_to_non_nullable
              as String?,
      transactionFee: null == transactionFee
          ? _value.transactionFee
          : transactionFee // ignore: cast_nullable_to_non_nullable
              as num,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BankAccountDetailsImpl implements _BankAccountDetails {
  _$BankAccountDetailsImpl(
      {this.accountName,
      @JsonKey(name: 'counterPartyId') this.counterPartyId,
      @JsonKey(name: 'depositAccountId') this.depositAccountId,
      @JsonKey(name: 'bankCode') this.bankCode,
      this.transactionFee = 0});

  factory _$BankAccountDetailsImpl.fromJson(Map<String, dynamic> json) =>
      _$$BankAccountDetailsImplFromJson(json);

  @override
  final String? accountName;
  @override
  @JsonKey(name: 'counterPartyId')
  final String? counterPartyId;
  @override
  @JsonKey(name: 'depositAccountId')
  final String? depositAccountId;
  @override
  @JsonKey(name: 'bankCode')
  final String? bankCode;
  @override
  @JsonKey()
  final num transactionFee;

  @override
  String toString() {
    return 'BankAccountDetails(accountName: $accountName, counterPartyId: $counterPartyId, depositAccountId: $depositAccountId, bankCode: $bankCode, transactionFee: $transactionFee)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BankAccountDetailsImpl &&
            (identical(other.accountName, accountName) ||
                other.accountName == accountName) &&
            (identical(other.counterPartyId, counterPartyId) ||
                other.counterPartyId == counterPartyId) &&
            (identical(other.depositAccountId, depositAccountId) ||
                other.depositAccountId == depositAccountId) &&
            (identical(other.bankCode, bankCode) ||
                other.bankCode == bankCode) &&
            (identical(other.transactionFee, transactionFee) ||
                other.transactionFee == transactionFee));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, accountName, counterPartyId,
      depositAccountId, bankCode, transactionFee);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BankAccountDetailsImplCopyWith<_$BankAccountDetailsImpl> get copyWith =>
      __$$BankAccountDetailsImplCopyWithImpl<_$BankAccountDetailsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BankAccountDetailsImplToJson(
      this,
    );
  }
}

abstract class _BankAccountDetails implements BankAccountDetails {
  factory _BankAccountDetails(
      {final String? accountName,
      @JsonKey(name: 'counterPartyId') final String? counterPartyId,
      @JsonKey(name: 'depositAccountId') final String? depositAccountId,
      @JsonKey(name: 'bankCode') final String? bankCode,
      final num transactionFee}) = _$BankAccountDetailsImpl;

  factory _BankAccountDetails.fromJson(Map<String, dynamic> json) =
      _$BankAccountDetailsImpl.fromJson;

  @override
  String? get accountName;
  @override
  @JsonKey(name: 'counterPartyId')
  String? get counterPartyId;
  @override
  @JsonKey(name: 'depositAccountId')
  String? get depositAccountId;
  @override
  @JsonKey(name: 'bankCode')
  String? get bankCode;
  @override
  num get transactionFee;
  @override
  @JsonKey(ignore: true)
  _$$BankAccountDetailsImplCopyWith<_$BankAccountDetailsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
