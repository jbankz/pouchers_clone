// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'request_history.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RequestHistory _$RequestHistoryFromJson(Map<String, dynamic> json) {
  return _RequestHistory.fromJson(json);
}

/// @nodoc
mixin _$RequestHistory {
  int? get amount => throw _privateConstructorUsedError;
  String? get currency => throw _privateConstructorUsedError;
  bool? get approved => throw _privateConstructorUsedError;
  int? get merchantAmount => throw _privateConstructorUsedError;
  String? get merchantCurrency => throw _privateConstructorUsedError;
  String? get reason => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: '_id')
  String? get id => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RequestHistoryCopyWith<RequestHistory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RequestHistoryCopyWith<$Res> {
  factory $RequestHistoryCopyWith(
          RequestHistory value, $Res Function(RequestHistory) then) =
      _$RequestHistoryCopyWithImpl<$Res, RequestHistory>;
  @useResult
  $Res call(
      {int? amount,
      String? currency,
      bool? approved,
      int? merchantAmount,
      String? merchantCurrency,
      String? reason,
      DateTime? createdAt,
      @JsonKey(name: '_id') String? id});
}

/// @nodoc
class _$RequestHistoryCopyWithImpl<$Res, $Val extends RequestHistory>
    implements $RequestHistoryCopyWith<$Res> {
  _$RequestHistoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? amount = freezed,
    Object? currency = freezed,
    Object? approved = freezed,
    Object? merchantAmount = freezed,
    Object? merchantCurrency = freezed,
    Object? reason = freezed,
    Object? createdAt = freezed,
    Object? id = freezed,
  }) {
    return _then(_value.copyWith(
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int?,
      currency: freezed == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String?,
      approved: freezed == approved
          ? _value.approved
          : approved // ignore: cast_nullable_to_non_nullable
              as bool?,
      merchantAmount: freezed == merchantAmount
          ? _value.merchantAmount
          : merchantAmount // ignore: cast_nullable_to_non_nullable
              as int?,
      merchantCurrency: freezed == merchantCurrency
          ? _value.merchantCurrency
          : merchantCurrency // ignore: cast_nullable_to_non_nullable
              as String?,
      reason: freezed == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RequestHistoryImplCopyWith<$Res>
    implements $RequestHistoryCopyWith<$Res> {
  factory _$$RequestHistoryImplCopyWith(_$RequestHistoryImpl value,
          $Res Function(_$RequestHistoryImpl) then) =
      __$$RequestHistoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? amount,
      String? currency,
      bool? approved,
      int? merchantAmount,
      String? merchantCurrency,
      String? reason,
      DateTime? createdAt,
      @JsonKey(name: '_id') String? id});
}

/// @nodoc
class __$$RequestHistoryImplCopyWithImpl<$Res>
    extends _$RequestHistoryCopyWithImpl<$Res, _$RequestHistoryImpl>
    implements _$$RequestHistoryImplCopyWith<$Res> {
  __$$RequestHistoryImplCopyWithImpl(
      _$RequestHistoryImpl _value, $Res Function(_$RequestHistoryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? amount = freezed,
    Object? currency = freezed,
    Object? approved = freezed,
    Object? merchantAmount = freezed,
    Object? merchantCurrency = freezed,
    Object? reason = freezed,
    Object? createdAt = freezed,
    Object? id = freezed,
  }) {
    return _then(_$RequestHistoryImpl(
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int?,
      currency: freezed == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String?,
      approved: freezed == approved
          ? _value.approved
          : approved // ignore: cast_nullable_to_non_nullable
              as bool?,
      merchantAmount: freezed == merchantAmount
          ? _value.merchantAmount
          : merchantAmount // ignore: cast_nullable_to_non_nullable
              as int?,
      merchantCurrency: freezed == merchantCurrency
          ? _value.merchantCurrency
          : merchantCurrency // ignore: cast_nullable_to_non_nullable
              as String?,
      reason: freezed == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RequestHistoryImpl implements _RequestHistory {
  _$RequestHistoryImpl(
      {this.amount,
      this.currency,
      this.approved,
      this.merchantAmount,
      this.merchantCurrency,
      this.reason,
      this.createdAt,
      @JsonKey(name: '_id') this.id});

  factory _$RequestHistoryImpl.fromJson(Map<String, dynamic> json) =>
      _$$RequestHistoryImplFromJson(json);

  @override
  final int? amount;
  @override
  final String? currency;
  @override
  final bool? approved;
  @override
  final int? merchantAmount;
  @override
  final String? merchantCurrency;
  @override
  final String? reason;
  @override
  final DateTime? createdAt;
  @override
  @JsonKey(name: '_id')
  final String? id;

  @override
  String toString() {
    return 'RequestHistory(amount: $amount, currency: $currency, approved: $approved, merchantAmount: $merchantAmount, merchantCurrency: $merchantCurrency, reason: $reason, createdAt: $createdAt, id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RequestHistoryImpl &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.approved, approved) ||
                other.approved == approved) &&
            (identical(other.merchantAmount, merchantAmount) ||
                other.merchantAmount == merchantAmount) &&
            (identical(other.merchantCurrency, merchantCurrency) ||
                other.merchantCurrency == merchantCurrency) &&
            (identical(other.reason, reason) || other.reason == reason) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, amount, currency, approved,
      merchantAmount, merchantCurrency, reason, createdAt, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RequestHistoryImplCopyWith<_$RequestHistoryImpl> get copyWith =>
      __$$RequestHistoryImplCopyWithImpl<_$RequestHistoryImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RequestHistoryImplToJson(
      this,
    );
  }
}

abstract class _RequestHistory implements RequestHistory {
  factory _RequestHistory(
      {final int? amount,
      final String? currency,
      final bool? approved,
      final int? merchantAmount,
      final String? merchantCurrency,
      final String? reason,
      final DateTime? createdAt,
      @JsonKey(name: '_id') final String? id}) = _$RequestHistoryImpl;

  factory _RequestHistory.fromJson(Map<String, dynamic> json) =
      _$RequestHistoryImpl.fromJson;

  @override
  int? get amount;
  @override
  String? get currency;
  @override
  bool? get approved;
  @override
  int? get merchantAmount;
  @override
  String? get merchantCurrency;
  @override
  String? get reason;
  @override
  DateTime? get createdAt;
  @override
  @JsonKey(name: '_id')
  String? get id;
  @override
  @JsonKey(ignore: true)
  _$$RequestHistoryImplCopyWith<_$RequestHistoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
