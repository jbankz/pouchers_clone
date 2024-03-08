// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'virtual_card_details.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

VirtualCardDetails _$VirtualCardDetailsFromJson(Map<String, dynamic> json) {
  return _VirtualCardDetails.fromJson(json);
}

/// @nodoc
mixin _$VirtualCardDetails {
  @JsonKey(name: '_id')
  String? get id => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;
  CardBrand? get brand => throw _privateConstructorUsedError;
  Currency? get currency => throw _privateConstructorUsedError;
  String? get maskedPan => throw _privateConstructorUsedError;
  String? get expiryMonth => throw _privateConstructorUsedError;
  String? get expiryYear => throw _privateConstructorUsedError;
  CardStatus? get status => throw _privateConstructorUsedError;
  bool get is2FAEnrolled => throw _privateConstructorUsedError;
  bool get isDefaultPINChanged => throw _privateConstructorUsedError;
  bool get disposable => throw _privateConstructorUsedError;
  String? get refundAccount => throw _privateConstructorUsedError;
  bool get isDeleted => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  @DateTimeSerializer()
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  @DateTimeSerializer()
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  Customer? get customer => throw _privateConstructorUsedError;
  Account? get account => throw _privateConstructorUsedError;
  FundingSource? get fundingSource => throw _privateConstructorUsedError;
  String? get cvv2 => throw _privateConstructorUsedError;
  String? get number => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VirtualCardDetailsCopyWith<VirtualCardDetails> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VirtualCardDetailsCopyWith<$Res> {
  factory $VirtualCardDetailsCopyWith(
          VirtualCardDetails value, $Res Function(VirtualCardDetails) then) =
      _$VirtualCardDetailsCopyWithImpl<$Res, VirtualCardDetails>;
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String? id,
      String? type,
      CardBrand? brand,
      Currency? currency,
      String? maskedPan,
      String? expiryMonth,
      String? expiryYear,
      CardStatus? status,
      bool is2FAEnrolled,
      bool isDefaultPINChanged,
      bool disposable,
      String? refundAccount,
      bool isDeleted,
      @JsonKey(name: 'created_at') @DateTimeSerializer() DateTime? createdAt,
      @JsonKey(name: 'updated_at') @DateTimeSerializer() DateTime? updatedAt,
      Customer? customer,
      Account? account,
      FundingSource? fundingSource,
      String? cvv2,
      String? number});

  $CustomerCopyWith<$Res>? get customer;
  $AccountCopyWith<$Res>? get account;
  $FundingSourceCopyWith<$Res>? get fundingSource;
}

/// @nodoc
class _$VirtualCardDetailsCopyWithImpl<$Res, $Val extends VirtualCardDetails>
    implements $VirtualCardDetailsCopyWith<$Res> {
  _$VirtualCardDetailsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? type = freezed,
    Object? brand = freezed,
    Object? currency = freezed,
    Object? maskedPan = freezed,
    Object? expiryMonth = freezed,
    Object? expiryYear = freezed,
    Object? status = freezed,
    Object? is2FAEnrolled = null,
    Object? isDefaultPINChanged = null,
    Object? disposable = null,
    Object? refundAccount = freezed,
    Object? isDeleted = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? customer = freezed,
    Object? account = freezed,
    Object? fundingSource = freezed,
    Object? cvv2 = freezed,
    Object? number = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      brand: freezed == brand
          ? _value.brand
          : brand // ignore: cast_nullable_to_non_nullable
              as CardBrand?,
      currency: freezed == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as Currency?,
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
              as CardStatus?,
      is2FAEnrolled: null == is2FAEnrolled
          ? _value.is2FAEnrolled
          : is2FAEnrolled // ignore: cast_nullable_to_non_nullable
              as bool,
      isDefaultPINChanged: null == isDefaultPINChanged
          ? _value.isDefaultPINChanged
          : isDefaultPINChanged // ignore: cast_nullable_to_non_nullable
              as bool,
      disposable: null == disposable
          ? _value.disposable
          : disposable // ignore: cast_nullable_to_non_nullable
              as bool,
      refundAccount: freezed == refundAccount
          ? _value.refundAccount
          : refundAccount // ignore: cast_nullable_to_non_nullable
              as String?,
      isDeleted: null == isDeleted
          ? _value.isDeleted
          : isDeleted // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
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
      cvv2: freezed == cvv2
          ? _value.cvv2
          : cvv2 // ignore: cast_nullable_to_non_nullable
              as String?,
      number: freezed == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as String?,
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
abstract class _$$VirtualCardDetailsImplCopyWith<$Res>
    implements $VirtualCardDetailsCopyWith<$Res> {
  factory _$$VirtualCardDetailsImplCopyWith(_$VirtualCardDetailsImpl value,
          $Res Function(_$VirtualCardDetailsImpl) then) =
      __$$VirtualCardDetailsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String? id,
      String? type,
      CardBrand? brand,
      Currency? currency,
      String? maskedPan,
      String? expiryMonth,
      String? expiryYear,
      CardStatus? status,
      bool is2FAEnrolled,
      bool isDefaultPINChanged,
      bool disposable,
      String? refundAccount,
      bool isDeleted,
      @JsonKey(name: 'created_at') @DateTimeSerializer() DateTime? createdAt,
      @JsonKey(name: 'updated_at') @DateTimeSerializer() DateTime? updatedAt,
      Customer? customer,
      Account? account,
      FundingSource? fundingSource,
      String? cvv2,
      String? number});

  @override
  $CustomerCopyWith<$Res>? get customer;
  @override
  $AccountCopyWith<$Res>? get account;
  @override
  $FundingSourceCopyWith<$Res>? get fundingSource;
}

