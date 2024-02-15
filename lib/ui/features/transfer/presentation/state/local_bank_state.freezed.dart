// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'local_bank_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$LocalBankState<T> {
  bool get isBusy => throw _privateConstructorUsedError;
  T? get data => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;
  StackTrace? get stackTrace => throw _privateConstructorUsedError;
  List<GuestLocalBank> get guestLocalBanks =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LocalBankStateCopyWith<T, LocalBankState<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocalBankStateCopyWith<T, $Res> {
  factory $LocalBankStateCopyWith(
          LocalBankState<T> value, $Res Function(LocalBankState<T>) then) =
      _$LocalBankStateCopyWithImpl<T, $Res, LocalBankState<T>>;
  @useResult
  $Res call(
      {bool isBusy,
      T? data,
      String? errorMessage,
      StackTrace? stackTrace,
      List<GuestLocalBank> guestLocalBanks});
}

/// @nodoc
class _$LocalBankStateCopyWithImpl<T, $Res, $Val extends LocalBankState<T>>
    implements $LocalBankStateCopyWith<T, $Res> {
  _$LocalBankStateCopyWithImpl(this._value, this._then);

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
    Object? guestLocalBanks = null,
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
      guestLocalBanks: null == guestLocalBanks
          ? _value.guestLocalBanks
          : guestLocalBanks // ignore: cast_nullable_to_non_nullable
              as List<GuestLocalBank>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LocalBankStateImplCopyWith<T, $Res>
    implements $LocalBankStateCopyWith<T, $Res> {
  factory _$$LocalBankStateImplCopyWith(_$LocalBankStateImpl<T> value,
          $Res Function(_$LocalBankStateImpl<T>) then) =
      __$$LocalBankStateImplCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call(
      {bool isBusy,
      T? data,
      String? errorMessage,
      StackTrace? stackTrace,
      List<GuestLocalBank> guestLocalBanks});
}

/// @nodoc
class __$$LocalBankStateImplCopyWithImpl<T, $Res>
    extends _$LocalBankStateCopyWithImpl<T, $Res, _$LocalBankStateImpl<T>>
    implements _$$LocalBankStateImplCopyWith<T, $Res> {
  __$$LocalBankStateImplCopyWithImpl(_$LocalBankStateImpl<T> _value,
      $Res Function(_$LocalBankStateImpl<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isBusy = null,
    Object? data = freezed,
    Object? errorMessage = freezed,
    Object? stackTrace = freezed,
    Object? guestLocalBanks = null,
  }) {
    return _then(_$LocalBankStateImpl<T>(
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
      guestLocalBanks: null == guestLocalBanks
          ? _value._guestLocalBanks
          : guestLocalBanks // ignore: cast_nullable_to_non_nullable
              as List<GuestLocalBank>,
    ));
  }
}

/// @nodoc

class _$LocalBankStateImpl<T> implements _LocalBankState<T> {
  const _$LocalBankStateImpl(
      {this.isBusy = false,
      this.data,
      this.errorMessage,
      this.stackTrace,
      final List<GuestLocalBank> guestLocalBanks = const []})
      : _guestLocalBanks = guestLocalBanks;

  @override
  @JsonKey()
  final bool isBusy;
  @override
  final T? data;
  @override
  final String? errorMessage;
  @override
  final StackTrace? stackTrace;
  final List<GuestLocalBank> _guestLocalBanks;
  @override
  @JsonKey()
  List<GuestLocalBank> get guestLocalBanks {
    if (_guestLocalBanks is EqualUnmodifiableListView) return _guestLocalBanks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_guestLocalBanks);
  }

  @override
  String toString() {
    return 'LocalBankState<$T>(isBusy: $isBusy, data: $data, errorMessage: $errorMessage, stackTrace: $stackTrace, guestLocalBanks: $guestLocalBanks)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LocalBankStateImpl<T> &&
            (identical(other.isBusy, isBusy) || other.isBusy == isBusy) &&
            const DeepCollectionEquality().equals(other.data, data) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.stackTrace, stackTrace) ||
                other.stackTrace == stackTrace) &&
            const DeepCollectionEquality()
                .equals(other._guestLocalBanks, _guestLocalBanks));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isBusy,
      const DeepCollectionEquality().hash(data),
      errorMessage,
      stackTrace,
      const DeepCollectionEquality().hash(_guestLocalBanks));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LocalBankStateImplCopyWith<T, _$LocalBankStateImpl<T>> get copyWith =>
      __$$LocalBankStateImplCopyWithImpl<T, _$LocalBankStateImpl<T>>(
          this, _$identity);
}

abstract class _LocalBankState<T> implements LocalBankState<T> {
  const factory _LocalBankState(
      {final bool isBusy,
      final T? data,
      final String? errorMessage,
      final StackTrace? stackTrace,
      final List<GuestLocalBank> guestLocalBanks}) = _$LocalBankStateImpl<T>;

  @override
  bool get isBusy;
  @override
  T? get data;
  @override
  String? get errorMessage;
  @override
  StackTrace? get stackTrace;
  @override
  List<GuestLocalBank> get guestLocalBanks;
  @override
  @JsonKey(ignore: true)
  _$$LocalBankStateImplCopyWith<T, _$LocalBankStateImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
