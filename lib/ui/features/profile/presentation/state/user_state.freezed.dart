// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$UserState<T> {
  bool get isBusy => throw _privateConstructorUsedError;
  T? get data => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;
  StackTrace? get stackTrace => throw _privateConstructorUsedError;
  Referral? get referral => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UserStateCopyWith<T, UserState<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserStateCopyWith<T, $Res> {
  factory $UserStateCopyWith(
          UserState<T> value, $Res Function(UserState<T>) then) =
      _$UserStateCopyWithImpl<T, $Res, UserState<T>>;
  @useResult
  $Res call(
      {bool isBusy,
      T? data,
      String? errorMessage,
      StackTrace? stackTrace,
      Referral? referral});

  $ReferralCopyWith<$Res>? get referral;
}

/// @nodoc
class _$UserStateCopyWithImpl<T, $Res, $Val extends UserState<T>>
    implements $UserStateCopyWith<T, $Res> {
  _$UserStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isBusy = null,
    Object? data = freezed,
    Object? errorMessage = freezed,
    Object? stackTrace = freezed,
    Object? referral = freezed,
  }) {
    return _then(_value.copyWith(
      isBusy: null == isBusy
          ? _value.isBusy
          : isBusy // ignore: cast_nullable_to_non_nullable
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
      referral: freezed == referral
          ? _value.referral
          : referral // ignore: cast_nullable_to_non_nullable
              as Referral?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ReferralCopyWith<$Res>? get referral {
    if (_value.referral == null) {
      return null;
    }

    return $ReferralCopyWith<$Res>(_value.referral!, (value) {
      return _then(_value.copyWith(referral: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UserStateImplCopyWith<T, $Res>
    implements $UserStateCopyWith<T, $Res> {
  factory _$$UserStateImplCopyWith(
          _$UserStateImpl<T> value, $Res Function(_$UserStateImpl<T>) then) =
      __$$UserStateImplCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call(
      {bool isBusy,
      T? data,
      String? errorMessage,
      StackTrace? stackTrace,
      Referral? referral});

  @override
  $ReferralCopyWith<$Res>? get referral;
}

/// @nodoc
class __$$UserStateImplCopyWithImpl<T, $Res>
    extends _$UserStateCopyWithImpl<T, $Res, _$UserStateImpl<T>>
    implements _$$UserStateImplCopyWith<T, $Res> {
  __$$UserStateImplCopyWithImpl(
      _$UserStateImpl<T> _value, $Res Function(_$UserStateImpl<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isBusy = null,
    Object? data = freezed,
    Object? errorMessage = freezed,
    Object? stackTrace = freezed,
    Object? referral = freezed,
  }) {
    return _then(_$UserStateImpl<T>(
      isBusy: null == isBusy
          ? _value.isBusy
          : isBusy // ignore: cast_nullable_to_non_nullable
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
      referral: freezed == referral
          ? _value.referral
          : referral // ignore: cast_nullable_to_non_nullable
              as Referral?,
    ));
  }
}

/// @nodoc

class _$UserStateImpl<T> implements _UserState<T> {
  const _$UserStateImpl(
      {this.isBusy = false,
      this.data,
      this.errorMessage,
      this.stackTrace,
      this.referral});

  @override
  @JsonKey()
  final bool isBusy;
  @override
  final T? data;
  @override
  final String? errorMessage;
  @override
  final StackTrace? stackTrace;
  @override
  final Referral? referral;

  @override
  String toString() {
    return 'UserState<$T>(isBusy: $isBusy, data: $data, errorMessage: $errorMessage, stackTrace: $stackTrace, referral: $referral)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserStateImpl<T> &&
            (identical(other.isBusy, isBusy) || other.isBusy == isBusy) &&
            const DeepCollectionEquality().equals(other.data, data) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.stackTrace, stackTrace) ||
                other.stackTrace == stackTrace) &&
            (identical(other.referral, referral) ||
                other.referral == referral));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isBusy,
      const DeepCollectionEquality().hash(data),
      errorMessage,
      stackTrace,
      referral);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserStateImplCopyWith<T, _$UserStateImpl<T>> get copyWith =>
      __$$UserStateImplCopyWithImpl<T, _$UserStateImpl<T>>(this, _$identity);
}

abstract class _UserState<T> implements UserState<T> {
  const factory _UserState(
      {final bool isBusy,
      final T? data,
      final String? errorMessage,
      final StackTrace? stackTrace,
      final Referral? referral}) = _$UserStateImpl<T>;

  @override
  bool get isBusy;
  @override
  T? get data;
  @override
  String? get errorMessage;
  @override
  StackTrace? get stackTrace;
  @override
  Referral? get referral;
  @override
  @JsonKey(ignore: true)
  _$$UserStateImplCopyWith<T, _$UserStateImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
