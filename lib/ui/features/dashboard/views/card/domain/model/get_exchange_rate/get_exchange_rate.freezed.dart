// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_exchange_rate.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GetExchangeRate _$GetExchangeRateFromJson(Map<String, dynamic> json) {
  return _GetExchangeRate.fromJson(json);
}

/// @nodoc
mixin _$GetExchangeRate {
  String? get rate => throw _privateConstructorUsedError;
  String? get sell => throw _privateConstructorUsedError;
  String? get buy => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GetExchangeRateCopyWith<GetExchangeRate> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetExchangeRateCopyWith<$Res> {
  factory $GetExchangeRateCopyWith(
          GetExchangeRate value, $Res Function(GetExchangeRate) then) =
      _$GetExchangeRateCopyWithImpl<$Res, GetExchangeRate>;
  @useResult
  $Res call({String? rate, String? sell, String? buy});
}

/// @nodoc
class _$GetExchangeRateCopyWithImpl<$Res, $Val extends GetExchangeRate>
    implements $GetExchangeRateCopyWith<$Res> {
  _$GetExchangeRateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rate = freezed,
    Object? sell = freezed,
    Object? buy = freezed,
  }) {
    return _then(_value.copyWith(
      rate: freezed == rate
          ? _value.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as String?,
      sell: freezed == sell
          ? _value.sell
          : sell // ignore: cast_nullable_to_non_nullable
              as String?,
      buy: freezed == buy
          ? _value.buy
          : buy // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GetExchangeRateImplCopyWith<$Res>
    implements $GetExchangeRateCopyWith<$Res> {
  factory _$$GetExchangeRateImplCopyWith(_$GetExchangeRateImpl value,
          $Res Function(_$GetExchangeRateImpl) then) =
      __$$GetExchangeRateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? rate, String? sell, String? buy});
}

/// @nodoc
class __$$GetExchangeRateImplCopyWithImpl<$Res>
    extends _$GetExchangeRateCopyWithImpl<$Res, _$GetExchangeRateImpl>
    implements _$$GetExchangeRateImplCopyWith<$Res> {
  __$$GetExchangeRateImplCopyWithImpl(
      _$GetExchangeRateImpl _value, $Res Function(_$GetExchangeRateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rate = freezed,
    Object? sell = freezed,
    Object? buy = freezed,
  }) {
    return _then(_$GetExchangeRateImpl(
      rate: freezed == rate
          ? _value.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as String?,
      sell: freezed == sell
          ? _value.sell
          : sell // ignore: cast_nullable_to_non_nullable
              as String?,
      buy: freezed == buy
          ? _value.buy
          : buy // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GetExchangeRateImpl implements _GetExchangeRate {
  _$GetExchangeRateImpl({this.rate, this.sell, this.buy});

  factory _$GetExchangeRateImpl.fromJson(Map<String, dynamic> json) =>
      _$$GetExchangeRateImplFromJson(json);

  @override
  final String? rate;
  @override
  final String? sell;
  @override
  final String? buy;

  @override
  String toString() {
    return 'GetExchangeRate(rate: $rate, sell: $sell, buy: $buy)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetExchangeRateImpl &&
            (identical(other.rate, rate) || other.rate == rate) &&
            (identical(other.sell, sell) || other.sell == sell) &&
            (identical(other.buy, buy) || other.buy == buy));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, rate, sell, buy);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetExchangeRateImplCopyWith<_$GetExchangeRateImpl> get copyWith =>
      __$$GetExchangeRateImplCopyWithImpl<_$GetExchangeRateImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GetExchangeRateImplToJson(
      this,
    );
  }
}

abstract class _GetExchangeRate implements GetExchangeRate {
  factory _GetExchangeRate(
      {final String? rate,
      final String? sell,
      final String? buy}) = _$GetExchangeRateImpl;

  factory _GetExchangeRate.fromJson(Map<String, dynamic> json) =
      _$GetExchangeRateImpl.fromJson;

  @override
  String? get rate;
  @override
  String? get sell;
  @override
  String? get buy;
  @override
  @JsonKey(ignore: true)
  _$$GetExchangeRateImplCopyWith<_$GetExchangeRateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
