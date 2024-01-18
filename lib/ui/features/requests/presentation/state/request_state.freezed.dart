// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'request_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$RequestState<T> {
  bool get isBusy => throw _privateConstructorUsedError;
  List<RequestModel> get requests => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RequestStateCopyWith<T, RequestState<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RequestStateCopyWith<T, $Res> {
  factory $RequestStateCopyWith(
          RequestState<T> value, $Res Function(RequestState<T>) then) =
      _$RequestStateCopyWithImpl<T, $Res, RequestState<T>>;
  @useResult
  $Res call({bool isBusy, List<RequestModel> requests});
}

/// @nodoc
class _$RequestStateCopyWithImpl<T, $Res, $Val extends RequestState<T>>
    implements $RequestStateCopyWith<T, $Res> {
  _$RequestStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isBusy = null,
    Object? requests = null,
  }) {
    return _then(_value.copyWith(
      isBusy: null == isBusy
          ? _value.isBusy
          : isBusy // ignore: cast_nullable_to_non_nullable
              as bool,
      requests: null == requests
          ? _value.requests
          : requests // ignore: cast_nullable_to_non_nullable
              as List<RequestModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RequestStateImplCopyWith<T, $Res>
    implements $RequestStateCopyWith<T, $Res> {
  factory _$$RequestStateImplCopyWith(_$RequestStateImpl<T> value,
          $Res Function(_$RequestStateImpl<T>) then) =
      __$$RequestStateImplCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call({bool isBusy, List<RequestModel> requests});
}

/// @nodoc
class __$$RequestStateImplCopyWithImpl<T, $Res>
    extends _$RequestStateCopyWithImpl<T, $Res, _$RequestStateImpl<T>>
    implements _$$RequestStateImplCopyWith<T, $Res> {
  __$$RequestStateImplCopyWithImpl(
      _$RequestStateImpl<T> _value, $Res Function(_$RequestStateImpl<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isBusy = null,
    Object? requests = null,
  }) {
    return _then(_$RequestStateImpl<T>(
      isBusy: null == isBusy
          ? _value.isBusy
          : isBusy // ignore: cast_nullable_to_non_nullable
              as bool,
      requests: null == requests
          ? _value._requests
          : requests // ignore: cast_nullable_to_non_nullable
              as List<RequestModel>,
    ));
  }
}

/// @nodoc

class _$RequestStateImpl<T> implements _RequestState<T> {
  const _$RequestStateImpl(
      {this.isBusy = false, final List<RequestModel> requests = const []})
      : _requests = requests;

  @override
  @JsonKey()
  final bool isBusy;
  final List<RequestModel> _requests;
  @override
  @JsonKey()
  List<RequestModel> get requests {
    if (_requests is EqualUnmodifiableListView) return _requests;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_requests);
  }

  @override
  String toString() {
    return 'RequestState<$T>(isBusy: $isBusy, requests: $requests)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RequestStateImpl<T> &&
            (identical(other.isBusy, isBusy) || other.isBusy == isBusy) &&
            const DeepCollectionEquality().equals(other._requests, _requests));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, isBusy, const DeepCollectionEquality().hash(_requests));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RequestStateImplCopyWith<T, _$RequestStateImpl<T>> get copyWith =>
      __$$RequestStateImplCopyWithImpl<T, _$RequestStateImpl<T>>(
          this, _$identity);
}

abstract class _RequestState<T> implements RequestState<T> {
  const factory _RequestState(
      {final bool isBusy,
      final List<RequestModel> requests}) = _$RequestStateImpl<T>;

  @override
  bool get isBusy;
  @override
  List<RequestModel> get requests;
  @override
  @JsonKey(ignore: true)
  _$$RequestStateImplCopyWith<T, _$RequestStateImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
