// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'buy_voucher.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

BuyVoucher _$BuyVoucherFromJson(Map<String, dynamic> json) {
  return _BuyVoucher.fromJson(json);
}

/// @nodoc
mixin _$BuyVoucher {
  @JsonKey(name: 'voucher_id')
  String? get voucherid => throw _privateConstructorUsedError;
  num get amount => throw _privateConstructorUsedError;
  @JsonKey(name: 'voucher_code')
  String? get voucherCode => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BuyVoucherCopyWith<BuyVoucher> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BuyVoucherCopyWith<$Res> {
  factory $BuyVoucherCopyWith(
          BuyVoucher value, $Res Function(BuyVoucher) then) =
      _$BuyVoucherCopyWithImpl<$Res, BuyVoucher>;
  @useResult
  $Res call(
      {@JsonKey(name: 'voucher_id') String? voucherid,
      num amount,
      @JsonKey(name: 'voucher_code') String? voucherCode});
}

/// @nodoc
class _$BuyVoucherCopyWithImpl<$Res, $Val extends BuyVoucher>
    implements $BuyVoucherCopyWith<$Res> {
  _$BuyVoucherCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? voucherid = freezed,
    Object? amount = null,
    Object? voucherCode = freezed,
  }) {
    return _then(_value.copyWith(
      voucherid: freezed == voucherid
          ? _value.voucherid
          : voucherid // ignore: cast_nullable_to_non_nullable
              as String?,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as num,
      voucherCode: freezed == voucherCode
          ? _value.voucherCode
          : voucherCode // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BuyVoucherImplCopyWith<$Res>
    implements $BuyVoucherCopyWith<$Res> {
  factory _$$BuyVoucherImplCopyWith(
          _$BuyVoucherImpl value, $Res Function(_$BuyVoucherImpl) then) =
      __$$BuyVoucherImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'voucher_id') String? voucherid,
      num amount,
      @JsonKey(name: 'voucher_code') String? voucherCode});
}

/// @nodoc
class __$$BuyVoucherImplCopyWithImpl<$Res>
    extends _$BuyVoucherCopyWithImpl<$Res, _$BuyVoucherImpl>
    implements _$$BuyVoucherImplCopyWith<$Res> {
  __$$BuyVoucherImplCopyWithImpl(
      _$BuyVoucherImpl _value, $Res Function(_$BuyVoucherImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? voucherid = freezed,
    Object? amount = null,
    Object? voucherCode = freezed,
  }) {
    return _then(_$BuyVoucherImpl(
      voucherid: freezed == voucherid
          ? _value.voucherid
          : voucherid // ignore: cast_nullable_to_non_nullable
              as String?,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as num,
      voucherCode: freezed == voucherCode
          ? _value.voucherCode
          : voucherCode // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BuyVoucherImpl implements _BuyVoucher {
  _$BuyVoucherImpl(
      {@JsonKey(name: 'voucher_id') this.voucherid,
      this.amount = 0,
      @JsonKey(name: 'voucher_code') this.voucherCode});

  factory _$BuyVoucherImpl.fromJson(Map<String, dynamic> json) =>
      _$$BuyVoucherImplFromJson(json);

  @override
  @JsonKey(name: 'voucher_id')
  final String? voucherid;
  @override
  @JsonKey()
  final num amount;
  @override
  @JsonKey(name: 'voucher_code')
  final String? voucherCode;

  @override
  String toString() {
    return 'BuyVoucher(voucherid: $voucherid, amount: $amount, voucherCode: $voucherCode)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BuyVoucherImpl &&
            (identical(other.voucherid, voucherid) ||
                other.voucherid == voucherid) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.voucherCode, voucherCode) ||
                other.voucherCode == voucherCode));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, voucherid, amount, voucherCode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BuyVoucherImplCopyWith<_$BuyVoucherImpl> get copyWith =>
      __$$BuyVoucherImplCopyWithImpl<_$BuyVoucherImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BuyVoucherImplToJson(
      this,
    );
  }
}

abstract class _BuyVoucher implements BuyVoucher {
  factory _BuyVoucher(
          {@JsonKey(name: 'voucher_id') final String? voucherid,
          final num amount,
          @JsonKey(name: 'voucher_code') final String? voucherCode}) =
      _$BuyVoucherImpl;

  factory _BuyVoucher.fromJson(Map<String, dynamic> json) =
      _$BuyVoucherImpl.fromJson;

  @override
  @JsonKey(name: 'voucher_id')
  String? get voucherid;
  @override
  num get amount;
  @override
  @JsonKey(name: 'voucher_code')
  String? get voucherCode;
  @override
  @JsonKey(ignore: true)
  _$$BuyVoucherImplCopyWith<_$BuyVoucherImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
