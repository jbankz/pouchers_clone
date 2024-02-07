// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transfer_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TransferState<T> {
  bool get isBusy => throw _privateConstructorUsedError;
  Transfer? get transfer => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;
  StackTrace? get stackTrace => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TransferStateCopyWith<T, TransferState<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransferStateCopyWith<T, $Res> {
  factory $TransferStateCopyWith(
          TransferState<T> value, $Res Function(TransferState<T>) then) =
      _$TransferStateCopyWithImpl<T, $Res, TransferState<T>>;
  @useResult
  $Res call(
      {bool isBusy,
      Transfer? transfer,
      String? errorMessage,
      StackTrace? stackTrace});

  $TransferCopyWith<$Res>? get transfer;
}

/// @nodoc
class _$TransferStateCopyWithImpl<T, $Res, $Val extends TransferState<T>>
    implements $TransferStateCopyWith<T, $Res> {
  _$TransferStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isBusy = null,
    Object? transfer = freezed,
    Object? errorMessage = freezed,
    Object? stackTrace = freezed,
  }) {
    return _then(_value.copyWith(
      isBusy: null == isBusy
          ? _value.isBusy
          : isBusy // ignore: cast_nullable_to_non_nullable
              as bool,
      transfer: freezed == transfer
          ? _value.transfer
          : transfer // ignore: cast_nullable_to_non_nullable
              as Transfer?,
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
  $TransferCopyWith<$Res>? get transfer {
    if (_value.transfer == null) {
      return null;
    }

    return $TransferCopyWith<$Res>(_value.transfer!, (value) {
      return _then(_value.copyWith(transfer: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$TransferStateImplCopyWith<T, $Res>
    implements $TransferStateCopyWith<T, $Res> {
  factory _$$TransferStateImplCopyWith(_$TransferStateImpl<T> value,
          $Res Function(_$TransferStateImpl<T>) then) =
      __$$TransferStateImplCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call(
      {bool isBusy,
      Transfer? transfer,
      String? errorMessage,
      StackTrace? stackTrace});

  @override
  $TransferCopyWith<$Res>? get transfer;
}

/// @nodoc
class __$$TransferStateImplCopyWithImpl<T, $Res>
    extends _$TransferStateCopyWithImpl<T, $Res, _$TransferStateImpl<T>>
    implements _$$TransferStateImplCopyWith<T, $Res> {
  __$$TransferStateImplCopyWithImpl(_$TransferStateImpl<T> _value,
      $Res Function(_$TransferStateImpl<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isBusy = null,
    Object? transfer = freezed,
    Object? errorMessage = freezed,
    Object? stackTrace = freezed,
  }) {
    return _then(_$TransferStateImpl<T>(
      isBusy: null == isBusy
          ? _value.isBusy
          : isBusy // ignore: cast_nullable_to_non_nullable
              as bool,
      transfer: freezed == transfer
          ? _value.transfer
          : transfer // ignore: cast_nullable_to_non_nullable
              as Transfer?,
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

class _$TransferStateImpl<T> implements _TransferState<T> {
  const _$TransferStateImpl(
      {this.isBusy = false, this.transfer, this.errorMessage, this.stackTrace});

  @override
  @JsonKey()
  final bool isBusy;
  @override
  final Transfer? transfer;
  @override
  final String? errorMessage;
  @override
  final StackTrace? stackTrace;

  @override
  String toString() {
    return 'TransferState<$T>(isBusy: $isBusy, transfer: $transfer, errorMessage: $errorMessage, stackTrace: $stackTrace)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransferStateImpl<T> &&
            (identical(other.isBusy, isBusy) || other.isBusy == isBusy) &&
            (identical(other.transfer, transfer) ||
                other.transfer == transfer) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.stackTrace, stackTrace) ||
                other.stackTrace == stackTrace));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, isBusy, transfer, errorMessage, stackTrace);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TransferStateImplCopyWith<T, _$TransferStateImpl<T>> get copyWith =>
      __$$TransferStateImplCopyWithImpl<T, _$TransferStateImpl<T>>(
          this, _$identity);
}

abstract class _TransferState<T> implements TransferState<T> {
  const factory _TransferState(
      {final bool isBusy,
      final Transfer? transfer,
      final String? errorMessage,
      final StackTrace? stackTrace}) = _$TransferStateImpl<T>;

  @override
  bool get isBusy;
  @override
  Transfer? get transfer;
  @override
  String? get errorMessage;
  @override
  StackTrace? get stackTrace;
  @override
  @JsonKey(ignore: true)
  _$$TransferStateImplCopyWith<T, _$TransferStateImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
