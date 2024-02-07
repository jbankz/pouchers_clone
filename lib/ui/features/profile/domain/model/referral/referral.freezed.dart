// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'referral.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Referral _$ReferralFromJson(Map<String, dynamic> json) {
  return _Referral.fromJson(json);
}

/// @nodoc
mixin _$Referral {
  @EarningSerializer()
  @HiveField(0)
  List<Earning>? get earning => throw _privateConstructorUsedError;
  @ReferralTrailSerializer()
  @HiveField(1)
  List<ReferralTrail>? get referralTrail => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReferralCopyWith<Referral> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReferralCopyWith<$Res> {
  factory $ReferralCopyWith(Referral value, $Res Function(Referral) then) =
      _$ReferralCopyWithImpl<$Res, Referral>;
  @useResult
  $Res call(
      {@EarningSerializer() @HiveField(0) List<Earning>? earning,
      @ReferralTrailSerializer()
      @HiveField(1)
      List<ReferralTrail>? referralTrail});
}

/// @nodoc
class _$ReferralCopyWithImpl<$Res, $Val extends Referral>
    implements $ReferralCopyWith<$Res> {
  _$ReferralCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? earning = freezed,
    Object? referralTrail = freezed,
  }) {
    return _then(_value.copyWith(
      earning: freezed == earning
          ? _value.earning
          : earning // ignore: cast_nullable_to_non_nullable
              as List<Earning>?,
      referralTrail: freezed == referralTrail
          ? _value.referralTrail
          : referralTrail // ignore: cast_nullable_to_non_nullable
              as List<ReferralTrail>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReferralImplCopyWith<$Res>
    implements $ReferralCopyWith<$Res> {
  factory _$$ReferralImplCopyWith(
          _$ReferralImpl value, $Res Function(_$ReferralImpl) then) =
      __$$ReferralImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@EarningSerializer() @HiveField(0) List<Earning>? earning,
      @ReferralTrailSerializer()
      @HiveField(1)
      List<ReferralTrail>? referralTrail});
}

/// @nodoc
class __$$ReferralImplCopyWithImpl<$Res>
    extends _$ReferralCopyWithImpl<$Res, _$ReferralImpl>
    implements _$$ReferralImplCopyWith<$Res> {
  __$$ReferralImplCopyWithImpl(
      _$ReferralImpl _value, $Res Function(_$ReferralImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? earning = freezed,
    Object? referralTrail = freezed,
  }) {
    return _then(_$ReferralImpl(
      earning: freezed == earning
          ? _value._earning
          : earning // ignore: cast_nullable_to_non_nullable
              as List<Earning>?,
      referralTrail: freezed == referralTrail
          ? _value._referralTrail
          : referralTrail // ignore: cast_nullable_to_non_nullable
              as List<ReferralTrail>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ReferralImpl implements _Referral {
  _$ReferralImpl(
      {@EarningSerializer()
      @HiveField(0)
      final List<Earning>? earning = const [],
      @ReferralTrailSerializer()
      @HiveField(1)
      final List<ReferralTrail>? referralTrail = const []})
      : _earning = earning,
        _referralTrail = referralTrail;

  factory _$ReferralImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReferralImplFromJson(json);

  final List<Earning>? _earning;
  @override
  @JsonKey()
  @EarningSerializer()
  @HiveField(0)
  List<Earning>? get earning {
    final value = _earning;
    if (value == null) return null;
    if (_earning is EqualUnmodifiableListView) return _earning;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<ReferralTrail>? _referralTrail;
  @override
  @JsonKey()
  @ReferralTrailSerializer()
  @HiveField(1)
  List<ReferralTrail>? get referralTrail {
    final value = _referralTrail;
    if (value == null) return null;
    if (_referralTrail is EqualUnmodifiableListView) return _referralTrail;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'Referral(earning: $earning, referralTrail: $referralTrail)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReferralImpl &&
            const DeepCollectionEquality().equals(other._earning, _earning) &&
            const DeepCollectionEquality()
                .equals(other._referralTrail, _referralTrail));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_earning),
      const DeepCollectionEquality().hash(_referralTrail));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReferralImplCopyWith<_$ReferralImpl> get copyWith =>
      __$$ReferralImplCopyWithImpl<_$ReferralImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReferralImplToJson(
      this,
    );
  }
}

abstract class _Referral implements Referral {
  factory _Referral(
      {@EarningSerializer() @HiveField(0) final List<Earning>? earning,
      @ReferralTrailSerializer()
      @HiveField(1)
      final List<ReferralTrail>? referralTrail}) = _$ReferralImpl;

  factory _Referral.fromJson(Map<String, dynamic> json) =
      _$ReferralImpl.fromJson;

  @override
  @EarningSerializer()
  @HiveField(0)
  List<Earning>? get earning;
  @override
  @ReferralTrailSerializer()
  @HiveField(1)
  List<ReferralTrail>? get referralTrail;
  @override
  @JsonKey(ignore: true)
  _$$ReferralImplCopyWith<_$ReferralImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
