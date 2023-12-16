// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'airtime_top_deals.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AirtimeTopDeals _$AirtimeTopDealsFromJson(Map<String, dynamic> json) {
  return _AirtimeTopDeals.fromJson(json);
}

/// @nodoc
mixin _$AirtimeTopDeals {
  num get cashBack => throw _privateConstructorUsedError;
  num get amount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AirtimeTopDealsCopyWith<AirtimeTopDeals> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AirtimeTopDealsCopyWith<$Res> {
  factory $AirtimeTopDealsCopyWith(
          AirtimeTopDeals value, $Res Function(AirtimeTopDeals) then) =
      _$AirtimeTopDealsCopyWithImpl<$Res, AirtimeTopDeals>;
  @useResult
  $Res call({num cashBack, num amount});
}

/// @nodoc
class _$AirtimeTopDealsCopyWithImpl<$Res, $Val extends AirtimeTopDeals>
    implements $AirtimeTopDealsCopyWith<$Res> {
  _$AirtimeTopDealsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cashBack = null,
    Object? amount = null,
  }) {
    return _then(_value.copyWith(
      cashBack: null == cashBack
          ? _value.cashBack
          : cashBack // ignore: cast_nullable_to_non_nullable
              as num,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as num,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AirtimeTopDealsImplCopyWith<$Res>
    implements $AirtimeTopDealsCopyWith<$Res> {
  factory _$$AirtimeTopDealsImplCopyWith(_$AirtimeTopDealsImpl value,
          $Res Function(_$AirtimeTopDealsImpl) then) =
      __$$AirtimeTopDealsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({num cashBack, num amount});
}

/// @nodoc
class __$$AirtimeTopDealsImplCopyWithImpl<$Res>
    extends _$AirtimeTopDealsCopyWithImpl<$Res, _$AirtimeTopDealsImpl>
    implements _$$AirtimeTopDealsImplCopyWith<$Res> {
  __$$AirtimeTopDealsImplCopyWithImpl(
      _$AirtimeTopDealsImpl _value, $Res Function(_$AirtimeTopDealsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cashBack = null,
    Object? amount = null,
  }) {
    return _then(_$AirtimeTopDealsImpl(
      cashBack: null == cashBack
          ? _value.cashBack
          : cashBack // ignore: cast_nullable_to_non_nullable
              as num,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as num,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AirtimeTopDealsImpl implements _AirtimeTopDeals {
  _$AirtimeTopDealsImpl({this.cashBack = 0, this.amount = 0});

  factory _$AirtimeTopDealsImpl.fromJson(Map<String, dynamic> json) =>
      _$$AirtimeTopDealsImplFromJson(json);

  @override
  @JsonKey()
  final num cashBack;
  @override
  @JsonKey()
  final num amount;

  @override
  String toString() {
    return 'AirtimeTopDeals(cashBack: $cashBack, amount: $amount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AirtimeTopDealsImpl &&
            (identical(other.cashBack, cashBack) ||
                other.cashBack == cashBack) &&
            (identical(other.amount, amount) || other.amount == amount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, cashBack, amount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AirtimeTopDealsImplCopyWith<_$AirtimeTopDealsImpl> get copyWith =>
      __$$AirtimeTopDealsImplCopyWithImpl<_$AirtimeTopDealsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AirtimeTopDealsImplToJson(
      this,
    );
  }
}

abstract class _AirtimeTopDeals implements AirtimeTopDeals {
  factory _AirtimeTopDeals({final num cashBack, final num amount}) =
      _$AirtimeTopDealsImpl;

  factory _AirtimeTopDeals.fromJson(Map<String, dynamic> json) =
      _$AirtimeTopDealsImpl.fromJson;

  @override
  num get cashBack;
  @override
  num get amount;
  @override
  @JsonKey(ignore: true)
  _$$AirtimeTopDealsImplCopyWith<_$AirtimeTopDealsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
