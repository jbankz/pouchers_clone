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
  num? get responseCode => throw _privateConstructorUsedError;
  num? get responseCategoryCode => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  String? get referenceNumber => throw _privateConstructorUsedError;
  String? get transactionId => throw _privateConstructorUsedError;
  String? get currency => throw _privateConstructorUsedError;
  String? get exchangeRate => throw _privateConstructorUsedError;
  String? get fee => throw _privateConstructorUsedError;

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
      {num? responseCode,
      num? responseCategoryCode,
      String? message,
      String? referenceNumber,
      String? transactionId,
      String? currency,
      String? exchangeRate,
      String? fee});
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
    Object? responseCode = freezed,
    Object? responseCategoryCode = freezed,
    Object? message = freezed,
    Object? referenceNumber = freezed,
    Object? transactionId = freezed,
    Object? currency = freezed,
    Object? exchangeRate = freezed,
    Object? fee = freezed,
  }) {
    return _then(_value.copyWith(
      responseCode: freezed == responseCode
          ? _value.responseCode
          : responseCode // ignore: cast_nullable_to_non_nullable
              as num?,
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
      fee: freezed == fee
          ? _value.fee
          : fee // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
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
      {num? responseCode,
      num? responseCategoryCode,
      String? message,
      String? referenceNumber,
      String? transactionId,
      String? currency,
      String? exchangeRate,
      String? fee});
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
    Object? responseCode = freezed,
    Object? responseCategoryCode = freezed,
    Object? message = freezed,
    Object? referenceNumber = freezed,
    Object? transactionId = freezed,
    Object? currency = freezed,
    Object? exchangeRate = freezed,
    Object? fee = freezed,
  }) {
    return _then(_$UtilityImpl(
      responseCode: freezed == responseCode
          ? _value.responseCode
          : responseCode // ignore: cast_nullable_to_non_nullable
              as num?,
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
      fee: freezed == fee
          ? _value.fee
          : fee // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UtilityImpl implements _Utility {
  _$UtilityImpl(
      {this.responseCode = 0,
      this.responseCategoryCode = 0,
      this.message,
      this.referenceNumber,
      this.transactionId,
      this.currency,
      this.exchangeRate,
      this.fee});

  factory _$UtilityImpl.fromJson(Map<String, dynamic> json) =>
      _$$UtilityImplFromJson(json);

  @override
  @JsonKey()
  final num? responseCode;
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
  final String? fee;

  @override
  String toString() {
    return 'Utility(responseCode: $responseCode, responseCategoryCode: $responseCategoryCode, message: $message, referenceNumber: $referenceNumber, transactionId: $transactionId, currency: $currency, exchangeRate: $exchangeRate, fee: $fee)';
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
            (identical(other.fee, fee) || other.fee == fee));
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
      fee);

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
      {final num? responseCode,
      final num? responseCategoryCode,
      final String? message,
      final String? referenceNumber,
      final String? transactionId,
      final String? currency,
      final String? exchangeRate,
      final String? fee}) = _$UtilityImpl;

  factory _Utility.fromJson(Map<String, dynamic> json) = _$UtilityImpl.fromJson;

  @override
  num? get responseCode;
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
  String? get fee;
  @override
  @JsonKey(ignore: true)
  _$$UtilityImplCopyWith<_$UtilityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
