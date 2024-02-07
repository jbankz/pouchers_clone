// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'authorization.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Authorization _$AuthorizationFromJson(Map<String, dynamic> json) {
  return _Authorization.fromJson(json);
}

/// @nodoc
mixin _$Authorization {
  @JsonKey(name: '_id')
  String? get id => throw _privateConstructorUsedError;
  String? get business => throw _privateConstructorUsedError;
  String? get customer => throw _privateConstructorUsedError;
  String? get account => throw _privateConstructorUsedError;
  String? get card => throw _privateConstructorUsedError;
  int? get amount => throw _privateConstructorUsedError;
  int? get fee => throw _privateConstructorUsedError;
  int? get vat => throw _privateConstructorUsedError;
  bool? get approved => throw _privateConstructorUsedError;
  String? get currency => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  String? get authorizationMethod => throw _privateConstructorUsedError;
  List<dynamic>? get balanceTransactions => throw _privateConstructorUsedError;
  int? get merchantAmount => throw _privateConstructorUsedError;
  String? get merchantCurrency => throw _privateConstructorUsedError;
  Merchant? get merchant => throw _privateConstructorUsedError;
  Terminal? get terminal => throw _privateConstructorUsedError;
  TransactionMetadata? get transactionMetadata =>
      throw _privateConstructorUsedError;
  dynamic get pendingRequest => throw _privateConstructorUsedError;
  List<RequestHistory>? get requestHistory =>
      throw _privateConstructorUsedError;
  Verification? get verification => throw _privateConstructorUsedError;
  bool? get isDeleted => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  List<FeeDetail>? get feeDetails => throw _privateConstructorUsedError;
  @JsonKey(name: '__v')
  int? get v => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AuthorizationCopyWith<Authorization> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthorizationCopyWith<$Res> {
  factory $AuthorizationCopyWith(
          Authorization value, $Res Function(Authorization) then) =
      _$AuthorizationCopyWithImpl<$Res, Authorization>;
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String? id,
      String? business,
      String? customer,
      String? account,
      String? card,
      int? amount,
      int? fee,
      int? vat,
      bool? approved,
      String? currency,
      String? status,
      String? authorizationMethod,
      List<dynamic>? balanceTransactions,
      int? merchantAmount,
      String? merchantCurrency,
      Merchant? merchant,
      Terminal? terminal,
      TransactionMetadata? transactionMetadata,
      dynamic pendingRequest,
      List<RequestHistory>? requestHistory,
      Verification? verification,
      bool? isDeleted,
      DateTime? createdAt,
      DateTime? updatedAt,
      List<FeeDetail>? feeDetails,
      @JsonKey(name: '__v') int? v});

  $MerchantCopyWith<$Res>? get merchant;
  $TerminalCopyWith<$Res>? get terminal;
  $TransactionMetadataCopyWith<$Res>? get transactionMetadata;
  $VerificationCopyWith<$Res>? get verification;
}

