// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'wallet.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Wallet _$WalletFromJson(Map<String, dynamic> json) {
  return _Wallet.fromJson(json);
}

/// @nodoc
mixin _$Wallet {
  @JsonKey(name: 'wallet_id')
  @HiveField(0)
  String? get walletId => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_id')
  @HiveField(1)
  String? get userId => throw _privateConstructorUsedError;
  @HiveField(2)
  String? get credit => throw _privateConstructorUsedError;
  @HiveField(3)
  String? get debit => throw _privateConstructorUsedError;
  @HiveField(4)
  String? get balance => throw _privateConstructorUsedError;
  @JsonKey(name: 'wallet_type')
  @HiveField(5)
  String? get walletType => throw _privateConstructorUsedError;
  @JsonKey(name: 'account_name')
  @HiveField(6)
  String? get accountName => throw _privateConstructorUsedError;
  @JsonKey(name: 'account_number')
  @HiveField(7)
  String? get accountNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'bank_provider')
  @HiveField(8)
  String? get bankProvider => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WalletCopyWith<Wallet> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WalletCopyWith<$Res> {
  factory $WalletCopyWith(Wallet value, $Res Function(Wallet) then) =
      _$WalletCopyWithImpl<$Res, Wallet>;
  @useResult
  $Res call(
      {@JsonKey(name: 'wallet_id') @HiveField(0) String? walletId,
      @JsonKey(name: 'user_id') @HiveField(1) String? userId,
      @HiveField(2) String? credit,
      @HiveField(3) String? debit,
      @HiveField(4) String? balance,
      @JsonKey(name: 'wallet_type') @HiveField(5) String? walletType,
      @JsonKey(name: 'account_name') @HiveField(6) String? accountName,
      @JsonKey(name: 'account_number') @HiveField(7) String? accountNumber,
      @JsonKey(name: 'bank_provider') @HiveField(8) String? bankProvider});
}

/// @nodoc
class _$WalletCopyWithImpl<$Res, $Val extends Wallet>
    implements $WalletCopyWith<$Res> {
  _$WalletCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? walletId = freezed,
    Object? userId = freezed,
    Object? credit = freezed,
    Object? debit = freezed,
    Object? balance = freezed,
    Object? walletType = freezed,
    Object? accountName = freezed,
    Object? accountNumber = freezed,
    Object? bankProvider = freezed,
  }) {
    return _then(_value.copyWith(
      walletId: freezed == walletId
          ? _value.walletId
          : walletId // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      credit: freezed == credit
          ? _value.credit
          : credit // ignore: cast_nullable_to_non_nullable
              as String?,
      debit: freezed == debit
          ? _value.debit
          : debit // ignore: cast_nullable_to_non_nullable
              as String?,
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
abstract class _$$WalletImplCopyWith<$Res> implements $WalletCopyWith<$Res> {
  factory _$$WalletImplCopyWith(
          _$WalletImpl value, $Res Function(_$WalletImpl) then) =
      __$$WalletImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'wallet_id') @HiveField(0) String? walletId,
      @JsonKey(name: 'user_id') @HiveField(1) String? userId,
      @HiveField(2) String? credit,
      @HiveField(3) String? debit,
      @HiveField(4) String? balance,
      @JsonKey(name: 'wallet_type') @HiveField(5) String? walletType,
      @JsonKey(name: 'account_name') @HiveField(6) String? accountName,
      @JsonKey(name: 'account_number') @HiveField(7) String? accountNumber,
      @JsonKey(name: 'bank_provider') @HiveField(8) String? bankProvider});
}

