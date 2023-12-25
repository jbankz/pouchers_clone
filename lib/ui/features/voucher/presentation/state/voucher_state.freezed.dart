// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'voucher_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$VoucherState<T> {
  bool get isBusy => throw _privateConstructorUsedError;
  List<Vouchers> get vouchers => throw _privateConstructorUsedError;
  List<num> get vouchersTopDeals => throw _privateConstructorUsedError;
  Vouchers? get voucher => throw _privateConstructorUsedError;
  BuyVoucher? get buyVoucher => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;
  StackTrace? get stackTrace => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $VoucherStateCopyWith<T, VoucherState<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VoucherStateCopyWith<T, $Res> {
  factory $VoucherStateCopyWith(
          VoucherState<T> value, $Res Function(VoucherState<T>) then) =
      _$VoucherStateCopyWithImpl<T, $Res, VoucherState<T>>;
  @useResult
  $Res call(
      {bool isBusy,
      List<Vouchers> vouchers,
      List<num> vouchersTopDeals,
      Vouchers? voucher,
      BuyVoucher? buyVoucher,
      String? errorMessage,
      StackTrace? stackTrace});

  $VouchersCopyWith<$Res>? get voucher;
  $BuyVoucherCopyWith<$Res>? get buyVoucher;
}

/// @nodoc
class _$VoucherStateCopyWithImpl<T, $Res, $Val extends VoucherState<T>>
    implements $VoucherStateCopyWith<T, $Res> {
  _$VoucherStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isBusy = null,
    Object? vouchers = null,
    Object? vouchersTopDeals = null,
    Object? voucher = freezed,
    Object? buyVoucher = freezed,
    Object? errorMessage = freezed,
    Object? stackTrace = freezed,
  }) {
    return _then(_value.copyWith(
      isBusy: null == isBusy
          ? _value.isBusy
          : isBusy // ignore: cast_nullable_to_non_nullable
              as bool,
      vouchers: null == vouchers
          ? _value.vouchers
          : vouchers // ignore: cast_nullable_to_non_nullable
              as List<Vouchers>,
      vouchersTopDeals: null == vouchersTopDeals
          ? _value.vouchersTopDeals
          : vouchersTopDeals // ignore: cast_nullable_to_non_nullable
              as List<num>,
      voucher: freezed == voucher
          ? _value.voucher
          : voucher // ignore: cast_nullable_to_non_nullable
              as Vouchers?,
      buyVoucher: freezed == buyVoucher
          ? _value.buyVoucher
          : buyVoucher // ignore: cast_nullable_to_non_nullable
              as BuyVoucher?,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      stackTrace: freezed == stackTrace
          ? _value.stackTrace
          : stackTrace // ignore: cast_nullable_to_non_nullable
              as StackTrace?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $VouchersCopyWith<$Res>? get voucher {
    if (_value.voucher == null) {
      return null;
    }

    return $VouchersCopyWith<$Res>(_value.voucher!, (value) {
      return _then(_value.copyWith(voucher: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $BuyVoucherCopyWith<$Res>? get buyVoucher {
    if (_value.buyVoucher == null) {
      return null;
    }

    return $BuyVoucherCopyWith<$Res>(_value.buyVoucher!, (value) {
      return _then(_value.copyWith(buyVoucher: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$VoucherStateImplCopyWith<T, $Res>
    implements $VoucherStateCopyWith<T, $Res> {
  factory _$$VoucherStateImplCopyWith(_$VoucherStateImpl<T> value,
          $Res Function(_$VoucherStateImpl<T>) then) =
      __$$VoucherStateImplCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call(
      {bool isBusy,
      List<Vouchers> vouchers,
      List<num> vouchersTopDeals,
      Vouchers? voucher,
      BuyVoucher? buyVoucher,
      String? errorMessage,
      StackTrace? stackTrace});

  @override
  $VouchersCopyWith<$Res>? get voucher;
  @override
  $BuyVoucherCopyWith<$Res>? get buyVoucher;
}

/// @nodoc
class __$$VoucherStateImplCopyWithImpl<T, $Res>
    extends _$VoucherStateCopyWithImpl<T, $Res, _$VoucherStateImpl<T>>
    implements _$$VoucherStateImplCopyWith<T, $Res> {
  __$$VoucherStateImplCopyWithImpl(
      _$VoucherStateImpl<T> _value, $Res Function(_$VoucherStateImpl<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isBusy = null,
    Object? vouchers = null,
    Object? vouchersTopDeals = null,
    Object? voucher = freezed,
    Object? buyVoucher = freezed,
    Object? errorMessage = freezed,
    Object? stackTrace = freezed,
  }) {
    return _then(_$VoucherStateImpl<T>(
      isBusy: null == isBusy
          ? _value.isBusy
          : isBusy // ignore: cast_nullable_to_non_nullable
              as bool,
      vouchers: null == vouchers
          ? _value._vouchers
          : vouchers // ignore: cast_nullable_to_non_nullable
              as List<Vouchers>,
      vouchersTopDeals: null == vouchersTopDeals
          ? _value._vouchersTopDeals
          : vouchersTopDeals // ignore: cast_nullable_to_non_nullable
              as List<num>,
      voucher: freezed == voucher
          ? _value.voucher
          : voucher // ignore: cast_nullable_to_non_nullable
              as Vouchers?,
      buyVoucher: freezed == buyVoucher
          ? _value.buyVoucher
          : buyVoucher // ignore: cast_nullable_to_non_nullable
              as BuyVoucher?,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      stackTrace: freezed == stackTrace
          ? _value.stackTrace
          : stackTrace // ignore: cast_nullable_to_non_nullable
              as StackTrace?,
    ));
  }
}

/// @nodoc

class _$VoucherStateImpl<T> implements _VoucherState<T> {
  const _$VoucherStateImpl(
      {this.isBusy = false,
      final List<Vouchers> vouchers = const [],
      final List<num> vouchersTopDeals = const [],
      this.voucher,
      this.buyVoucher,
      this.errorMessage,
      this.stackTrace})
      : _vouchers = vouchers,
        _vouchersTopDeals = vouchersTopDeals;

  @override
  @JsonKey()
  final bool isBusy;
  final List<Vouchers> _vouchers;
  @override
  @JsonKey()
  List<Vouchers> get vouchers {
    if (_vouchers is EqualUnmodifiableListView) return _vouchers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_vouchers);
  }

  final List<num> _vouchersTopDeals;
  @override
  @JsonKey()
  List<num> get vouchersTopDeals {
    if (_vouchersTopDeals is EqualUnmodifiableListView)
      return _vouchersTopDeals;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_vouchersTopDeals);
  }

  @override
  final Vouchers? voucher;
  @override
  final BuyVoucher? buyVoucher;
  @override
  final String? errorMessage;
  @override
  final StackTrace? stackTrace;

  @override
  String toString() {
    return 'VoucherState<$T>(isBusy: $isBusy, vouchers: $vouchers, vouchersTopDeals: $vouchersTopDeals, voucher: $voucher, buyVoucher: $buyVoucher, errorMessage: $errorMessage, stackTrace: $stackTrace)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VoucherStateImpl<T> &&
            (identical(other.isBusy, isBusy) || other.isBusy == isBusy) &&
            const DeepCollectionEquality().equals(other._vouchers, _vouchers) &&
            const DeepCollectionEquality()
                .equals(other._vouchersTopDeals, _vouchersTopDeals) &&
            (identical(other.voucher, voucher) || other.voucher == voucher) &&
            (identical(other.buyVoucher, buyVoucher) ||
                other.buyVoucher == buyVoucher) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.stackTrace, stackTrace) ||
                other.stackTrace == stackTrace));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isBusy,
      const DeepCollectionEquality().hash(_vouchers),
      const DeepCollectionEquality().hash(_vouchersTopDeals),
      voucher,
      buyVoucher,
      errorMessage,
      stackTrace);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$VoucherStateImplCopyWith<T, _$VoucherStateImpl<T>> get copyWith =>
      __$$VoucherStateImplCopyWithImpl<T, _$VoucherStateImpl<T>>(
          this, _$identity);
}

abstract class _VoucherState<T> implements VoucherState<T> {
  const factory _VoucherState(
      {final bool isBusy,
      final List<Vouchers> vouchers,
      final List<num> vouchersTopDeals,
      final Vouchers? voucher,
      final BuyVoucher? buyVoucher,
      final String? errorMessage,
      final StackTrace? stackTrace}) = _$VoucherStateImpl<T>;

  @override
  bool get isBusy;
  @override
  List<Vouchers> get vouchers;
  @override
  List<num> get vouchersTopDeals;
  @override
  Vouchers? get voucher;
  @override
  BuyVoucher? get buyVoucher;
  @override
  String? get errorMessage;
  @override
  StackTrace? get stackTrace;
  @override
  @JsonKey(ignore: true)
  _$$VoucherStateImplCopyWith<T, _$VoucherStateImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
