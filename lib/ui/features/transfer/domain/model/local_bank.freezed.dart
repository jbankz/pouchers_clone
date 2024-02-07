// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'local_bank.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LocalBank _$LocalBankFromJson(Map<String, dynamic> json) {
  return _LocalBank.fromJson(json);
}

/// @nodoc
mixin _$LocalBank {
  @HiveField(0)
  String? get id => throw _privateConstructorUsedError;
  @HiveField(1)
  String? get type => throw _privateConstructorUsedError;
  @HiveField(2)
  Attributes? get attributes => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LocalBankCopyWith<LocalBank> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocalBankCopyWith<$Res> {
  factory $LocalBankCopyWith(LocalBank value, $Res Function(LocalBank) then) =
      _$LocalBankCopyWithImpl<$Res, LocalBank>;
  @useResult
  $Res call(
      {@HiveField(0) String? id,
      @HiveField(1) String? type,
      @HiveField(2) Attributes? attributes});

  $AttributesCopyWith<$Res>? get attributes;
}

/// @nodoc
class _$LocalBankCopyWithImpl<$Res, $Val extends LocalBank>
    implements $LocalBankCopyWith<$Res> {
  _$LocalBankCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? type = freezed,
    Object? attributes = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      attributes: freezed == attributes
          ? _value.attributes
          : attributes // ignore: cast_nullable_to_non_nullable
              as Attributes?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $AttributesCopyWith<$Res>? get attributes {
    if (_value.attributes == null) {
      return null;
    }

    return $AttributesCopyWith<$Res>(_value.attributes!, (value) {
      return _then(_value.copyWith(attributes: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$LocalBankImplCopyWith<$Res>
    implements $LocalBankCopyWith<$Res> {
  factory _$$LocalBankImplCopyWith(
          _$LocalBankImpl value, $Res Function(_$LocalBankImpl) then) =
      __$$LocalBankImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) String? id,
      @HiveField(1) String? type,
      @HiveField(2) Attributes? attributes});

  @override
  $AttributesCopyWith<$Res>? get attributes;
}

/// @nodoc
class __$$LocalBankImplCopyWithImpl<$Res>
    extends _$LocalBankCopyWithImpl<$Res, _$LocalBankImpl>
    implements _$$LocalBankImplCopyWith<$Res> {
  __$$LocalBankImplCopyWithImpl(
      _$LocalBankImpl _value, $Res Function(_$LocalBankImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? type = freezed,
    Object? attributes = freezed,
  }) {
    return _then(_$LocalBankImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      attributes: freezed == attributes
          ? _value.attributes
          : attributes // ignore: cast_nullable_to_non_nullable
              as Attributes?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LocalBankImpl implements _LocalBank {
  _$LocalBankImpl(
      {@HiveField(0) this.id,
      @HiveField(1) this.type,
      @HiveField(2) this.attributes});

  factory _$LocalBankImpl.fromJson(Map<String, dynamic> json) =>
      _$$LocalBankImplFromJson(json);

  @override
  @HiveField(0)
  final String? id;
  @override
  @HiveField(1)
  final String? type;
  @override
  @HiveField(2)
  final Attributes? attributes;

  @override
  String toString() {
    return 'LocalBank(id: $id, type: $type, attributes: $attributes)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LocalBankImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.attributes, attributes) ||
                other.attributes == attributes));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, type, attributes);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LocalBankImplCopyWith<_$LocalBankImpl> get copyWith =>
      __$$LocalBankImplCopyWithImpl<_$LocalBankImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LocalBankImplToJson(
      this,
    );
  }
}

abstract class _LocalBank implements LocalBank {
  factory _LocalBank(
      {@HiveField(0) final String? id,
      @HiveField(1) final String? type,
      @HiveField(2) final Attributes? attributes}) = _$LocalBankImpl;

  factory _LocalBank.fromJson(Map<String, dynamic> json) =
      _$LocalBankImpl.fromJson;

  @override
  @HiveField(0)
  String? get id;
  @override
  @HiveField(1)
  String? get type;
  @override
  @HiveField(2)
  Attributes? get attributes;
  @override
  @JsonKey(ignore: true)
  _$$LocalBankImplCopyWith<_$LocalBankImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
