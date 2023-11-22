// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Data _$DataFromJson(Map<String, dynamic> json) {
  return _Data.fromJson(json);
}

/// @nodoc
mixin _$Data {
  @JsonKey(name: '_id')
  String? get id => throw _privateConstructorUsedError;
  String? get business => throw _privateConstructorUsedError;
  Customer? get customer => throw _privateConstructorUsedError;
  Account? get account => throw _privateConstructorUsedError;
  FundingSource? get fundingSource => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;
  String? get brand => throw _privateConstructorUsedError;
  String? get currency => throw _privateConstructorUsedError;
  String? get maskedPan => throw _privateConstructorUsedError;
  String? get expiryMonth => throw _privateConstructorUsedError;
  String? get expiryYear => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'is2FAEnrolled')
  bool? get is2FaEnrolled => throw _privateConstructorUsedError;
  @JsonKey(name: 'isDefaultPINChanged')
  bool? get isDefaultPinChanged => throw _privateConstructorUsedError;
  bool? get isDeleted => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: '__v')
  int? get v => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DataCopyWith<Data> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DataCopyWith<$Res> {
  factory $DataCopyWith(Data value, $Res Function(Data) then) =
      _$DataCopyWithImpl<$Res, Data>;
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String? id,
      String? business,
      Customer? customer,
      Account? account,
      FundingSource? fundingSource,
      String? type,
      String? brand,
      String? currency,
      String? maskedPan,
      String? expiryMonth,
      String? expiryYear,
      String? status,
      @JsonKey(name: 'is2FAEnrolled') bool? is2FaEnrolled,
      @JsonKey(name: 'isDefaultPINChanged') bool? isDefaultPinChanged,
      bool? isDeleted,
      DateTime? createdAt,
      DateTime? updatedAt,
      @JsonKey(name: '__v') int? v});

  $CustomerCopyWith<$Res>? get customer;
  $AccountCopyWith<$Res>? get account;
  $FundingSourceCopyWith<$Res>? get fundingSource;
}

