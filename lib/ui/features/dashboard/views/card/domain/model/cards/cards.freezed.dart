// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cards.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Cards _$CardsFromJson(Map<String, dynamic> json) {
  return _Cards.fromJson(json);
}

/// @nodoc
mixin _$Cards {
  @HiveField(0)
  @JsonKey(name: 'user_id')
  String? get userId => throw _privateConstructorUsedError;
  @HiveField(1)
  @JsonKey(name: 'account_id')
  String? get accountId => throw _privateConstructorUsedError;
  @HiveField(2)
  @JsonKey(name: 'account_type')
  String? get accountType => throw _privateConstructorUsedError;
  @HiveField(3)
  @JsonKey(name: 'account_number')
  String? get accountNumber => throw _privateConstructorUsedError;
  @HiveField(4)
  @JsonKey(name: 'account_name')
  String? get accountName => throw _privateConstructorUsedError;
  @HiveField(5)
  CardBrand? get brand => throw _privateConstructorUsedError;
  @HiveField(6)
  Currency? get currency => throw _privateConstructorUsedError;
  @HiveField(7)
  String? get last4 => throw _privateConstructorUsedError;
  @HiveField(8)
  @JsonKey(name: 'expiry_month')
  String? get expiryMonth => throw _privateConstructorUsedError;
  @HiveField(9)
  @JsonKey(name: 'expiry_year')
  String? get expiryYear => throw _privateConstructorUsedError;
  @HiveField(10)
  @JsonKey(name: 'card_status')
  String? get cardStatus => throw _privateConstructorUsedError;
  @HiveField(11)
  @JsonKey(name: 'card_id')
  String? get cardId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CardsCopyWith<Cards> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CardsCopyWith<$Res> {
  factory $CardsCopyWith(Cards value, $Res Function(Cards) then) =
      _$CardsCopyWithImpl<$Res, Cards>;
  @useResult
  $Res call(
      {@HiveField(0) @JsonKey(name: 'user_id') String? userId,
      @HiveField(1) @JsonKey(name: 'account_id') String? accountId,
      @HiveField(2) @JsonKey(name: 'account_type') String? accountType,
      @HiveField(3) @JsonKey(name: 'account_number') String? accountNumber,
      @HiveField(4) @JsonKey(name: 'account_name') String? accountName,
      @HiveField(5) CardBrand? brand,
      @HiveField(6) Currency? currency,
      @HiveField(7) String? last4,
      @HiveField(8) @JsonKey(name: 'expiry_month') String? expiryMonth,
      @HiveField(9) @JsonKey(name: 'expiry_year') String? expiryYear,
      @HiveField(10) @JsonKey(name: 'card_status') String? cardStatus,
      @HiveField(11) @JsonKey(name: 'card_id') String? cardId});
}

/// @nodoc
class _$CardsCopyWithImpl<$Res, $Val extends Cards>
    implements $CardsCopyWith<$Res> {
  _$CardsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = freezed,
    Object? accountId = freezed,
    Object? accountType = freezed,
    Object? accountNumber = freezed,
    Object? accountName = freezed,
    Object? brand = freezed,
    Object? currency = freezed,
    Object? last4 = freezed,
    Object? expiryMonth = freezed,
    Object? expiryYear = freezed,
    Object? cardStatus = freezed,
    Object? cardId = freezed,
  }) {
    return _then(_value.copyWith(
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      accountId: freezed == accountId
          ? _value.accountId
          : accountId // ignore: cast_nullable_to_non_nullable
              as String?,
      accountType: freezed == accountType
          ? _value.accountType
          : accountType // ignore: cast_nullable_to_non_nullable
              as String?,
      accountNumber: freezed == accountNumber
          ? _value.accountNumber
          : accountNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      accountName: freezed == accountName
          ? _value.accountName
          : accountName // ignore: cast_nullable_to_non_nullable
              as String?,
      brand: freezed == brand
          ? _value.brand
          : brand // ignore: cast_nullable_to_non_nullable
              as CardBrand?,
      currency: freezed == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as Currency?,
      last4: freezed == last4
          ? _value.last4
          : last4 // ignore: cast_nullable_to_non_nullable
              as String?,
      expiryMonth: freezed == expiryMonth
          ? _value.expiryMonth
          : expiryMonth // ignore: cast_nullable_to_non_nullable
              as String?,
      expiryYear: freezed == expiryYear
          ? _value.expiryYear
          : expiryYear // ignore: cast_nullable_to_non_nullable
              as String?,
      cardStatus: freezed == cardStatus
          ? _value.cardStatus
          : cardStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      cardId: freezed == cardId
          ? _value.cardId
          : cardId // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CardsImplCopyWith<$Res> implements $CardsCopyWith<$Res> {
  factory _$$CardsImplCopyWith(
          _$CardsImpl value, $Res Function(_$CardsImpl) then) =
      __$$CardsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) @JsonKey(name: 'user_id') String? userId,
      @HiveField(1) @JsonKey(name: 'account_id') String? accountId,
      @HiveField(2) @JsonKey(name: 'account_type') String? accountType,
      @HiveField(3) @JsonKey(name: 'account_number') String? accountNumber,
      @HiveField(4) @JsonKey(name: 'account_name') String? accountName,
      @HiveField(5) CardBrand? brand,
      @HiveField(6) Currency? currency,
      @HiveField(7) String? last4,
      @HiveField(8) @JsonKey(name: 'expiry_month') String? expiryMonth,
      @HiveField(9) @JsonKey(name: 'expiry_year') String? expiryYear,
      @HiveField(10) @JsonKey(name: 'card_status') String? cardStatus,
      @HiveField(11) @JsonKey(name: 'card_id') String? cardId});
}

