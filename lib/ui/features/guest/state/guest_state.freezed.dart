// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'guest_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$GuestState<T> {
  String? get fullName => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $GuestStateCopyWith<T, GuestState<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GuestStateCopyWith<T, $Res> {
  factory $GuestStateCopyWith(
          GuestState<T> value, $Res Function(GuestState<T>) then) =
      _$GuestStateCopyWithImpl<T, $Res, GuestState<T>>;
  @useResult
  $Res call({String? fullName, String? email});
}

/// @nodoc
class _$GuestStateCopyWithImpl<T, $Res, $Val extends GuestState<T>>
    implements $GuestStateCopyWith<T, $Res> {
  _$GuestStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fullName = freezed,
    Object? email = freezed,
  }) {
    return _then(_value.copyWith(
      fullName: freezed == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GuestStateImplCopyWith<T, $Res>
    implements $GuestStateCopyWith<T, $Res> {
  factory _$$GuestStateImplCopyWith(
          _$GuestStateImpl<T> value, $Res Function(_$GuestStateImpl<T>) then) =
      __$$GuestStateImplCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call({String? fullName, String? email});
}

/// @nodoc
class __$$GuestStateImplCopyWithImpl<T, $Res>
    extends _$GuestStateCopyWithImpl<T, $Res, _$GuestStateImpl<T>>
    implements _$$GuestStateImplCopyWith<T, $Res> {
  __$$GuestStateImplCopyWithImpl(
      _$GuestStateImpl<T> _value, $Res Function(_$GuestStateImpl<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fullName = freezed,
    Object? email = freezed,
  }) {
    return _then(_$GuestStateImpl<T>(
      fullName: freezed == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$GuestStateImpl<T> implements _GuestState<T> {
  const _$GuestStateImpl({this.fullName, this.email});

  @override
  final String? fullName;
  @override
  final String? email;

  @override
  String toString() {
    return 'GuestState<$T>(fullName: $fullName, email: $email)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GuestStateImpl<T> &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.email, email) || other.email == email));
  }

  @override
  int get hashCode => Object.hash(runtimeType, fullName, email);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GuestStateImplCopyWith<T, _$GuestStateImpl<T>> get copyWith =>
      __$$GuestStateImplCopyWithImpl<T, _$GuestStateImpl<T>>(this, _$identity);
}

abstract class _GuestState<T> implements GuestState<T> {
  const factory _GuestState({final String? fullName, final String? email}) =
      _$GuestStateImpl<T>;

  @override
  String? get fullName;
  @override
  String? get email;
  @override
  @JsonKey(ignore: true)
  _$$GuestStateImplCopyWith<T, _$GuestStateImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
