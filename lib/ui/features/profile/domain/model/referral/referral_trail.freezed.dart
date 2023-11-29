// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'referral_trail.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ReferralTrail _$ReferralTrailFromJson(Map<String, dynamic> json) {
  return _ReferralTrail.fromJson(json);
}

/// @nodoc
mixin _$ReferralTrail {
  @HiveField(0)
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'referred_user_id')
  @HiveField(1)
  String? get referredUserId => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_paid')
  @HiveField(2)
  bool? get isPaid => throw _privateConstructorUsedError;
  @JsonKey(name: 'referral_amount')
  @HiveField(3)
  String? get referralAmount => throw _privateConstructorUsedError;
  @JsonKey(name: 'first_name')
  @HiveField(4)
  String? get firstName => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_name')
  @HiveField(5)
  String? get lastName => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  @DateTimeSerializer()
  @HiveField(6)
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  @DateTimeSerializer()
  @HiveField(7)
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReferralTrailCopyWith<ReferralTrail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReferralTrailCopyWith<$Res> {
  factory $ReferralTrailCopyWith(
          ReferralTrail value, $Res Function(ReferralTrail) then) =
      _$ReferralTrailCopyWithImpl<$Res, ReferralTrail>;
  @useResult
  $Res call(
      {@HiveField(0) int? id,
      @JsonKey(name: 'referred_user_id') @HiveField(1) String? referredUserId,
      @JsonKey(name: 'is_paid') @HiveField(2) bool? isPaid,
      @JsonKey(name: 'referral_amount') @HiveField(3) String? referralAmount,
      @JsonKey(name: 'first_name') @HiveField(4) String? firstName,
      @JsonKey(name: 'last_name') @HiveField(5) String? lastName,
      @JsonKey(name: 'created_at')
      @DateTimeSerializer()
      @HiveField(6)
      DateTime? createdAt,
      @JsonKey(name: 'updated_at')
      @DateTimeSerializer()
      @HiveField(7)
      DateTime? updatedAt});
}

/// @nodoc
class _$ReferralTrailCopyWithImpl<$Res, $Val extends ReferralTrail>
    implements $ReferralTrailCopyWith<$Res> {
  _$ReferralTrailCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? referredUserId = freezed,
    Object? isPaid = freezed,
    Object? referralAmount = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      referredUserId: freezed == referredUserId
          ? _value.referredUserId
          : referredUserId // ignore: cast_nullable_to_non_nullable
              as String?,
      isPaid: freezed == isPaid
          ? _value.isPaid
          : isPaid // ignore: cast_nullable_to_non_nullable
              as bool?,
      referralAmount: freezed == referralAmount
          ? _value.referralAmount
          : referralAmount // ignore: cast_nullable_to_non_nullable
              as String?,
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReferralTrailImplCopyWith<$Res>
    implements $ReferralTrailCopyWith<$Res> {
  factory _$$ReferralTrailImplCopyWith(
          _$ReferralTrailImpl value, $Res Function(_$ReferralTrailImpl) then) =
      __$$ReferralTrailImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) int? id,
      @JsonKey(name: 'referred_user_id') @HiveField(1) String? referredUserId,
      @JsonKey(name: 'is_paid') @HiveField(2) bool? isPaid,
      @JsonKey(name: 'referral_amount') @HiveField(3) String? referralAmount,
      @JsonKey(name: 'first_name') @HiveField(4) String? firstName,
      @JsonKey(name: 'last_name') @HiveField(5) String? lastName,
      @JsonKey(name: 'created_at')
      @DateTimeSerializer()
      @HiveField(6)
      DateTime? createdAt,
      @JsonKey(name: 'updated_at')
      @DateTimeSerializer()
      @HiveField(7)
      DateTime? updatedAt});
}

