// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'guest_services_purchase_status.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GuestServicesPurchaseStatus _$GuestServicesPurchaseStatusFromJson(
    Map<String, dynamic> json) {
  return _GuestServicesPurchaseStatus.fromJson(json);
}

/// @nodoc
mixin _$GuestServicesPurchaseStatus {
  String? get referenceNumber => throw _privateConstructorUsedError;
  @StringToNumSerializer()
  num? get statusCode => throw _privateConstructorUsedError;
  String? get statusMessage => throw _privateConstructorUsedError;
  num? get requestAmount => throw _privateConstructorUsedError;
  num? get totalPaymentAmount => throw _privateConstructorUsedError;
  Currency? get currency => throw _privateConstructorUsedError;
  String? get expiryDateTimeUTC => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GuestServicesPurchaseStatusCopyWith<GuestServicesPurchaseStatus>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GuestServicesPurchaseStatusCopyWith<$Res> {
  factory $GuestServicesPurchaseStatusCopyWith(
          GuestServicesPurchaseStatus value,
          $Res Function(GuestServicesPurchaseStatus) then) =
      _$GuestServicesPurchaseStatusCopyWithImpl<$Res,
          GuestServicesPurchaseStatus>;
  @useResult
  $Res call(
      {String? referenceNumber,
      @StringToNumSerializer() num? statusCode,
      String? statusMessage,
      num? requestAmount,
      num? totalPaymentAmount,
      Currency? currency,
      String? expiryDateTimeUTC});
}

/// @nodoc
class _$GuestServicesPurchaseStatusCopyWithImpl<$Res,
        $Val extends GuestServicesPurchaseStatus>
    implements $GuestServicesPurchaseStatusCopyWith<$Res> {
  _$GuestServicesPurchaseStatusCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? referenceNumber = freezed,
    Object? statusCode = freezed,
    Object? statusMessage = freezed,
    Object? requestAmount = freezed,
    Object? totalPaymentAmount = freezed,
    Object? currency = freezed,
    Object? expiryDateTimeUTC = freezed,
  }) {
    return _then(_value.copyWith(
      referenceNumber: freezed == referenceNumber
          ? _value.referenceNumber
          : referenceNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      statusCode: freezed == statusCode
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as num?,
      statusMessage: freezed == statusMessage
          ? _value.statusMessage
          : statusMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      requestAmount: freezed == requestAmount
          ? _value.requestAmount
          : requestAmount // ignore: cast_nullable_to_non_nullable
              as num?,
      totalPaymentAmount: freezed == totalPaymentAmount
          ? _value.totalPaymentAmount
          : totalPaymentAmount // ignore: cast_nullable_to_non_nullable
              as num?,
      currency: freezed == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as Currency?,
      expiryDateTimeUTC: freezed == expiryDateTimeUTC
          ? _value.expiryDateTimeUTC
          : expiryDateTimeUTC // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GuestServicesPurchaseStatusImplCopyWith<$Res>
    implements $GuestServicesPurchaseStatusCopyWith<$Res> {
  factory _$$GuestServicesPurchaseStatusImplCopyWith(
          _$GuestServicesPurchaseStatusImpl value,
          $Res Function(_$GuestServicesPurchaseStatusImpl) then) =
      __$$GuestServicesPurchaseStatusImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? referenceNumber,
      @StringToNumSerializer() num? statusCode,
      String? statusMessage,
      num? requestAmount,
      num? totalPaymentAmount,
      Currency? currency,
      String? expiryDateTimeUTC});
}

/// @nodoc
class __$$GuestServicesPurchaseStatusImplCopyWithImpl<$Res>
    extends _$GuestServicesPurchaseStatusCopyWithImpl<$Res,
        _$GuestServicesPurchaseStatusImpl>
    implements _$$GuestServicesPurchaseStatusImplCopyWith<$Res> {
  __$$GuestServicesPurchaseStatusImplCopyWithImpl(
      _$GuestServicesPurchaseStatusImpl _value,
      $Res Function(_$GuestServicesPurchaseStatusImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? referenceNumber = freezed,
    Object? statusCode = freezed,
    Object? statusMessage = freezed,
    Object? requestAmount = freezed,
    Object? totalPaymentAmount = freezed,
    Object? currency = freezed,
    Object? expiryDateTimeUTC = freezed,
  }) {
    return _then(_$GuestServicesPurchaseStatusImpl(
      referenceNumber: freezed == referenceNumber
          ? _value.referenceNumber
          : referenceNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      statusCode: freezed == statusCode
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as num?,
      statusMessage: freezed == statusMessage
          ? _value.statusMessage
          : statusMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      requestAmount: freezed == requestAmount
          ? _value.requestAmount
          : requestAmount // ignore: cast_nullable_to_non_nullable
              as num?,
      totalPaymentAmount: freezed == totalPaymentAmount
          ? _value.totalPaymentAmount
          : totalPaymentAmount // ignore: cast_nullable_to_non_nullable
              as num?,
      currency: freezed == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as Currency?,
      expiryDateTimeUTC: freezed == expiryDateTimeUTC
          ? _value.expiryDateTimeUTC
          : expiryDateTimeUTC // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GuestServicesPurchaseStatusImpl
    implements _GuestServicesPurchaseStatus {
  _$GuestServicesPurchaseStatusImpl(
      {this.referenceNumber,
      @StringToNumSerializer() this.statusCode,
      this.statusMessage,
      this.requestAmount,
      this.totalPaymentAmount,
      this.currency,
      this.expiryDateTimeUTC});

  factory _$GuestServicesPurchaseStatusImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$GuestServicesPurchaseStatusImplFromJson(json);

  @override
  final String? referenceNumber;
  @override
  @StringToNumSerializer()
  final num? statusCode;
  @override
  final String? statusMessage;
  @override
  final num? requestAmount;
  @override
  final num? totalPaymentAmount;
  @override
  final Currency? currency;
  @override
  final String? expiryDateTimeUTC;

  @override
  String toString() {
    return 'GuestServicesPurchaseStatus(referenceNumber: $referenceNumber, statusCode: $statusCode, statusMessage: $statusMessage, requestAmount: $requestAmount, totalPaymentAmount: $totalPaymentAmount, currency: $currency, expiryDateTimeUTC: $expiryDateTimeUTC)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GuestServicesPurchaseStatusImpl &&
            (identical(other.referenceNumber, referenceNumber) ||
                other.referenceNumber == referenceNumber) &&
            (identical(other.statusCode, statusCode) ||
                other.statusCode == statusCode) &&
            (identical(other.statusMessage, statusMessage) ||
                other.statusMessage == statusMessage) &&
            (identical(other.requestAmount, requestAmount) ||
                other.requestAmount == requestAmount) &&
            (identical(other.totalPaymentAmount, totalPaymentAmount) ||
                other.totalPaymentAmount == totalPaymentAmount) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.expiryDateTimeUTC, expiryDateTimeUTC) ||
                other.expiryDateTimeUTC == expiryDateTimeUTC));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      referenceNumber,
      statusCode,
      statusMessage,
      requestAmount,
      totalPaymentAmount,
      currency,
      expiryDateTimeUTC);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GuestServicesPurchaseStatusImplCopyWith<_$GuestServicesPurchaseStatusImpl>
      get copyWith => __$$GuestServicesPurchaseStatusImplCopyWithImpl<
          _$GuestServicesPurchaseStatusImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GuestServicesPurchaseStatusImplToJson(
      this,
    );
  }
}

abstract class _GuestServicesPurchaseStatus
    implements GuestServicesPurchaseStatus {
  factory _GuestServicesPurchaseStatus(
      {final String? referenceNumber,
      @StringToNumSerializer() final num? statusCode,
      final String? statusMessage,
      final num? requestAmount,
      final num? totalPaymentAmount,
      final Currency? currency,
      final String? expiryDateTimeUTC}) = _$GuestServicesPurchaseStatusImpl;

  factory _GuestServicesPurchaseStatus.fromJson(Map<String, dynamic> json) =
      _$GuestServicesPurchaseStatusImpl.fromJson;

  @override
  String? get referenceNumber;
  @override
  @StringToNumSerializer()
  num? get statusCode;
  @override
  String? get statusMessage;
  @override
  num? get requestAmount;
  @override
  num? get totalPaymentAmount;
  @override
  Currency? get currency;
  @override
  String? get expiryDateTimeUTC;
  @override
  @JsonKey(ignore: true)
  _$$GuestServicesPurchaseStatusImplCopyWith<_$GuestServicesPurchaseStatusImpl>
      get copyWith => throw _privateConstructorUsedError;
}
