// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vouchers.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Vouchers _$VouchersFromJson(Map<String, dynamic> json) {
  return _Vouchers.fromJson(json);
}

/// @nodoc
mixin _$Vouchers {
  @HiveField(0)
  String? get code => throw _privateConstructorUsedError;
  @HiveField(1)
  num get amount => throw _privateConstructorUsedError;
  @HiveField(2)
  @JsonKey(name: 'buyer_id')
  String? get buyerId => throw _privateConstructorUsedError;
  @HiveField(3)
  @JsonKey(name: 'giftee_id')
  String? get gifteeId => throw _privateConstructorUsedError;
  @HiveField(4)
  VoucherStatus get status => throw _privateConstructorUsedError;
  @HiveField(5)
  bool get redeemed => throw _privateConstructorUsedError;
  @HiveField(6)
  @JsonKey(name: 'created_at')
  @DateTimeSerializer()
  DateTime? get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VouchersCopyWith<Vouchers> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VouchersCopyWith<$Res> {
  factory $VouchersCopyWith(Vouchers value, $Res Function(Vouchers) then) =
      _$VouchersCopyWithImpl<$Res, Vouchers>;
  @useResult
  $Res call(
      {@HiveField(0) String? code,
      @HiveField(1) num amount,
      @HiveField(2) @JsonKey(name: 'buyer_id') String? buyerId,
      @HiveField(3) @JsonKey(name: 'giftee_id') String? gifteeId,
      @HiveField(4) VoucherStatus status,
      @HiveField(5) bool redeemed,
      @HiveField(6)
      @JsonKey(name: 'created_at')
      @DateTimeSerializer()
      DateTime? createdAt});
}

/// @nodoc
class _$VouchersCopyWithImpl<$Res, $Val extends Vouchers>
    implements $VouchersCopyWith<$Res> {
  _$VouchersCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = freezed,
    Object? amount = null,
    Object? buyerId = freezed,
    Object? gifteeId = freezed,
    Object? status = null,
    Object? redeemed = null,
    Object? createdAt = freezed,
  }) {
    return _then(_value.copyWith(
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as num,
      buyerId: freezed == buyerId
          ? _value.buyerId
          : buyerId // ignore: cast_nullable_to_non_nullable
              as String?,
      gifteeId: freezed == gifteeId
          ? _value.gifteeId
          : gifteeId // ignore: cast_nullable_to_non_nullable
              as String?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as VoucherStatus,
      redeemed: null == redeemed
          ? _value.redeemed
          : redeemed // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VouchersImplCopyWith<$Res>
    implements $VouchersCopyWith<$Res> {
  factory _$$VouchersImplCopyWith(
          _$VouchersImpl value, $Res Function(_$VouchersImpl) then) =
      __$$VouchersImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) String? code,
      @HiveField(1) num amount,
      @HiveField(2) @JsonKey(name: 'buyer_id') String? buyerId,
      @HiveField(3) @JsonKey(name: 'giftee_id') String? gifteeId,
      @HiveField(4) VoucherStatus status,
      @HiveField(5) bool redeemed,
      @HiveField(6)
      @JsonKey(name: 'created_at')
      @DateTimeSerializer()
      DateTime? createdAt});
}

