// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'datum.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Datum _$DatumFromJson(Map<String, dynamic> json) {
  return _Datum.fromJson(json);
}

/// @nodoc
mixin _$Datum {
  @JsonKey(name: '_id')
  String? get id => throw _privateConstructorUsedError;
  String? get business => throw _privateConstructorUsedError;
  Customer? get customer => throw _privateConstructorUsedError;
  Account? get account => throw _privateConstructorUsedError;
  Card? get card => throw _privateConstructorUsedError;
  Authorization? get authorization => throw _privateConstructorUsedError;
  int? get amount => throw _privateConstructorUsedError;
  int? get fee => throw _privateConstructorUsedError;
  int? get vat => throw _privateConstructorUsedError;
  String? get currency => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;
  List<dynamic>? get balanceTransactions => throw _privateConstructorUsedError;
  int? get merchantAmount => throw _privateConstructorUsedError;
  String? get merchantCurrency => throw _privateConstructorUsedError;
  Merchant? get merchant => throw _privateConstructorUsedError;
  Terminal? get terminal => throw _privateConstructorUsedError;
  TransactionMetadata? get transactionMetadata =>
      throw _privateConstructorUsedError;
  bool? get isDeleted => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  List<FeeDetail>? get feeDetails => throw _privateConstructorUsedError;
  @JsonKey(name: '__v')
  int? get v => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DatumCopyWith<Datum> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DatumCopyWith<$Res> {
  factory $DatumCopyWith(Datum value, $Res Function(Datum) then) =
      _$DatumCopyWithImpl<$Res, Datum>;
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String? id,
      String? business,
      Customer? customer,
      Account? account,
      Card? card,
      Authorization? authorization,
      int? amount,
      int? fee,
      int? vat,
      String? currency,
      String? type,
      List<dynamic>? balanceTransactions,
      int? merchantAmount,
      String? merchantCurrency,
      Merchant? merchant,
      Terminal? terminal,
      TransactionMetadata? transactionMetadata,
      bool? isDeleted,
      DateTime? createdAt,
      DateTime? updatedAt,
      List<FeeDetail>? feeDetails,
      @JsonKey(name: '__v') int? v});

  $CustomerCopyWith<$Res>? get customer;
  $AccountCopyWith<$Res>? get account;
  $CardCopyWith<$Res>? get card;
  $AuthorizationCopyWith<$Res>? get authorization;
  $MerchantCopyWith<$Res>? get merchant;
  $TerminalCopyWith<$Res>? get terminal;
  $TransactionMetadataCopyWith<$Res>? get transactionMetadata;
}

