// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transaction_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TransactionState<T> {
  bool get isBusy => throw _privateConstructorUsedError;
  List<TransactionHistory> get history => throw _privateConstructorUsedError;
  TransactionAnalytic? get transaction => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;
  StackTrace? get stackTrace => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TransactionStateCopyWith<T, TransactionState<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionStateCopyWith<T, $Res> {
  factory $TransactionStateCopyWith(
          TransactionState<T> value, $Res Function(TransactionState<T>) then) =
      _$TransactionStateCopyWithImpl<T, $Res, TransactionState<T>>;
  @useResult
  $Res call(
      {bool isBusy,
      List<TransactionHistory> history,
      TransactionAnalytic? transaction,
      String? errorMessage,
      StackTrace? stackTrace});

  $TransactionAnalyticCopyWith<$Res>? get transaction;
}

/// @nodoc
class _$TransactionStateCopyWithImpl<T, $Res, $Val extends TransactionState<T>>
    implements $TransactionStateCopyWith<T, $Res> {
  _$TransactionStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isBusy = null,
    Object? history = null,
    Object? transaction = freezed,
    Object? errorMessage = freezed,
    Object? stackTrace = freezed,
  }) {
    return _then(_value.copyWith(
      isBusy: null == isBusy
          ? _value.isBusy
          : isBusy // ignore: cast_nullable_to_non_nullable
              as bool,
      history: null == history
          ? _value.history
          : history // ignore: cast_nullable_to_non_nullable
              as List<TransactionHistory>,
      transaction: freezed == transaction
          ? _value.transaction
          : transaction // ignore: cast_nullable_to_non_nullable
              as TransactionAnalytic?,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      stackTrace: freezed == stackTrace
          ? _value.stackTrace
          : stackTrace // ignore: cast_nullable_to_non_nullable
              as StackTrace?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $TransactionAnalyticCopyWith<$Res>? get transaction {
    if (_value.transaction == null) {
      return null;
    }

    return $TransactionAnalyticCopyWith<$Res>(_value.transaction!, (value) {
      return _then(_value.copyWith(transaction: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$TransactionStateImplCopyWith<T, $Res>
    implements $TransactionStateCopyWith<T, $Res> {
  factory _$$TransactionStateImplCopyWith(_$TransactionStateImpl<T> value,
          $Res Function(_$TransactionStateImpl<T>) then) =
      __$$TransactionStateImplCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call(
      {bool isBusy,
      List<TransactionHistory> history,
      TransactionAnalytic? transaction,
      String? errorMessage,
      StackTrace? stackTrace});

  @override
  $TransactionAnalyticCopyWith<$Res>? get transaction;
}

/// @nodoc
class __$$TransactionStateImplCopyWithImpl<T, $Res>
    extends _$TransactionStateCopyWithImpl<T, $Res, _$TransactionStateImpl<T>>
    implements _$$TransactionStateImplCopyWith<T, $Res> {
  __$$TransactionStateImplCopyWithImpl(_$TransactionStateImpl<T> _value,
      $Res Function(_$TransactionStateImpl<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isBusy = null,
    Object? history = null,
    Object? transaction = freezed,
    Object? errorMessage = freezed,
    Object? stackTrace = freezed,
  }) {
    return _then(_$TransactionStateImpl<T>(
      isBusy: null == isBusy
          ? _value.isBusy
          : isBusy // ignore: cast_nullable_to_non_nullable
              as bool,
      history: null == history
          ? _value._history
          : history // ignore: cast_nullable_to_non_nullable
              as List<TransactionHistory>,
      transaction: freezed == transaction
          ? _value.transaction
          : transaction // ignore: cast_nullable_to_non_nullable
              as TransactionAnalytic?,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      stackTrace: freezed == stackTrace
          ? _value.stackTrace
          : stackTrace // ignore: cast_nullable_to_non_nullable
              as StackTrace?,
    ));
  }
}

/// @nodoc

class _$TransactionStateImpl<T> implements _TransactionState<T> {
  const _$TransactionStateImpl(
      {this.isBusy = false,
      final List<TransactionHistory> history = const [],
      this.transaction,
      this.errorMessage,
      this.stackTrace})
      : _history = history;

  @override
  @JsonKey()
  final bool isBusy;
  final List<TransactionHistory> _history;
  @override
  @JsonKey()
  List<TransactionHistory> get history {
    if (_history is EqualUnmodifiableListView) return _history;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_history);
  }

  @override
  final TransactionAnalytic? transaction;
  @override
  final String? errorMessage;
  @override
  final StackTrace? stackTrace;

  @override
  String toString() {
    return 'TransactionState<$T>(isBusy: $isBusy, history: $history, transaction: $transaction, errorMessage: $errorMessage, stackTrace: $stackTrace)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransactionStateImpl<T> &&
            (identical(other.isBusy, isBusy) || other.isBusy == isBusy) &&
            const DeepCollectionEquality().equals(other._history, _history) &&
            (identical(other.transaction, transaction) ||
                other.transaction == transaction) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.stackTrace, stackTrace) ||
                other.stackTrace == stackTrace));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isBusy,
      const DeepCollectionEquality().hash(_history),
      transaction,
      errorMessage,
      stackTrace);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TransactionStateImplCopyWith<T, _$TransactionStateImpl<T>> get copyWith =>
      __$$TransactionStateImplCopyWithImpl<T, _$TransactionStateImpl<T>>(
          this, _$identity);
}

abstract class _TransactionState<T> implements TransactionState<T> {
  const factory _TransactionState(
      {final bool isBusy,
      final List<TransactionHistory> history,
      final TransactionAnalytic? transaction,
      final String? errorMessage,
      final StackTrace? stackTrace}) = _$TransactionStateImpl<T>;

  @override
  bool get isBusy;
  @override
  List<TransactionHistory> get history;
  @override
  TransactionAnalytic? get transaction;
  @override
  String? get errorMessage;
  @override
  StackTrace? get stackTrace;
  @override
  @JsonKey(ignore: true)
  _$$TransactionStateImplCopyWith<T, _$TransactionStateImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