/// @nodoc
class __$$VirtualCardDetailsImplCopyWithImpl<$Res>
    extends _$VirtualCardDetailsCopyWithImpl<$Res, _$VirtualCardDetailsImpl>
    implements _$$VirtualCardDetailsImplCopyWith<$Res> {
  __$$VirtualCardDetailsImplCopyWithImpl(_$VirtualCardDetailsImpl _value,
      $Res Function(_$VirtualCardDetailsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? type = freezed,
    Object? brand = freezed,
    Object? currency = freezed,
    Object? maskedPan = freezed,
    Object? expiryMonth = freezed,
    Object? expiryYear = freezed,
    Object? status = freezed,
    Object? is2FAEnrolled = null,
    Object? isDefaultPINChanged = null,
    Object? disposable = null,
    Object? refundAccount = freezed,
    Object? isDeleted = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? customer = freezed,
    Object? account = freezed,
    Object? fundingSource = freezed,
    Object? cvv2 = freezed,
    Object? number = freezed,
  }) {
    return _then(_$VirtualCardDetailsImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      brand: freezed == brand
          ? _value.brand
          : brand // ignore: cast_nullable_to_non_nullable
              as CardBrand?,
      currency: freezed == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as Currency?,
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
              as CardStatus?,
      is2FAEnrolled: null == is2FAEnrolled
          ? _value.is2FAEnrolled
          : is2FAEnrolled // ignore: cast_nullable_to_non_nullable
              as bool,
      isDefaultPINChanged: null == isDefaultPINChanged
          ? _value.isDefaultPINChanged
          : isDefaultPINChanged // ignore: cast_nullable_to_non_nullable
              as bool,
      disposable: null == disposable
          ? _value.disposable
          : disposable // ignore: cast_nullable_to_non_nullable
              as bool,
      refundAccount: freezed == refundAccount
          ? _value.refundAccount
          : refundAccount // ignore: cast_nullable_to_non_nullable
              as String?,
      isDeleted: null == isDeleted
          ? _value.isDeleted
          : isDeleted // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
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
      cvv2: freezed == cvv2
          ? _value.cvv2
          : cvv2 // ignore: cast_nullable_to_non_nullable
              as String?,
      number: freezed == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VirtualCardDetailsImpl implements _VirtualCardDetails {
  _$VirtualCardDetailsImpl(
      {@JsonKey(name: '_id') this.id,
      this.type,
      this.brand,
      this.currency,
      this.maskedPan,
      this.expiryMonth,
      this.expiryYear,
      this.status = CardStatus.active,
      this.is2FAEnrolled = false,
      this.isDefaultPINChanged = false,
      this.disposable = false,
      this.refundAccount,
      this.isDeleted = false,
      @JsonKey(name: 'created_at') @DateTimeSerializer() this.createdAt,
      @JsonKey(name: 'updated_at') @DateTimeSerializer() this.updatedAt,
      this.customer,
      this.account,
      this.fundingSource,
      this.cvv2,
      this.number});

  factory _$VirtualCardDetailsImpl.fromJson(Map<String, dynamic> json) =>
      _$$VirtualCardDetailsImplFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String? id;
  @override
  final String? type;
  @override
  final CardBrand? brand;
  @override
  final Currency? currency;
  @override
  final String? maskedPan;
  @override
  final String? expiryMonth;
  @override
  final String? expiryYear;
  @override
  @JsonKey()
  final CardStatus? status;
  @override
  @JsonKey()
  final bool is2FAEnrolled;
  @override
  @JsonKey()
  final bool isDefaultPINChanged;
  @override
  @JsonKey()
  final bool disposable;
  @override
  final String? refundAccount;
  @override
  @JsonKey()
  final bool isDeleted;
  @override
  @JsonKey(name: 'created_at')
  @DateTimeSerializer()
  final DateTime? createdAt;
  @override
  @JsonKey(name: 'updated_at')
  @DateTimeSerializer()
  final DateTime? updatedAt;
  @override
  final Customer? customer;
  @override
  final Account? account;
  @override
  final FundingSource? fundingSource;
  @override
  final String? cvv2;
  @override
  final String? number;

  @override
  String toString() {
    return 'VirtualCardDetails(id: $id, type: $type, brand: $brand, currency: $currency, maskedPan: $maskedPan, expiryMonth: $expiryMonth, expiryYear: $expiryYear, status: $status, is2FAEnrolled: $is2FAEnrolled, isDefaultPINChanged: $isDefaultPINChanged, disposable: $disposable, refundAccount: $refundAccount, isDeleted: $isDeleted, createdAt: $createdAt, updatedAt: $updatedAt, customer: $customer, account: $account, fundingSource: $fundingSource, cvv2: $cvv2, number: $number)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VirtualCardDetailsImpl &&
            (identical(other.id, id) || other.id == id) &&
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
            (identical(other.is2FAEnrolled, is2FAEnrolled) ||
                other.is2FAEnrolled == is2FAEnrolled) &&
            (identical(other.isDefaultPINChanged, isDefaultPINChanged) ||
                other.isDefaultPINChanged == isDefaultPINChanged) &&
            (identical(other.disposable, disposable) ||
                other.disposable == disposable) &&
            (identical(other.refundAccount, refundAccount) ||
                other.refundAccount == refundAccount) &&
            (identical(other.isDeleted, isDeleted) ||
                other.isDeleted == isDeleted) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.customer, customer) ||
                other.customer == customer) &&
            (identical(other.account, account) || other.account == account) &&
            (identical(other.fundingSource, fundingSource) ||
                other.fundingSource == fundingSource) &&
            (identical(other.cvv2, cvv2) || other.cvv2 == cvv2) &&
            (identical(other.number, number) || other.number == number));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        type,
        brand,
        currency,
        maskedPan,
        expiryMonth,
        expiryYear,
        status,
        is2FAEnrolled,
        isDefaultPINChanged,
        disposable,
        refundAccount,
        isDeleted,
        createdAt,
        updatedAt,
        customer,
        account,
        fundingSource,
        cvv2,
        number
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$VirtualCardDetailsImplCopyWith<_$VirtualCardDetailsImpl> get copyWith =>
      __$$VirtualCardDetailsImplCopyWithImpl<_$VirtualCardDetailsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VirtualCardDetailsImplToJson(
      this,
    );
  }
}

abstract class _VirtualCardDetails implements VirtualCardDetails {
  factory _VirtualCardDetails(
      {@JsonKey(name: '_id') final String? id,
      final String? type,
      final CardBrand? brand,
      final Currency? currency,
      final String? maskedPan,
      final String? expiryMonth,
      final String? expiryYear,
      final CardStatus? status,
      final bool is2FAEnrolled,
      final bool isDefaultPINChanged,
      final bool disposable,
      final String? refundAccount,
      final bool isDeleted,
      @JsonKey(name: 'created_at')
      @DateTimeSerializer()
      final DateTime? createdAt,
      @JsonKey(name: 'updated_at')
      @DateTimeSerializer()
      final DateTime? updatedAt,
      final Customer? customer,
      final Account? account,
      final FundingSource? fundingSource,
      final String? cvv2,
      final String? number}) = _$VirtualCardDetailsImpl;

  factory _VirtualCardDetails.fromJson(Map<String, dynamic> json) =
      _$VirtualCardDetailsImpl.fromJson;

