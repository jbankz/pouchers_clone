// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Data _$DataFromJson(Map<String, dynamic> json) {
  return _Data.fromJson(json);
}

/// @nodoc
mixin _$Data {
  Tier? get tier1 => throw _privateConstructorUsedError;
  Tier? get tier2 => throw _privateConstructorUsedError;
  Tier? get tier3 => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DataCopyWith<Data> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DataCopyWith<$Res> {
  factory $DataCopyWith(Data value, $Res Function(Data) then) =
      _$DataCopyWithImpl<$Res, Data>;
  @useResult
  $Res call({Tier? tier1, Tier? tier2, Tier? tier3});

  $TierCopyWith<$Res>? get tier1;
  $TierCopyWith<$Res>? get tier2;
  $TierCopyWith<$Res>? get tier3;
}

/// @nodoc
class _$DataCopyWithImpl<$Res, $Val extends Data>
    implements $DataCopyWith<$Res> {
  _$DataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tier1 = freezed,
    Object? tier2 = freezed,
    Object? tier3 = freezed,
  }) {
    return _then(_value.copyWith(
      tier1: freezed == tier1
          ? _value.tier1
          : tier1 // ignore: cast_nullable_to_non_nullable
              as Tier?,
      tier2: freezed == tier2
          ? _value.tier2
          : tier2 // ignore: cast_nullable_to_non_nullable
              as Tier?,
      tier3: freezed == tier3
          ? _value.tier3
          : tier3 // ignore: cast_nullable_to_non_nullable
              as Tier?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $TierCopyWith<$Res>? get tier1 {
    if (_value.tier1 == null) {
      return null;
    }

    return $TierCopyWith<$Res>(_value.tier1!, (value) {
      return _then(_value.copyWith(tier1: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $TierCopyWith<$Res>? get tier2 {
    if (_value.tier2 == null) {
      return null;
    }

    return $TierCopyWith<$Res>(_value.tier2!, (value) {
      return _then(_value.copyWith(tier2: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $TierCopyWith<$Res>? get tier3 {
    if (_value.tier3 == null) {
      return null;
    }

    return $TierCopyWith<$Res>(_value.tier3!, (value) {
      return _then(_value.copyWith(tier3: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DataImplCopyWith<$Res> implements $DataCopyWith<$Res> {
  factory _$$DataImplCopyWith(
          _$DataImpl value, $Res Function(_$DataImpl) then) =
      __$$DataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Tier? tier1, Tier? tier2, Tier? tier3});

  @override
  $TierCopyWith<$Res>? get tier1;
  @override
  $TierCopyWith<$Res>? get tier2;
  @override
  $TierCopyWith<$Res>? get tier3;
}

/// @nodoc
class __$$DataImplCopyWithImpl<$Res>
    extends _$DataCopyWithImpl<$Res, _$DataImpl>
    implements _$$DataImplCopyWith<$Res> {
  __$$DataImplCopyWithImpl(_$DataImpl _value, $Res Function(_$DataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tier1 = freezed,
    Object? tier2 = freezed,
    Object? tier3 = freezed,
  }) {
    return _then(_$DataImpl(
      tier1: freezed == tier1
          ? _value.tier1
          : tier1 // ignore: cast_nullable_to_non_nullable
              as Tier?,
      tier2: freezed == tier2
          ? _value.tier2
          : tier2 // ignore: cast_nullable_to_non_nullable
              as Tier?,
      tier3: freezed == tier3
          ? _value.tier3
          : tier3 // ignore: cast_nullable_to_non_nullable
              as Tier?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DataImpl implements _Data {
  _$DataImpl({this.tier1, this.tier2, this.tier3});

  factory _$DataImpl.fromJson(Map<String, dynamic> json) =>
      _$$DataImplFromJson(json);

  @override
  final Tier? tier1;
  @override
  final Tier? tier2;
  @override
  final Tier? tier3;

  @override
  String toString() {
    return 'Data(tier1: $tier1, tier2: $tier2, tier3: $tier3)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DataImpl &&
            (identical(other.tier1, tier1) || other.tier1 == tier1) &&
            (identical(other.tier2, tier2) || other.tier2 == tier2) &&
            (identical(other.tier3, tier3) || other.tier3 == tier3));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, tier1, tier2, tier3);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DataImplCopyWith<_$DataImpl> get copyWith =>
      __$$DataImplCopyWithImpl<_$DataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DataImplToJson(
      this,
    );
  }
}

abstract class _Data implements Data {
  factory _Data({final Tier? tier1, final Tier? tier2, final Tier? tier3}) =
      _$DataImpl;

  factory _Data.fromJson(Map<String, dynamic> json) = _$DataImpl.fromJson;

  @override
  Tier? get tier1;
  @override
  Tier? get tier2;
  @override
  Tier? get tier3;
  @override
  @JsonKey(ignore: true)
  _$$DataImplCopyWith<_$DataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