/// @nodoc
class __$$CardsImplCopyWithImpl<$Res>
    extends _$CardsCopyWithImpl<$Res, _$CardsImpl>
    implements _$$CardsImplCopyWith<$Res> {
  __$$CardsImplCopyWithImpl(
      _$CardsImpl _value, $Res Function(_$CardsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = freezed,
    Object? accountId = freezed,
    Object? accountType = freezed,
    Object? accountNumber = freezed,
    Object? accountName = freezed,
    Object? brand = freezed,
    Object? currency = freezed,
    Object? last4 = freezed,
    Object? expiryMonth = freezed,
    Object? expiryYear = freezed,
    Object? cardStatus = freezed,
    Object? cardId = freezed,
  }) {
    return _then(_$CardsImpl(
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      accountId: freezed == accountId
          ? _value.accountId
          : accountId // ignore: cast_nullable_to_non_nullable
              as String?,
      accountType: freezed == accountType
          ? _value.accountType
          : accountType // ignore: cast_nullable_to_non_nullable
              as String?,
      accountNumber: freezed == accountNumber
          ? _value.accountNumber
          : accountNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      accountName: freezed == accountName
          ? _value.accountName
          : accountName // ignore: cast_nullable_to_non_nullable
              as String?,
      brand: freezed == brand
          ? _value.brand
          : brand // ignore: cast_nullable_to_non_nullable
              as CardBrand?,
      currency: freezed == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as Currency?,
      last4: freezed == last4
          ? _value.last4
          : last4 // ignore: cast_nullable_to_non_nullable
              as String?,
      expiryMonth: freezed == expiryMonth
          ? _value.expiryMonth
          : expiryMonth // ignore: cast_nullable_to_non_nullable
              as String?,
      expiryYear: freezed == expiryYear
          ? _value.expiryYear
          : expiryYear // ignore: cast_nullable_to_non_nullable
              as String?,
      cardStatus: freezed == cardStatus
          ? _value.cardStatus
          : cardStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      cardId: freezed == cardId
          ? _value.cardId
          : cardId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CardsImpl implements _Cards {
  _$CardsImpl(
      {@HiveField(0) @JsonKey(name: 'user_id') this.userId,
      @HiveField(1) @JsonKey(name: 'account_id') this.accountId,
      @HiveField(2) @JsonKey(name: 'account_type') this.accountType,
      @HiveField(3) @JsonKey(name: 'account_number') this.accountNumber,
      @HiveField(4) @JsonKey(name: 'account_name') this.accountName,
      @HiveField(5) this.brand = CardBrand.verve,
      @HiveField(6) this.currency = Currency.NGN,
      @HiveField(7) this.last4,
      @HiveField(8) @JsonKey(name: 'expiry_month') this.expiryMonth,
      @HiveField(9) @JsonKey(name: 'expiry_year') this.expiryYear,
      @HiveField(10) @JsonKey(name: 'card_status') this.cardStatus,
      @HiveField(11) @JsonKey(name: 'card_id') this.cardId});

  factory _$CardsImpl.fromJson(Map<String, dynamic> json) =>
      _$$CardsImplFromJson(json);

  @override
  @HiveField(0)
  @JsonKey(name: 'user_id')
  final String? userId;
  @override
  @HiveField(1)
  @JsonKey(name: 'account_id')
  final String? accountId;
  @override
  @HiveField(2)
  @JsonKey(name: 'account_type')
  final String? accountType;
  @override
  @HiveField(3)
  @JsonKey(name: 'account_number')
  final String? accountNumber;
  @override
  @HiveField(4)
  @JsonKey(name: 'account_name')
  final String? accountName;
  @override
  @JsonKey()
  @HiveField(5)
  final CardBrand? brand;
  @override
  @JsonKey()
  @HiveField(6)
  final Currency? currency;
  @override
  @HiveField(7)
  final String? last4;
  @override
  @HiveField(8)
  @JsonKey(name: 'expiry_month')
  final String? expiryMonth;
  @override
  @HiveField(9)
  @JsonKey(name: 'expiry_year')
  final String? expiryYear;
  @override
  @HiveField(10)
  @JsonKey(name: 'card_status')
  final String? cardStatus;
  @override
  @HiveField(11)
  @JsonKey(name: 'card_id')
  final String? cardId;

  @override
  String toString() {
    return 'Cards(userId: $userId, accountId: $accountId, accountType: $accountType, accountNumber: $accountNumber, accountName: $accountName, brand: $brand, currency: $currency, last4: $last4, expiryMonth: $expiryMonth, expiryYear: $expiryYear, cardStatus: $cardStatus, cardId: $cardId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CardsImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.accountId, accountId) ||
                other.accountId == accountId) &&
            (identical(other.accountType, accountType) ||
                other.accountType == accountType) &&
            (identical(other.accountNumber, accountNumber) ||
                other.accountNumber == accountNumber) &&
            (identical(other.accountName, accountName) ||
                other.accountName == accountName) &&
            (identical(other.brand, brand) || other.brand == brand) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.last4, last4) || other.last4 == last4) &&
            (identical(other.expiryMonth, expiryMonth) ||
                other.expiryMonth == expiryMonth) &&
            (identical(other.expiryYear, expiryYear) ||
                other.expiryYear == expiryYear) &&
            (identical(other.cardStatus, cardStatus) ||
                other.cardStatus == cardStatus) &&
            (identical(other.cardId, cardId) || other.cardId == cardId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      userId,
      accountId,
      accountType,
      accountNumber,
      accountName,
      brand,
      currency,
      last4,
      expiryMonth,
      expiryYear,
      cardStatus,
      cardId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CardsImplCopyWith<_$CardsImpl> get copyWith =>
      __$$CardsImplCopyWithImpl<_$CardsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CardsImplToJson(
      this,
    );
  }
}

abstract class _Cards implements Cards {
  factory _Cards(
      {@HiveField(0) @JsonKey(name: 'user_id') final String? userId,
      @HiveField(1) @JsonKey(name: 'account_id') final String? accountId,
      @HiveField(2) @JsonKey(name: 'account_type') final String? accountType,
      @HiveField(3)
      @JsonKey(name: 'account_number')
      final String? accountNumber,
      @HiveField(4) @JsonKey(name: 'account_name') final String? accountName,
      @HiveField(5) final CardBrand? brand,
      @HiveField(6) final Currency? currency,
      @HiveField(7) final String? last4,
      @HiveField(8) @JsonKey(name: 'expiry_month') final String? expiryMonth,
      @HiveField(9) @JsonKey(name: 'expiry_year') final String? expiryYear,
      @HiveField(10) @JsonKey(name: 'card_status') final String? cardStatus,
      @HiveField(11)
      @JsonKey(name: 'card_id')
      final String? cardId}) = _$CardsImpl;

  factory _Cards.fromJson(Map<String, dynamic> json) = _$CardsImpl.fromJson;

  @override
  @HiveField(0)
  @JsonKey(name: 'user_id')
  String? get userId;
  @override
  @HiveField(1)
  @JsonKey(name: 'account_id')
  String? get accountId;
  @override
  @HiveField(2)
  @JsonKey(name: 'account_type')
  String? get accountType;
  @override
  @HiveField(3)
  @JsonKey(name: 'account_number')
  String? get accountNumber;
  @override
  @HiveField(4)
  @JsonKey(name: 'account_name')
  String? get accountName;
  @override
  @HiveField(5)
  CardBrand? get brand;
  @override
  @HiveField(6)
  Currency? get currency;
  @override
  @HiveField(7)
  String? get last4;
  @override
  @HiveField(8)
  @JsonKey(name: 'expiry_month')
  String? get expiryMonth;
  @override
  @HiveField(9)
  @JsonKey(name: 'expiry_year')
  String? get expiryYear;
  @override
  @HiveField(10)
  @JsonKey(name: 'card_status')
  String? get cardStatus;
  @override
  @HiveField(11)
  @JsonKey(name: 'card_id')
  String? get cardId;
  @override
  @JsonKey(ignore: true)
  _$$CardsImplCopyWith<_$CardsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