/// @nodoc
class __$$WalletImplCopyWithImpl<$Res>
    extends _$WalletCopyWithImpl<$Res, _$WalletImpl>
    implements _$$WalletImplCopyWith<$Res> {
  __$$WalletImplCopyWithImpl(
      _$WalletImpl _value, $Res Function(_$WalletImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? walletId = freezed,
    Object? userId = freezed,
    Object? credit = freezed,
    Object? debit = freezed,
    Object? balance = freezed,
    Object? walletType = freezed,
    Object? accountName = freezed,
    Object? accountNumber = freezed,
    Object? bankProvider = freezed,
  }) {
    return _then(_$WalletImpl(
      walletId: freezed == walletId
          ? _value.walletId
          : walletId // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      credit: freezed == credit
          ? _value.credit
          : credit // ignore: cast_nullable_to_non_nullable
              as String?,
      debit: freezed == debit
          ? _value.debit
          : debit // ignore: cast_nullable_to_non_nullable
              as String?,
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
class _$WalletImpl implements _Wallet {
  _$WalletImpl(
      {@JsonKey(name: 'wallet_id') @HiveField(0) this.walletId,
      @JsonKey(name: 'user_id') @HiveField(1) this.userId,
      @HiveField(2) this.credit,
      @HiveField(3) this.debit,
      @HiveField(4) this.balance,
      @JsonKey(name: 'wallet_type') @HiveField(5) this.walletType,
      @JsonKey(name: 'account_name') @HiveField(6) this.accountName,
      @JsonKey(name: 'account_number') @HiveField(7) this.accountNumber,
      @JsonKey(name: 'bank_provider') @HiveField(8) this.bankProvider});

  factory _$WalletImpl.fromJson(Map<String, dynamic> json) =>
      _$$WalletImplFromJson(json);

  @override
  @JsonKey(name: 'wallet_id')
  @HiveField(0)
  final String? walletId;
  @override
  @JsonKey(name: 'user_id')
  @HiveField(1)
  final String? userId;
  @override
  @HiveField(2)
  final String? credit;
  @override
  @HiveField(3)
  final String? debit;
  @override
  @HiveField(4)
  final String? balance;
  @override
  @JsonKey(name: 'wallet_type')
  @HiveField(5)
  final String? walletType;
  @override
  @JsonKey(name: 'account_name')
  @HiveField(6)
  final String? accountName;
  @override
  @JsonKey(name: 'account_number')
  @HiveField(7)
  final String? accountNumber;
  @override
  @JsonKey(name: 'bank_provider')
  @HiveField(8)
  final String? bankProvider;

  @override
  String toString() {
    return 'Wallet(walletId: $walletId, userId: $userId, credit: $credit, debit: $debit, balance: $balance, walletType: $walletType, accountName: $accountName, accountNumber: $accountNumber, bankProvider: $bankProvider)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WalletImpl &&
            (identical(other.walletId, walletId) ||
                other.walletId == walletId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.credit, credit) || other.credit == credit) &&
            (identical(other.debit, debit) || other.debit == debit) &&
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
  int get hashCode => Object.hash(runtimeType, walletId, userId, credit, debit,
      balance, walletType, accountName, accountNumber, bankProvider);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WalletImplCopyWith<_$WalletImpl> get copyWith =>
      __$$WalletImplCopyWithImpl<_$WalletImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WalletImplToJson(
      this,
    );
  }
}

abstract class _Wallet implements Wallet {
  factory _Wallet(
      {@JsonKey(name: 'wallet_id') @HiveField(0) final String? walletId,
      @JsonKey(name: 'user_id') @HiveField(1) final String? userId,
      @HiveField(2) final String? credit,
      @HiveField(3) final String? debit,
      @HiveField(4) final String? balance,
      @JsonKey(name: 'wallet_type') @HiveField(5) final String? walletType,
      @JsonKey(name: 'account_name') @HiveField(6) final String? accountName,
      @JsonKey(name: 'account_number')
      @HiveField(7)
      final String? accountNumber,
      @JsonKey(name: 'bank_provider')
      @HiveField(8)
      final String? bankProvider}) = _$WalletImpl;

  factory _Wallet.fromJson(Map<String, dynamic> json) = _$WalletImpl.fromJson;

  @override
  @JsonKey(name: 'wallet_id')
  @HiveField(0)
  String? get walletId;
  @override
  @JsonKey(name: 'user_id')
  @HiveField(1)
  String? get userId;
  @override
  @HiveField(2)
  String? get credit;
  @override
  @HiveField(3)
  String? get debit;
  @override
  @HiveField(4)
  String? get balance;
  @override
  @JsonKey(name: 'wallet_type')
  @HiveField(5)
  String? get walletType;
  @override
  @JsonKey(name: 'account_name')
  @HiveField(6)
  String? get accountName;
  @override
  @JsonKey(name: 'account_number')
  @HiveField(7)
  String? get accountNumber;
  @override
  @JsonKey(name: 'bank_provider')
  @HiveField(8)
  String? get bankProvider;
  @override
  @JsonKey(ignore: true)
  _$$WalletImplCopyWith<_$WalletImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
