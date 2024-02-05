// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'card_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CardState<T> {
  bool get isBusy => throw _privateConstructorUsedError;
  GetExchangeRate? get exchangeRate => throw _privateConstructorUsedError;
  VirtualCardDetails? get virtualCardDetails =>
      throw _privateConstructorUsedError;
  VirtualAccountBalance? get virtualAccountBalance =>
      throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;
  StackTrace? get stackTrace => throw _privateConstructorUsedError;
  List<Datum> get transactions => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CardStateCopyWith<T, CardState<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CardStateCopyWith<T, $Res> {
  factory $CardStateCopyWith(
          CardState<T> value, $Res Function(CardState<T>) then) =
      _$CardStateCopyWithImpl<T, $Res, CardState<T>>;
  @useResult
  $Res call(
      {bool isBusy,
      GetExchangeRate? exchangeRate,
      VirtualCardDetails? virtualCardDetails,
      VirtualAccountBalance? virtualAccountBalance,
      String? errorMessage,
      StackTrace? stackTrace,
      List<Datum> transactions});

  $GetExchangeRateCopyWith<$Res>? get exchangeRate;
  $VirtualCardDetailsCopyWith<$Res>? get virtualCardDetails;
  $VirtualAccountBalanceCopyWith<$Res>? get virtualAccountBalance;
}

