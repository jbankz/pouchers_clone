// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tier.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Tier _$TierFromJson(Map<String, dynamic> json) {
  return _Tier.fromJson(json);
}

/// @nodoc
mixin _$Tier {
  String? get dailyTxLimit => throw _privateConstructorUsedError;
  String? get maxBalance => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TierCopyWith<Tier> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TierCopyWith<$Res> {
  factory $TierCopyWith(Tier value, $Res Function(Tier) then) =
      _$TierCopyWithImpl<$Res, Tier>;
  @useResult
  $Res call({String? dailyTxLimit, String? maxBalance});
}

/// @nodoc
class _$TierCopyWithImpl<$Res, $Val extends Tier>
    implements $TierCopyWith<$Res> {
  _$TierCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dailyTxLimit = freezed,
    Object? maxBalance = freezed,
  }) {
    return _then(_value.copyWith(
      dailyTxLimit: freezed == dailyTxLimit
          ? _value.dailyTxLimit
          : dailyTxLimit // ignore: cast_nullable_to_non_nullable
              as String?,
      maxBalance: freezed == maxBalance
          ? _value.maxBalance
          : maxBalance // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TierImplCopyWith<$Res> implements $TierCopyWith<$Res> {
  factory _$$TierImplCopyWith(
          _$TierImpl value, $Res Function(_$TierImpl) then) =
      __$$TierImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? dailyTxLimit, String? maxBalance});
}

/// @nodoc
class __$$TierImplCopyWithImpl<$Res>
    extends _$TierCopyWithImpl<$Res, _$TierImpl>
    implements _$$TierImplCopyWith<$Res> {
  __$$TierImplCopyWithImpl(_$TierImpl _value, $Res Function(_$TierImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dailyTxLimit = freezed,
    Object? maxBalance = freezed,
  }) {
    return _then(_$TierImpl(
      dailyTxLimit: freezed == dailyTxLimit
          ? _value.dailyTxLimit
          : dailyTxLimit // ignore: cast_nullable_to_non_nullable
              as String?,
      maxBalance: freezed == maxBalance
          ? _value.maxBalance
          : maxBalance // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TierImpl implements _Tier {
  _$TierImpl({this.dailyTxLimit, this.maxBalance});

  factory _$TierImpl.fromJson(Map<String, dynamic> json) =>
      _$$TierImplFromJson(json);

  @override
  final String? dailyTxLimit;
  @override
  final String? maxBalance;

  @override
  String toString() {
    return 'Tier(dailyTxLimit: $dailyTxLimit, maxBalance: $maxBalance)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TierImpl &&
            (identical(other.dailyTxLimit, dailyTxLimit) ||
                other.dailyTxLimit == dailyTxLimit) &&
            (identical(other.maxBalance, maxBalance) ||
                other.maxBalance == maxBalance));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, dailyTxLimit, maxBalance);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TierImplCopyWith<_$TierImpl> get copyWith =>
      __$$TierImplCopyWithImpl<_$TierImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TierImplToJson(
      this,
    );
  }
}

abstract class _Tier implements Tier {
  factory _Tier({final String? dailyTxLimit, final String? maxBalance}) =
      _$TierImpl;

  factory _Tier.fromJson(Map<String, dynamic> json) = _$TierImpl.fromJson;

  @override
  String? get dailyTxLimit;
  @override
  String? get maxBalance;
  @override
  @JsonKey(ignore: true)
  _$$TierImplCopyWith<_$TierImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