/// @nodoc
class __$$ReferralTrailImplCopyWithImpl<$Res>
    extends _$ReferralTrailCopyWithImpl<$Res, _$ReferralTrailImpl>
    implements _$$ReferralTrailImplCopyWith<$Res> {
  __$$ReferralTrailImplCopyWithImpl(
      _$ReferralTrailImpl _value, $Res Function(_$ReferralTrailImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? referredUserId = freezed,
    Object? isPaid = freezed,
    Object? referralAmount = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$ReferralTrailImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      referredUserId: freezed == referredUserId
          ? _value.referredUserId
          : referredUserId // ignore: cast_nullable_to_non_nullable
              as String?,
      isPaid: freezed == isPaid
          ? _value.isPaid
          : isPaid // ignore: cast_nullable_to_non_nullable
              as bool?,
      referralAmount: freezed == referralAmount
          ? _value.referralAmount
          : referralAmount // ignore: cast_nullable_to_non_nullable
              as String?,
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@HiveType(typeId: 4, adapterName: 'ReferralTrailAdapter')
class _$ReferralTrailImpl implements _ReferralTrail {
  _$ReferralTrailImpl(
      {@HiveField(0) this.id,
      @JsonKey(name: 'referred_user_id') @HiveField(1) this.referredUserId,
      @JsonKey(name: 'is_paid') @HiveField(2) this.isPaid,
      @JsonKey(name: 'referral_amount') @HiveField(3) this.referralAmount,
      @JsonKey(name: 'first_name') @HiveField(4) this.firstName,
      @JsonKey(name: 'last_name') @HiveField(5) this.lastName,
      @JsonKey(name: 'created_at')
      @DateTimeSerializer()
      @HiveField(6)
      this.createdAt,
      @JsonKey(name: 'updated_at')
      @DateTimeSerializer()
      @HiveField(7)
      this.updatedAt});

  factory _$ReferralTrailImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReferralTrailImplFromJson(json);

  @override
  @HiveField(0)
  final int? id;
  @override
  @JsonKey(name: 'referred_user_id')
  @HiveField(1)
  final String? referredUserId;
  @override
  @JsonKey(name: 'is_paid')
  @HiveField(2)
  final bool? isPaid;
  @override
  @JsonKey(name: 'referral_amount')
  @HiveField(3)
  final String? referralAmount;
  @override
  @JsonKey(name: 'first_name')
  @HiveField(4)
  final String? firstName;
  @override
  @JsonKey(name: 'last_name')
  @HiveField(5)
  final String? lastName;
  @override
  @JsonKey(name: 'created_at')
  @DateTimeSerializer()
  @HiveField(6)
  final DateTime? createdAt;
  @override
  @JsonKey(name: 'updated_at')
  @DateTimeSerializer()
  @HiveField(7)
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'ReferralTrail(id: $id, referredUserId: $referredUserId, isPaid: $isPaid, referralAmount: $referralAmount, firstName: $firstName, lastName: $lastName, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReferralTrailImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.referredUserId, referredUserId) ||
                other.referredUserId == referredUserId) &&
            (identical(other.isPaid, isPaid) || other.isPaid == isPaid) &&
            (identical(other.referralAmount, referralAmount) ||
                other.referralAmount == referralAmount) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, referredUserId, isPaid,
      referralAmount, firstName, lastName, createdAt, updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReferralTrailImplCopyWith<_$ReferralTrailImpl> get copyWith =>
      __$$ReferralTrailImplCopyWithImpl<_$ReferralTrailImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReferralTrailImplToJson(
      this,
    );
  }
}

abstract class _ReferralTrail implements ReferralTrail {
  factory _ReferralTrail(
      {@HiveField(0) final int? id,
      @JsonKey(name: 'referred_user_id')
      @HiveField(1)
      final String? referredUserId,
      @JsonKey(name: 'is_paid') @HiveField(2) final bool? isPaid,
      @JsonKey(name: 'referral_amount')
      @HiveField(3)
      final String? referralAmount,
      @JsonKey(name: 'first_name') @HiveField(4) final String? firstName,
      @JsonKey(name: 'last_name') @HiveField(5) final String? lastName,
      @JsonKey(name: 'created_at')
      @DateTimeSerializer()
      @HiveField(6)
      final DateTime? createdAt,
      @JsonKey(name: 'updated_at')
      @DateTimeSerializer()
      @HiveField(7)
      final DateTime? updatedAt}) = _$ReferralTrailImpl;

  factory _ReferralTrail.fromJson(Map<String, dynamic> json) =
      _$ReferralTrailImpl.fromJson;

  @override
  @HiveField(0)
  int? get id;
  @override
  @JsonKey(name: 'referred_user_id')
  @HiveField(1)
  String? get referredUserId;
  @override
  @JsonKey(name: 'is_paid')
  @HiveField(2)
  bool? get isPaid;
  @override
  @JsonKey(name: 'referral_amount')
  @HiveField(3)
  String? get referralAmount;
  @override
  @JsonKey(name: 'first_name')
  @HiveField(4)
  String? get firstName;
  @override
  @JsonKey(name: 'last_name')
  @HiveField(5)
  String? get lastName;
  @override
  @JsonKey(name: 'created_at')
  @DateTimeSerializer()
  @HiveField(6)
  DateTime? get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  @DateTimeSerializer()
  @HiveField(7)
  DateTime? get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$ReferralTrailImplCopyWith<_$ReferralTrailImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
