// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'funding_source.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FundingSource _$FundingSourceFromJson(Map<String, dynamic> json) {
  return _FundingSource.fromJson(json);
}

/// @nodoc
mixin _$FundingSource {
  @JsonKey(name: '_id')
  String? get id => throw _privateConstructorUsedError;
  String? get business => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  dynamic get jitGateway => throw _privateConstructorUsedError;
  bool? get isDefault => throw _privateConstructorUsedError;
  bool? get isDeleted => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: '__v')
  int? get v => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FundingSourceCopyWith<FundingSource> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FundingSourceCopyWith<$Res> {
  factory $FundingSourceCopyWith(
          FundingSource value, $Res Function(FundingSource) then) =
      _$FundingSourceCopyWithImpl<$Res, FundingSource>;
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String? id,
      String? business,
      String? type,
      String? status,
      dynamic jitGateway,
      bool? isDefault,
      bool? isDeleted,
      DateTime? createdAt,
      DateTime? updatedAt,
      @JsonKey(name: '__v') int? v});
}

/// @nodoc
class _$FundingSourceCopyWithImpl<$Res, $Val extends FundingSource>
    implements $FundingSourceCopyWith<$Res> {
  _$FundingSourceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? business = freezed,
    Object? type = freezed,
    Object? status = freezed,
    Object? jitGateway = freezed,
    Object? isDefault = freezed,
    Object? isDeleted = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? v = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      business: freezed == business
          ? _value.business
          : business // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      jitGateway: freezed == jitGateway
          ? _value.jitGateway
          : jitGateway // ignore: cast_nullable_to_non_nullable
              as dynamic,
      isDefault: freezed == isDefault
          ? _value.isDefault
          : isDefault // ignore: cast_nullable_to_non_nullable
              as bool?,
      isDeleted: freezed == isDeleted
          ? _value.isDeleted
          : isDeleted // ignore: cast_nullable_to_non_nullable
              as bool?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      v: freezed == v
          ? _value.v
          : v // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FundingSourceImplCopyWith<$Res>
    implements $FundingSourceCopyWith<$Res> {
  factory _$$FundingSourceImplCopyWith(
          _$FundingSourceImpl value, $Res Function(_$FundingSourceImpl) then) =
      __$$FundingSourceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String? id,
      String? business,
      String? type,
      String? status,
      dynamic jitGateway,
      bool? isDefault,
      bool? isDeleted,
      DateTime? createdAt,
      DateTime? updatedAt,
      @JsonKey(name: '__v') int? v});
}

/// @nodoc
class __$$FundingSourceImplCopyWithImpl<$Res>
    extends _$FundingSourceCopyWithImpl<$Res, _$FundingSourceImpl>
    implements _$$FundingSourceImplCopyWith<$Res> {
  __$$FundingSourceImplCopyWithImpl(
      _$FundingSourceImpl _value, $Res Function(_$FundingSourceImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? business = freezed,
    Object? type = freezed,
    Object? status = freezed,
    Object? jitGateway = freezed,
    Object? isDefault = freezed,
    Object? isDeleted = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? v = freezed,
  }) {
    return _then(_$FundingSourceImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      business: freezed == business
          ? _value.business
          : business // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      jitGateway: freezed == jitGateway
          ? _value.jitGateway
          : jitGateway // ignore: cast_nullable_to_non_nullable
              as dynamic,
      isDefault: freezed == isDefault
          ? _value.isDefault
          : isDefault // ignore: cast_nullable_to_non_nullable
              as bool?,
      isDeleted: freezed == isDeleted
          ? _value.isDeleted
          : isDeleted // ignore: cast_nullable_to_non_nullable
              as bool?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      v: freezed == v
          ? _value.v
          : v // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FundingSourceImpl implements _FundingSource {
  _$FundingSourceImpl(
      {@JsonKey(name: '_id') this.id,
      this.business,
      this.type,
      this.status,
      this.jitGateway,
      this.isDefault,
      this.isDeleted,
      this.createdAt,
      this.updatedAt,
      @JsonKey(name: '__v') this.v});

  factory _$FundingSourceImpl.fromJson(Map<String, dynamic> json) =>
      _$$FundingSourceImplFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String? id;
  @override
  final String? business;
  @override
  final String? type;
  @override
  final String? status;
  @override
  final dynamic jitGateway;
  @override
  final bool? isDefault;
  @override
  final bool? isDeleted;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;
  @override
  @JsonKey(name: '__v')
  final int? v;

  @override
  String toString() {
    return 'FundingSource(id: $id, business: $business, type: $type, status: $status, jitGateway: $jitGateway, isDefault: $isDefault, isDeleted: $isDeleted, createdAt: $createdAt, updatedAt: $updatedAt, v: $v)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FundingSourceImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.business, business) ||
                other.business == business) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality()
                .equals(other.jitGateway, jitGateway) &&
            (identical(other.isDefault, isDefault) ||
                other.isDefault == isDefault) &&
            (identical(other.isDeleted, isDeleted) ||
                other.isDeleted == isDeleted) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.v, v) || other.v == v));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      business,
      type,
      status,
      const DeepCollectionEquality().hash(jitGateway),
      isDefault,
      isDeleted,
      createdAt,
      updatedAt,
      v);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FundingSourceImplCopyWith<_$FundingSourceImpl> get copyWith =>
      __$$FundingSourceImplCopyWithImpl<_$FundingSourceImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FundingSourceImplToJson(
      this,
    );
  }
}

abstract class _FundingSource implements FundingSource {
  factory _FundingSource(
      {@JsonKey(name: '_id') final String? id,
      final String? business,
      final String? type,
      final String? status,
      final dynamic jitGateway,
      final bool? isDefault,
      final bool? isDeleted,
      final DateTime? createdAt,
      final DateTime? updatedAt,
      @JsonKey(name: '__v') final int? v}) = _$FundingSourceImpl;

  factory _FundingSource.fromJson(Map<String, dynamic> json) =
      _$FundingSourceImpl.fromJson;

  @override
  @JsonKey(name: '_id')
  String? get id;
  @override
  String? get business;
  @override
  String? get type;
  @override
  String? get status;
  @override
  dynamic get jitGateway;
  @override
  bool? get isDefault;
  @override
  bool? get isDeleted;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get updatedAt;
  @override
  @JsonKey(name: '__v')
  int? get v;
  @override
  @JsonKey(ignore: true)
  _$$FundingSourceImplCopyWith<_$FundingSourceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
