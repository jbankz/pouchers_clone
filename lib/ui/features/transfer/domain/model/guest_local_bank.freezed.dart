// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'guest_local_bank.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GuestLocalBank _$GuestLocalBankFromJson(Map<String, dynamic> json) {
  return _GuestLocalBank.fromJson(json);
}

/// @nodoc
mixin _$GuestLocalBank {
  String? get name => throw _privateConstructorUsedError;
  String? get uuid => throw _privateConstructorUsedError;
  @StringToNumSerializer()
  num get interInstitutionCode => throw _privateConstructorUsedError;
  @StringToNumSerializer()
  num get sortCode => throw _privateConstructorUsedError;
  @StringToNumSerializer()
  num get ussdCode => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GuestLocalBankCopyWith<GuestLocalBank> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GuestLocalBankCopyWith<$Res> {
  factory $GuestLocalBankCopyWith(
          GuestLocalBank value, $Res Function(GuestLocalBank) then) =
      _$GuestLocalBankCopyWithImpl<$Res, GuestLocalBank>;
  @useResult
  $Res call(
      {String? name,
      String? uuid,
      @StringToNumSerializer() num interInstitutionCode,
      @StringToNumSerializer() num sortCode,
      @StringToNumSerializer() num ussdCode});
}

/// @nodoc
class _$GuestLocalBankCopyWithImpl<$Res, $Val extends GuestLocalBank>
    implements $GuestLocalBankCopyWith<$Res> {
  _$GuestLocalBankCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? uuid = freezed,
    Object? interInstitutionCode = null,
    Object? sortCode = null,
    Object? ussdCode = null,
  }) {
    return _then(_value.copyWith(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      uuid: freezed == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String?,
      interInstitutionCode: null == interInstitutionCode
          ? _value.interInstitutionCode
          : interInstitutionCode // ignore: cast_nullable_to_non_nullable
              as num,
      sortCode: null == sortCode
          ? _value.sortCode
          : sortCode // ignore: cast_nullable_to_non_nullable
              as num,
      ussdCode: null == ussdCode
          ? _value.ussdCode
          : ussdCode // ignore: cast_nullable_to_non_nullable
              as num,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GuestLocalBankImplCopyWith<$Res>
    implements $GuestLocalBankCopyWith<$Res> {
  factory _$$GuestLocalBankImplCopyWith(_$GuestLocalBankImpl value,
          $Res Function(_$GuestLocalBankImpl) then) =
      __$$GuestLocalBankImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? name,
      String? uuid,
      @StringToNumSerializer() num interInstitutionCode,
      @StringToNumSerializer() num sortCode,
      @StringToNumSerializer() num ussdCode});
}

/// @nodoc
class __$$GuestLocalBankImplCopyWithImpl<$Res>
    extends _$GuestLocalBankCopyWithImpl<$Res, _$GuestLocalBankImpl>
    implements _$$GuestLocalBankImplCopyWith<$Res> {
  __$$GuestLocalBankImplCopyWithImpl(
      _$GuestLocalBankImpl _value, $Res Function(_$GuestLocalBankImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? uuid = freezed,
    Object? interInstitutionCode = null,
    Object? sortCode = null,
    Object? ussdCode = null,
  }) {
    return _then(_$GuestLocalBankImpl(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      uuid: freezed == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String?,
      interInstitutionCode: null == interInstitutionCode
          ? _value.interInstitutionCode
          : interInstitutionCode // ignore: cast_nullable_to_non_nullable
              as num,
      sortCode: null == sortCode
          ? _value.sortCode
          : sortCode // ignore: cast_nullable_to_non_nullable
              as num,
      ussdCode: null == ussdCode
          ? _value.ussdCode
          : ussdCode // ignore: cast_nullable_to_non_nullable
              as num,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GuestLocalBankImpl implements _GuestLocalBank {
  _$GuestLocalBankImpl(
      {this.name,
      this.uuid,
      @StringToNumSerializer() this.interInstitutionCode = 0,
      @StringToNumSerializer() this.sortCode = 0,
      @StringToNumSerializer() this.ussdCode = 0});

  factory _$GuestLocalBankImpl.fromJson(Map<String, dynamic> json) =>
      _$$GuestLocalBankImplFromJson(json);

  @override
  final String? name;
  @override
  final String? uuid;
  @override
  @JsonKey()
  @StringToNumSerializer()
  final num interInstitutionCode;
  @override
  @JsonKey()
  @StringToNumSerializer()
  final num sortCode;
  @override
  @JsonKey()
  @StringToNumSerializer()
  final num ussdCode;

  @override
  String toString() {
    return 'GuestLocalBank(name: $name, uuid: $uuid, interInstitutionCode: $interInstitutionCode, sortCode: $sortCode, ussdCode: $ussdCode)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GuestLocalBankImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            (identical(other.interInstitutionCode, interInstitutionCode) ||
                other.interInstitutionCode == interInstitutionCode) &&
            (identical(other.sortCode, sortCode) ||
                other.sortCode == sortCode) &&
            (identical(other.ussdCode, ussdCode) ||
                other.ussdCode == ussdCode));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, name, uuid, interInstitutionCode, sortCode, ussdCode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GuestLocalBankImplCopyWith<_$GuestLocalBankImpl> get copyWith =>
      __$$GuestLocalBankImplCopyWithImpl<_$GuestLocalBankImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GuestLocalBankImplToJson(
      this,
    );
  }
}

abstract class _GuestLocalBank implements GuestLocalBank {
  factory _GuestLocalBank(
      {final String? name,
      final String? uuid,
      @StringToNumSerializer() final num interInstitutionCode,
      @StringToNumSerializer() final num sortCode,
      @StringToNumSerializer() final num ussdCode}) = _$GuestLocalBankImpl;

  factory _GuestLocalBank.fromJson(Map<String, dynamic> json) =
      _$GuestLocalBankImpl.fromJson;

  @override
  String? get name;
  @override
  String? get uuid;
  @override
  @StringToNumSerializer()
  num get interInstitutionCode;
  @override
  @StringToNumSerializer()
  num get sortCode;
  @override
  @StringToNumSerializer()
  num get ussdCode;
  @override
  @JsonKey(ignore: true)
  _$$GuestLocalBankImplCopyWith<_$GuestLocalBankImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
