// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cable_service.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CableService _$CableServiceFromJson(Map<String, dynamic> json) {
  return _CableService.fromJson(json);
}

/// @nodoc
mixin _$CableService {
  @HiveField(0)
  String? get name => throw _privateConstructorUsedError;
  @HiveField(1)
  String? get code => throw _privateConstructorUsedError;
  @HiveField(2)
  String? get category => throw _privateConstructorUsedError;
  @HiveField(3)
  String? get status => throw _privateConstructorUsedError;
  @StringToNumSerializer()
  @HiveField(4)
  num get price => throw _privateConstructorUsedError;
  @HiveField(5)
  String? get shortCode => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CableServiceCopyWith<CableService> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CableServiceCopyWith<$Res> {
  factory $CableServiceCopyWith(
          CableService value, $Res Function(CableService) then) =
      _$CableServiceCopyWithImpl<$Res, CableService>;
  @useResult
  $Res call(
      {@HiveField(0) String? name,
      @HiveField(1) String? code,
      @HiveField(2) String? category,
      @HiveField(3) String? status,
      @StringToNumSerializer() @HiveField(4) num price,
      @HiveField(5) String? shortCode});
}

/// @nodoc
class _$CableServiceCopyWithImpl<$Res, $Val extends CableService>
    implements $CableServiceCopyWith<$Res> {
  _$CableServiceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? code = freezed,
    Object? category = freezed,
    Object? status = freezed,
    Object? price = null,
    Object? shortCode = freezed,
  }) {
    return _then(_value.copyWith(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as num,
      shortCode: freezed == shortCode
          ? _value.shortCode
          : shortCode // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CableServiceImplCopyWith<$Res>
    implements $CableServiceCopyWith<$Res> {
  factory _$$CableServiceImplCopyWith(
          _$CableServiceImpl value, $Res Function(_$CableServiceImpl) then) =
      __$$CableServiceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) String? name,
      @HiveField(1) String? code,
      @HiveField(2) String? category,
      @HiveField(3) String? status,
      @StringToNumSerializer() @HiveField(4) num price,
      @HiveField(5) String? shortCode});
}

/// @nodoc
class __$$CableServiceImplCopyWithImpl<$Res>
    extends _$CableServiceCopyWithImpl<$Res, _$CableServiceImpl>
    implements _$$CableServiceImplCopyWith<$Res> {
  __$$CableServiceImplCopyWithImpl(
      _$CableServiceImpl _value, $Res Function(_$CableServiceImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? code = freezed,
    Object? category = freezed,
    Object? status = freezed,
    Object? price = null,
    Object? shortCode = freezed,
  }) {
    return _then(_$CableServiceImpl(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as num,
      shortCode: freezed == shortCode
          ? _value.shortCode
          : shortCode // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CableServiceImpl implements _CableService {
  _$CableServiceImpl(
      {@HiveField(0) this.name,
      @HiveField(1) this.code,
      @HiveField(2) this.category,
      @HiveField(3) this.status,
      @StringToNumSerializer() @HiveField(4) this.price = 0,
      @HiveField(5) this.shortCode});

  factory _$CableServiceImpl.fromJson(Map<String, dynamic> json) =>
      _$$CableServiceImplFromJson(json);

  @override
  @HiveField(0)
  final String? name;
  @override
  @HiveField(1)
  final String? code;
  @override
  @HiveField(2)
  final String? category;
  @override
  @HiveField(3)
  final String? status;
  @override
  @JsonKey()
  @StringToNumSerializer()
  @HiveField(4)
  final num price;
  @override
  @HiveField(5)
  final String? shortCode;

  @override
  String toString() {
    return 'CableService(name: $name, code: $code, category: $category, status: $status, price: $price, shortCode: $shortCode)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CableServiceImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.shortCode, shortCode) ||
                other.shortCode == shortCode));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, name, code, category, status, price, shortCode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CableServiceImplCopyWith<_$CableServiceImpl> get copyWith =>
      __$$CableServiceImplCopyWithImpl<_$CableServiceImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CableServiceImplToJson(
      this,
    );
  }
}

abstract class _CableService implements CableService {
  factory _CableService(
      {@HiveField(0) final String? name,
      @HiveField(1) final String? code,
      @HiveField(2) final String? category,
      @HiveField(3) final String? status,
      @StringToNumSerializer() @HiveField(4) final num price,
      @HiveField(5) final String? shortCode}) = _$CableServiceImpl;

  factory _CableService.fromJson(Map<String, dynamic> json) =
      _$CableServiceImpl.fromJson;

  @override
  @HiveField(0)
  String? get name;
  @override
  @HiveField(1)
  String? get code;
  @override
  @HiveField(2)
  String? get category;
  @override
  @HiveField(3)
  String? get status;
  @override
  @StringToNumSerializer()
  @HiveField(4)
  num get price;
  @override
  @HiveField(5)
  String? get shortCode;
  @override
  @JsonKey(ignore: true)
  _$$CableServiceImplCopyWith<_$CableServiceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