/// @nodoc
class _$DataCopyWithImpl<$Res, $Val extends Data>
    implements $DataCopyWith<$Res> {
  _$DataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? business = freezed,
    Object? customer = freezed,
    Object? account = freezed,
    Object? fundingSource = freezed,
    Object? type = freezed,
    Object? brand = freezed,
    Object? currency = freezed,
    Object? maskedPan = freezed,
    Object? expiryMonth = freezed,
    Object? expiryYear = freezed,
    Object? status = freezed,
    Object? is2FaEnrolled = freezed,
    Object? isDefaultPinChanged = freezed,
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
      customer: freezed == customer
          ? _value.customer
          : customer // ignore: cast_nullable_to_non_nullable
              as Customer?,
      account: freezed == account
          ? _value.account
          : account // ignore: cast_nullable_to_non_nullable
              as Account?,
      fundingSource: freezed == fundingSource
          ? _value.fundingSource
          : fundingSource // ignore: cast_nullable_to_non_nullable
              as FundingSource?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      brand: freezed == brand
          ? _value.brand
          : brand // ignore: cast_nullable_to_non_nullable
              as String?,
      currency: freezed == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String?,
      maskedPan: freezed == maskedPan
          ? _value.maskedPan
          : maskedPan // ignore: cast_nullable_to_non_nullable
              as String?,
      expiryMonth: freezed == expiryMonth
          ? _value.expiryMonth
          : expiryMonth // ignore: cast_nullable_to_non_nullable
              as String?,
      expiryYear: freezed == expiryYear
          ? _value.expiryYear
          : expiryYear // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      is2FaEnrolled: freezed == is2FaEnrolled
          ? _value.is2FaEnrolled
          : is2FaEnrolled // ignore: cast_nullable_to_non_nullable
              as bool?,
      isDefaultPinChanged: freezed == isDefaultPinChanged
          ? _value.isDefaultPinChanged
          : isDefaultPinChanged // ignore: cast_nullable_to_non_nullable
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

  @override
  @pragma('vm:prefer-inline')
  $CustomerCopyWith<$Res>? get customer {
    if (_value.customer == null) {
      return null;
    }

    return $CustomerCopyWith<$Res>(_value.customer!, (value) {
      return _then(_value.copyWith(customer: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $AccountCopyWith<$Res>? get account {
    if (_value.account == null) {
      return null;
    }

    return $AccountCopyWith<$Res>(_value.account!, (value) {
      return _then(_value.copyWith(account: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $FundingSourceCopyWith<$Res>? get fundingSource {
    if (_value.fundingSource == null) {
      return null;
    }

    return $FundingSourceCopyWith<$Res>(_value.fundingSource!, (value) {
      return _then(_value.copyWith(fundingSource: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DataImplCopyWith<$Res> implements $DataCopyWith<$Res> {
  factory _$$DataImplCopyWith(
          _$DataImpl value, $Res Function(_$DataImpl) then) =
      __$$DataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String? id,
      String? business,
      Customer? customer,
      Account? account,
      FundingSource? fundingSource,
      String? type,
      String? brand,
      String? currency,
      String? maskedPan,
      String? expiryMonth,
      String? expiryYear,
      String? status,
      @JsonKey(name: 'is2FAEnrolled') bool? is2FaEnrolled,
      @JsonKey(name: 'isDefaultPINChanged') bool? isDefaultPinChanged,
      bool? isDeleted,
      DateTime? createdAt,
      DateTime? updatedAt,
      @JsonKey(name: '__v') int? v});

  @override
  $CustomerCopyWith<$Res>? get customer;
  @override
  $AccountCopyWith<$Res>? get account;
  @override
  $FundingSourceCopyWith<$Res>? get fundingSource;
}

/// @nodoc
class __$$DataImplCopyWithImpl<$Res>
    extends _$DataCopyWithImpl<$Res, _$DataImpl>
    implements _$$DataImplCopyWith<$Res> {
  __$$DataImplCopyWithImpl(_$DataImpl _value, $Res Function(_$DataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? business = freezed,
    Object? customer = freezed,
    Object? account = freezed,
    Object? fundingSource = freezed,
    Object? type = freezed,
    Object? brand = freezed,
    Object? currency = freezed,
    Object? maskedPan = freezed,
    Object? expiryMonth = freezed,
    Object? expiryYear = freezed,
    Object? status = freezed,
    Object? is2FaEnrolled = freezed,
    Object? isDefaultPinChanged = freezed,
    Object? isDeleted = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? v = freezed,
  }) {
    return _then(_$DataImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      business: freezed == business
          ? _value.business
          : business // ignore: cast_nullable_to_non_nullable
              as String?,
      customer: freezed == customer
          ? _value.customer
          : customer // ignore: cast_nullable_to_non_nullable
              as Customer?,
      account: freezed == account
          ? _value.account
          : account // ignore: cast_nullable_to_non_nullable
              as Account?,
      fundingSource: freezed == fundingSource
          ? _value.fundingSource
          : fundingSource // ignore: cast_nullable_to_non_nullable
              as FundingSource?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      brand: freezed == brand
          ? _value.brand
          : brand // ignore: cast_nullable_to_non_nullable
              as String?,
      currency: freezed == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String?,
      maskedPan: freezed == maskedPan
          ? _value.maskedPan
          : maskedPan // ignore: cast_nullable_to_non_nullable
              as String?,
      expiryMonth: freezed == expiryMonth
          ? _value.expiryMonth
          : expiryMonth // ignore: cast_nullable_to_non_nullable
              as String?,
      expiryYear: freezed == expiryYear
          ? _value.expiryYear
          : expiryYear // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      is2FaEnrolled: freezed == is2FaEnrolled
          ? _value.is2FaEnrolled
          : is2FaEnrolled // ignore: cast_nullable_to_non_nullable
              as bool?,
      isDefaultPinChanged: freezed == isDefaultPinChanged
          ? _value.isDefaultPinChanged
          : isDefaultPinChanged // ignore: cast_nullable_to_non_nullable
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
class _$DataImpl implements _Data {
  _$DataImpl(
      {@JsonKey(name: '_id') this.id,
      this.business,
      this.customer,
      this.account,
      this.fundingSource,
      this.type,
      this.brand,
      this.currency,
      this.maskedPan,
      this.expiryMonth,
      this.expiryYear,
      this.status,
      @JsonKey(name: 'is2FAEnrolled') this.is2FaEnrolled,
      @JsonKey(name: 'isDefaultPINChanged') this.isDefaultPinChanged,
      this.isDeleted,
      this.createdAt,
      this.updatedAt,
      @JsonKey(name: '__v') this.v});

  factory _$DataImpl.fromJson(Map<String, dynamic> json) =>
      _$$DataImplFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String? id;
  @override
  final String? business;
  @override
  final Customer? customer;
  @override
  final Account? account;
  @override
  final FundingSource? fundingSource;
  @override
  final String? type;
  @override
  final String? brand;
  @override
  final String? currency;
  @override
  final String? maskedPan;
  @override
  final String? expiryMonth;
  @override
  final String? expiryYear;
  @override
  final String? status;
  @override
  @JsonKey(name: 'is2FAEnrolled')
  final bool? is2FaEnrolled;
  @override
  @JsonKey(name: 'isDefaultPINChanged')
  final bool? isDefaultPinChanged;
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
    return 'Data(id: $id, business: $business, customer: $customer, account: $account, fundingSource: $fundingSource, type: $type, brand: $brand, currency: $currency, maskedPan: $maskedPan, expiryMonth: $expiryMonth, expiryYear: $expiryYear, status: $status, is2FaEnrolled: $is2FaEnrolled, isDefaultPinChanged: $isDefaultPinChanged, isDeleted: $isDeleted, createdAt: $createdAt, updatedAt: $updatedAt, v: $v)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DataImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.business, business) ||
                other.business == business) &&
            (identical(other.customer, customer) ||
                other.customer == customer) &&
            (identical(other.account, account) || other.account == account) &&
            (identical(other.fundingSource, fundingSource) ||
                other.fundingSource == fundingSource) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.brand, brand) || other.brand == brand) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.maskedPan, maskedPan) ||
                other.maskedPan == maskedPan) &&
            (identical(other.expiryMonth, expiryMonth) ||
                other.expiryMonth == expiryMonth) &&
            (identical(other.expiryYear, expiryYear) ||
                other.expiryYear == expiryYear) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.is2FaEnrolled, is2FaEnrolled) ||
                other.is2FaEnrolled == is2FaEnrolled) &&
            (identical(other.isDefaultPinChanged, isDefaultPinChanged) ||
                other.isDefaultPinChanged == isDefaultPinChanged) &&
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
      customer,
      account,
      fundingSource,
      type,
      brand,
      currency,
      maskedPan,
      expiryMonth,
      expiryYear,
      status,
      is2FaEnrolled,
      isDefaultPinChanged,
      isDeleted,
      createdAt,
      updatedAt,
      v);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DataImplCopyWith<_$DataImpl> get copyWith =>
      __$$DataImplCopyWithImpl<_$DataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DataImplToJson(
      this,
    );
  }
}

abstract class _Data implements Data {
  factory _Data(
      {@JsonKey(name: '_id') final String? id,
      final String? business,
      final Customer? customer,
      final Account? account,
      final FundingSource? fundingSource,
      final String? type,
      final String? brand,
      final String? currency,
      final String? maskedPan,
      final String? expiryMonth,
      final String? expiryYear,
      final String? status,
      @JsonKey(name: 'is2FAEnrolled') final bool? is2FaEnrolled,
      @JsonKey(name: 'isDefaultPINChanged') final bool? isDefaultPinChanged,
      final bool? isDeleted,
      final DateTime? createdAt,
      final DateTime? updatedAt,
      @JsonKey(name: '__v') final int? v}) = _$DataImpl;

  factory _Data.fromJson(Map<String, dynamic> json) = _$DataImpl.fromJson;

  @override
  @JsonKey(name: '_id')
  String? get id;
  @override
  String? get business;
  @override
  Customer? get customer;
  @override
  Account? get account;
  @override
  FundingSource? get fundingSource;
  @override
  String? get type;
  @override
  String? get brand;
  @override
  String? get currency;
  @override
  String? get maskedPan;
  @override
  String? get expiryMonth;
  @override
  String? get expiryYear;
  @override
  String? get status;
  @override
  @JsonKey(name: 'is2FAEnrolled')
  bool? get is2FaEnrolled;
  @override
  @JsonKey(name: 'isDefaultPINChanged')
  bool? get isDefaultPinChanged;
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
  _$$DataImplCopyWith<_$DataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
