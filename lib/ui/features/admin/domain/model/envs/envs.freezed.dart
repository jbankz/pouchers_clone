// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'envs.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Envs _$EnvsFromJson(Map<String, dynamic> json) {
  return _Envs.fromJson(json);
}

/// @nodoc
mixin _$Envs {
  String? get name => throw _privateConstructorUsedError;
  String? get value => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EnvsCopyWith<Envs> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EnvsCopyWith<$Res> {
  factory $EnvsCopyWith(Envs value, $Res Function(Envs) then) =
      _$EnvsCopyWithImpl<$Res, Envs>;
  @useResult
  $Res call(
      {String? name,
      String? value,
      @JsonKey(name: 'updated_at') DateTime? updatedAt});
}

/// @nodoc
class _$EnvsCopyWithImpl<$Res, $Val extends Envs>
    implements $EnvsCopyWith<$Res> {
  _$EnvsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? value = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EnvsImplCopyWith<$Res> implements $EnvsCopyWith<$Res> {
  factory _$$EnvsImplCopyWith(
          _$EnvsImpl value, $Res Function(_$EnvsImpl) then) =
      __$$EnvsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? name,
      String? value,
      @JsonKey(name: 'updated_at') DateTime? updatedAt});
}

/// @nodoc
class __$$EnvsImplCopyWithImpl<$Res>
    extends _$EnvsCopyWithImpl<$Res, _$EnvsImpl>
    implements _$$EnvsImplCopyWith<$Res> {
  __$$EnvsImplCopyWithImpl(_$EnvsImpl _value, $Res Function(_$EnvsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? value = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$EnvsImpl(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EnvsImpl implements _Envs {
  _$EnvsImpl(
      {this.name, this.value, @JsonKey(name: 'updated_at') this.updatedAt});

  factory _$EnvsImpl.fromJson(Map<String, dynamic> json) =>
      _$$EnvsImplFromJson(json);

  @override
  final String? name;
  @override
  final String? value;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'Envs(name: $name, value: $value, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EnvsImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, value, updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EnvsImplCopyWith<_$EnvsImpl> get copyWith =>
      __$$EnvsImplCopyWithImpl<_$EnvsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EnvsImplToJson(
      this,
    );
  }
}

abstract class _Envs implements Envs {
  factory _Envs(
      {final String? name,
      final String? value,
      @JsonKey(name: 'updated_at') final DateTime? updatedAt}) = _$EnvsImpl;

  factory _Envs.fromJson(Map<String, dynamic> json) = _$EnvsImpl.fromJson;

  @override
  String? get name;
  @override
  String? get value;
  @override
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$EnvsImplCopyWith<_$EnvsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