  @override
  @JsonKey(name: '_id')
  String? get id;
  @override
  String? get type;
  @override
  CardBrand? get brand;
  @override
  Currency? get currency;
  @override
  String? get maskedPan;
  @override
  String? get expiryMonth;
  @override
  String? get expiryYear;
  @override
  CardStatus? get status;
  @override
  bool get is2FAEnrolled;
  @override
  bool get isDefaultPINChanged;
  @override
  bool get disposable;
  @override
  String? get refundAccount;
  @override
  bool get isDeleted;
  @override
  @JsonKey(name: 'created_at')
  @DateTimeSerializer()
  DateTime? get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  @DateTimeSerializer()
  DateTime? get updatedAt;
  @override
  Customer? get customer;
  @override
  Account? get account;
  @override
  FundingSource? get fundingSource;
  @override
  String? get cvv2;
  @override
  String? get number;
  @override
  @JsonKey(ignore: true)
  _$$VirtualCardDetailsImplCopyWith<_$VirtualCardDetailsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Customer _$CustomerFromJson(Map<String, dynamic> json) {
  return _Customer.fromJson(json);
}

/// @nodoc
mixin _$Customer {
  @JsonKey(name: '_id')
  String? get id => throw _privateConstructorUsedError;
  String? get business => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get phoneNumber => throw _privateConstructorUsedError;
  String? get emailAddress => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  Individual? get individual => throw _privateConstructorUsedError;
  BillingAddress? get billingAddress => throw _privateConstructorUsedError;
  bool get isDeleted => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  @DateTimeSerializer()
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  @DateTimeSerializer()
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CustomerCopyWith<Customer> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomerCopyWith<$Res> {
  factory $CustomerCopyWith(Customer value, $Res Function(Customer) then) =
      _$CustomerCopyWithImpl<$Res, Customer>;
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String? id,
      String? business,
      String? type,
      String? name,
      String? phoneNumber,
      String? emailAddress,
      String? status,
      Individual? individual,
      BillingAddress? billingAddress,
      bool isDeleted,
      @JsonKey(name: 'created_at') @DateTimeSerializer() DateTime? createdAt,
      @JsonKey(name: 'updated_at') @DateTimeSerializer() DateTime? updatedAt});

  $IndividualCopyWith<$Res>? get individual;
  $BillingAddressCopyWith<$Res>? get billingAddress;
}

