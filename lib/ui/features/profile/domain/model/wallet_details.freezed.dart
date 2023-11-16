// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'wallet_details.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

WalletDetails _$WalletDetailsFromJson(Map<String, dynamic> json) {
  return _WalletDetails.fromJson(json);
}

/// @nodoc
mixin _$WalletDetails {
  String? get balance => throw _privateConstructorUsedError;
  @JsonKey(name: 'wallet_type')
  @HiveField(0)
  String? get walletType => throw _privateConstructorUsedError;
  @JsonKey(name: 'account_name')
  @HiveField(1)
  String? get accountName => throw _privateConstructorUsedError;
  @JsonKey(name: 'account_number')
  @HiveField(2)
  String? get accountNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'bank_provider')
  @HiveField(3)
  String? get bankProvider => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WalletDetailsCopyWith<WalletDetails> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WalletDetailsCopyWith<$Res> {
  factory $WalletDetailsCopyWith(
          WalletDetails value, $Res Function(WalletDetails) then) =
      _$WalletDetailsCopyWithImpl<$Res, WalletDetails>;
  @useResult
  $Res call(
      {String? balance,
      @JsonKey(name: 'wallet_type') @HiveField(0) String? walletType,
      @JsonKey(name: 'account_name') @HiveField(1) String? accountName,
      @JsonKey(name: 'account_number') @HiveField(2) String? accountNumber,
      @JsonKey(name: 'bank_provider') @HiveField(3) String? bankProvider});
}

/// @nodoc
class _$WalletDetailsCopyWithImpl<$Res, $Val extends WalletDetails>
    implements $WalletDetailsCopyWith<$Res> {
  _$WalletDetailsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? balance = freezed,
    Object? walletType = freezed,
    Object? accountName = freezed,
    Object? accountNumber = freezed,
    Object? bankProvider = freezed,
  }) {
    return _then(_value.copyWith(
      balance: freezed == balance
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as String?,
      walletType: freezed == walletType
          ? _value.walletType
          : walletType // ignore: cast_nullable_to_non_nullable
              as String?,
      accountName: freezed == accountName
          ? _value.accountName
          : accountName // ignore: cast_nullable_to_non_nullable
              as String?,
      accountNumber: freezed == accountNumber
          ? _value.accountNumber
          : accountNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      bankProvider: freezed == bankProvider
          ? _value.bankProvider
          : bankProvider // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WalletDetailsImplCopyWith<$Res>
    implements $WalletDetailsCopyWith<$Res> {
  factory _$$WalletDetailsImplCopyWith(
          _$WalletDetailsImpl value, $Res Function(_$WalletDetailsImpl) then) =
      __$$WalletDetailsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? balance,
      @JsonKey(name: 'wallet_type') @HiveField(0) String? walletType,
      @JsonKey(name: 'account_name') @HiveField(1) String? accountName,
      @JsonKey(name: 'account_number') @HiveField(2) String? accountNumber,
      @JsonKey(name: 'bank_provider') @HiveField(3) String? bankProvider});
}

/// @nodoc
class __$$WalletDetailsImplCopyWithImpl<$Res>
    extends _$WalletDetailsCopyWithImpl<$Res, _$WalletDetailsImpl>
    implements _$$WalletDetailsImplCopyWith<$Res> {
  __$$WalletDetailsImplCopyWithImpl(
      _$WalletDetailsImpl _value, $Res Function(_$WalletDetailsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? balance = freezed,
    Object? walletType = freezed,
    Object? accountName = freezed,
    Object? accountNumber = freezed,
    Object? bankProvider = freezed,
  }) {
    return _then(_$WalletDetailsImpl(
      balance: freezed == balance
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as String?,
      walletType: freezed == walletType
          ? _value.walletType
          : walletType // ignore: cast_nullable_to_non_nullable
              as String?,
      accountName: freezed == accountName
          ? _value.accountName
          : accountName // ignore: cast_nullable_to_non_nullable
              as String?,
      accountNumber: freezed == accountNumber
          ? _value.accountNumber
          : accountNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      bankProvider: freezed == bankProvider
          ? _value.bankProvider
          : bankProvider // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@HiveType(typeId: 2, adapterName: 'WalletDetailsAdapter')
class _$WalletDetailsImpl implements _WalletDetails {
  _$WalletDetailsImpl(
      {this.balance,
      @JsonKey(name: 'wallet_type') @HiveField(0) this.walletType,
      @JsonKey(name: 'account_name') @HiveField(1) this.accountName,
      @JsonKey(name: 'account_number') @HiveField(2) this.accountNumber,
      @JsonKey(name: 'bank_provider') @HiveField(3) this.bankProvider});

  factory _$WalletDetailsImpl.fromJson(Map<String, dynamic> json) =>
      _$$WalletDetailsImplFromJson(json);

  @override
  final String? balance;
  @override
  @JsonKey(name: 'wallet_type')
  @HiveField(0)
  final String? walletType;
  @override
  @JsonKey(name: 'account_name')
  @HiveField(1)
  final String? accountName;
  @override
  @JsonKey(name: 'account_number')
  @HiveField(2)
  final String? accountNumber;
  @override
  @JsonKey(name: 'bank_provider')
  @HiveField(3)
  final String? bankProvider;

  @override
  String toString() {
    return 'WalletDetails(balance: $balance, walletType: $walletType, accountName: $accountName, accountNumber: $accountNumber, bankProvider: $bankProvider)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WalletDetailsImpl &&
            (identical(other.balance, balance) || other.balance == balance) &&
            (identical(other.walletType, walletType) ||
                other.walletType == walletType) &&
            (identical(other.accountName, accountName) ||
                other.accountName == accountName) &&
            (identical(other.accountNumber, accountNumber) ||
                other.accountNumber == accountNumber) &&
            (identical(other.bankProvider, bankProvider) ||
                other.bankProvider == bankProvider));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, balance, walletType, accountName,
      accountNumber, bankProvider);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WalletDetailsImplCopyWith<_$WalletDetailsImpl> get copyWith =>
      __$$WalletDetailsImplCopyWithImpl<_$WalletDetailsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WalletDetailsImplToJson(
      this,
    );
  }
}

abstract class _WalletDetails implements WalletDetails {
  factory _WalletDetails(
      {final String? balance,
      @JsonKey(name: 'wallet_type') @HiveField(0) final String? walletType,
      @JsonKey(name: 'account_name') @HiveField(1) final String? accountName,
      @JsonKey(name: 'account_number')
      @HiveField(2)
      final String? accountNumber,
      @JsonKey(name: 'bank_provider')
      @HiveField(3)
      final String? bankProvider}) = _$WalletDetailsImpl;

  factory _WalletDetails.fromJson(Map<String, dynamic> json) =
      _$WalletDetailsImpl.fromJson;

  @override
  String? get balance;
  @override
  @JsonKey(name: 'wallet_type')
  @HiveField(0)
  String? get walletType;
  @override
  @JsonKey(name: 'account_name')
  @HiveField(1)
  String? get accountName;
  @override
  @JsonKey(name: 'account_number')
  @HiveField(2)
  String? get accountNumber;
  @override
  @JsonKey(name: 'bank_provider')
  @HiveField(3)
  String? get bankProvider;
  @override
  @JsonKey(ignore: true)
  _$$WalletDetailsImplCopyWith<_$WalletDetailsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
