// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'merchant_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MerchantState<T> {
  bool get isBusy => throw _privateConstructorUsedError;
  GetMerchant? get getMerchant => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;
  StackTrace? get stackTrace => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MerchantStateCopyWith<T, MerchantState<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MerchantStateCopyWith<T, $Res> {
  factory $MerchantStateCopyWith(
          MerchantState<T> value, $Res Function(MerchantState<T>) then) =
      _$MerchantStateCopyWithImpl<T, $Res, MerchantState<T>>;
  @useResult
  $Res call(
      {bool isBusy,
      GetMerchant? getMerchant,
      String? errorMessage,
      StackTrace? stackTrace});

  $GetMerchantCopyWith<$Res>? get getMerchant;
}

/// @nodoc
class _$MerchantStateCopyWithImpl<T, $Res, $Val extends MerchantState<T>>
    implements $MerchantStateCopyWith<T, $Res> {
  _$MerchantStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isBusy = null,
    Object? getMerchant = freezed,
    Object? errorMessage = freezed,
    Object? stackTrace = freezed,
  }) {
    return _then(_value.copyWith(
      isBusy: null == isBusy
          ? _value.isBusy
          : isBusy // ignore: cast_nullable_to_non_nullable
              as bool,
      getMerchant: freezed == getMerchant
          ? _value.getMerchant
          : getMerchant // ignore: cast_nullable_to_non_nullable
              as GetMerchant?,
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
  $GetMerchantCopyWith<$Res>? get getMerchant {
    if (_value.getMerchant == null) {
      return null;
    }

    return $GetMerchantCopyWith<$Res>(_value.getMerchant!, (value) {
      return _then(_value.copyWith(getMerchant: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MerchantStateImplCopyWith<T, $Res>
    implements $MerchantStateCopyWith<T, $Res> {
  factory _$$MerchantStateImplCopyWith(_$MerchantStateImpl<T> value,
          $Res Function(_$MerchantStateImpl<T>) then) =
      __$$MerchantStateImplCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call(
      {bool isBusy,
      GetMerchant? getMerchant,
      String? errorMessage,
      StackTrace? stackTrace});

  @override
  $GetMerchantCopyWith<$Res>? get getMerchant;
}

/// @nodoc
class __$$MerchantStateImplCopyWithImpl<T, $Res>
    extends _$MerchantStateCopyWithImpl<T, $Res, _$MerchantStateImpl<T>>
    implements _$$MerchantStateImplCopyWith<T, $Res> {
  __$$MerchantStateImplCopyWithImpl(_$MerchantStateImpl<T> _value,
      $Res Function(_$MerchantStateImpl<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isBusy = null,
    Object? getMerchant = freezed,
    Object? errorMessage = freezed,
    Object? stackTrace = freezed,
  }) {
    return _then(_$MerchantStateImpl<T>(
      isBusy: null == isBusy
          ? _value.isBusy
          : isBusy // ignore: cast_nullable_to_non_nullable
              as bool,
      getMerchant: freezed == getMerchant
          ? _value.getMerchant
          : getMerchant // ignore: cast_nullable_to_non_nullable
              as GetMerchant?,
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

class _$MerchantStateImpl<T> implements _MerchantState<T> {
  const _$MerchantStateImpl(
      {this.isBusy = false,
      this.getMerchant,
      this.errorMessage,
      this.stackTrace});

  @override
  @JsonKey()
  final bool isBusy;
  @override
  final GetMerchant? getMerchant;
  @override
  final String? errorMessage;
  @override
  final StackTrace? stackTrace;

  @override
  String toString() {
    return 'MerchantState<$T>(isBusy: $isBusy, getMerchant: $getMerchant, errorMessage: $errorMessage, stackTrace: $stackTrace)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MerchantStateImpl<T> &&
            (identical(other.isBusy, isBusy) || other.isBusy == isBusy) &&
            (identical(other.getMerchant, getMerchant) ||
                other.getMerchant == getMerchant) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.stackTrace, stackTrace) ||
                other.stackTrace == stackTrace));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, isBusy, getMerchant, errorMessage, stackTrace);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MerchantStateImplCopyWith<T, _$MerchantStateImpl<T>> get copyWith =>
      __$$MerchantStateImplCopyWithImpl<T, _$MerchantStateImpl<T>>(
          this, _$identity);
}

abstract class _MerchantState<T> implements MerchantState<T> {
  const factory _MerchantState(
      {final bool isBusy,
      final GetMerchant? getMerchant,
      final String? errorMessage,
      final StackTrace? stackTrace}) = _$MerchantStateImpl<T>;

  @override
  bool get isBusy;
  @override
  GetMerchant? get getMerchant;
  @override
  String? get errorMessage;
  @override
  StackTrace? get stackTrace;
  @override
  @JsonKey(ignore: true)
  _$$MerchantStateImplCopyWith<T, _$MerchantStateImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