/// @nodoc
class _$CustomerCopyWithImpl<$Res, $Val extends Customer>
    implements $CustomerCopyWith<$Res> {
  _$CustomerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? business = freezed,
    Object? type = freezed,
    Object? name = freezed,
    Object? phoneNumber = freezed,
    Object? emailAddress = freezed,
    Object? status = freezed,
    Object? individual = freezed,
    Object? billingAddress = freezed,
    Object? isDeleted = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
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
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      emailAddress: freezed == emailAddress
          ? _value.emailAddress
          : emailAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      individual: freezed == individual
          ? _value.individual
          : individual // ignore: cast_nullable_to_non_nullable
              as Individual?,
      billingAddress: freezed == billingAddress
          ? _value.billingAddress
          : billingAddress // ignore: cast_nullable_to_non_nullable
              as BillingAddress?,
      isDeleted: null == isDeleted
          ? _value.isDeleted
          : isDeleted // ignore: cast_nullable_to_non_nullable
              as bool,
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

  @override
  @pragma('vm:prefer-inline')
  $IndividualCopyWith<$Res>? get individual {
    if (_value.individual == null) {
      return null;
    }

    return $IndividualCopyWith<$Res>(_value.individual!, (value) {
      return _then(_value.copyWith(individual: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $BillingAddressCopyWith<$Res>? get billingAddress {
    if (_value.billingAddress == null) {
      return null;
    }

    return $BillingAddressCopyWith<$Res>(_value.billingAddress!, (value) {
      return _then(_value.copyWith(billingAddress: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CustomerImplCopyWith<$Res>
    implements $CustomerCopyWith<$Res> {
  factory _$$CustomerImplCopyWith(
          _$CustomerImpl value, $Res Function(_$CustomerImpl) then) =
      __$$CustomerImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String? id,
      String? business,
      String? type,
      String? name,
      String? phoneNumber,
      String? emailAddress,
      String? status,
      Individual? individual,
      BillingAddress? billingAddress,
      bool isDeleted,
      @JsonKey(name: 'created_at') @DateTimeSerializer() DateTime? createdAt,
      @JsonKey(name: 'updated_at') @DateTimeSerializer() DateTime? updatedAt});

  @override
  $IndividualCopyWith<$Res>? get individual;
  @override
  $BillingAddressCopyWith<$Res>? get billingAddress;
}

/// @nodoc
class __$$CustomerImplCopyWithImpl<$Res>
    extends _$CustomerCopyWithImpl<$Res, _$CustomerImpl>
    implements _$$CustomerImplCopyWith<$Res> {
  __$$CustomerImplCopyWithImpl(
      _$CustomerImpl _value, $Res Function(_$CustomerImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? business = freezed,
    Object? type = freezed,
    Object? name = freezed,
    Object? phoneNumber = freezed,
    Object? emailAddress = freezed,
    Object? status = freezed,
    Object? individual = freezed,
    Object? billingAddress = freezed,
    Object? isDeleted = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$CustomerImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      business: freezed == business
          ? _value.business
          : business // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      emailAddress: freezed == emailAddress
          ? _value.emailAddress
          : emailAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      individual: freezed == individual
          ? _value.individual
          : individual // ignore: cast_nullable_to_non_nullable
              as Individual?,
      billingAddress: freezed == billingAddress
          ? _value.billingAddress
          : billingAddress // ignore: cast_nullable_to_non_nullable
              as BillingAddress?,
      isDeleted: null == isDeleted
          ? _value.isDeleted
          : isDeleted // ignore: cast_nullable_to_non_nullable
              as bool,
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
class _$CustomerImpl implements _Customer {
  _$CustomerImpl(
      {@JsonKey(name: '_id') this.id,
      this.business,
      this.type,
      this.name,
      this.phoneNumber,
      this.emailAddress,
      this.status,
      this.individual,
      this.billingAddress,
      this.isDeleted = false,
      @JsonKey(name: 'created_at') @DateTimeSerializer() this.createdAt,
      @JsonKey(name: 'updated_at') @DateTimeSerializer() this.updatedAt});

  factory _$CustomerImpl.fromJson(Map<String, dynamic> json) =>
      _$$CustomerImplFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String? id;
  @override
  final String? business;
  @override
  final String? type;
  @override
  final String? name;
  @override
  final String? phoneNumber;
  @override
  final String? emailAddress;
  @override
  final String? status;
  @override
  final Individual? individual;
  @override
  final BillingAddress? billingAddress;
  @override
  @JsonKey()
  final bool isDeleted;
  @override
  @JsonKey(name: 'created_at')
  @DateTimeSerializer()
  final DateTime? createdAt;
  @override
  @JsonKey(name: 'updated_at')
  @DateTimeSerializer()
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'Customer(id: $id, business: $business, type: $type, name: $name, phoneNumber: $phoneNumber, emailAddress: $emailAddress, status: $status, individual: $individual, billingAddress: $billingAddress, isDeleted: $isDeleted, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CustomerImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.business, business) ||
                other.business == business) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.emailAddress, emailAddress) ||
                other.emailAddress == emailAddress) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.individual, individual) ||
                other.individual == individual) &&
            (identical(other.billingAddress, billingAddress) ||
                other.billingAddress == billingAddress) &&
            (identical(other.isDeleted, isDeleted) ||
                other.isDeleted == isDeleted) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      business,
      type,
      name,
      phoneNumber,
      emailAddress,
      status,
      individual,
      billingAddress,
      isDeleted,
      createdAt,
      updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CustomerImplCopyWith<_$CustomerImpl> get copyWith =>
      __$$CustomerImplCopyWithImpl<_$CustomerImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CustomerImplToJson(
      this,
    );
  }
}

abstract class _Customer implements Customer {
  factory _Customer(
      {@JsonKey(name: '_id') final String? id,
      final String? business,
      final String? type,
      final String? name,
      final String? phoneNumber,
      final String? emailAddress,
      final String? status,
      final Individual? individual,
      final BillingAddress? billingAddress,
      final bool isDeleted,
      @JsonKey(name: 'created_at')
      @DateTimeSerializer()
      final DateTime? createdAt,
      @JsonKey(name: 'updated_at')
      @DateTimeSerializer()
      final DateTime? updatedAt}) = _$CustomerImpl;

  factory _Customer.fromJson(Map<String, dynamic> json) =
      _$CustomerImpl.fromJson;

  @override
  @JsonKey(name: '_id')
  String? get id;
  @override
  String? get business;
  @override
  String? get type;
  @override
  String? get name;
  @override
  String? get phoneNumber;
  @override
  String? get emailAddress;
  @override
  String? get status;
  @override
  Individual? get individual;
  @override
  BillingAddress? get billingAddress;
  @override
  bool get isDeleted;
  @override
  @JsonKey(name: 'created_at')
  @DateTimeSerializer()
  DateTime? get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  @DateTimeSerializer()
  DateTime? get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$CustomerImplCopyWith<_$CustomerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Individual _$IndividualFromJson(Map<String, dynamic> json) {
  return _Individual.fromJson(json);
}

/// @nodoc
mixin _$Individual {
  @JsonKey(name: '_id')
  String? get id => throw _privateConstructorUsedError;
  String? get firstName => throw _privateConstructorUsedError;
  String? get lastName => throw _privateConstructorUsedError;
  String? get dob => throw _privateConstructorUsedError;
  Identity? get identity => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $IndividualCopyWith<Individual> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IndividualCopyWith<$Res> {
  factory $IndividualCopyWith(
          Individual value, $Res Function(Individual) then) =
      _$IndividualCopyWithImpl<$Res, Individual>;
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String? id,
      String? firstName,
      String? lastName,
      String? dob,
      Identity? identity});

  $IdentityCopyWith<$Res>? get identity;
}

/// @nodoc
class _$IndividualCopyWithImpl<$Res, $Val extends Individual>
    implements $IndividualCopyWith<$Res> {
  _$IndividualCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? dob = freezed,
    Object? identity = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      dob: freezed == dob
          ? _value.dob
          : dob // ignore: cast_nullable_to_non_nullable
              as String?,
      identity: freezed == identity
          ? _value.identity
          : identity // ignore: cast_nullable_to_non_nullable
              as Identity?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $IdentityCopyWith<$Res>? get identity {
    if (_value.identity == null) {
      return null;
    }

    return $IdentityCopyWith<$Res>(_value.identity!, (value) {
      return _then(_value.copyWith(identity: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$IndividualImplCopyWith<$Res>
    implements $IndividualCopyWith<$Res> {
  factory _$$IndividualImplCopyWith(
          _$IndividualImpl value, $Res Function(_$IndividualImpl) then) =
      __$$IndividualImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String? id,
      String? firstName,
      String? lastName,
      String? dob,
      Identity? identity});

  @override
  $IdentityCopyWith<$Res>? get identity;
}

/// @nodoc
class __$$IndividualImplCopyWithImpl<$Res>
    extends _$IndividualCopyWithImpl<$Res, _$IndividualImpl>
    implements _$$IndividualImplCopyWith<$Res> {
  __$$IndividualImplCopyWithImpl(
      _$IndividualImpl _value, $Res Function(_$IndividualImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? dob = freezed,
    Object? identity = freezed,
  }) {
    return _then(_$IndividualImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      dob: freezed == dob
          ? _value.dob
          : dob // ignore: cast_nullable_to_non_nullable
              as String?,
      identity: freezed == identity
          ? _value.identity
          : identity // ignore: cast_nullable_to_non_nullable
              as Identity?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$IndividualImpl implements _Individual {
  _$IndividualImpl(
      {@JsonKey(name: '_id') this.id,
      this.firstName,
      this.lastName,
      this.dob,
      this.identity});

  factory _$IndividualImpl.fromJson(Map<String, dynamic> json) =>
      _$$IndividualImplFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String? id;
  @override
  final String? firstName;
  @override
  final String? lastName;
  @override
  final String? dob;
  @override
  final Identity? identity;

  @override
  String toString() {
    return 'Individual(id: $id, firstName: $firstName, lastName: $lastName, dob: $dob, identity: $identity)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IndividualImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.dob, dob) || other.dob == dob) &&
            (identical(other.identity, identity) ||
                other.identity == identity));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, firstName, lastName, dob, identity);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$IndividualImplCopyWith<_$IndividualImpl> get copyWith =>
      __$$IndividualImplCopyWithImpl<_$IndividualImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$IndividualImplToJson(
      this,
    );
  }
}

abstract class _Individual implements Individual {
  factory _Individual(
      {@JsonKey(name: '_id') final String? id,
      final String? firstName,
      final String? lastName,
      final String? dob,
      final Identity? identity}) = _$IndividualImpl;

  factory _Individual.fromJson(Map<String, dynamic> json) =
      _$IndividualImpl.fromJson;

  @override
  @JsonKey(name: '_id')
  String? get id;
  @override
  String? get firstName;
  @override
  String? get lastName;
  @override
  String? get dob;
  @override
  Identity? get identity;
  @override
  @JsonKey(ignore: true)
  _$$IndividualImplCopyWith<_$IndividualImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Identity _$IdentityFromJson(Map<String, dynamic> json) {
  return _Identity.fromJson(json);
}

/// @nodoc
mixin _$Identity {
  @JsonKey(name: '_id')
  String? get id => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;
  String? get number => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $IdentityCopyWith<Identity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IdentityCopyWith<$Res> {
  factory $IdentityCopyWith(Identity value, $Res Function(Identity) then) =
      _$IdentityCopyWithImpl<$Res, Identity>;
  @useResult
  $Res call({@JsonKey(name: '_id') String? id, String? type, String? number});
}

/// @nodoc
class _$IdentityCopyWithImpl<$Res, $Val extends Identity>
    implements $IdentityCopyWith<$Res> {
  _$IdentityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? type = freezed,
    Object? number = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      number: freezed == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$IdentityImplCopyWith<$Res>
    implements $IdentityCopyWith<$Res> {
  factory _$$IdentityImplCopyWith(
          _$IdentityImpl value, $Res Function(_$IdentityImpl) then) =
      __$$IdentityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: '_id') String? id, String? type, String? number});
}

/// @nodoc
class __$$IdentityImplCopyWithImpl<$Res>
    extends _$IdentityCopyWithImpl<$Res, _$IdentityImpl>
    implements _$$IdentityImplCopyWith<$Res> {
  __$$IdentityImplCopyWithImpl(
      _$IdentityImpl _value, $Res Function(_$IdentityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? type = freezed,
    Object? number = freezed,
  }) {
    return _then(_$IdentityImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      number: freezed == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$IdentityImpl implements _Identity {
  _$IdentityImpl({@JsonKey(name: '_id') this.id, this.type, this.number});

  factory _$IdentityImpl.fromJson(Map<String, dynamic> json) =>
      _$$IdentityImplFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String? id;
  @override
  final String? type;
  @override
  final String? number;

  @override
  String toString() {
    return 'Identity(id: $id, type: $type, number: $number)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IdentityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.number, number) || other.number == number));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, type, number);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$IdentityImplCopyWith<_$IdentityImpl> get copyWith =>
      __$$IdentityImplCopyWithImpl<_$IdentityImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$IdentityImplToJson(
      this,
    );
  }
}

abstract class _Identity implements Identity {
  factory _Identity(
      {@JsonKey(name: '_id') final String? id,
      final String? type,
      final String? number}) = _$IdentityImpl;

  factory _Identity.fromJson(Map<String, dynamic> json) =
      _$IdentityImpl.fromJson;

  @override
  @JsonKey(name: '_id')
  String? get id;
  @override
  String? get type;
  @override
  String? get number;
  @override
  @JsonKey(ignore: true)
  _$$IdentityImplCopyWith<_$IdentityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

BillingAddress _$BillingAddressFromJson(Map<String, dynamic> json) {
  return _BillingAddress.fromJson(json);
}

/// @nodoc
mixin _$BillingAddress {
  @JsonKey(name: '_id')
  String? get id => throw _privateConstructorUsedError;
  String? get line1 => throw _privateConstructorUsedError;
  String? get city => throw _privateConstructorUsedError;
  String? get state => throw _privateConstructorUsedError;
  String? get country => throw _privateConstructorUsedError;
  String? get postalCode => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BillingAddressCopyWith<BillingAddress> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BillingAddressCopyWith<$Res> {
  factory $BillingAddressCopyWith(
          BillingAddress value, $Res Function(BillingAddress) then) =
      _$BillingAddressCopyWithImpl<$Res, BillingAddress>;
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String? id,
      String? line1,
      String? city,
      String? state,
      String? country,
      String? postalCode});
}

/// @nodoc
class _$BillingAddressCopyWithImpl<$Res, $Val extends BillingAddress>
    implements $BillingAddressCopyWith<$Res> {
  _$BillingAddressCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? line1 = freezed,
    Object? city = freezed,
    Object? state = freezed,
    Object? country = freezed,
    Object? postalCode = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      line1: freezed == line1
          ? _value.line1
          : line1 // ignore: cast_nullable_to_non_nullable
              as String?,
      city: freezed == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
      state: freezed == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String?,
      country: freezed == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
      postalCode: freezed == postalCode
          ? _value.postalCode
          : postalCode // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BillingAddressImplCopyWith<$Res>
    implements $BillingAddressCopyWith<$Res> {
  factory _$$BillingAddressImplCopyWith(_$BillingAddressImpl value,
          $Res Function(_$BillingAddressImpl) then) =
      __$$BillingAddressImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String? id,
      String? line1,
      String? city,
      String? state,
      String? country,
      String? postalCode});
}

/// @nodoc
class __$$BillingAddressImplCopyWithImpl<$Res>
    extends _$BillingAddressCopyWithImpl<$Res, _$BillingAddressImpl>
    implements _$$BillingAddressImplCopyWith<$Res> {
  __$$BillingAddressImplCopyWithImpl(
      _$BillingAddressImpl _value, $Res Function(_$BillingAddressImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? line1 = freezed,
    Object? city = freezed,
    Object? state = freezed,
    Object? country = freezed,
    Object? postalCode = freezed,
  }) {
    return _then(_$BillingAddressImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      line1: freezed == line1
          ? _value.line1
          : line1 // ignore: cast_nullable_to_non_nullable
              as String?,
      city: freezed == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
      state: freezed == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String?,
      country: freezed == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
      postalCode: freezed == postalCode
          ? _value.postalCode
          : postalCode // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BillingAddressImpl implements _BillingAddress {
  _$BillingAddressImpl(
      {@JsonKey(name: '_id') this.id,
      this.line1,
      this.city,
      this.state,
      this.country,
      this.postalCode});

  factory _$BillingAddressImpl.fromJson(Map<String, dynamic> json) =>
      _$$BillingAddressImplFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String? id;
  @override
  final String? line1;
  @override
  final String? city;
  @override
  final String? state;
  @override
  final String? country;
  @override
  final String? postalCode;

  @override
  String toString() {
    return 'BillingAddress(id: $id, line1: $line1, city: $city, state: $state, country: $country, postalCode: $postalCode)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BillingAddressImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.line1, line1) || other.line1 == line1) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.country, country) || other.country == country) &&
            (identical(other.postalCode, postalCode) ||
                other.postalCode == postalCode));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, line1, city, state, country, postalCode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BillingAddressImplCopyWith<_$BillingAddressImpl> get copyWith =>
      __$$BillingAddressImplCopyWithImpl<_$BillingAddressImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BillingAddressImplToJson(
      this,
    );
  }
}

abstract class _BillingAddress implements BillingAddress {
  factory _BillingAddress(
      {@JsonKey(name: '_id') final String? id,
      final String? line1,
      final String? city,
      final String? state,
      final String? country,
      final String? postalCode}) = _$BillingAddressImpl;

  factory _BillingAddress.fromJson(Map<String, dynamic> json) =
      _$BillingAddressImpl.fromJson;

  @override
  @JsonKey(name: '_id')
  String? get id;
  @override
  String? get line1;
  @override
  String? get city;
  @override
  String? get state;
  @override
  String? get country;
  @override
  String? get postalCode;
  @override
  @JsonKey(ignore: true)
  _$$BillingAddressImplCopyWith<_$BillingAddressImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Account _$AccountFromJson(Map<String, dynamic> json) {
  return _Account.fromJson(json);
}

/// @nodoc
mixin _$Account {
  @JsonKey(name: '_id')
  String? get id => throw _privateConstructorUsedError;
  String? get business => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;
  Currency get currency => throw _privateConstructorUsedError;
  String? get accountName => throw _privateConstructorUsedError;
  String? get bankCode => throw _privateConstructorUsedError;
  String? get accountType => throw _privateConstructorUsedError;
  String? get accountNumber => throw _privateConstructorUsedError;
  num get currentBalance => throw _privateConstructorUsedError;
  num get availableBalance => throw _privateConstructorUsedError;
  String? get provider => throw _privateConstructorUsedError;
  String? get providerReference => throw _privateConstructorUsedError;
  String? get referenceCode => throw _privateConstructorUsedError;
  bool get reloadable => throw _privateConstructorUsedError;
  bool get isDefault => throw _privateConstructorUsedError;
  bool get isDeleted => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  @DateTimeSerializer()
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  @DateTimeSerializer()
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  List<dynamic> get charges => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AccountCopyWith<Account> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccountCopyWith<$Res> {
  factory $AccountCopyWith(Account value, $Res Function(Account) then) =
      _$AccountCopyWithImpl<$Res, Account>;
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String? id,
      String? business,
      String? type,
      Currency currency,
      String? accountName,
      String? bankCode,
      String? accountType,
      String? accountNumber,
      num currentBalance,
      num availableBalance,
      String? provider,
      String? providerReference,
      String? referenceCode,
      bool reloadable,
      bool isDefault,
      bool isDeleted,
      @JsonKey(name: 'created_at') @DateTimeSerializer() DateTime? createdAt,
      @JsonKey(name: 'updated_at') @DateTimeSerializer() DateTime? updatedAt,
      List<dynamic> charges});
}

/// @nodoc
class _$AccountCopyWithImpl<$Res, $Val extends Account>
    implements $AccountCopyWith<$Res> {
  _$AccountCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? business = freezed,
    Object? type = freezed,
    Object? currency = null,
    Object? accountName = freezed,
    Object? bankCode = freezed,
    Object? accountType = freezed,
    Object? accountNumber = freezed,
    Object? currentBalance = null,
    Object? availableBalance = null,
    Object? provider = freezed,
    Object? providerReference = freezed,
    Object? referenceCode = freezed,
    Object? reloadable = null,
    Object? isDefault = null,
    Object? isDeleted = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? charges = null,
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
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as Currency,
      accountName: freezed == accountName
          ? _value.accountName
          : accountName // ignore: cast_nullable_to_non_nullable
              as String?,
      bankCode: freezed == bankCode
          ? _value.bankCode
          : bankCode // ignore: cast_nullable_to_non_nullable
              as String?,
      accountType: freezed == accountType
          ? _value.accountType
          : accountType // ignore: cast_nullable_to_non_nullable
              as String?,
      accountNumber: freezed == accountNumber
          ? _value.accountNumber
          : accountNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      currentBalance: null == currentBalance
          ? _value.currentBalance
          : currentBalance // ignore: cast_nullable_to_non_nullable
              as num,
      availableBalance: null == availableBalance
          ? _value.availableBalance
          : availableBalance // ignore: cast_nullable_to_non_nullable
              as num,
      provider: freezed == provider
          ? _value.provider
          : provider // ignore: cast_nullable_to_non_nullable
              as String?,
      providerReference: freezed == providerReference
          ? _value.providerReference
          : providerReference // ignore: cast_nullable_to_non_nullable
              as String?,
      referenceCode: freezed == referenceCode
          ? _value.referenceCode
          : referenceCode // ignore: cast_nullable_to_non_nullable
              as String?,
      reloadable: null == reloadable
          ? _value.reloadable
          : reloadable // ignore: cast_nullable_to_non_nullable
              as bool,
      isDefault: null == isDefault
          ? _value.isDefault
          : isDefault // ignore: cast_nullable_to_non_nullable
              as bool,
      isDeleted: null == isDeleted
          ? _value.isDeleted
          : isDeleted // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      charges: null == charges
          ? _value.charges
          : charges // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AccountImplCopyWith<$Res> implements $AccountCopyWith<$Res> {
  factory _$$AccountImplCopyWith(
          _$AccountImpl value, $Res Function(_$AccountImpl) then) =
      __$$AccountImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String? id,
      String? business,
      String? type,
      Currency currency,
      String? accountName,
      String? bankCode,
      String? accountType,
      String? accountNumber,
      num currentBalance,
      num availableBalance,
      String? provider,
      String? providerReference,
      String? referenceCode,
      bool reloadable,
      bool isDefault,
      bool isDeleted,
      @JsonKey(name: 'created_at') @DateTimeSerializer() DateTime? createdAt,
      @JsonKey(name: 'updated_at') @DateTimeSerializer() DateTime? updatedAt,
      List<dynamic> charges});
}

/// @nodoc
class __$$AccountImplCopyWithImpl<$Res>
    extends _$AccountCopyWithImpl<$Res, _$AccountImpl>
    implements _$$AccountImplCopyWith<$Res> {
  __$$AccountImplCopyWithImpl(
      _$AccountImpl _value, $Res Function(_$AccountImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? business = freezed,
    Object? type = freezed,
    Object? currency = null,
    Object? accountName = freezed,
    Object? bankCode = freezed,
    Object? accountType = freezed,
    Object? accountNumber = freezed,
    Object? currentBalance = null,
    Object? availableBalance = null,
    Object? provider = freezed,
    Object? providerReference = freezed,
    Object? referenceCode = freezed,
    Object? reloadable = null,
    Object? isDefault = null,
    Object? isDeleted = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? charges = null,
  }) {
    return _then(_$AccountImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      business: freezed == business
          ? _value.business
          : business // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as Currency,
      accountName: freezed == accountName
          ? _value.accountName
          : accountName // ignore: cast_nullable_to_non_nullable
              as String?,
      bankCode: freezed == bankCode
          ? _value.bankCode
          : bankCode // ignore: cast_nullable_to_non_nullable
              as String?,
      accountType: freezed == accountType
          ? _value.accountType
          : accountType // ignore: cast_nullable_to_non_nullable
              as String?,
      accountNumber: freezed == accountNumber
          ? _value.accountNumber
          : accountNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      currentBalance: null == currentBalance
          ? _value.currentBalance
          : currentBalance // ignore: cast_nullable_to_non_nullable
              as num,
      availableBalance: null == availableBalance
          ? _value.availableBalance
          : availableBalance // ignore: cast_nullable_to_non_nullable
              as num,
      provider: freezed == provider
          ? _value.provider
          : provider // ignore: cast_nullable_to_non_nullable
              as String?,
      providerReference: freezed == providerReference
          ? _value.providerReference
          : providerReference // ignore: cast_nullable_to_non_nullable
              as String?,
      referenceCode: freezed == referenceCode
          ? _value.referenceCode
          : referenceCode // ignore: cast_nullable_to_non_nullable
              as String?,
      reloadable: null == reloadable
          ? _value.reloadable
          : reloadable // ignore: cast_nullable_to_non_nullable
              as bool,
      isDefault: null == isDefault
          ? _value.isDefault
          : isDefault // ignore: cast_nullable_to_non_nullable
              as bool,
      isDeleted: null == isDeleted
          ? _value.isDeleted
          : isDeleted // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      charges: null == charges
          ? _value._charges
          : charges // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AccountImpl implements _Account {
  _$AccountImpl(
      {@JsonKey(name: '_id') this.id,
      this.business,
      this.type,
      this.currency = Currency.ngn,
      this.accountName,
      this.bankCode,
      this.accountType,
      this.accountNumber,
      this.currentBalance = 0,
      this.availableBalance = 0,
      this.provider,
      this.providerReference,
      this.referenceCode,
      this.reloadable = false,
      this.isDefault = false,
      this.isDeleted = false,
      @JsonKey(name: 'created_at') @DateTimeSerializer() this.createdAt,
      @JsonKey(name: 'updated_at') @DateTimeSerializer() this.updatedAt,
      final List<dynamic> charges = const []})
      : _charges = charges;

  factory _$AccountImpl.fromJson(Map<String, dynamic> json) =>
      _$$AccountImplFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String? id;
  @override
  final String? business;
  @override
  final String? type;
  @override
  @JsonKey()
  final Currency currency;
  @override
  final String? accountName;
  @override
  final String? bankCode;
  @override
  final String? accountType;
  @override
  final String? accountNumber;
  @override
  @JsonKey()
  final num currentBalance;
  @override
  @JsonKey()
  final num availableBalance;
  @override
  final String? provider;
  @override
  final String? providerReference;
  @override
  final String? referenceCode;
  @override
  @JsonKey()
  final bool reloadable;
  @override
  @JsonKey()
  final bool isDefault;
  @override
  @JsonKey()
  final bool isDeleted;
  @override
  @JsonKey(name: 'created_at')
  @DateTimeSerializer()
  final DateTime? createdAt;
  @override
  @JsonKey(name: 'updated_at')
  @DateTimeSerializer()
  final DateTime? updatedAt;
  final List<dynamic> _charges;
  @override
  @JsonKey()
  List<dynamic> get charges {
    if (_charges is EqualUnmodifiableListView) return _charges;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_charges);
  }

  @override
  String toString() {
    return 'Account(id: $id, business: $business, type: $type, currency: $currency, accountName: $accountName, bankCode: $bankCode, accountType: $accountType, accountNumber: $accountNumber, currentBalance: $currentBalance, availableBalance: $availableBalance, provider: $provider, providerReference: $providerReference, referenceCode: $referenceCode, reloadable: $reloadable, isDefault: $isDefault, isDeleted: $isDeleted, createdAt: $createdAt, updatedAt: $updatedAt, charges: $charges)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AccountImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.business, business) ||
                other.business == business) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.accountName, accountName) ||
                other.accountName == accountName) &&
            (identical(other.bankCode, bankCode) ||
                other.bankCode == bankCode) &&
            (identical(other.accountType, accountType) ||
                other.accountType == accountType) &&
            (identical(other.accountNumber, accountNumber) ||
                other.accountNumber == accountNumber) &&
            (identical(other.currentBalance, currentBalance) ||
                other.currentBalance == currentBalance) &&
            (identical(other.availableBalance, availableBalance) ||
                other.availableBalance == availableBalance) &&
            (identical(other.provider, provider) ||
                other.provider == provider) &&
            (identical(other.providerReference, providerReference) ||
                other.providerReference == providerReference) &&
            (identical(other.referenceCode, referenceCode) ||
                other.referenceCode == referenceCode) &&
            (identical(other.reloadable, reloadable) ||
                other.reloadable == reloadable) &&
            (identical(other.isDefault, isDefault) ||
                other.isDefault == isDefault) &&
            (identical(other.isDeleted, isDeleted) ||
                other.isDeleted == isDeleted) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            const DeepCollectionEquality().equals(other._charges, _charges));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        business,
        type,
        currency,
        accountName,
        bankCode,
        accountType,
        accountNumber,
        currentBalance,
        availableBalance,
        provider,
        providerReference,
        referenceCode,
        reloadable,
        isDefault,
        isDeleted,
        createdAt,
        updatedAt,
        const DeepCollectionEquality().hash(_charges)
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AccountImplCopyWith<_$AccountImpl> get copyWith =>
      __$$AccountImplCopyWithImpl<_$AccountImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AccountImplToJson(
      this,
    );
  }
}

abstract class _Account implements Account {
  factory _Account(
      {@JsonKey(name: '_id') final String? id,
      final String? business,
      final String? type,
      final Currency currency,
      final String? accountName,
      final String? bankCode,
      final String? accountType,
      final String? accountNumber,
      final num currentBalance,
      final num availableBalance,
      final String? provider,
      final String? providerReference,
      final String? referenceCode,
      final bool reloadable,
      final bool isDefault,
      final bool isDeleted,
      @JsonKey(name: 'created_at')
      @DateTimeSerializer()
      final DateTime? createdAt,
      @JsonKey(name: 'updated_at')
      @DateTimeSerializer()
      final DateTime? updatedAt,
      final List<dynamic> charges}) = _$AccountImpl;

  factory _Account.fromJson(Map<String, dynamic> json) = _$AccountImpl.fromJson;

  @override
  @JsonKey(name: '_id')
  String? get id;
  @override
  String? get business;
  @override
  String? get type;
  @override
  Currency get currency;
  @override
  String? get accountName;
  @override
  String? get bankCode;
  @override
  String? get accountType;
  @override
  String? get accountNumber;
  @override
  num get currentBalance;
  @override
  num get availableBalance;
  @override
  String? get provider;
  @override
  String? get providerReference;
  @override
  String? get referenceCode;
  @override
  bool get reloadable;
  @override
  bool get isDefault;
  @override
  bool get isDeleted;
  @override
  @JsonKey(name: 'created_at')
  @DateTimeSerializer()
  DateTime? get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  @DateTimeSerializer()
  DateTime? get updatedAt;
  @override
  List<dynamic> get charges;
  @override
  @JsonKey(ignore: true)
  _$$AccountImplCopyWith<_$AccountImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

FundingSource _$FundingSourceFromJson(Map<String, dynamic> json) {
  return _FundingSource.fromJson(json);
}

/// @nodoc
mixin _$FundingSource {
  @JsonKey(name: '_id')
  String? get id => throw _privateConstructorUsedError;
  String? get business => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  dynamic get jitGateway => throw _privateConstructorUsedError;
  bool get isDefault => throw _privateConstructorUsedError;
  bool get isDeleted => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  @DateTimeSerializer()
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  @DateTimeSerializer()
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FundingSourceCopyWith<FundingSource> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FundingSourceCopyWith<$Res> {
  factory $FundingSourceCopyWith(
          FundingSource value, $Res Function(FundingSource) then) =
      _$FundingSourceCopyWithImpl<$Res, FundingSource>;
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String? id,
      String? business,
      String? type,
      String? status,
      dynamic jitGateway,
      bool isDefault,
      bool isDeleted,
      @JsonKey(name: 'created_at') @DateTimeSerializer() DateTime? createdAt,
      @JsonKey(name: 'updated_at') @DateTimeSerializer() DateTime? updatedAt});
}

/// @nodoc
class _$FundingSourceCopyWithImpl<$Res, $Val extends FundingSource>
    implements $FundingSourceCopyWith<$Res> {
  _$FundingSourceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? business = freezed,
    Object? type = freezed,
    Object? status = freezed,
    Object? jitGateway = freezed,
    Object? isDefault = null,
    Object? isDeleted = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
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
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      jitGateway: freezed == jitGateway
          ? _value.jitGateway
          : jitGateway // ignore: cast_nullable_to_non_nullable
              as dynamic,
      isDefault: null == isDefault
          ? _value.isDefault
          : isDefault // ignore: cast_nullable_to_non_nullable
              as bool,
      isDeleted: null == isDeleted
          ? _value.isDeleted
          : isDeleted // ignore: cast_nullable_to_non_nullable
              as bool,
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
abstract class _$$FundingSourceImplCopyWith<$Res>
    implements $FundingSourceCopyWith<$Res> {
  factory _$$FundingSourceImplCopyWith(
          _$FundingSourceImpl value, $Res Function(_$FundingSourceImpl) then) =
      __$$FundingSourceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String? id,
      String? business,
      String? type,
      String? status,
      dynamic jitGateway,
      bool isDefault,
      bool isDeleted,
      @JsonKey(name: 'created_at') @DateTimeSerializer() DateTime? createdAt,
      @JsonKey(name: 'updated_at') @DateTimeSerializer() DateTime? updatedAt});
}

/// @nodoc
class __$$FundingSourceImplCopyWithImpl<$Res>
    extends _$FundingSourceCopyWithImpl<$Res, _$FundingSourceImpl>
    implements _$$FundingSourceImplCopyWith<$Res> {
  __$$FundingSourceImplCopyWithImpl(
      _$FundingSourceImpl _value, $Res Function(_$FundingSourceImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? business = freezed,
    Object? type = freezed,
    Object? status = freezed,
    Object? jitGateway = freezed,
    Object? isDefault = null,
    Object? isDeleted = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$FundingSourceImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      business: freezed == business
          ? _value.business
          : business // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      jitGateway: freezed == jitGateway
          ? _value.jitGateway
          : jitGateway // ignore: cast_nullable_to_non_nullable
              as dynamic,
      isDefault: null == isDefault
          ? _value.isDefault
          : isDefault // ignore: cast_nullable_to_non_nullable
              as bool,
      isDeleted: null == isDeleted
          ? _value.isDeleted
          : isDeleted // ignore: cast_nullable_to_non_nullable
              as bool,
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
class _$FundingSourceImpl implements _FundingSource {
  _$FundingSourceImpl(
      {@JsonKey(name: '_id') this.id,
      this.business,
      this.type,
      this.status,
      this.jitGateway,
      this.isDefault = false,
      this.isDeleted = false,
      @JsonKey(name: 'created_at') @DateTimeSerializer() this.createdAt,
      @JsonKey(name: 'updated_at') @DateTimeSerializer() this.updatedAt});

  factory _$FundingSourceImpl.fromJson(Map<String, dynamic> json) =>
      _$$FundingSourceImplFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String? id;
  @override
  final String? business;
  @override
  final String? type;
  @override
  final String? status;
  @override
  final dynamic jitGateway;
  @override
  @JsonKey()
  final bool isDefault;
  @override
  @JsonKey()
  final bool isDeleted;
  @override
  @JsonKey(name: 'created_at')
  @DateTimeSerializer()
  final DateTime? createdAt;
  @override
  @JsonKey(name: 'updated_at')
  @DateTimeSerializer()
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'FundingSource(id: $id, business: $business, type: $type, status: $status, jitGateway: $jitGateway, isDefault: $isDefault, isDeleted: $isDeleted, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FundingSourceImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.business, business) ||
                other.business == business) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality()
                .equals(other.jitGateway, jitGateway) &&
            (identical(other.isDefault, isDefault) ||
                other.isDefault == isDefault) &&
            (identical(other.isDeleted, isDeleted) ||
                other.isDeleted == isDeleted) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      business,
      type,
      status,
      const DeepCollectionEquality().hash(jitGateway),
      isDefault,
      isDeleted,
      createdAt,
      updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FundingSourceImplCopyWith<_$FundingSourceImpl> get copyWith =>
      __$$FundingSourceImplCopyWithImpl<_$FundingSourceImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FundingSourceImplToJson(
      this,
    );
  }
}

abstract class _FundingSource implements FundingSource {
  factory _FundingSource(
      {@JsonKey(name: '_id') final String? id,
      final String? business,
      final String? type,
      final String? status,
      final dynamic jitGateway,
      final bool isDefault,
      final bool isDeleted,
      @JsonKey(name: 'created_at')
      @DateTimeSerializer()
      final DateTime? createdAt,
      @JsonKey(name: 'updated_at')
      @DateTimeSerializer()
      final DateTime? updatedAt}) = _$FundingSourceImpl;

  factory _FundingSource.fromJson(Map<String, dynamic> json) =
      _$FundingSourceImpl.fromJson;

  @override
  @JsonKey(name: '_id')
  String? get id;
  @override
  String? get business;
  @override
  String? get type;
  @override
  String? get status;
  @override
  dynamic get jitGateway;
  @override
  bool get isDefault;
  @override
  bool get isDeleted;
  @override
  @JsonKey(name: 'created_at')
  @DateTimeSerializer()
  DateTime? get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  @DateTimeSerializer()
  DateTime? get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$FundingSourceImplCopyWith<_$FundingSourceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