/// @nodoc
class __$$VouchersImplCopyWithImpl<$Res>
    extends _$VouchersCopyWithImpl<$Res, _$VouchersImpl>
    implements _$$VouchersImplCopyWith<$Res> {
  __$$VouchersImplCopyWithImpl(
      _$VouchersImpl _value, $Res Function(_$VouchersImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = freezed,
    Object? amount = null,
    Object? buyerId = freezed,
    Object? gifteeId = freezed,
    Object? status = null,
    Object? redeemed = null,
    Object? createdAt = freezed,
  }) {
    return _then(_$VouchersImpl(
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as num,
      buyerId: freezed == buyerId
          ? _value.buyerId
          : buyerId // ignore: cast_nullable_to_non_nullable
              as String?,
      gifteeId: freezed == gifteeId
          ? _value.gifteeId
          : gifteeId // ignore: cast_nullable_to_non_nullable
              as String?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as VoucherStatus,
      redeemed: null == redeemed
          ? _value.redeemed
          : redeemed // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@HiveType(typeId: 15, adapterName: 'VouchersAdapter')
class _$VouchersImpl implements _Vouchers {
  _$VouchersImpl(
      {@HiveField(0) this.code,
      @HiveField(1) this.amount = 0,
      @HiveField(2) @JsonKey(name: 'buyer_id') this.buyerId,
      @HiveField(3) @JsonKey(name: 'giftee_id') this.gifteeId,
      @HiveField(4) this.status = VoucherStatus.inactive,
      @HiveField(5) this.redeemed = false,
      @HiveField(6)
      @JsonKey(name: 'created_at')
      @DateTimeSerializer()
      this.createdAt});

  factory _$VouchersImpl.fromJson(Map<String, dynamic> json) =>
      _$$VouchersImplFromJson(json);

  @override
  @HiveField(0)
  final String? code;
  @override
  @JsonKey()
  @HiveField(1)
  final num amount;
  @override
  @HiveField(2)
  @JsonKey(name: 'buyer_id')
  final String? buyerId;
  @override
  @HiveField(3)
  @JsonKey(name: 'giftee_id')
  final String? gifteeId;
  @override
  @JsonKey()
  @HiveField(4)
  final VoucherStatus status;
  @override
  @JsonKey()
  @HiveField(5)
  final bool redeemed;
  @override
  @HiveField(6)
  @JsonKey(name: 'created_at')
  @DateTimeSerializer()
  final DateTime? createdAt;

  @override
  String toString() {
    return 'Vouchers(code: $code, amount: $amount, buyerId: $buyerId, gifteeId: $gifteeId, status: $status, redeemed: $redeemed, createdAt: $createdAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VouchersImpl &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.buyerId, buyerId) || other.buyerId == buyerId) &&
            (identical(other.gifteeId, gifteeId) ||
                other.gifteeId == gifteeId) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.redeemed, redeemed) ||
                other.redeemed == redeemed) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, code, amount, buyerId, gifteeId,
      status, redeemed, createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$VouchersImplCopyWith<_$VouchersImpl> get copyWith =>
      __$$VouchersImplCopyWithImpl<_$VouchersImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VouchersImplToJson(
      this,
    );
  }
}

abstract class _Vouchers implements Vouchers {
  factory _Vouchers(
      {@HiveField(0) final String? code,
      @HiveField(1) final num amount,
      @HiveField(2) @JsonKey(name: 'buyer_id') final String? buyerId,
      @HiveField(3) @JsonKey(name: 'giftee_id') final String? gifteeId,
      @HiveField(4) final VoucherStatus status,
      @HiveField(5) final bool redeemed,
      @HiveField(6)
      @JsonKey(name: 'created_at')
      @DateTimeSerializer()
      final DateTime? createdAt}) = _$VouchersImpl;

  factory _Vouchers.fromJson(Map<String, dynamic> json) =
      _$VouchersImpl.fromJson;

  @override
  @HiveField(0)
  String? get code;
  @override
  @HiveField(1)
  num get amount;
  @override
  @HiveField(2)
  @JsonKey(name: 'buyer_id')
  String? get buyerId;
  @override
  @HiveField(3)
  @JsonKey(name: 'giftee_id')
  String? get gifteeId;
  @override
  @HiveField(4)
  VoucherStatus get status;
  @override
  @HiveField(5)
  bool get redeemed;
  @override
  @HiveField(6)
  @JsonKey(name: 'created_at')
  @DateTimeSerializer()
  DateTime? get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$VouchersImplCopyWith<_$VouchersImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