/// @nodoc
class _$CardStateCopyWithImpl<T, $Res, $Val extends CardState<T>>
    implements $CardStateCopyWith<T, $Res> {
  _$CardStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isBusy = null,
    Object? exchangeRate = freezed,
    Object? virtualCardDetails = freezed,
    Object? virtualAccountBalance = freezed,
    Object? errorMessage = freezed,
    Object? stackTrace = freezed,
    Object? transactions = null,
  }) {
    return _then(_value.copyWith(
      isBusy: null == isBusy
          ? _value.isBusy
          : isBusy // ignore: cast_nullable_to_non_nullable
              as bool,
      exchangeRate: freezed == exchangeRate
          ? _value.exchangeRate
          : exchangeRate // ignore: cast_nullable_to_non_nullable
              as GetExchangeRate?,
      virtualCardDetails: freezed == virtualCardDetails
          ? _value.virtualCardDetails
          : virtualCardDetails // ignore: cast_nullable_to_non_nullable
              as VirtualCardDetails?,
      virtualAccountBalance: freezed == virtualAccountBalance
          ? _value.virtualAccountBalance
          : virtualAccountBalance // ignore: cast_nullable_to_non_nullable
              as VirtualAccountBalance?,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      stackTrace: freezed == stackTrace
          ? _value.stackTrace
          : stackTrace // ignore: cast_nullable_to_non_nullable
              as StackTrace?,
      transactions: null == transactions
          ? _value.transactions
          : transactions // ignore: cast_nullable_to_non_nullable
              as List<Datum>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $GetExchangeRateCopyWith<$Res>? get exchangeRate {
    if (_value.exchangeRate == null) {
      return null;
    }

    return $GetExchangeRateCopyWith<$Res>(_value.exchangeRate!, (value) {
      return _then(_value.copyWith(exchangeRate: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $VirtualCardDetailsCopyWith<$Res>? get virtualCardDetails {
    if (_value.virtualCardDetails == null) {
      return null;
    }

    return $VirtualCardDetailsCopyWith<$Res>(_value.virtualCardDetails!,
        (value) {
      return _then(_value.copyWith(virtualCardDetails: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $VirtualAccountBalanceCopyWith<$Res>? get virtualAccountBalance {
    if (_value.virtualAccountBalance == null) {
      return null;
    }

    return $VirtualAccountBalanceCopyWith<$Res>(_value.virtualAccountBalance!,
        (value) {
      return _then(_value.copyWith(virtualAccountBalance: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CardStateImplCopyWith<T, $Res>
    implements $CardStateCopyWith<T, $Res> {
  factory _$$CardStateImplCopyWith(
          _$CardStateImpl<T> value, $Res Function(_$CardStateImpl<T>) then) =
      __$$CardStateImplCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call(
      {bool isBusy,
      GetExchangeRate? exchangeRate,
      VirtualCardDetails? virtualCardDetails,
      VirtualAccountBalance? virtualAccountBalance,
      String? errorMessage,
      StackTrace? stackTrace,
      List<Datum> transactions});

  @override
  $GetExchangeRateCopyWith<$Res>? get exchangeRate;
  @override
  $VirtualCardDetailsCopyWith<$Res>? get virtualCardDetails;
  @override
  $VirtualAccountBalanceCopyWith<$Res>? get virtualAccountBalance;
}

/// @nodoc
class __$$CardStateImplCopyWithImpl<T, $Res>
    extends _$CardStateCopyWithImpl<T, $Res, _$CardStateImpl<T>>
    implements _$$CardStateImplCopyWith<T, $Res> {
  __$$CardStateImplCopyWithImpl(
      _$CardStateImpl<T> _value, $Res Function(_$CardStateImpl<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isBusy = null,
    Object? exchangeRate = freezed,
    Object? virtualCardDetails = freezed,
    Object? virtualAccountBalance = freezed,
    Object? errorMessage = freezed,
    Object? stackTrace = freezed,
    Object? transactions = null,
  }) {
    return _then(_$CardStateImpl<T>(
      isBusy: null == isBusy
          ? _value.isBusy
          : isBusy // ignore: cast_nullable_to_non_nullable
              as bool,
      exchangeRate: freezed == exchangeRate
          ? _value.exchangeRate
          : exchangeRate // ignore: cast_nullable_to_non_nullable
              as GetExchangeRate?,
      virtualCardDetails: freezed == virtualCardDetails
          ? _value.virtualCardDetails
          : virtualCardDetails // ignore: cast_nullable_to_non_nullable
              as VirtualCardDetails?,
      virtualAccountBalance: freezed == virtualAccountBalance
          ? _value.virtualAccountBalance
          : virtualAccountBalance // ignore: cast_nullable_to_non_nullable
              as VirtualAccountBalance?,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      stackTrace: freezed == stackTrace
          ? _value.stackTrace
          : stackTrace // ignore: cast_nullable_to_non_nullable
              as StackTrace?,
      transactions: null == transactions
          ? _value._transactions
          : transactions // ignore: cast_nullable_to_non_nullable
              as List<Datum>,
    ));
  }
}

/// @nodoc

class _$CardStateImpl<T> implements _CardState<T> {
  const _$CardStateImpl(
      {this.isBusy = false,
      this.exchangeRate,
      this.virtualCardDetails,
      this.virtualAccountBalance,
      this.errorMessage,
      this.stackTrace,
      final List<Datum> transactions = const []})
      : _transactions = transactions;

  @override
  @JsonKey()
  final bool isBusy;
  @override
  final GetExchangeRate? exchangeRate;
  @override
  final VirtualCardDetails? virtualCardDetails;
  @override
  final VirtualAccountBalance? virtualAccountBalance;
  @override
  final String? errorMessage;
  @override
  final StackTrace? stackTrace;
  final List<Datum> _transactions;
  @override
  @JsonKey()
  List<Datum> get transactions {
    if (_transactions is EqualUnmodifiableListView) return _transactions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_transactions);
  }

  @override
  String toString() {
    return 'CardState<$T>(isBusy: $isBusy, exchangeRate: $exchangeRate, virtualCardDetails: $virtualCardDetails, virtualAccountBalance: $virtualAccountBalance, errorMessage: $errorMessage, stackTrace: $stackTrace, transactions: $transactions)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CardStateImpl<T> &&
            (identical(other.isBusy, isBusy) || other.isBusy == isBusy) &&
            (identical(other.exchangeRate, exchangeRate) ||
                other.exchangeRate == exchangeRate) &&
            (identical(other.virtualCardDetails, virtualCardDetails) ||
                other.virtualCardDetails == virtualCardDetails) &&
            (identical(other.virtualAccountBalance, virtualAccountBalance) ||
                other.virtualAccountBalance == virtualAccountBalance) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.stackTrace, stackTrace) ||
                other.stackTrace == stackTrace) &&
            const DeepCollectionEquality()
                .equals(other._transactions, _transactions));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isBusy,
      exchangeRate,
      virtualCardDetails,
      virtualAccountBalance,
      errorMessage,
      stackTrace,
      const DeepCollectionEquality().hash(_transactions));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CardStateImplCopyWith<T, _$CardStateImpl<T>> get copyWith =>
      __$$CardStateImplCopyWithImpl<T, _$CardStateImpl<T>>(this, _$identity);
}

abstract class _CardState<T> implements CardState<T> {
  const factory _CardState(
      {final bool isBusy,
      final GetExchangeRate? exchangeRate,
      final VirtualCardDetails? virtualCardDetails,
      final VirtualAccountBalance? virtualAccountBalance,
      final String? errorMessage,
      final StackTrace? stackTrace,
      final List<Datum> transactions}) = _$CardStateImpl<T>;

  @override
  bool get isBusy;
  @override
  GetExchangeRate? get exchangeRate;
  @override
  VirtualCardDetails? get virtualCardDetails;
  @override
  VirtualAccountBalance? get virtualAccountBalance;
  @override
  String? get errorMessage;
  @override
  StackTrace? get stackTrace;
  @override
  List<Datum> get transactions;
  @override
  @JsonKey(ignore: true)
  _$$CardStateImplCopyWith<T, _$CardStateImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
