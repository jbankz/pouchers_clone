// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'utility.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Utility _$UtilityFromJson(Map<String, dynamic> json) {
  return _Utility.fromJson(json);
}

/// @nodoc
mixin _$Utility {
  @StringToNumSerializer()
  num get responseCode => throw _privateConstructorUsedError;
  num? get responseCategoryCode => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  String? get referenceNumber => throw _privateConstructorUsedError;
  String? get transactionId => throw _privateConstructorUsedError;
  String? get currency => throw _privateConstructorUsedError;
  String? get exchangeRate => throw _privateConstructorUsedError;
  @StringToNumSerializer()
  num get fee => throw _privateConstructorUsedError;
  String? get integrationStatus => throw _privateConstructorUsedError;
  AdditionalProperties? get additionalProperties =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UtilityCopyWith<Utility> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UtilityCopyWith<$Res> {
  factory $UtilityCopyWith(Utility value, $Res Function(Utility) then) =
      _$UtilityCopyWithImpl<$Res, Utility>;
  @useResult
  $Res call(
      {@StringToNumSerializer() num responseCode,
      num? responseCategoryCode,
      String? message,
      String? referenceNumber,
      String? transactionId,
      String? currency,
      String? exchangeRate,
      @StringToNumSerializer() num fee,
      String? integrationStatus,
      AdditionalProperties? additionalProperties});

  $AdditionalPropertiesCopyWith<$Res>? get additionalProperties;
}

/// @nodoc
class _$UtilityCopyWithImpl<$Res, $Val extends Utility>
    implements $UtilityCopyWith<$Res> {
  _$UtilityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? responseCode = null,
    Object? responseCategoryCode = freezed,
    Object? message = freezed,
    Object? referenceNumber = freezed,
    Object? transactionId = freezed,
    Object? currency = freezed,
    Object? exchangeRate = freezed,
    Object? fee = null,
    Object? integrationStatus = freezed,
    Object? additionalProperties = freezed,
  }) {
    return _then(_value.copyWith(
      responseCode: null == responseCode
          ? _value.responseCode
          : responseCode // ignore: cast_nullable_to_non_nullable
              as num,
      responseCategoryCode: freezed == responseCategoryCode
          ? _value.responseCategoryCode
          : responseCategoryCode // ignore: cast_nullable_to_non_nullable
              as num?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      referenceNumber: freezed == referenceNumber
          ? _value.referenceNumber
          : referenceNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      transactionId: freezed == transactionId
          ? _value.transactionId
          : transactionId // ignore: cast_nullable_to_non_nullable
              as String?,
      currency: freezed == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String?,
      exchangeRate: freezed == exchangeRate
          ? _value.exchangeRate
          : exchangeRate // ignore: cast_nullable_to_non_nullable
              as String?,
      fee: null == fee
          ? _value.fee
          : fee // ignore: cast_nullable_to_non_nullable
              as num,
      integrationStatus: freezed == integrationStatus
          ? _value.integrationStatus
          : integrationStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      additionalProperties: freezed == additionalProperties
          ? _value.additionalProperties
          : additionalProperties // ignore: cast_nullable_to_non_nullable
              as AdditionalProperties?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $AdditionalPropertiesCopyWith<$Res>? get additionalProperties {
    if (_value.additionalProperties == null) {
      return null;
    }

    return $AdditionalPropertiesCopyWith<$Res>(_value.additionalProperties!,
        (value) {
      return _then(_value.copyWith(additionalProperties: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UtilityImplCopyWith<$Res> implements $UtilityCopyWith<$Res> {
  factory _$$UtilityImplCopyWith(
          _$UtilityImpl value, $Res Function(_$UtilityImpl) then) =
      __$$UtilityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@StringToNumSerializer() num responseCode,
      num? responseCategoryCode,
      String? message,
      String? referenceNumber,
      String? transactionId,
      String? currency,
      String? exchangeRate,
      @StringToNumSerializer() num fee,
      String? integrationStatus,
      AdditionalProperties? additionalProperties});

  @override
  $AdditionalPropertiesCopyWith<$Res>? get additionalProperties;
}

/// @nodoc
class __$$UtilityImplCopyWithImpl<$Res>
    extends _$UtilityCopyWithImpl<$Res, _$UtilityImpl>
    implements _$$UtilityImplCopyWith<$Res> {
  __$$UtilityImplCopyWithImpl(
      _$UtilityImpl _value, $Res Function(_$UtilityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? responseCode = null,
    Object? responseCategoryCode = freezed,
    Object? message = freezed,
    Object? referenceNumber = freezed,
    Object? transactionId = freezed,
    Object? currency = freezed,
    Object? exchangeRate = freezed,
    Object? fee = null,
    Object? integrationStatus = freezed,
    Object? additionalProperties = freezed,
  }) {
    return _then(_$UtilityImpl(
      responseCode: null == responseCode
          ? _value.responseCode
          : responseCode // ignore: cast_nullable_to_non_nullable
              as num,
      responseCategoryCode: freezed == responseCategoryCode
          ? _value.responseCategoryCode
          : responseCategoryCode // ignore: cast_nullable_to_non_nullable
              as num?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      referenceNumber: freezed == referenceNumber
          ? _value.referenceNumber
          : referenceNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      transactionId: freezed == transactionId
          ? _value.transactionId
          : transactionId // ignore: cast_nullable_to_non_nullable
              as String?,
      currency: freezed == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String?,
      exchangeRate: freezed == exchangeRate
          ? _value.exchangeRate
          : exchangeRate // ignore: cast_nullable_to_non_nullable
              as String?,
      fee: null == fee
          ? _value.fee
          : fee // ignore: cast_nullable_to_non_nullable
              as num,
      integrationStatus: freezed == integrationStatus
          ? _value.integrationStatus
          : integrationStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      additionalProperties: freezed == additionalProperties
          ? _value.additionalProperties
          : additionalProperties // ignore: cast_nullable_to_non_nullable
              as AdditionalProperties?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UtilityImpl implements _Utility {
  _$UtilityImpl(
      {@StringToNumSerializer() this.responseCode = 0,
      this.responseCategoryCode = 0,
      this.message,
      this.referenceNumber,
      this.transactionId,
      this.currency,
      this.exchangeRate,
      @StringToNumSerializer() this.fee = 0,
      this.integrationStatus,
      this.additionalProperties});

  factory _$UtilityImpl.fromJson(Map<String, dynamic> json) =>
      _$$UtilityImplFromJson(json);

  @override
  @JsonKey()
  @StringToNumSerializer()
  final num responseCode;
  @override
  @JsonKey()
  final num? responseCategoryCode;
  @override
  final String? message;
  @override
  final String? referenceNumber;
  @override
  final String? transactionId;
  @override
  final String? currency;
  @override
  final String? exchangeRate;
  @override
  @JsonKey()
  @StringToNumSerializer()
  final num fee;
  @override
  final String? integrationStatus;
  @override
  final AdditionalProperties? additionalProperties;

  @override
  String toString() {
    return 'Utility(responseCode: $responseCode, responseCategoryCode: $responseCategoryCode, message: $message, referenceNumber: $referenceNumber, transactionId: $transactionId, currency: $currency, exchangeRate: $exchangeRate, fee: $fee, integrationStatus: $integrationStatus, additionalProperties: $additionalProperties)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UtilityImpl &&
            (identical(other.responseCode, responseCode) ||
                other.responseCode == responseCode) &&
            (identical(other.responseCategoryCode, responseCategoryCode) ||
                other.responseCategoryCode == responseCategoryCode) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.referenceNumber, referenceNumber) ||
                other.referenceNumber == referenceNumber) &&
            (identical(other.transactionId, transactionId) ||
                other.transactionId == transactionId) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.exchangeRate, exchangeRate) ||
                other.exchangeRate == exchangeRate) &&
            (identical(other.fee, fee) || other.fee == fee) &&
            (identical(other.integrationStatus, integrationStatus) ||
                other.integrationStatus == integrationStatus) &&
            (identical(other.additionalProperties, additionalProperties) ||
                other.additionalProperties == additionalProperties));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      responseCode,
      responseCategoryCode,
      message,
      referenceNumber,
      transactionId,
      currency,
      exchangeRate,
      fee,
      integrationStatus,
      additionalProperties);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UtilityImplCopyWith<_$UtilityImpl> get copyWith =>
      __$$UtilityImplCopyWithImpl<_$UtilityImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UtilityImplToJson(
      this,
    );
  }
}

abstract class _Utility implements Utility {
  factory _Utility(
      {@StringToNumSerializer() final num responseCode,
      final num? responseCategoryCode,
      final String? message,
      final String? referenceNumber,
      final String? transactionId,
      final String? currency,
      final String? exchangeRate,
      @StringToNumSerializer() final num fee,
      final String? integrationStatus,
      final AdditionalProperties? additionalProperties}) = _$UtilityImpl;

  factory _Utility.fromJson(Map<String, dynamic> json) = _$UtilityImpl.fromJson;

  @override
  @StringToNumSerializer()
  num get responseCode;
  @override
  num? get responseCategoryCode;
  @override
  String? get message;
  @override
  String? get referenceNumber;
  @override
  String? get transactionId;
  @override
  String? get currency;
  @override
  String? get exchangeRate;
  @override
  @StringToNumSerializer()
  num get fee;
  @override
  String? get integrationStatus;
  @override
  AdditionalProperties? get additionalProperties;
  @override
  @JsonKey(ignore: true)
  _$$UtilityImplCopyWith<_$UtilityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AdditionalProperties _$AdditionalPropertiesFromJson(Map<String, dynamic> json) {
  return _AdditionalProperties.fromJson(json);
}

/// @nodoc
mixin _$AdditionalProperties {
  num get debtBalance => throw _privateConstructorUsedError;
  num? get unitsPayment => throw _privateConstructorUsedError;
  num get paymentAmount => throw _privateConstructorUsedError;
  num get arrearsBalance => throw _privateConstructorUsedError;
  num get totalPayment => throw _privateConstructorUsedError;
  String? get completedTimestamp => throw _privateConstructorUsedError;
  num get tariffRate => throw _privateConstructorUsedError;
  String? get receiptNumber => throw _privateConstructorUsedError;
  String? get merchantCustomerAccountName => throw _privateConstructorUsedError;
  String? get address => throw _privateConstructorUsedError;
  String? get customerAccountNumber => throw _privateConstructorUsedError;
  String? get customerName => throw _privateConstructorUsedError;
  String? get paymentDate => throw _privateConstructorUsedError;
  String? get customerPhoneNumber => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AdditionalPropertiesCopyWith<AdditionalProperties> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AdditionalPropertiesCopyWith<$Res> {
  factory $AdditionalPropertiesCopyWith(AdditionalProperties value,
          $Res Function(AdditionalProperties) then) =
      _$AdditionalPropertiesCopyWithImpl<$Res, AdditionalProperties>;
  @useResult
  $Res call(
      {num debtBalance,
      num? unitsPayment,
      num paymentAmount,
      num arrearsBalance,
      num totalPayment,
      String? completedTimestamp,
      num tariffRate,
      String? receiptNumber,
      String? merchantCustomerAccountName,
      String? address,
      String? customerAccountNumber,
      String? customerName,
      String? paymentDate,
      String? customerPhoneNumber});
}

/// @nodoc
class _$AdditionalPropertiesCopyWithImpl<$Res,
        $Val extends AdditionalProperties>
    implements $AdditionalPropertiesCopyWith<$Res> {
  _$AdditionalPropertiesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? debtBalance = null,
    Object? unitsPayment = freezed,
    Object? paymentAmount = null,
    Object? arrearsBalance = null,
    Object? totalPayment = null,
    Object? completedTimestamp = freezed,
    Object? tariffRate = null,
    Object? receiptNumber = freezed,
    Object? merchantCustomerAccountName = freezed,
    Object? address = freezed,
    Object? customerAccountNumber = freezed,
    Object? customerName = freezed,
    Object? paymentDate = freezed,
    Object? customerPhoneNumber = freezed,
  }) {
    return _then(_value.copyWith(
      debtBalance: null == debtBalance
          ? _value.debtBalance
          : debtBalance // ignore: cast_nullable_to_non_nullable
              as num,
      unitsPayment: freezed == unitsPayment
          ? _value.unitsPayment
          : unitsPayment // ignore: cast_nullable_to_non_nullable
              as num?,
      paymentAmount: null == paymentAmount
          ? _value.paymentAmount
          : paymentAmount // ignore: cast_nullable_to_non_nullable
              as num,
      arrearsBalance: null == arrearsBalance
          ? _value.arrearsBalance
          : arrearsBalance // ignore: cast_nullable_to_non_nullable
              as num,
      totalPayment: null == totalPayment
          ? _value.totalPayment
          : totalPayment // ignore: cast_nullable_to_non_nullable
              as num,
      completedTimestamp: freezed == completedTimestamp
          ? _value.completedTimestamp
          : completedTimestamp // ignore: cast_nullable_to_non_nullable
              as String?,
      tariffRate: null == tariffRate
          ? _value.tariffRate
          : tariffRate // ignore: cast_nullable_to_non_nullable
              as num,
      receiptNumber: freezed == receiptNumber
          ? _value.receiptNumber
          : receiptNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      merchantCustomerAccountName: freezed == merchantCustomerAccountName
          ? _value.merchantCustomerAccountName
          : merchantCustomerAccountName // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      customerAccountNumber: freezed == customerAccountNumber
          ? _value.customerAccountNumber
          : customerAccountNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      customerName: freezed == customerName
          ? _value.customerName
          : customerName // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentDate: freezed == paymentDate
          ? _value.paymentDate
          : paymentDate // ignore: cast_nullable_to_non_nullable
              as String?,
      customerPhoneNumber: freezed == customerPhoneNumber
          ? _value.customerPhoneNumber
          : customerPhoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AdditionalPropertiesImplCopyWith<$Res>
    implements $AdditionalPropertiesCopyWith<$Res> {
  factory _$$AdditionalPropertiesImplCopyWith(_$AdditionalPropertiesImpl value,
          $Res Function(_$AdditionalPropertiesImpl) then) =
      __$$AdditionalPropertiesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {num debtBalance,
      num? unitsPayment,
      num paymentAmount,
      num arrearsBalance,
      num totalPayment,
      String? completedTimestamp,
      num tariffRate,
      String? receiptNumber,
      String? merchantCustomerAccountName,
      String? address,
      String? customerAccountNumber,
      String? customerName,
      String? paymentDate,
      String? customerPhoneNumber});
}

/// @nodoc
class __$$AdditionalPropertiesImplCopyWithImpl<$Res>
    extends _$AdditionalPropertiesCopyWithImpl<$Res, _$AdditionalPropertiesImpl>
    implements _$$AdditionalPropertiesImplCopyWith<$Res> {
  __$$AdditionalPropertiesImplCopyWithImpl(_$AdditionalPropertiesImpl _value,
      $Res Function(_$AdditionalPropertiesImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? debtBalance = null,
    Object? unitsPayment = freezed,
    Object? paymentAmount = null,
    Object? arrearsBalance = null,
    Object? totalPayment = null,
    Object? completedTimestamp = freezed,
    Object? tariffRate = null,
    Object? receiptNumber = freezed,
    Object? merchantCustomerAccountName = freezed,
    Object? address = freezed,
    Object? customerAccountNumber = freezed,
    Object? customerName = freezed,
    Object? paymentDate = freezed,
    Object? customerPhoneNumber = freezed,
  }) {
    return _then(_$AdditionalPropertiesImpl(
      debtBalance: null == debtBalance
          ? _value.debtBalance
          : debtBalance // ignore: cast_nullable_to_non_nullable
              as num,
      unitsPayment: freezed == unitsPayment
          ? _value.unitsPayment
          : unitsPayment // ignore: cast_nullable_to_non_nullable
              as num?,
      paymentAmount: null == paymentAmount
          ? _value.paymentAmount
          : paymentAmount // ignore: cast_nullable_to_non_nullable
              as num,
      arrearsBalance: null == arrearsBalance
          ? _value.arrearsBalance
          : arrearsBalance // ignore: cast_nullable_to_non_nullable
              as num,
      totalPayment: null == totalPayment
          ? _value.totalPayment
          : totalPayment // ignore: cast_nullable_to_non_nullable
              as num,
      completedTimestamp: freezed == completedTimestamp
          ? _value.completedTimestamp
          : completedTimestamp // ignore: cast_nullable_to_non_nullable
              as String?,
      tariffRate: null == tariffRate
          ? _value.tariffRate
          : tariffRate // ignore: cast_nullable_to_non_nullable
              as num,
      receiptNumber: freezed == receiptNumber
          ? _value.receiptNumber
          : receiptNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      merchantCustomerAccountName: freezed == merchantCustomerAccountName
          ? _value.merchantCustomerAccountName
          : merchantCustomerAccountName // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      customerAccountNumber: freezed == customerAccountNumber
          ? _value.customerAccountNumber
          : customerAccountNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      customerName: freezed == customerName
          ? _value.customerName
          : customerName // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentDate: freezed == paymentDate
          ? _value.paymentDate
          : paymentDate // ignore: cast_nullable_to_non_nullable
              as String?,
      customerPhoneNumber: freezed == customerPhoneNumber
          ? _value.customerPhoneNumber
          : customerPhoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AdditionalPropertiesImpl implements _AdditionalProperties {
  _$AdditionalPropertiesImpl(
      {this.debtBalance = 0,
      this.unitsPayment = 0,
      this.paymentAmount = 0,
      this.arrearsBalance = 0,
      this.totalPayment = 0,
      this.completedTimestamp,
      this.tariffRate = 0,
      this.receiptNumber,
      this.merchantCustomerAccountName,
      this.address,
      this.customerAccountNumber,
      this.customerName,
      this.paymentDate,
      this.customerPhoneNumber});

  factory _$AdditionalPropertiesImpl.fromJson(Map<String, dynamic> json) =>
      _$$AdditionalPropertiesImplFromJson(json);

  @override
  @JsonKey()
  final num debtBalance;
  @override
  @JsonKey()
  final num? unitsPayment;
  @override
  @JsonKey()
  final num paymentAmount;
  @override
  @JsonKey()
  final num arrearsBalance;
  @override
  @JsonKey()
  final num totalPayment;
  @override
  final String? completedTimestamp;
  @override
  @JsonKey()
  final num tariffRate;
  @override
  final String? receiptNumber;
  @override
  final String? merchantCustomerAccountName;
  @override
  final String? address;
  @override
  final String? customerAccountNumber;
  @override
  final String? customerName;
  @override
  final String? paymentDate;
  @override
  final String? customerPhoneNumber;

  @override
  String toString() {
    return 'AdditionalProperties(debtBalance: $debtBalance, unitsPayment: $unitsPayment, paymentAmount: $paymentAmount, arrearsBalance: $arrearsBalance, totalPayment: $totalPayment, completedTimestamp: $completedTimestamp, tariffRate: $tariffRate, receiptNumber: $receiptNumber, merchantCustomerAccountName: $merchantCustomerAccountName, address: $address, customerAccountNumber: $customerAccountNumber, customerName: $customerName, paymentDate: $paymentDate, customerPhoneNumber: $customerPhoneNumber)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AdditionalPropertiesImpl &&
            (identical(other.debtBalance, debtBalance) ||
                other.debtBalance == debtBalance) &&
            (identical(other.unitsPayment, unitsPayment) ||
                other.unitsPayment == unitsPayment) &&
            (identical(other.paymentAmount, paymentAmount) ||
                other.paymentAmount == paymentAmount) &&
            (identical(other.arrearsBalance, arrearsBalance) ||
                other.arrearsBalance == arrearsBalance) &&
            (identical(other.totalPayment, totalPayment) ||
                other.totalPayment == totalPayment) &&
            (identical(other.completedTimestamp, completedTimestamp) ||
                other.completedTimestamp == completedTimestamp) &&
            (identical(other.tariffRate, tariffRate) ||
                other.tariffRate == tariffRate) &&
            (identical(other.receiptNumber, receiptNumber) ||
                other.receiptNumber == receiptNumber) &&
            (identical(other.merchantCustomerAccountName,
                    merchantCustomerAccountName) ||
                other.merchantCustomerAccountName ==
                    merchantCustomerAccountName) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.customerAccountNumber, customerAccountNumber) ||
                other.customerAccountNumber == customerAccountNumber) &&
            (identical(other.customerName, customerName) ||
                other.customerName == customerName) &&
            (identical(other.paymentDate, paymentDate) ||
                other.paymentDate == paymentDate) &&
            (identical(other.customerPhoneNumber, customerPhoneNumber) ||
                other.customerPhoneNumber == customerPhoneNumber));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      debtBalance,
      unitsPayment,
      paymentAmount,
      arrearsBalance,
      totalPayment,
      completedTimestamp,
      tariffRate,
      receiptNumber,
      merchantCustomerAccountName,
      address,
      customerAccountNumber,
      customerName,
      paymentDate,
      customerPhoneNumber);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AdditionalPropertiesImplCopyWith<_$AdditionalPropertiesImpl>
      get copyWith =>
          __$$AdditionalPropertiesImplCopyWithImpl<_$AdditionalPropertiesImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AdditionalPropertiesImplToJson(
      this,
    );
  }
}

abstract class _AdditionalProperties implements AdditionalProperties {
  factory _AdditionalProperties(
      {final num debtBalance,
      final num? unitsPayment,
      final num paymentAmount,
      final num arrearsBalance,
      final num totalPayment,
      final String? completedTimestamp,
      final num tariffRate,
      final String? receiptNumber,
      final String? merchantCustomerAccountName,
      final String? address,
      final String? customerAccountNumber,
      final String? customerName,
      final String? paymentDate,
      final String? customerPhoneNumber}) = _$AdditionalPropertiesImpl;

  factory _AdditionalProperties.fromJson(Map<String, dynamic> json) =
      _$AdditionalPropertiesImpl.fromJson;

  @override
  num get debtBalance;
  @override
  num? get unitsPayment;
  @override
  num get paymentAmount;
  @override
  num get arrearsBalance;
  @override
  num get totalPayment;
  @override
  String? get completedTimestamp;
  @override
  num get tariffRate;
  @override
  String? get receiptNumber;
  @override
  String? get merchantCustomerAccountName;
  @override
  String? get address;
  @override
  String? get customerAccountNumber;
  @override
  String? get customerName;
  @override
  String? get paymentDate;
  @override
  String? get customerPhoneNumber;
  @override
  @JsonKey(ignore: true)
  _$$AdditionalPropertiesImplCopyWith<_$AdditionalPropertiesImpl>
      get copyWith => throw _privateConstructorUsedError;
}