/// @nodoc
class _$AuthorizationCopyWithImpl<$Res, $Val extends Authorization>
    implements $AuthorizationCopyWith<$Res> {
  _$AuthorizationCopyWithImpl(this._value, this._then);

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
    Object? amount = freezed,
    Object? fee = freezed,
    Object? vat = freezed,
    Object? approved = freezed,
    Object? currency = freezed,
    Object? status = freezed,
    Object? authorizationMethod = freezed,
    Object? balanceTransactions = freezed,
    Object? merchantAmount = freezed,
    Object? merchantCurrency = freezed,
    Object? merchant = freezed,
    Object? terminal = freezed,
    Object? transactionMetadata = freezed,
    Object? pendingRequest = freezed,
    Object? requestHistory = freezed,
    Object? verification = freezed,
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
              as String?,
      account: freezed == account
          ? _value.account
          : account // ignore: cast_nullable_to_non_nullable
              as String?,
      card: freezed == card
          ? _value.card
          : card // ignore: cast_nullable_to_non_nullable
              as String?,
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
      approved: freezed == approved
          ? _value.approved
          : approved // ignore: cast_nullable_to_non_nullable
              as bool?,
      currency: freezed == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      authorizationMethod: freezed == authorizationMethod
          ? _value.authorizationMethod
          : authorizationMethod // ignore: cast_nullable_to_non_nullable
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
      pendingRequest: freezed == pendingRequest
          ? _value.pendingRequest
          : pendingRequest // ignore: cast_nullable_to_non_nullable
              as dynamic,
      requestHistory: freezed == requestHistory
          ? _value.requestHistory
          : requestHistory // ignore: cast_nullable_to_non_nullable
              as List<RequestHistory>?,
      verification: freezed == verification
          ? _value.verification
          : verification // ignore: cast_nullable_to_non_nullable
              as Verification?,
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

  @override
  @pragma('vm:prefer-inline')
  $VerificationCopyWith<$Res>? get verification {
    if (_value.verification == null) {
      return null;
    }

    return $VerificationCopyWith<$Res>(_value.verification!, (value) {
      return _then(_value.copyWith(verification: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AuthorizationImplCopyWith<$Res>
    implements $AuthorizationCopyWith<$Res> {
  factory _$$AuthorizationImplCopyWith(
          _$AuthorizationImpl value, $Res Function(_$AuthorizationImpl) then) =
      __$$AuthorizationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String? id,
      String? business,
      String? customer,
      String? account,
      String? card,
      int? amount,
      int? fee,
      int? vat,
      bool? approved,
      String? currency,
      String? status,
      String? authorizationMethod,
      List<dynamic>? balanceTransactions,
      int? merchantAmount,
      String? merchantCurrency,
      Merchant? merchant,
      Terminal? terminal,
      TransactionMetadata? transactionMetadata,
      dynamic pendingRequest,
      List<RequestHistory>? requestHistory,
      Verification? verification,
      bool? isDeleted,
      DateTime? createdAt,
      DateTime? updatedAt,
      List<FeeDetail>? feeDetails,
      @JsonKey(name: '__v') int? v});

  @override
  $MerchantCopyWith<$Res>? get merchant;
  @override
  $TerminalCopyWith<$Res>? get terminal;
  @override
  $TransactionMetadataCopyWith<$Res>? get transactionMetadata;
  @override
  $VerificationCopyWith<$Res>? get verification;
}

/// @nodoc
class __$$AuthorizationImplCopyWithImpl<$Res>
    extends _$AuthorizationCopyWithImpl<$Res, _$AuthorizationImpl>
    implements _$$AuthorizationImplCopyWith<$Res> {
  __$$AuthorizationImplCopyWithImpl(
      _$AuthorizationImpl _value, $Res Function(_$AuthorizationImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? business = freezed,
    Object? customer = freezed,
    Object? account = freezed,
    Object? card = freezed,
    Object? amount = freezed,
    Object? fee = freezed,
    Object? vat = freezed,
    Object? approved = freezed,
    Object? currency = freezed,
    Object? status = freezed,
    Object? authorizationMethod = freezed,
    Object? balanceTransactions = freezed,
    Object? merchantAmount = freezed,
    Object? merchantCurrency = freezed,
    Object? merchant = freezed,
    Object? terminal = freezed,
    Object? transactionMetadata = freezed,
    Object? pendingRequest = freezed,
    Object? requestHistory = freezed,
    Object? verification = freezed,
    Object? isDeleted = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? feeDetails = freezed,
    Object? v = freezed,
  }) {
    return _then(_$AuthorizationImpl(
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
              as String?,
      account: freezed == account
          ? _value.account
          : account // ignore: cast_nullable_to_non_nullable
              as String?,
      card: freezed == card
          ? _value.card
          : card // ignore: cast_nullable_to_non_nullable
              as String?,
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
      approved: freezed == approved
          ? _value.approved
          : approved // ignore: cast_nullable_to_non_nullable
              as bool?,
      currency: freezed == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      authorizationMethod: freezed == authorizationMethod
          ? _value.authorizationMethod
          : authorizationMethod // ignore: cast_nullable_to_non_nullable
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
      pendingRequest: freezed == pendingRequest
          ? _value.pendingRequest
          : pendingRequest // ignore: cast_nullable_to_non_nullable
              as dynamic,
      requestHistory: freezed == requestHistory
          ? _value._requestHistory
          : requestHistory // ignore: cast_nullable_to_non_nullable
              as List<RequestHistory>?,
      verification: freezed == verification
          ? _value.verification
          : verification // ignore: cast_nullable_to_non_nullable
              as Verification?,
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
class _$AuthorizationImpl implements _Authorization {
  _$AuthorizationImpl(
      {@JsonKey(name: '_id') this.id,
      this.business,
      this.customer,
      this.account,
      this.card,
      this.amount,
      this.fee,
      this.vat,
      this.approved,
      this.currency,
      this.status,
      this.authorizationMethod,
      final List<dynamic>? balanceTransactions,
      this.merchantAmount,
      this.merchantCurrency,
      this.merchant,
      this.terminal,
      this.transactionMetadata,
      this.pendingRequest,
      final List<RequestHistory>? requestHistory,
      this.verification,
      this.isDeleted,
      this.createdAt,
      this.updatedAt,
      final List<FeeDetail>? feeDetails,
      @JsonKey(name: '__v') this.v})
      : _balanceTransactions = balanceTransactions,
        _requestHistory = requestHistory,
        _feeDetails = feeDetails;

  factory _$AuthorizationImpl.fromJson(Map<String, dynamic> json) =>
      _$$AuthorizationImplFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String? id;
  @override
  final String? business;
  @override
  final String? customer;
  @override
  final String? account;
  @override
  final String? card;
  @override
  final int? amount;
  @override
  final int? fee;
  @override
  final int? vat;
  @override
  final bool? approved;
  @override
  final String? currency;
  @override
  final String? status;
  @override
  final String? authorizationMethod;
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
  final dynamic pendingRequest;
  final List<RequestHistory>? _requestHistory;
  @override
  List<RequestHistory>? get requestHistory {
    final value = _requestHistory;
    if (value == null) return null;
    if (_requestHistory is EqualUnmodifiableListView) return _requestHistory;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final Verification? verification;
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
    return 'Authorization(id: $id, business: $business, customer: $customer, account: $account, card: $card, amount: $amount, fee: $fee, vat: $vat, approved: $approved, currency: $currency, status: $status, authorizationMethod: $authorizationMethod, balanceTransactions: $balanceTransactions, merchantAmount: $merchantAmount, merchantCurrency: $merchantCurrency, merchant: $merchant, terminal: $terminal, transactionMetadata: $transactionMetadata, pendingRequest: $pendingRequest, requestHistory: $requestHistory, verification: $verification, isDeleted: $isDeleted, createdAt: $createdAt, updatedAt: $updatedAt, feeDetails: $feeDetails, v: $v)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthorizationImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.business, business) ||
                other.business == business) &&
            (identical(other.customer, customer) ||
                other.customer == customer) &&
            (identical(other.account, account) || other.account == account) &&
            (identical(other.card, card) || other.card == card) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.fee, fee) || other.fee == fee) &&
            (identical(other.vat, vat) || other.vat == vat) &&
            (identical(other.approved, approved) ||
                other.approved == approved) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.authorizationMethod, authorizationMethod) ||
                other.authorizationMethod == authorizationMethod) &&
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
            const DeepCollectionEquality()
                .equals(other.pendingRequest, pendingRequest) &&
            const DeepCollectionEquality()
                .equals(other._requestHistory, _requestHistory) &&
            (identical(other.verification, verification) ||
                other.verification == verification) &&
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
        amount,
        fee,
        vat,
        approved,
        currency,
        status,
        authorizationMethod,
        const DeepCollectionEquality().hash(_balanceTransactions),
        merchantAmount,
        merchantCurrency,
        merchant,
        terminal,
        transactionMetadata,
        const DeepCollectionEquality().hash(pendingRequest),
        const DeepCollectionEquality().hash(_requestHistory),
        verification,
        isDeleted,
        createdAt,
        updatedAt,
        const DeepCollectionEquality().hash(_feeDetails),
        v
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthorizationImplCopyWith<_$AuthorizationImpl> get copyWith =>
      __$$AuthorizationImplCopyWithImpl<_$AuthorizationImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AuthorizationImplToJson(
      this,
    );
  }
}

abstract class _Authorization implements Authorization {
  factory _Authorization(
      {@JsonKey(name: '_id') final String? id,
      final String? business,
      final String? customer,
      final String? account,
      final String? card,
      final int? amount,
      final int? fee,
      final int? vat,
      final bool? approved,
      final String? currency,
      final String? status,
      final String? authorizationMethod,
      final List<dynamic>? balanceTransactions,
      final int? merchantAmount,
      final String? merchantCurrency,
      final Merchant? merchant,
      final Terminal? terminal,
      final TransactionMetadata? transactionMetadata,
      final dynamic pendingRequest,
      final List<RequestHistory>? requestHistory,
      final Verification? verification,
      final bool? isDeleted,
      final DateTime? createdAt,
      final DateTime? updatedAt,
      final List<FeeDetail>? feeDetails,
      @JsonKey(name: '__v') final int? v}) = _$AuthorizationImpl;

  factory _Authorization.fromJson(Map<String, dynamic> json) =
      _$AuthorizationImpl.fromJson;

  @override
  @JsonKey(name: '_id')
  String? get id;
  @override
  String? get business;
  @override
  String? get customer;
  @override
  String? get account;
  @override
  String? get card;
  @override
  int? get amount;
  @override
  int? get fee;
  @override
  int? get vat;
  @override
  bool? get approved;
  @override
  String? get currency;
  @override
  String? get status;
  @override
  String? get authorizationMethod;
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
  dynamic get pendingRequest;
  @override
  List<RequestHistory>? get requestHistory;
  @override
  Verification? get verification;
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
  _$$AuthorizationImplCopyWith<_$AuthorizationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
