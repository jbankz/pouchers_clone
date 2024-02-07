// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'wallet_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$WalletState<T> {
  bool get isBusy => throw _privateConstructorUsedError;
  bool get validatingAccount => throw _privateConstructorUsedError;
  T? get data => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;
  StackTrace? get stackTrace => throw _privateConstructorUsedError;
  BankAccountDetails? get bankAccountDetails =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $WalletStateCopyWith<T, WalletState<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WalletStateCopyWith<T, $Res> {
  factory $WalletStateCopyWith(
          WalletState<T> value, $Res Function(WalletState<T>) then) =
      _$WalletStateCopyWithImpl<T, $Res, WalletState<T>>;
  @useResult
  $Res call(
      {bool isBusy,
      bool validatingAccount,
      T? data,
      String? errorMessage,
      StackTrace? stackTrace,
      BankAccountDetails? bankAccountDetails});

  $BankAccountDetailsCopyWith<$Res>? get bankAccountDetails;
}

/// @nodoc
class _$WalletStateCopyWithImpl<T, $Res, $Val extends WalletState<T>>
    implements $WalletStateCopyWith<T, $Res> {
  _$WalletStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isBusy = null,
    Object? validatingAccount = null,
    Object? data = freezed,
    Object? errorMessage = freezed,
    Object? stackTrace = freezed,
    Object? bankAccountDetails = freezed,
  }) {
    return _then(_value.copyWith(
      isBusy: null == isBusy
          ? _value.isBusy
          : isBusy // ignore: cast_nullable_to_non_nullable
              as bool,
      validatingAccount: null == validatingAccount
          ? _value.validatingAccount
          : validatingAccount // ignore: cast_nullable_to_non_nullable
              as bool,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T?,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      stackTrace: freezed == stackTrace
          ? _value.stackTrace
          : stackTrace // ignore: cast_nullable_to_non_nullable
              as StackTrace?,
      bankAccountDetails: freezed == bankAccountDetails
          ? _value.bankAccountDetails
          : bankAccountDetails // ignore: cast_nullable_to_non_nullable
              as BankAccountDetails?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $BankAccountDetailsCopyWith<$Res>? get bankAccountDetails {
    if (_value.bankAccountDetails == null) {
      return null;
    }

    return $BankAccountDetailsCopyWith<$Res>(_value.bankAccountDetails!,
        (value) {
      return _then(_value.copyWith(bankAccountDetails: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$WalletStateImplCopyWith<T, $Res>
    implements $WalletStateCopyWith<T, $Res> {
  factory _$$WalletStateImplCopyWith(_$WalletStateImpl<T> value,
          $Res Function(_$WalletStateImpl<T>) then) =
      __$$WalletStateImplCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call(
      {bool isBusy,
      bool validatingAccount,
      T? data,
      String? errorMessage,
      StackTrace? stackTrace,
      BankAccountDetails? bankAccountDetails});

  @override
  $BankAccountDetailsCopyWith<$Res>? get bankAccountDetails;
}

/// @nodoc
class __$$WalletStateImplCopyWithImpl<T, $Res>
    extends _$WalletStateCopyWithImpl<T, $Res, _$WalletStateImpl<T>>
    implements _$$WalletStateImplCopyWith<T, $Res> {
  __$$WalletStateImplCopyWithImpl(
      _$WalletStateImpl<T> _value, $Res Function(_$WalletStateImpl<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isBusy = null,
    Object? validatingAccount = null,
    Object? data = freezed,
    Object? errorMessage = freezed,
    Object? stackTrace = freezed,
    Object? bankAccountDetails = freezed,
  }) {
    return _then(_$WalletStateImpl<T>(
      isBusy: null == isBusy
          ? _value.isBusy
          : isBusy // ignore: cast_nullable_to_non_nullable
              as bool,
      validatingAccount: null == validatingAccount
          ? _value.validatingAccount
          : validatingAccount // ignore: cast_nullable_to_non_nullable
              as bool,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T?,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      stackTrace: freezed == stackTrace
          ? _value.stackTrace
          : stackTrace // ignore: cast_nullable_to_non_nullable
              as StackTrace?,
      bankAccountDetails: freezed == bankAccountDetails
          ? _value.bankAccountDetails
          : bankAccountDetails // ignore: cast_nullable_to_non_nullable
              as BankAccountDetails?,
    ));
  }
}

/// @nodoc

class _$WalletStateImpl<T> implements _WalletState<T> {
  const _$WalletStateImpl(
      {this.isBusy = false,
      this.validatingAccount = false,
      this.data,
      this.errorMessage,
      this.stackTrace,
      this.bankAccountDetails});

  @override
  @JsonKey()
  final bool isBusy;
  @override
  @JsonKey()
  final bool validatingAccount;
  @override
  final T? data;
  @override
  final String? errorMessage;
  @override
  final StackTrace? stackTrace;
  @override
  final BankAccountDetails? bankAccountDetails;

  @override
  String toString() {
    return 'WalletState<$T>(isBusy: $isBusy, validatingAccount: $validatingAccount, data: $data, errorMessage: $errorMessage, stackTrace: $stackTrace, bankAccountDetails: $bankAccountDetails)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WalletStateImpl<T> &&
            (identical(other.isBusy, isBusy) || other.isBusy == isBusy) &&
            (identical(other.validatingAccount, validatingAccount) ||
                other.validatingAccount == validatingAccount) &&
            const DeepCollectionEquality().equals(other.data, data) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.stackTrace, stackTrace) ||
                other.stackTrace == stackTrace) &&
            (identical(other.bankAccountDetails, bankAccountDetails) ||
                other.bankAccountDetails == bankAccountDetails));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isBusy,
      validatingAccount,
      const DeepCollectionEquality().hash(data),
      errorMessage,
      stackTrace,
      bankAccountDetails);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WalletStateImplCopyWith<T, _$WalletStateImpl<T>> get copyWith =>
      __$$WalletStateImplCopyWithImpl<T, _$WalletStateImpl<T>>(
          this, _$identity);
}

abstract class _WalletState<T> implements WalletState<T> {
  const factory _WalletState(
      {final bool isBusy,
      final bool validatingAccount,
      final T? data,
      final String? errorMessage,
      final StackTrace? stackTrace,
      final BankAccountDetails? bankAccountDetails}) = _$WalletStateImpl<T>;

  @override
  bool get isBusy;
  @override
  bool get validatingAccount;
  @override
  T? get data;
  @override
  String? get errorMessage;
  @override
  StackTrace? get stackTrace;
  @override
  BankAccountDetails? get bankAccountDetails;
  @override
  @JsonKey(ignore: true)
  _$$WalletStateImplCopyWith<T, _$WalletStateImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
