// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'individual.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Individual _$IndividualFromJson(Map<String, dynamic> json) {
  return _Individual.fromJson(json);
}

/// @nodoc
mixin _$Individual {
  String? get firstName => throw _privateConstructorUsedError;
  String? get lastName => throw _privateConstructorUsedError;
  dynamic get dob => throw _privateConstructorUsedError;
  @JsonKey(name: '_id')
  String? get id => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $IndividualCopyWith<Individual> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IndividualCopyWith<$Res> {
  factory $IndividualCopyWith(
          Individual value, $Res Function(Individual) then) =
      _$IndividualCopyWithImpl<$Res, Individual>;
  @useResult
  $Res call(
      {String? firstName,
      String? lastName,
      dynamic dob,
      @JsonKey(name: '_id') String? id});
}

/// @nodoc
class _$IndividualCopyWithImpl<$Res, $Val extends Individual>
    implements $IndividualCopyWith<$Res> {
  _$IndividualCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? dob = freezed,
    Object? id = freezed,
  }) {
    return _then(_value.copyWith(
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      dob: freezed == dob
          ? _value.dob
          : dob // ignore: cast_nullable_to_non_nullable
              as dynamic,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$IndividualImplCopyWith<$Res>
    implements $IndividualCopyWith<$Res> {
  factory _$$IndividualImplCopyWith(
          _$IndividualImpl value, $Res Function(_$IndividualImpl) then) =
      __$$IndividualImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? firstName,
      String? lastName,
      dynamic dob,
      @JsonKey(name: '_id') String? id});
}

/// @nodoc
class __$$IndividualImplCopyWithImpl<$Res>
    extends _$IndividualCopyWithImpl<$Res, _$IndividualImpl>
    implements _$$IndividualImplCopyWith<$Res> {
  __$$IndividualImplCopyWithImpl(
      _$IndividualImpl _value, $Res Function(_$IndividualImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? dob = freezed,
    Object? id = freezed,
  }) {
    return _then(_$IndividualImpl(
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      dob: freezed == dob
          ? _value.dob
          : dob // ignore: cast_nullable_to_non_nullable
              as dynamic,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$IndividualImpl implements _Individual {
  _$IndividualImpl(
      {this.firstName, this.lastName, this.dob, @JsonKey(name: '_id') this.id});

  factory _$IndividualImpl.fromJson(Map<String, dynamic> json) =>
      _$$IndividualImplFromJson(json);

  @override
  final String? firstName;
  @override
  final String? lastName;
  @override
  final dynamic dob;
  @override
  @JsonKey(name: '_id')
  final String? id;

  @override
  String toString() {
    return 'Individual(firstName: $firstName, lastName: $lastName, dob: $dob, id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IndividualImpl &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            const DeepCollectionEquality().equals(other.dob, dob) &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, firstName, lastName,
      const DeepCollectionEquality().hash(dob), id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$IndividualImplCopyWith<_$IndividualImpl> get copyWith =>
      __$$IndividualImplCopyWithImpl<_$IndividualImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$IndividualImplToJson(
      this,
    );
  }
}

abstract class _Individual implements Individual {
  factory _Individual(
      {final String? firstName,
      final String? lastName,
      final dynamic dob,
      @JsonKey(name: '_id') final String? id}) = _$IndividualImpl;

  factory _Individual.fromJson(Map<String, dynamic> json) =
      _$IndividualImpl.fromJson;

  @override
  String? get firstName;
  @override
  String? get lastName;
  @override
  dynamic get dob;
  @override
  @JsonKey(name: '_id')
  String? get id;
  @override
  @JsonKey(ignore: true)
  _$$IndividualImplCopyWith<_$IndividualImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
