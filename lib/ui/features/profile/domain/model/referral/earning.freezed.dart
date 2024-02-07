// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'earning.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Earning _$EarningFromJson(Map<String, dynamic> json) {
  return _Earning.fromJson(json);
}

/// @nodoc
mixin _$Earning {
  @JsonKey(name: 'total_earnings')
  @HiveField(0)
  String? get totalEarnings => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EarningCopyWith<Earning> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EarningCopyWith<$Res> {
  factory $EarningCopyWith(Earning value, $Res Function(Earning) then) =
      _$EarningCopyWithImpl<$Res, Earning>;
  @useResult
  $Res call(
      {@JsonKey(name: 'total_earnings') @HiveField(0) String? totalEarnings});
}

/// @nodoc
class _$EarningCopyWithImpl<$Res, $Val extends Earning>
    implements $EarningCopyWith<$Res> {
  _$EarningCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalEarnings = freezed,
  }) {
    return _then(_value.copyWith(
      totalEarnings: freezed == totalEarnings
          ? _value.totalEarnings
          : totalEarnings // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EarningImplCopyWith<$Res> implements $EarningCopyWith<$Res> {
  factory _$$EarningImplCopyWith(
          _$EarningImpl value, $Res Function(_$EarningImpl) then) =
      __$$EarningImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'total_earnings') @HiveField(0) String? totalEarnings});
}

/// @nodoc
class __$$EarningImplCopyWithImpl<$Res>
    extends _$EarningCopyWithImpl<$Res, _$EarningImpl>
    implements _$$EarningImplCopyWith<$Res> {
  __$$EarningImplCopyWithImpl(
      _$EarningImpl _value, $Res Function(_$EarningImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalEarnings = freezed,
  }) {
    return _then(_$EarningImpl(
      totalEarnings: freezed == totalEarnings
          ? _value.totalEarnings
          : totalEarnings // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EarningImpl implements _Earning {
  _$EarningImpl(
      {@JsonKey(name: 'total_earnings') @HiveField(0) this.totalEarnings});

  factory _$EarningImpl.fromJson(Map<String, dynamic> json) =>
      _$$EarningImplFromJson(json);

  @override
  @JsonKey(name: 'total_earnings')
  @HiveField(0)
  final String? totalEarnings;

  @override
  String toString() {
    return 'Earning(totalEarnings: $totalEarnings)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EarningImpl &&
            (identical(other.totalEarnings, totalEarnings) ||
                other.totalEarnings == totalEarnings));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, totalEarnings);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EarningImplCopyWith<_$EarningImpl> get copyWith =>
      __$$EarningImplCopyWithImpl<_$EarningImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EarningImplToJson(
      this,
    );
  }
}

abstract class _Earning implements Earning {
  factory _Earning(
      {@JsonKey(name: 'total_earnings')
      @HiveField(0)
      final String? totalEarnings}) = _$EarningImpl;

  factory _Earning.fromJson(Map<String, dynamic> json) = _$EarningImpl.fromJson;

  @override
  @JsonKey(name: 'total_earnings')
  @HiveField(0)
  String? get totalEarnings;
  @override
  @JsonKey(ignore: true)
  _$$EarningImplCopyWith<_$EarningImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
