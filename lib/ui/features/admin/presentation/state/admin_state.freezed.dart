// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'admin_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AdminState<T> {
  bool get isBusy => throw _privateConstructorUsedError;
  List<Banner> get banner => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;
  StackTrace? get stackTrace => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AdminStateCopyWith<T, AdminState<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AdminStateCopyWith<T, $Res> {
  factory $AdminStateCopyWith(
          AdminState<T> value, $Res Function(AdminState<T>) then) =
      _$AdminStateCopyWithImpl<T, $Res, AdminState<T>>;
  @useResult
  $Res call(
      {bool isBusy,
      List<Banner> banner,
      String? errorMessage,
      StackTrace? stackTrace});
}

/// @nodoc
class _$AdminStateCopyWithImpl<T, $Res, $Val extends AdminState<T>>
    implements $AdminStateCopyWith<T, $Res> {
  _$AdminStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isBusy = null,
    Object? banner = null,
    Object? errorMessage = freezed,
    Object? stackTrace = freezed,
  }) {
    return _then(_value.copyWith(
      isBusy: null == isBusy
          ? _value.isBusy
          : isBusy // ignore: cast_nullable_to_non_nullable
              as bool,
      banner: null == banner
          ? _value.banner
          : banner // ignore: cast_nullable_to_non_nullable
              as List<Banner>,
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
}

/// @nodoc
abstract class _$$AdminStateImplCopyWith<T, $Res>
    implements $AdminStateCopyWith<T, $Res> {
  factory _$$AdminStateImplCopyWith(
          _$AdminStateImpl<T> value, $Res Function(_$AdminStateImpl<T>) then) =
      __$$AdminStateImplCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call(
      {bool isBusy,
      List<Banner> banner,
      String? errorMessage,
      StackTrace? stackTrace});
}

/// @nodoc
class __$$AdminStateImplCopyWithImpl<T, $Res>
    extends _$AdminStateCopyWithImpl<T, $Res, _$AdminStateImpl<T>>
    implements _$$AdminStateImplCopyWith<T, $Res> {
  __$$AdminStateImplCopyWithImpl(
      _$AdminStateImpl<T> _value, $Res Function(_$AdminStateImpl<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isBusy = null,
    Object? banner = null,
    Object? errorMessage = freezed,
    Object? stackTrace = freezed,
  }) {
    return _then(_$AdminStateImpl<T>(
      isBusy: null == isBusy
          ? _value.isBusy
          : isBusy // ignore: cast_nullable_to_non_nullable
              as bool,
      banner: null == banner
          ? _value._banner
          : banner // ignore: cast_nullable_to_non_nullable
              as List<Banner>,
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

class _$AdminStateImpl<T> implements _AdminState<T> {
  const _$AdminStateImpl(
      {this.isBusy = false,
      final List<Banner> banner = const [],
      this.errorMessage,
      this.stackTrace})
      : _banner = banner;

  @override
  @JsonKey()
  final bool isBusy;
  final List<Banner> _banner;
  @override
  @JsonKey()
  List<Banner> get banner {
    if (_banner is EqualUnmodifiableListView) return _banner;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_banner);
  }

  @override
  final String? errorMessage;
  @override
  final StackTrace? stackTrace;

  @override
  String toString() {
    return 'AdminState<$T>(isBusy: $isBusy, banner: $banner, errorMessage: $errorMessage, stackTrace: $stackTrace)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AdminStateImpl<T> &&
            (identical(other.isBusy, isBusy) || other.isBusy == isBusy) &&
            const DeepCollectionEquality().equals(other._banner, _banner) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.stackTrace, stackTrace) ||
                other.stackTrace == stackTrace));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isBusy,
      const DeepCollectionEquality().hash(_banner), errorMessage, stackTrace);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AdminStateImplCopyWith<T, _$AdminStateImpl<T>> get copyWith =>
      __$$AdminStateImplCopyWithImpl<T, _$AdminStateImpl<T>>(this, _$identity);
}

abstract class _AdminState<T> implements AdminState<T> {
  const factory _AdminState(
      {final bool isBusy,
      final List<Banner> banner,
      final String? errorMessage,
      final StackTrace? stackTrace}) = _$AdminStateImpl<T>;

  @override
  bool get isBusy;
  @override
  List<Banner> get banner;
  @override
  String? get errorMessage;
  @override
  StackTrace? get stackTrace;
  @override
  @JsonKey(ignore: true)
  _$$AdminStateImplCopyWith<T, _$AdminStateImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