/// @nodoc
class _$DatumCopyWithImpl<$Res, $Val extends Datum>
    implements $DatumCopyWith<$Res> {
  _$DatumCopyWithImpl(this._value, this._then);

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
    Object? card = freezed,
    Object? authorization = freezed,
    Object? amount = freezed,
    Object? fee = freezed,
    Object? vat = freezed,
    Object? currency = freezed,
    Object? type = freezed,
    Object? balanceTransactions = freezed,
    Object? merchantAmount = freezed,
    Object? merchantCurrency = freezed,
    Object? merchant = freezed,
    Object? terminal = freezed,
    Object? transactionMetadata = freezed,
    Object? isDeleted = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? feeDetails = freezed,
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
      card: freezed == card
          ? _value.card
          : card // ignore: cast_nullable_to_non_nullable
              as Card?,
      authorization: freezed == authorization
          ? _value.authorization
          : authorization // ignore: cast_nullable_to_non_nullable
              as Authorization?,
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int?,
      fee: freezed == fee
          ? _value.fee
          : fee // ignore: cast_nullable_to_non_nullable
              as int?,
      vat: freezed == vat
          ? _value.vat
          : vat // ignore: cast_nullable_to_non_nullable
              as int?,
      currency: freezed == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      balanceTransactions: freezed == balanceTransactions
          ? _value.balanceTransactions
          : balanceTransactions // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      merchantAmount: freezed == merchantAmount
          ? _value.merchantAmount
          : merchantAmount // ignore: cast_nullable_to_non_nullable
              as int?,
      merchantCurrency: freezed == merchantCurrency
          ? _value.merchantCurrency
          : merchantCurrency // ignore: cast_nullable_to_non_nullable
              as String?,
      merchant: freezed == merchant
          ? _value.merchant
          : merchant // ignore: cast_nullable_to_non_nullable
              as Merchant?,
      terminal: freezed == terminal
          ? _value.terminal
          : terminal // ignore: cast_nullable_to_non_nullable
              as Terminal?,
      transactionMetadata: freezed == transactionMetadata
          ? _value.transactionMetadata
          : transactionMetadata // ignore: cast_nullable_to_non_nullable
              as TransactionMetadata?,
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
      feeDetails: freezed == feeDetails
          ? _value.feeDetails
          : feeDetails // ignore: cast_nullable_to_non_nullable
              as List<FeeDetail>?,
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
  $CardCopyWith<$Res>? get card {
    if (_value.card == null) {
      return null;
    }

    return $CardCopyWith<$Res>(_value.card!, (value) {
      return _then(_value.copyWith(card: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $AuthorizationCopyWith<$Res>? get authorization {
    if (_value.authorization == null) {
      return null;
    }

    return $AuthorizationCopyWith<$Res>(_value.authorization!, (value) {
      return _then(_value.copyWith(authorization: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $MerchantCopyWith<$Res>? get merchant {
    if (_value.merchant == null) {
      return null;
    }

    return $MerchantCopyWith<$Res>(_value.merchant!, (value) {
      return _then(_value.copyWith(merchant: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $TerminalCopyWith<$Res>? get terminal {
    if (_value.terminal == null) {
      return null;
    }

    return $TerminalCopyWith<$Res>(_value.terminal!, (value) {
      return _then(_value.copyWith(terminal: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $TransactionMetadataCopyWith<$Res>? get transactionMetadata {
    if (_value.transactionMetadata == null) {
      return null;
    }

    return $TransactionMetadataCopyWith<$Res>(_value.transactionMetadata!,
        (value) {
      return _then(_value.copyWith(transactionMetadata: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DatumImplCopyWith<$Res> implements $DatumCopyWith<$Res> {
  factory _$$DatumImplCopyWith(
          _$DatumImpl value, $Res Function(_$DatumImpl) then) =
      __$$DatumImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String? id,
      String? business,
      Customer? customer,
      Account? account,
      Card? card,
      Authorization? authorization,
      int? amount,
      int? fee,
      int? vat,
      String? currency,
      String? type,
      List<dynamic>? balanceTransactions,
      int? merchantAmount,
      String? merchantCurrency,
      Merchant? merchant,
      Terminal? terminal,
      TransactionMetadata? transactionMetadata,
      bool? isDeleted,
      DateTime? createdAt,
      DateTime? updatedAt,
      List<FeeDetail>? feeDetails,
      @JsonKey(name: '__v') int? v});

  @override
  $CustomerCopyWith<$Res>? get customer;
  @override
  $AccountCopyWith<$Res>? get account;
  @override
  $CardCopyWith<$Res>? get card;
  @override
  $AuthorizationCopyWith<$Res>? get authorization;
  @override
  $MerchantCopyWith<$Res>? get merchant;
  @override
  $TerminalCopyWith<$Res>? get terminal;
  @override
  $TransactionMetadataCopyWith<$Res>? get transactionMetadata;
}

/// @nodoc
class __$$DatumImplCopyWithImpl<$Res>
    extends _$DatumCopyWithImpl<$Res, _$DatumImpl>
    implements _$$DatumImplCopyWith<$Res> {
  __$$DatumImplCopyWithImpl(
      _$DatumImpl _value, $Res Function(_$DatumImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? business = freezed,
    Object? customer = freezed,
    Object? account = freezed,
    Object? card = freezed,
    Object? authorization = freezed,
    Object? amount = freezed,
    Object? fee = freezed,
    Object? vat = freezed,
    Object? currency = freezed,
    Object? type = freezed,
    Object? balanceTransactions = freezed,
    Object? merchantAmount = freezed,
    Object? merchantCurrency = freezed,
    Object? merchant = freezed,
    Object? terminal = freezed,
    Object? transactionMetadata = freezed,
    Object? isDeleted = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? feeDetails = freezed,
    Object? v = freezed,
  }) {
    return _then(_$DatumImpl(
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
      card: freezed == card
          ? _value.card
          : card // ignore: cast_nullable_to_non_nullable
              as Card?,
      authorization: freezed == authorization
          ? _value.authorization
          : authorization // ignore: cast_nullable_to_non_nullable
              as Authorization?,
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int?,
      fee: freezed == fee
          ? _value.fee
          : fee // ignore: cast_nullable_to_non_nullable
              as int?,
      vat: freezed == vat
          ? _value.vat
          : vat // ignore: cast_nullable_to_non_nullable
              as int?,
      currency: freezed == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      balanceTransactions: freezed == balanceTransactions
          ? _value._balanceTransactions
          : balanceTransactions // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      merchantAmount: freezed == merchantAmount
          ? _value.merchantAmount
          : merchantAmount // ignore: cast_nullable_to_non_nullable
              as int?,
      merchantCurrency: freezed == merchantCurrency
          ? _value.merchantCurrency
          : merchantCurrency // ignore: cast_nullable_to_non_nullable
              as String?,
      merchant: freezed == merchant
          ? _value.merchant
          : merchant // ignore: cast_nullable_to_non_nullable
              as Merchant?,
      terminal: freezed == terminal
          ? _value.terminal
          : terminal // ignore: cast_nullable_to_non_nullable
              as Terminal?,
      transactionMetadata: freezed == transactionMetadata
          ? _value.transactionMetadata
          : transactionMetadata // ignore: cast_nullable_to_non_nullable
              as TransactionMetadata?,
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
      feeDetails: freezed == feeDetails
          ? _value._feeDetails
          : feeDetails // ignore: cast_nullable_to_non_nullable
              as List<FeeDetail>?,
      v: freezed == v
          ? _value.v
          : v // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DatumImpl implements _Datum {
  _$DatumImpl(
      {@JsonKey(name: '_id') this.id,
      this.business,
      this.customer,
      this.account,
      this.card,
      this.authorization,
      this.amount,
      this.fee,
      this.vat,
      this.currency,
      this.type,
      final List<dynamic>? balanceTransactions,
      this.merchantAmount,
      this.merchantCurrency,
      this.merchant,
      this.terminal,
      this.transactionMetadata,
      this.isDeleted,
      this.createdAt,
      this.updatedAt,
      final List<FeeDetail>? feeDetails,
      @JsonKey(name: '__v') this.v})
      : _balanceTransactions = balanceTransactions,
        _feeDetails = feeDetails;

  factory _$DatumImpl.fromJson(Map<String, dynamic> json) =>
      _$$DatumImplFromJson(json);

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
  final Card? card;
  @override
  final Authorization? authorization;
  @override
  final int? amount;
  @override
  final int? fee;
  @override
  final int? vat;
  @override
  final String? currency;
  @override
  final String? type;
  final List<dynamic>? _balanceTransactions;
  @override
  List<dynamic>? get balanceTransactions {
    final value = _balanceTransactions;
    if (value == null) return null;
    if (_balanceTransactions is EqualUnmodifiableListView)
      return _balanceTransactions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final int? merchantAmount;
  @override
  final String? merchantCurrency;
  @override
  final Merchant? merchant;
  @override
  final Terminal? terminal;
  @override
  final TransactionMetadata? transactionMetadata;
  @override
  final bool? isDeleted;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;
  final List<FeeDetail>? _feeDetails;
  @override
  List<FeeDetail>? get feeDetails {
    final value = _feeDetails;
    if (value == null) return null;
    if (_feeDetails is EqualUnmodifiableListView) return _feeDetails;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: '__v')
  final int? v;

  @override
  String toString() {
    return 'Datum(id: $id, business: $business, customer: $customer, account: $account, card: $card, authorization: $authorization, amount: $amount, fee: $fee, vat: $vat, currency: $currency, type: $type, balanceTransactions: $balanceTransactions, merchantAmount: $merchantAmount, merchantCurrency: $merchantCurrency, merchant: $merchant, terminal: $terminal, transactionMetadata: $transactionMetadata, isDeleted: $isDeleted, createdAt: $createdAt, updatedAt: $updatedAt, feeDetails: $feeDetails, v: $v)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DatumImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.business, business) ||
                other.business == business) &&
            (identical(other.customer, customer) ||
                other.customer == customer) &&
            (identical(other.account, account) || other.account == account) &&
            (identical(other.card, card) || other.card == card) &&
            (identical(other.authorization, authorization) ||
                other.authorization == authorization) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.fee, fee) || other.fee == fee) &&
            (identical(other.vat, vat) || other.vat == vat) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.type, type) || other.type == type) &&
            const DeepCollectionEquality()
                .equals(other._balanceTransactions, _balanceTransactions) &&
            (identical(other.merchantAmount, merchantAmount) ||
                other.merchantAmount == merchantAmount) &&
            (identical(other.merchantCurrency, merchantCurrency) ||
                other.merchantCurrency == merchantCurrency) &&
            (identical(other.merchant, merchant) ||
                other.merchant == merchant) &&
            (identical(other.terminal, terminal) ||
                other.terminal == terminal) &&
            (identical(other.transactionMetadata, transactionMetadata) ||
                other.transactionMetadata == transactionMetadata) &&
            (identical(other.isDeleted, isDeleted) ||
                other.isDeleted == isDeleted) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            const DeepCollectionEquality()
                .equals(other._feeDetails, _feeDetails) &&
            (identical(other.v, v) || other.v == v));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        business,
        customer,
        account,
        card,
        authorization,
        amount,
        fee,
        vat,
        currency,
        type,
        const DeepCollectionEquality().hash(_balanceTransactions),
        merchantAmount,
        merchantCurrency,
        merchant,
        terminal,
        transactionMetadata,
        isDeleted,
        createdAt,
        updatedAt,
        const DeepCollectionEquality().hash(_feeDetails),
        v
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DatumImplCopyWith<_$DatumImpl> get copyWith =>
      __$$DatumImplCopyWithImpl<_$DatumImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DatumImplToJson(
      this,
    );
  }
}

abstract class _Datum implements Datum {
  factory _Datum(
      {@JsonKey(name: '_id') final String? id,
      final String? business,
      final Customer? customer,
      final Account? account,
      final Card? card,
      final Authorization? authorization,
      final int? amount,
      final int? fee,
      final int? vat,
      final String? currency,
      final String? type,
      final List<dynamic>? balanceTransactions,
      final int? merchantAmount,
      final String? merchantCurrency,
      final Merchant? merchant,
      final Terminal? terminal,
      final TransactionMetadata? transactionMetadata,
      final bool? isDeleted,
      final DateTime? createdAt,
      final DateTime? updatedAt,
      final List<FeeDetail>? feeDetails,
      @JsonKey(name: '__v') final int? v}) = _$DatumImpl;

  factory _Datum.fromJson(Map<String, dynamic> json) = _$DatumImpl.fromJson;

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
  Card? get card;
  @override
  Authorization? get authorization;
  @override
  int? get amount;
  @override
  int? get fee;
  @override
  int? get vat;
  @override
  String? get currency;
  @override
  String? get type;
  @override
  List<dynamic>? get balanceTransactions;
  @override
  int? get merchantAmount;
  @override
  String? get merchantCurrency;
  @override
  Merchant? get merchant;
  @override
  Terminal? get terminal;
  @override
  TransactionMetadata? get transactionMetadata;
  @override
  bool? get isDeleted;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get updatedAt;
  @override
  List<FeeDetail>? get feeDetails;
  @override
  @JsonKey(name: '__v')
  int? get v;
  @override
  @JsonKey(ignore: true)
  _$$DatumImplCopyWith<_$DatumImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
