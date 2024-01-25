// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transaction_analytic.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TransactionAnalytic _$TransactionAnalyticFromJson(Map<String, dynamic> json) {
  return _TransactionAnalytic.fromJson(json);
}

/// @nodoc
mixin _$TransactionAnalytic {
  @JsonKey(name: 'analyticsSummary')
  @HiveField(0)
  List<AnalyticSummary> get analyticsSummary =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'analytics')
  @HiveField(1)
  List<Analytic> get analytic => throw _privateConstructorUsedError;
  @HiveField(2)
  List<List<AnalyticSummary>> get chunkedTransactions =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TransactionAnalyticCopyWith<TransactionAnalytic> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionAnalyticCopyWith<$Res> {
  factory $TransactionAnalyticCopyWith(
          TransactionAnalytic value, $Res Function(TransactionAnalytic) then) =
      _$TransactionAnalyticCopyWithImpl<$Res, TransactionAnalytic>;
  @useResult
  $Res call(
      {@JsonKey(name: 'analyticsSummary')
      @HiveField(0)
      List<AnalyticSummary> analyticsSummary,
      @JsonKey(name: 'analytics') @HiveField(1) List<Analytic> analytic,
      @HiveField(2) List<List<AnalyticSummary>> chunkedTransactions});
}

/// @nodoc
class _$TransactionAnalyticCopyWithImpl<$Res, $Val extends TransactionAnalytic>
    implements $TransactionAnalyticCopyWith<$Res> {
  _$TransactionAnalyticCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? analyticsSummary = null,
    Object? analytic = null,
    Object? chunkedTransactions = null,
  }) {
    return _then(_value.copyWith(
      analyticsSummary: null == analyticsSummary
          ? _value.analyticsSummary
          : analyticsSummary // ignore: cast_nullable_to_non_nullable
              as List<AnalyticSummary>,
      analytic: null == analytic
          ? _value.analytic
          : analytic // ignore: cast_nullable_to_non_nullable
              as List<Analytic>,
      chunkedTransactions: null == chunkedTransactions
          ? _value.chunkedTransactions
          : chunkedTransactions // ignore: cast_nullable_to_non_nullable
              as List<List<AnalyticSummary>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TransactionAnalyticImplCopyWith<$Res>
    implements $TransactionAnalyticCopyWith<$Res> {
  factory _$$TransactionAnalyticImplCopyWith(_$TransactionAnalyticImpl value,
          $Res Function(_$TransactionAnalyticImpl) then) =
      __$$TransactionAnalyticImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'analyticsSummary')
      @HiveField(0)
      List<AnalyticSummary> analyticsSummary,
      @JsonKey(name: 'analytics') @HiveField(1) List<Analytic> analytic,
      @HiveField(2) List<List<AnalyticSummary>> chunkedTransactions});
}

/// @nodoc
class __$$TransactionAnalyticImplCopyWithImpl<$Res>
    extends _$TransactionAnalyticCopyWithImpl<$Res, _$TransactionAnalyticImpl>
    implements _$$TransactionAnalyticImplCopyWith<$Res> {
  __$$TransactionAnalyticImplCopyWithImpl(_$TransactionAnalyticImpl _value,
      $Res Function(_$TransactionAnalyticImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? analyticsSummary = null,
    Object? analytic = null,
    Object? chunkedTransactions = null,
  }) {
    return _then(_$TransactionAnalyticImpl(
      analyticsSummary: null == analyticsSummary
          ? _value._analyticsSummary
          : analyticsSummary // ignore: cast_nullable_to_non_nullable
              as List<AnalyticSummary>,
      analytic: null == analytic
          ? _value._analytic
          : analytic // ignore: cast_nullable_to_non_nullable
              as List<Analytic>,
      chunkedTransactions: null == chunkedTransactions
          ? _value._chunkedTransactions
          : chunkedTransactions // ignore: cast_nullable_to_non_nullable
              as List<List<AnalyticSummary>>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TransactionAnalyticImpl implements _TransactionAnalytic {
  _$TransactionAnalyticImpl(
      {@JsonKey(name: 'analyticsSummary')
      @HiveField(0)
      final List<AnalyticSummary> analyticsSummary = const [],
      @JsonKey(name: 'analytics')
      @HiveField(1)
      final List<Analytic> analytic = const [],
      @HiveField(2)
      final List<List<AnalyticSummary>> chunkedTransactions = const []})
      : _analyticsSummary = analyticsSummary,
        _analytic = analytic,
        _chunkedTransactions = chunkedTransactions;

  factory _$TransactionAnalyticImpl.fromJson(Map<String, dynamic> json) =>
      _$$TransactionAnalyticImplFromJson(json);

  final List<AnalyticSummary> _analyticsSummary;
  @override
  @JsonKey(name: 'analyticsSummary')
  @HiveField(0)
  List<AnalyticSummary> get analyticsSummary {
    if (_analyticsSummary is EqualUnmodifiableListView)
      return _analyticsSummary;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_analyticsSummary);
  }

  final List<Analytic> _analytic;
  @override
  @JsonKey(name: 'analytics')
  @HiveField(1)
  List<Analytic> get analytic {
    if (_analytic is EqualUnmodifiableListView) return _analytic;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_analytic);
  }

  final List<List<AnalyticSummary>> _chunkedTransactions;
  @override
  @JsonKey()
  @HiveField(2)
  List<List<AnalyticSummary>> get chunkedTransactions {
    if (_chunkedTransactions is EqualUnmodifiableListView)
      return _chunkedTransactions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_chunkedTransactions);
  }

  @override
  String toString() {
    return 'TransactionAnalytic(analyticsSummary: $analyticsSummary, analytic: $analytic, chunkedTransactions: $chunkedTransactions)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransactionAnalyticImpl &&
            const DeepCollectionEquality()
                .equals(other._analyticsSummary, _analyticsSummary) &&
            const DeepCollectionEquality().equals(other._analytic, _analytic) &&
            const DeepCollectionEquality()
                .equals(other._chunkedTransactions, _chunkedTransactions));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_analyticsSummary),
      const DeepCollectionEquality().hash(_analytic),
      const DeepCollectionEquality().hash(_chunkedTransactions));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TransactionAnalyticImplCopyWith<_$TransactionAnalyticImpl> get copyWith =>
      __$$TransactionAnalyticImplCopyWithImpl<_$TransactionAnalyticImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TransactionAnalyticImplToJson(
      this,
    );
  }
}

abstract class _TransactionAnalytic implements TransactionAnalytic {
  factory _TransactionAnalytic(
      {@JsonKey(name: 'analyticsSummary')
      @HiveField(0)
      final List<AnalyticSummary> analyticsSummary,
      @JsonKey(name: 'analytics') @HiveField(1) final List<Analytic> analytic,
      @HiveField(2)
      final List<List<AnalyticSummary>>
          chunkedTransactions}) = _$TransactionAnalyticImpl;

  factory _TransactionAnalytic.fromJson(Map<String, dynamic> json) =
      _$TransactionAnalyticImpl.fromJson;

  @override
  @JsonKey(name: 'analyticsSummary')
  @HiveField(0)
  List<AnalyticSummary> get analyticsSummary;
  @override
  @JsonKey(name: 'analytics')
  @HiveField(1)
  List<Analytic> get analytic;
  @override
  @HiveField(2)
  List<List<AnalyticSummary>> get chunkedTransactions;
  @override
  @JsonKey(ignore: true)
  _$$TransactionAnalyticImplCopyWith<_$TransactionAnalyticImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AnalyticSummary _$AnalyticSummaryFromJson(Map<String, dynamic> json) {
  return _AnalyticSummary.fromJson(json);
}

/// @nodoc
mixin _$AnalyticSummary {
  @JsonKey(name: 'day')
  @HiveField(0)
  @StringToNumSerializer()
  num get day => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_outflow')
  @StringToNumSerializer()
  @HiveField(1)
  num get totalOutflow => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AnalyticSummaryCopyWith<AnalyticSummary> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnalyticSummaryCopyWith<$Res> {
  factory $AnalyticSummaryCopyWith(
          AnalyticSummary value, $Res Function(AnalyticSummary) then) =
      _$AnalyticSummaryCopyWithImpl<$Res, AnalyticSummary>;
  @useResult
  $Res call(
      {@JsonKey(name: 'day') @HiveField(0) @StringToNumSerializer() num day,
      @JsonKey(name: 'total_outflow')
      @StringToNumSerializer()
      @HiveField(1)
      num totalOutflow});
}

/// @nodoc
class _$AnalyticSummaryCopyWithImpl<$Res, $Val extends AnalyticSummary>
    implements $AnalyticSummaryCopyWith<$Res> {
  _$AnalyticSummaryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? day = null,
    Object? totalOutflow = null,
  }) {
    return _then(_value.copyWith(
      day: null == day
          ? _value.day
          : day // ignore: cast_nullable_to_non_nullable
              as num,
      totalOutflow: null == totalOutflow
          ? _value.totalOutflow
          : totalOutflow // ignore: cast_nullable_to_non_nullable
              as num,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AnalyticSummaryImplCopyWith<$Res>
    implements $AnalyticSummaryCopyWith<$Res> {
  factory _$$AnalyticSummaryImplCopyWith(_$AnalyticSummaryImpl value,
          $Res Function(_$AnalyticSummaryImpl) then) =
      __$$AnalyticSummaryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'day') @HiveField(0) @StringToNumSerializer() num day,
      @JsonKey(name: 'total_outflow')
      @StringToNumSerializer()
      @HiveField(1)
      num totalOutflow});
}

/// @nodoc
class __$$AnalyticSummaryImplCopyWithImpl<$Res>
    extends _$AnalyticSummaryCopyWithImpl<$Res, _$AnalyticSummaryImpl>
    implements _$$AnalyticSummaryImplCopyWith<$Res> {
  __$$AnalyticSummaryImplCopyWithImpl(
      _$AnalyticSummaryImpl _value, $Res Function(_$AnalyticSummaryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? day = null,
    Object? totalOutflow = null,
  }) {
    return _then(_$AnalyticSummaryImpl(
      day: null == day
          ? _value.day
          : day // ignore: cast_nullable_to_non_nullable
              as num,
      totalOutflow: null == totalOutflow
          ? _value.totalOutflow
          : totalOutflow // ignore: cast_nullable_to_non_nullable
              as num,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AnalyticSummaryImpl implements _AnalyticSummary {
  _$AnalyticSummaryImpl(
      {@JsonKey(name: 'day')
      @HiveField(0)
      @StringToNumSerializer()
      this.day = 0,
      @JsonKey(name: 'total_outflow')
      @StringToNumSerializer()
      @HiveField(1)
      this.totalOutflow = 0});

  factory _$AnalyticSummaryImpl.fromJson(Map<String, dynamic> json) =>
      _$$AnalyticSummaryImplFromJson(json);

  @override
  @JsonKey(name: 'day')
  @HiveField(0)
  @StringToNumSerializer()
  final num day;
  @override
  @JsonKey(name: 'total_outflow')
  @StringToNumSerializer()
  @HiveField(1)
  final num totalOutflow;

  @override
  String toString() {
    return 'AnalyticSummary(day: $day, totalOutflow: $totalOutflow)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AnalyticSummaryImpl &&
            (identical(other.day, day) || other.day == day) &&
            (identical(other.totalOutflow, totalOutflow) ||
                other.totalOutflow == totalOutflow));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, day, totalOutflow);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AnalyticSummaryImplCopyWith<_$AnalyticSummaryImpl> get copyWith =>
      __$$AnalyticSummaryImplCopyWithImpl<_$AnalyticSummaryImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AnalyticSummaryImplToJson(
      this,
    );
  }
}

abstract class _AnalyticSummary implements AnalyticSummary {
  factory _AnalyticSummary(
      {@JsonKey(name: 'day')
      @HiveField(0)
      @StringToNumSerializer()
      final num day,
      @JsonKey(name: 'total_outflow')
      @StringToNumSerializer()
      @HiveField(1)
      final num totalOutflow}) = _$AnalyticSummaryImpl;

  factory _AnalyticSummary.fromJson(Map<String, dynamic> json) =
      _$AnalyticSummaryImpl.fromJson;

  @override
  @JsonKey(name: 'day')
  @HiveField(0)
  @StringToNumSerializer()
  num get day;
  @override
  @JsonKey(name: 'total_outflow')
  @StringToNumSerializer()
  @HiveField(1)
  num get totalOutflow;
  @override
  @JsonKey(ignore: true)
  _$$AnalyticSummaryImplCopyWith<_$AnalyticSummaryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Analytic _$AnalyticFromJson(Map<String, dynamic> json) {
  return _Analytic.fromJson(json);
}

/// @nodoc
mixin _$Analytic {
  @JsonKey(name: 'total_spending')
  @StringToNumSerializer()
  @HiveField(0)
  num get totalSpending => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_inflow')
  @StringToNumSerializer()
  @HiveField(1)
  num get totalInflow => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_outflow')
  @StringToNumSerializer()
  @HiveField(2)
  num get totalOutflow => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_transfers')
  @StringToNumSerializer()
  @HiveField(3)
  num get totalTransfers => throw _privateConstructorUsedError;
  @JsonKey(name: 'transfer_percentage')
  @StringToNumSerializer()
  @HiveField(4)
  num get transferPercentage => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_admin_credit_wallet')
  @StringToNumSerializer()
  @HiveField(5)
  num get totalAdminCreditWallet => throw _privateConstructorUsedError;
  @JsonKey(name: 'admin_credit_wallet_percentage')
  @StringToNumSerializer()
  @HiveField(6)
  num get adminCreditWalletPercentage => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_admin_debit_wallet')
  @StringToNumSerializer()
  @HiveField(7)
  num get totalAdminDebitWallet => throw _privateConstructorUsedError;
  @JsonKey(name: 'admin_debit_wallet_percentage')
  @StringToNumSerializer()
  num get adminDebitWalletPercentage => throw _privateConstructorUsedError;
  @HiveField(8)
  @JsonKey(name: 'total_voucher_purchased')
  @StringToNumSerializer()
  @HiveField(9)
  num get totalVoucherPurchased => throw _privateConstructorUsedError;
  @JsonKey(name: 'voucher_percentage')
  @StringToNumSerializer()
  @HiveField(10)
  num get voucherPercentage => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_airtime_purchased')
  @StringToNumSerializer()
  @HiveField(11)
  num get totalAirtimePurchased => throw _privateConstructorUsedError;
  @JsonKey(name: 'airtime_percentage')
  @StringToNumSerializer()
  @HiveField(12)
  num get airtimePercentage => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_data_purchased')
  @HiveField(13)
  @StringToNumSerializer()
  num get totalDataPurchased => throw _privateConstructorUsedError;
  @JsonKey(name: 'data_percentage')
  @StringToNumSerializer()
  @HiveField(14)
  num get dataPercentage => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_internet_purchased')
  @StringToNumSerializer()
  @HiveField(15)
  num get totalInternetPurchased => throw _privateConstructorUsedError;
  @JsonKey(name: 'internet_percentage')
  @StringToNumSerializer()
  @HiveField(16)
  num get internetPercentage => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_cable_purchased')
  @StringToNumSerializer()
  @HiveField(17)
  num get totalCablePurchased => throw _privateConstructorUsedError;
  @JsonKey(name: 'cable_percentage')
  @StringToNumSerializer()
  @HiveField(18)
  num get cablePercentage => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_education_purchased')
  @StringToNumSerializer()
  @HiveField(19)
  num get totalEducationPurchased => throw _privateConstructorUsedError;
  @JsonKey(name: 'education_percentage')
  @StringToNumSerializer()
  @HiveField(20)
  num get educationPercentage => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_electricity_purchased')
  @StringToNumSerializer()
  @HiveField(21)
  num get totalElectricityPurchased => throw _privateConstructorUsedError;
  @JsonKey(name: 'electricity_percentage')
  @StringToNumSerializer()
  @HiveField(22)
  num get electricityPercentage => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_betting_purchased')
  @StringToNumSerializer()
  @HiveField(23)
  num get totalBettingPurchased => throw _privateConstructorUsedError;
  @JsonKey(name: 'betting_percentage')
  @StringToNumSerializer()
  @HiveField(24)
  num get bettingPercentage => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AnalyticCopyWith<Analytic> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnalyticCopyWith<$Res> {
  factory $AnalyticCopyWith(Analytic value, $Res Function(Analytic) then) =
      _$AnalyticCopyWithImpl<$Res, Analytic>;
  @useResult
  $Res call(
      {@JsonKey(name: 'total_spending')
      @StringToNumSerializer()
      @HiveField(0)
      num totalSpending,
      @JsonKey(name: 'total_inflow')
      @StringToNumSerializer()
      @HiveField(1)
      num totalInflow,
      @JsonKey(name: 'total_outflow')
      @StringToNumSerializer()
      @HiveField(2)
      num totalOutflow,
      @JsonKey(name: 'total_transfers')
      @StringToNumSerializer()
      @HiveField(3)
      num totalTransfers,
      @JsonKey(name: 'transfer_percentage')
      @StringToNumSerializer()
      @HiveField(4)
      num transferPercentage,
      @JsonKey(name: 'total_admin_credit_wallet')
      @StringToNumSerializer()
      @HiveField(5)
      num totalAdminCreditWallet,
      @JsonKey(name: 'admin_credit_wallet_percentage')
      @StringToNumSerializer()
      @HiveField(6)
      num adminCreditWalletPercentage,
      @JsonKey(name: 'total_admin_debit_wallet')
      @StringToNumSerializer()
      @HiveField(7)
      num totalAdminDebitWallet,
      @JsonKey(name: 'admin_debit_wallet_percentage')
      @StringToNumSerializer()
      num adminDebitWalletPercentage,
      @HiveField(8)
      @JsonKey(name: 'total_voucher_purchased')
      @StringToNumSerializer()
      @HiveField(9)
      num totalVoucherPurchased,
      @JsonKey(name: 'voucher_percentage')
      @StringToNumSerializer()
      @HiveField(10)
      num voucherPercentage,
      @JsonKey(name: 'total_airtime_purchased')
      @StringToNumSerializer()
      @HiveField(11)
      num totalAirtimePurchased,
      @JsonKey(name: 'airtime_percentage')
      @StringToNumSerializer()
      @HiveField(12)
      num airtimePercentage,
      @JsonKey(name: 'total_data_purchased')
      @HiveField(13)
      @StringToNumSerializer()
      num totalDataPurchased,
      @JsonKey(name: 'data_percentage')
      @StringToNumSerializer()
      @HiveField(14)
      num dataPercentage,
      @JsonKey(name: 'total_internet_purchased')
      @StringToNumSerializer()
      @HiveField(15)
      num totalInternetPurchased,
      @JsonKey(name: 'internet_percentage')
      @StringToNumSerializer()
      @HiveField(16)
      num internetPercentage,
      @JsonKey(name: 'total_cable_purchased')
      @StringToNumSerializer()
      @HiveField(17)
      num totalCablePurchased,
      @JsonKey(name: 'cable_percentage')
      @StringToNumSerializer()
      @HiveField(18)
      num cablePercentage,
      @JsonKey(name: 'total_education_purchased')
      @StringToNumSerializer()
      @HiveField(19)
      num totalEducationPurchased,
      @JsonKey(name: 'education_percentage')
      @StringToNumSerializer()
      @HiveField(20)
      num educationPercentage,
      @JsonKey(name: 'total_electricity_purchased')
      @StringToNumSerializer()
      @HiveField(21)
      num totalElectricityPurchased,
      @JsonKey(name: 'electricity_percentage')
      @StringToNumSerializer()
      @HiveField(22)
      num electricityPercentage,
      @JsonKey(name: 'total_betting_purchased')
      @StringToNumSerializer()
      @HiveField(23)
      num totalBettingPurchased,
      @JsonKey(name: 'betting_percentage')
      @StringToNumSerializer()
      @HiveField(24)
      num bettingPercentage});
}

/// @nodoc
class _$AnalyticCopyWithImpl<$Res, $Val extends Analytic>
    implements $AnalyticCopyWith<$Res> {
  _$AnalyticCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalSpending = null,
    Object? totalInflow = null,
    Object? totalOutflow = null,
    Object? totalTransfers = null,
    Object? transferPercentage = null,
    Object? totalAdminCreditWallet = null,
    Object? adminCreditWalletPercentage = null,
    Object? totalAdminDebitWallet = null,
    Object? adminDebitWalletPercentage = null,
    Object? totalVoucherPurchased = null,
    Object? voucherPercentage = null,
    Object? totalAirtimePurchased = null,
    Object? airtimePercentage = null,
    Object? totalDataPurchased = null,
    Object? dataPercentage = null,
    Object? totalInternetPurchased = null,
    Object? internetPercentage = null,
    Object? totalCablePurchased = null,
    Object? cablePercentage = null,
    Object? totalEducationPurchased = null,
    Object? educationPercentage = null,
    Object? totalElectricityPurchased = null,
    Object? electricityPercentage = null,
    Object? totalBettingPurchased = null,
    Object? bettingPercentage = null,
  }) {
    return _then(_value.copyWith(
      totalSpending: null == totalSpending
          ? _value.totalSpending
          : totalSpending // ignore: cast_nullable_to_non_nullable
              as num,
      totalInflow: null == totalInflow
          ? _value.totalInflow
          : totalInflow // ignore: cast_nullable_to_non_nullable
              as num,
      totalOutflow: null == totalOutflow
          ? _value.totalOutflow
          : totalOutflow // ignore: cast_nullable_to_non_nullable
              as num,
      totalTransfers: null == totalTransfers
          ? _value.totalTransfers
          : totalTransfers // ignore: cast_nullable_to_non_nullable
              as num,
      transferPercentage: null == transferPercentage
          ? _value.transferPercentage
          : transferPercentage // ignore: cast_nullable_to_non_nullable
              as num,
      totalAdminCreditWallet: null == totalAdminCreditWallet
          ? _value.totalAdminCreditWallet
          : totalAdminCreditWallet // ignore: cast_nullable_to_non_nullable
              as num,
      adminCreditWalletPercentage: null == adminCreditWalletPercentage
          ? _value.adminCreditWalletPercentage
          : adminCreditWalletPercentage // ignore: cast_nullable_to_non_nullable
              as num,
      totalAdminDebitWallet: null == totalAdminDebitWallet
          ? _value.totalAdminDebitWallet
          : totalAdminDebitWallet // ignore: cast_nullable_to_non_nullable
              as num,
      adminDebitWalletPercentage: null == adminDebitWalletPercentage
          ? _value.adminDebitWalletPercentage
          : adminDebitWalletPercentage // ignore: cast_nullable_to_non_nullable
              as num,
      totalVoucherPurchased: null == totalVoucherPurchased
          ? _value.totalVoucherPurchased
          : totalVoucherPurchased // ignore: cast_nullable_to_non_nullable
              as num,
      voucherPercentage: null == voucherPercentage
          ? _value.voucherPercentage
          : voucherPercentage // ignore: cast_nullable_to_non_nullable
              as num,
      totalAirtimePurchased: null == totalAirtimePurchased
          ? _value.totalAirtimePurchased
          : totalAirtimePurchased // ignore: cast_nullable_to_non_nullable
              as num,
      airtimePercentage: null == airtimePercentage
          ? _value.airtimePercentage
          : airtimePercentage // ignore: cast_nullable_to_non_nullable
              as num,
      totalDataPurchased: null == totalDataPurchased
          ? _value.totalDataPurchased
          : totalDataPurchased // ignore: cast_nullable_to_non_nullable
              as num,
      dataPercentage: null == dataPercentage
          ? _value.dataPercentage
          : dataPercentage // ignore: cast_nullable_to_non_nullable
              as num,
      totalInternetPurchased: null == totalInternetPurchased
          ? _value.totalInternetPurchased
          : totalInternetPurchased // ignore: cast_nullable_to_non_nullable
              as num,
      internetPercentage: null == internetPercentage
          ? _value.internetPercentage
          : internetPercentage // ignore: cast_nullable_to_non_nullable
              as num,
      totalCablePurchased: null == totalCablePurchased
          ? _value.totalCablePurchased
          : totalCablePurchased // ignore: cast_nullable_to_non_nullable
              as num,
      cablePercentage: null == cablePercentage
          ? _value.cablePercentage
          : cablePercentage // ignore: cast_nullable_to_non_nullable
              as num,
      totalEducationPurchased: null == totalEducationPurchased
          ? _value.totalEducationPurchased
          : totalEducationPurchased // ignore: cast_nullable_to_non_nullable
              as num,
      educationPercentage: null == educationPercentage
          ? _value.educationPercentage
          : educationPercentage // ignore: cast_nullable_to_non_nullable
              as num,
      totalElectricityPurchased: null == totalElectricityPurchased
          ? _value.totalElectricityPurchased
          : totalElectricityPurchased // ignore: cast_nullable_to_non_nullable
              as num,
      electricityPercentage: null == electricityPercentage
          ? _value.electricityPercentage
          : electricityPercentage // ignore: cast_nullable_to_non_nullable
              as num,
      totalBettingPurchased: null == totalBettingPurchased
          ? _value.totalBettingPurchased
          : totalBettingPurchased // ignore: cast_nullable_to_non_nullable
              as num,
      bettingPercentage: null == bettingPercentage
          ? _value.bettingPercentage
          : bettingPercentage // ignore: cast_nullable_to_non_nullable
              as num,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AnalyticImplCopyWith<$Res>
    implements $AnalyticCopyWith<$Res> {
  factory _$$AnalyticImplCopyWith(
          _$AnalyticImpl value, $Res Function(_$AnalyticImpl) then) =
      __$$AnalyticImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'total_spending')
      @StringToNumSerializer()
      @HiveField(0)
      num totalSpending,
      @JsonKey(name: 'total_inflow')
      @StringToNumSerializer()
      @HiveField(1)
      num totalInflow,
      @JsonKey(name: 'total_outflow')
      @StringToNumSerializer()
      @HiveField(2)
      num totalOutflow,
      @JsonKey(name: 'total_transfers')
      @StringToNumSerializer()
      @HiveField(3)
      num totalTransfers,
      @JsonKey(name: 'transfer_percentage')
      @StringToNumSerializer()
      @HiveField(4)
      num transferPercentage,
      @JsonKey(name: 'total_admin_credit_wallet')
      @StringToNumSerializer()
      @HiveField(5)
      num totalAdminCreditWallet,
      @JsonKey(name: 'admin_credit_wallet_percentage')
      @StringToNumSerializer()
      @HiveField(6)
      num adminCreditWalletPercentage,
      @JsonKey(name: 'total_admin_debit_wallet')
      @StringToNumSerializer()
      @HiveField(7)
      num totalAdminDebitWallet,
      @JsonKey(name: 'admin_debit_wallet_percentage')
      @StringToNumSerializer()
      num adminDebitWalletPercentage,
      @HiveField(8)
      @JsonKey(name: 'total_voucher_purchased')
      @StringToNumSerializer()
      @HiveField(9)
      num totalVoucherPurchased,
      @JsonKey(name: 'voucher_percentage')
      @StringToNumSerializer()
      @HiveField(10)
      num voucherPercentage,
      @JsonKey(name: 'total_airtime_purchased')
      @StringToNumSerializer()
      @HiveField(11)
      num totalAirtimePurchased,
      @JsonKey(name: 'airtime_percentage')
      @StringToNumSerializer()
      @HiveField(12)
      num airtimePercentage,
      @JsonKey(name: 'total_data_purchased')
      @HiveField(13)
      @StringToNumSerializer()
      num totalDataPurchased,
      @JsonKey(name: 'data_percentage')
      @StringToNumSerializer()
      @HiveField(14)
      num dataPercentage,
      @JsonKey(name: 'total_internet_purchased')
      @StringToNumSerializer()
      @HiveField(15)
      num totalInternetPurchased,
      @JsonKey(name: 'internet_percentage')
      @StringToNumSerializer()
      @HiveField(16)
      num internetPercentage,
      @JsonKey(name: 'total_cable_purchased')
      @StringToNumSerializer()
      @HiveField(17)
      num totalCablePurchased,
      @JsonKey(name: 'cable_percentage')
      @StringToNumSerializer()
      @HiveField(18)
      num cablePercentage,
      @JsonKey(name: 'total_education_purchased')
      @StringToNumSerializer()
      @HiveField(19)
      num totalEducationPurchased,
      @JsonKey(name: 'education_percentage')
      @StringToNumSerializer()
      @HiveField(20)
      num educationPercentage,
      @JsonKey(name: 'total_electricity_purchased')
      @StringToNumSerializer()
      @HiveField(21)
      num totalElectricityPurchased,
      @JsonKey(name: 'electricity_percentage')
      @StringToNumSerializer()
      @HiveField(22)
      num electricityPercentage,
      @JsonKey(name: 'total_betting_purchased')
      @StringToNumSerializer()
      @HiveField(23)
      num totalBettingPurchased,
      @JsonKey(name: 'betting_percentage')
      @StringToNumSerializer()
      @HiveField(24)
      num bettingPercentage});
}

/// @nodoc
class __$$AnalyticImplCopyWithImpl<$Res>
    extends _$AnalyticCopyWithImpl<$Res, _$AnalyticImpl>
    implements _$$AnalyticImplCopyWith<$Res> {
  __$$AnalyticImplCopyWithImpl(
      _$AnalyticImpl _value, $Res Function(_$AnalyticImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalSpending = null,
    Object? totalInflow = null,
    Object? totalOutflow = null,
    Object? totalTransfers = null,
    Object? transferPercentage = null,
    Object? totalAdminCreditWallet = null,
    Object? adminCreditWalletPercentage = null,
    Object? totalAdminDebitWallet = null,
    Object? adminDebitWalletPercentage = null,
    Object? totalVoucherPurchased = null,
    Object? voucherPercentage = null,
    Object? totalAirtimePurchased = null,
    Object? airtimePercentage = null,
    Object? totalDataPurchased = null,
    Object? dataPercentage = null,
    Object? totalInternetPurchased = null,
    Object? internetPercentage = null,
    Object? totalCablePurchased = null,
    Object? cablePercentage = null,
    Object? totalEducationPurchased = null,
    Object? educationPercentage = null,
    Object? totalElectricityPurchased = null,
    Object? electricityPercentage = null,
    Object? totalBettingPurchased = null,
    Object? bettingPercentage = null,
  }) {
    return _then(_$AnalyticImpl(
      totalSpending: null == totalSpending
          ? _value.totalSpending
          : totalSpending // ignore: cast_nullable_to_non_nullable
              as num,
      totalInflow: null == totalInflow
          ? _value.totalInflow
          : totalInflow // ignore: cast_nullable_to_non_nullable
              as num,
      totalOutflow: null == totalOutflow
          ? _value.totalOutflow
          : totalOutflow // ignore: cast_nullable_to_non_nullable
              as num,
      totalTransfers: null == totalTransfers
          ? _value.totalTransfers
          : totalTransfers // ignore: cast_nullable_to_non_nullable
              as num,
      transferPercentage: null == transferPercentage
          ? _value.transferPercentage
          : transferPercentage // ignore: cast_nullable_to_non_nullable
              as num,
      totalAdminCreditWallet: null == totalAdminCreditWallet
          ? _value.totalAdminCreditWallet
          : totalAdminCreditWallet // ignore: cast_nullable_to_non_nullable
              as num,
      adminCreditWalletPercentage: null == adminCreditWalletPercentage
          ? _value.adminCreditWalletPercentage
          : adminCreditWalletPercentage // ignore: cast_nullable_to_non_nullable
              as num,
      totalAdminDebitWallet: null == totalAdminDebitWallet
          ? _value.totalAdminDebitWallet
          : totalAdminDebitWallet // ignore: cast_nullable_to_non_nullable
              as num,
      adminDebitWalletPercentage: null == adminDebitWalletPercentage
          ? _value.adminDebitWalletPercentage
          : adminDebitWalletPercentage // ignore: cast_nullable_to_non_nullable
              as num,
      totalVoucherPurchased: null == totalVoucherPurchased
          ? _value.totalVoucherPurchased
          : totalVoucherPurchased // ignore: cast_nullable_to_non_nullable
              as num,
      voucherPercentage: null == voucherPercentage
          ? _value.voucherPercentage
          : voucherPercentage // ignore: cast_nullable_to_non_nullable
              as num,
      totalAirtimePurchased: null == totalAirtimePurchased
          ? _value.totalAirtimePurchased
          : totalAirtimePurchased // ignore: cast_nullable_to_non_nullable
              as num,
      airtimePercentage: null == airtimePercentage
          ? _value.airtimePercentage
          : airtimePercentage // ignore: cast_nullable_to_non_nullable
              as num,
      totalDataPurchased: null == totalDataPurchased
          ? _value.totalDataPurchased
          : totalDataPurchased // ignore: cast_nullable_to_non_nullable
              as num,
      dataPercentage: null == dataPercentage
          ? _value.dataPercentage
          : dataPercentage // ignore: cast_nullable_to_non_nullable
              as num,
      totalInternetPurchased: null == totalInternetPurchased
          ? _value.totalInternetPurchased
          : totalInternetPurchased // ignore: cast_nullable_to_non_nullable
              as num,
      internetPercentage: null == internetPercentage
          ? _value.internetPercentage
          : internetPercentage // ignore: cast_nullable_to_non_nullable
              as num,
      totalCablePurchased: null == totalCablePurchased
          ? _value.totalCablePurchased
          : totalCablePurchased // ignore: cast_nullable_to_non_nullable
              as num,
      cablePercentage: null == cablePercentage
          ? _value.cablePercentage
          : cablePercentage // ignore: cast_nullable_to_non_nullable
              as num,
      totalEducationPurchased: null == totalEducationPurchased
          ? _value.totalEducationPurchased
          : totalEducationPurchased // ignore: cast_nullable_to_non_nullable
              as num,
      educationPercentage: null == educationPercentage
          ? _value.educationPercentage
          : educationPercentage // ignore: cast_nullable_to_non_nullable
              as num,
      totalElectricityPurchased: null == totalElectricityPurchased
          ? _value.totalElectricityPurchased
          : totalElectricityPurchased // ignore: cast_nullable_to_non_nullable
              as num,
      electricityPercentage: null == electricityPercentage
          ? _value.electricityPercentage
          : electricityPercentage // ignore: cast_nullable_to_non_nullable
              as num,
      totalBettingPurchased: null == totalBettingPurchased
          ? _value.totalBettingPurchased
          : totalBettingPurchased // ignore: cast_nullable_to_non_nullable
              as num,
      bettingPercentage: null == bettingPercentage
          ? _value.bettingPercentage
          : bettingPercentage // ignore: cast_nullable_to_non_nullable
              as num,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AnalyticImpl implements _Analytic {
  _$AnalyticImpl(
      {@JsonKey(name: 'total_spending')
      @StringToNumSerializer()
      @HiveField(0)
      this.totalSpending = 0,
      @JsonKey(name: 'total_inflow')
      @StringToNumSerializer()
      @HiveField(1)
      this.totalInflow = 0,
      @JsonKey(name: 'total_outflow')
      @StringToNumSerializer()
      @HiveField(2)
      this.totalOutflow = 0,
      @JsonKey(name: 'total_transfers')
      @StringToNumSerializer()
      @HiveField(3)
      this.totalTransfers = 0,
      @JsonKey(name: 'transfer_percentage')
      @StringToNumSerializer()
      @HiveField(4)
      this.transferPercentage = 0,
      @JsonKey(name: 'total_admin_credit_wallet')
      @StringToNumSerializer()
      @HiveField(5)
      this.totalAdminCreditWallet = 0,
      @JsonKey(name: 'admin_credit_wallet_percentage')
      @StringToNumSerializer()
      @HiveField(6)
      this.adminCreditWalletPercentage = 0,
      @JsonKey(name: 'total_admin_debit_wallet')
      @StringToNumSerializer()
      @HiveField(7)
      this.totalAdminDebitWallet = 0,
      @JsonKey(name: 'admin_debit_wallet_percentage')
      @StringToNumSerializer()
      this.adminDebitWalletPercentage = 0,
      @HiveField(8)
      @JsonKey(name: 'total_voucher_purchased')
      @StringToNumSerializer()
      @HiveField(9)
      this.totalVoucherPurchased = 0,
      @JsonKey(name: 'voucher_percentage')
      @StringToNumSerializer()
      @HiveField(10)
      this.voucherPercentage = 0,
      @JsonKey(name: 'total_airtime_purchased')
      @StringToNumSerializer()
      @HiveField(11)
      this.totalAirtimePurchased = 0,
      @JsonKey(name: 'airtime_percentage')
      @StringToNumSerializer()
      @HiveField(12)
      this.airtimePercentage = 0,
      @JsonKey(name: 'total_data_purchased')
      @HiveField(13)
      @StringToNumSerializer()
      this.totalDataPurchased = 0,
      @JsonKey(name: 'data_percentage')
      @StringToNumSerializer()
      @HiveField(14)
      this.dataPercentage = 0,
      @JsonKey(name: 'total_internet_purchased')
      @StringToNumSerializer()
      @HiveField(15)
      this.totalInternetPurchased = 0,
      @JsonKey(name: 'internet_percentage') @StringToNumSerializer() @HiveField(16) this.internetPercentage = 0,
      @JsonKey(name: 'total_cable_purchased') @StringToNumSerializer() @HiveField(17) this.totalCablePurchased = 0,
      @JsonKey(name: 'cable_percentage') @StringToNumSerializer() @HiveField(18) this.cablePercentage = 0,
      @JsonKey(name: 'total_education_purchased') @StringToNumSerializer() @HiveField(19) this.totalEducationPurchased = 0,
      @JsonKey(name: 'education_percentage') @StringToNumSerializer() @HiveField(20) this.educationPercentage = 0,
      @JsonKey(name: 'total_electricity_purchased') @StringToNumSerializer() @HiveField(21) this.totalElectricityPurchased = 0,
      @JsonKey(name: 'electricity_percentage') @StringToNumSerializer() @HiveField(22) this.electricityPercentage = 0,
      @JsonKey(name: 'total_betting_purchased') @StringToNumSerializer() @HiveField(23) this.totalBettingPurchased = 0,
      @JsonKey(name: 'betting_percentage') @StringToNumSerializer() @HiveField(24) this.bettingPercentage = 0});

  factory _$AnalyticImpl.fromJson(Map<String, dynamic> json) =>
      _$$AnalyticImplFromJson(json);

  @override
  @JsonKey(name: 'total_spending')
  @StringToNumSerializer()
  @HiveField(0)
  final num totalSpending;
  @override
  @JsonKey(name: 'total_inflow')
  @StringToNumSerializer()
  @HiveField(1)
  final num totalInflow;
  @override
  @JsonKey(name: 'total_outflow')
  @StringToNumSerializer()
  @HiveField(2)
  final num totalOutflow;
  @override
  @JsonKey(name: 'total_transfers')
  @StringToNumSerializer()
  @HiveField(3)
  final num totalTransfers;
  @override
  @JsonKey(name: 'transfer_percentage')
  @StringToNumSerializer()
  @HiveField(4)
  final num transferPercentage;
  @override
  @JsonKey(name: 'total_admin_credit_wallet')
  @StringToNumSerializer()
  @HiveField(5)
  final num totalAdminCreditWallet;
  @override
  @JsonKey(name: 'admin_credit_wallet_percentage')
  @StringToNumSerializer()
  @HiveField(6)
  final num adminCreditWalletPercentage;
  @override
  @JsonKey(name: 'total_admin_debit_wallet')
  @StringToNumSerializer()
  @HiveField(7)
  final num totalAdminDebitWallet;
  @override
  @JsonKey(name: 'admin_debit_wallet_percentage')
  @StringToNumSerializer()
  final num adminDebitWalletPercentage;
  @override
  @HiveField(8)
  @JsonKey(name: 'total_voucher_purchased')
  @StringToNumSerializer()
  @HiveField(9)
  final num totalVoucherPurchased;
  @override
  @JsonKey(name: 'voucher_percentage')
  @StringToNumSerializer()
  @HiveField(10)
  final num voucherPercentage;
  @override
  @JsonKey(name: 'total_airtime_purchased')
  @StringToNumSerializer()
  @HiveField(11)
  final num totalAirtimePurchased;
  @override
  @JsonKey(name: 'airtime_percentage')
  @StringToNumSerializer()
  @HiveField(12)
  final num airtimePercentage;
  @override
  @JsonKey(name: 'total_data_purchased')
  @HiveField(13)
  @StringToNumSerializer()
  final num totalDataPurchased;
  @override
  @JsonKey(name: 'data_percentage')
  @StringToNumSerializer()
  @HiveField(14)
  final num dataPercentage;
  @override
  @JsonKey(name: 'total_internet_purchased')
  @StringToNumSerializer()
  @HiveField(15)
  final num totalInternetPurchased;
  @override
  @JsonKey(name: 'internet_percentage')
  @StringToNumSerializer()
  @HiveField(16)
  final num internetPercentage;
  @override
  @JsonKey(name: 'total_cable_purchased')
  @StringToNumSerializer()
  @HiveField(17)
  final num totalCablePurchased;
  @override
  @JsonKey(name: 'cable_percentage')
  @StringToNumSerializer()
  @HiveField(18)
  final num cablePercentage;
  @override
  @JsonKey(name: 'total_education_purchased')
  @StringToNumSerializer()
  @HiveField(19)
  final num totalEducationPurchased;
  @override
  @JsonKey(name: 'education_percentage')
  @StringToNumSerializer()
  @HiveField(20)
  final num educationPercentage;
  @override
  @JsonKey(name: 'total_electricity_purchased')
  @StringToNumSerializer()
  @HiveField(21)
  final num totalElectricityPurchased;
  @override
  @JsonKey(name: 'electricity_percentage')
  @StringToNumSerializer()
  @HiveField(22)
  final num electricityPercentage;
  @override
  @JsonKey(name: 'total_betting_purchased')
  @StringToNumSerializer()
  @HiveField(23)
  final num totalBettingPurchased;
  @override
  @JsonKey(name: 'betting_percentage')
  @StringToNumSerializer()
  @HiveField(24)
  final num bettingPercentage;

  @override
  String toString() {
    return 'Analytic(totalSpending: $totalSpending, totalInflow: $totalInflow, totalOutflow: $totalOutflow, totalTransfers: $totalTransfers, transferPercentage: $transferPercentage, totalAdminCreditWallet: $totalAdminCreditWallet, adminCreditWalletPercentage: $adminCreditWalletPercentage, totalAdminDebitWallet: $totalAdminDebitWallet, adminDebitWalletPercentage: $adminDebitWalletPercentage, totalVoucherPurchased: $totalVoucherPurchased, voucherPercentage: $voucherPercentage, totalAirtimePurchased: $totalAirtimePurchased, airtimePercentage: $airtimePercentage, totalDataPurchased: $totalDataPurchased, dataPercentage: $dataPercentage, totalInternetPurchased: $totalInternetPurchased, internetPercentage: $internetPercentage, totalCablePurchased: $totalCablePurchased, cablePercentage: $cablePercentage, totalEducationPurchased: $totalEducationPurchased, educationPercentage: $educationPercentage, totalElectricityPurchased: $totalElectricityPurchased, electricityPercentage: $electricityPercentage, totalBettingPurchased: $totalBettingPurchased, bettingPercentage: $bettingPercentage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AnalyticImpl &&
            (identical(other.totalSpending, totalSpending) ||
                other.totalSpending == totalSpending) &&
            (identical(other.totalInflow, totalInflow) ||
                other.totalInflow == totalInflow) &&
            (identical(other.totalOutflow, totalOutflow) ||
                other.totalOutflow == totalOutflow) &&
            (identical(other.totalTransfers, totalTransfers) ||
                other.totalTransfers == totalTransfers) &&
            (identical(other.transferPercentage, transferPercentage) ||
                other.transferPercentage == transferPercentage) &&
            (identical(other.totalAdminCreditWallet, totalAdminCreditWallet) ||
                other.totalAdminCreditWallet == totalAdminCreditWallet) &&
            (identical(other.adminCreditWalletPercentage,
                    adminCreditWalletPercentage) ||
                other.adminCreditWalletPercentage ==
                    adminCreditWalletPercentage) &&
            (identical(other.totalAdminDebitWallet, totalAdminDebitWallet) ||
                other.totalAdminDebitWallet == totalAdminDebitWallet) &&
            (identical(other.adminDebitWalletPercentage, adminDebitWalletPercentage) ||
                other.adminDebitWalletPercentage ==
                    adminDebitWalletPercentage) &&
            (identical(other.totalVoucherPurchased, totalVoucherPurchased) ||
                other.totalVoucherPurchased == totalVoucherPurchased) &&
            (identical(other.voucherPercentage, voucherPercentage) ||
                other.voucherPercentage == voucherPercentage) &&
            (identical(other.totalAirtimePurchased, totalAirtimePurchased) ||
                other.totalAirtimePurchased == totalAirtimePurchased) &&
            (identical(other.airtimePercentage, airtimePercentage) ||
                other.airtimePercentage == airtimePercentage) &&
            (identical(other.totalDataPurchased, totalDataPurchased) ||
                other.totalDataPurchased == totalDataPurchased) &&
            (identical(other.dataPercentage, dataPercentage) ||
                other.dataPercentage == dataPercentage) &&
            (identical(other.totalInternetPurchased, totalInternetPurchased) ||
                other.totalInternetPurchased == totalInternetPurchased) &&
            (identical(other.internetPercentage, internetPercentage) ||
                other.internetPercentage == internetPercentage) &&
            (identical(other.totalCablePurchased, totalCablePurchased) ||
                other.totalCablePurchased == totalCablePurchased) &&
            (identical(other.cablePercentage, cablePercentage) ||
                other.cablePercentage == cablePercentage) &&
            (identical(other.totalEducationPurchased, totalEducationPurchased) ||
                other.totalEducationPurchased == totalEducationPurchased) &&
            (identical(other.educationPercentage, educationPercentage) ||
                other.educationPercentage == educationPercentage) &&
            (identical(other.totalElectricityPurchased, totalElectricityPurchased) ||
                other.totalElectricityPurchased == totalElectricityPurchased) &&
            (identical(other.electricityPercentage, electricityPercentage) ||
                other.electricityPercentage == electricityPercentage) &&
            (identical(other.totalBettingPurchased, totalBettingPurchased) ||
                other.totalBettingPurchased == totalBettingPurchased) &&
            (identical(other.bettingPercentage, bettingPercentage) ||
                other.bettingPercentage == bettingPercentage));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        totalSpending,
        totalInflow,
        totalOutflow,
        totalTransfers,
        transferPercentage,
        totalAdminCreditWallet,
        adminCreditWalletPercentage,
        totalAdminDebitWallet,
        adminDebitWalletPercentage,
        totalVoucherPurchased,
        voucherPercentage,
        totalAirtimePurchased,
        airtimePercentage,
        totalDataPurchased,
        dataPercentage,
        totalInternetPurchased,
        internetPercentage,
        totalCablePurchased,
        cablePercentage,
        totalEducationPurchased,
        educationPercentage,
        totalElectricityPurchased,
        electricityPercentage,
        totalBettingPurchased,
        bettingPercentage
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AnalyticImplCopyWith<_$AnalyticImpl> get copyWith =>
      __$$AnalyticImplCopyWithImpl<_$AnalyticImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AnalyticImplToJson(
      this,
    );
  }
}

abstract class _Analytic implements Analytic {
  factory _Analytic(
      {@JsonKey(name: 'total_spending')
      @StringToNumSerializer()
      @HiveField(0)
      final num totalSpending,
      @JsonKey(name: 'total_inflow')
      @StringToNumSerializer()
      @HiveField(1)
      final num totalInflow,
      @JsonKey(name: 'total_outflow')
      @StringToNumSerializer()
      @HiveField(2)
      final num totalOutflow,
      @JsonKey(name: 'total_transfers')
      @StringToNumSerializer()
      @HiveField(3)
      final num totalTransfers,
      @JsonKey(name: 'transfer_percentage')
      @StringToNumSerializer()
      @HiveField(4)
      final num transferPercentage,
      @JsonKey(name: 'total_admin_credit_wallet')
      @StringToNumSerializer()
      @HiveField(5)
      final num totalAdminCreditWallet,
      @JsonKey(name: 'admin_credit_wallet_percentage')
      @StringToNumSerializer()
      @HiveField(6)
      final num adminCreditWalletPercentage,
      @JsonKey(name: 'total_admin_debit_wallet')
      @StringToNumSerializer()
      @HiveField(7)
      final num totalAdminDebitWallet,
      @JsonKey(name: 'admin_debit_wallet_percentage')
      @StringToNumSerializer()
      final num adminDebitWalletPercentage,
      @HiveField(8)
      @JsonKey(name: 'total_voucher_purchased')
      @StringToNumSerializer()
      @HiveField(9)
      final num totalVoucherPurchased,
      @JsonKey(name: 'voucher_percentage')
      @StringToNumSerializer()
      @HiveField(10)
      final num voucherPercentage,
      @JsonKey(name: 'total_airtime_purchased')
      @StringToNumSerializer()
      @HiveField(11)
      final num totalAirtimePurchased,
      @JsonKey(name: 'airtime_percentage')
      @StringToNumSerializer()
      @HiveField(12)
      final num airtimePercentage,
      @JsonKey(name: 'total_data_purchased')
      @HiveField(13)
      @StringToNumSerializer()
      final num totalDataPurchased,
      @JsonKey(name: 'data_percentage')
      @StringToNumSerializer()
      @HiveField(14)
      final num dataPercentage,
      @JsonKey(name: 'total_internet_purchased')
      @StringToNumSerializer()
      @HiveField(15)
      final num totalInternetPurchased,
      @JsonKey(name: 'internet_percentage')
      @StringToNumSerializer()
      @HiveField(16)
      final num internetPercentage,
      @JsonKey(name: 'total_cable_purchased')
      @StringToNumSerializer()
      @HiveField(17)
      final num totalCablePurchased,
      @JsonKey(name: 'cable_percentage')
      @StringToNumSerializer()
      @HiveField(18)
      final num cablePercentage,
      @JsonKey(name: 'total_education_purchased')
      @StringToNumSerializer()
      @HiveField(19)
      final num totalEducationPurchased,
      @JsonKey(name: 'education_percentage')
      @StringToNumSerializer()
      @HiveField(20)
      final num educationPercentage,
      @JsonKey(name: 'total_electricity_purchased')
      @StringToNumSerializer()
      @HiveField(21)
      final num totalElectricityPurchased,
      @JsonKey(name: 'electricity_percentage')
      @StringToNumSerializer()
      @HiveField(22)
      final num electricityPercentage,
      @JsonKey(name: 'total_betting_purchased')
      @StringToNumSerializer()
      @HiveField(23)
      final num totalBettingPurchased,
      @JsonKey(name: 'betting_percentage')
      @StringToNumSerializer()
      @HiveField(24)
      final num bettingPercentage}) = _$AnalyticImpl;

  factory _Analytic.fromJson(Map<String, dynamic> json) =
      _$AnalyticImpl.fromJson;

  @override
  @JsonKey(name: 'total_spending')
  @StringToNumSerializer()
  @HiveField(0)
  num get totalSpending;
  @override
  @JsonKey(name: 'total_inflow')
  @StringToNumSerializer()
  @HiveField(1)
  num get totalInflow;
  @override
  @JsonKey(name: 'total_outflow')
  @StringToNumSerializer()
  @HiveField(2)
  num get totalOutflow;
  @override
  @JsonKey(name: 'total_transfers')
  @StringToNumSerializer()
  @HiveField(3)
  num get totalTransfers;
  @override
  @JsonKey(name: 'transfer_percentage')
  @StringToNumSerializer()
  @HiveField(4)
  num get transferPercentage;
  @override
  @JsonKey(name: 'total_admin_credit_wallet')
  @StringToNumSerializer()
  @HiveField(5)
  num get totalAdminCreditWallet;
  @override
  @JsonKey(name: 'admin_credit_wallet_percentage')
  @StringToNumSerializer()
  @HiveField(6)
  num get adminCreditWalletPercentage;
  @override
  @JsonKey(name: 'total_admin_debit_wallet')
  @StringToNumSerializer()
  @HiveField(7)
  num get totalAdminDebitWallet;
  @override
  @JsonKey(name: 'admin_debit_wallet_percentage')
  @StringToNumSerializer()
  num get adminDebitWalletPercentage;
  @override
  @HiveField(8)
  @JsonKey(name: 'total_voucher_purchased')
  @StringToNumSerializer()
  @HiveField(9)
  num get totalVoucherPurchased;
  @override
  @JsonKey(name: 'voucher_percentage')
  @StringToNumSerializer()
  @HiveField(10)
  num get voucherPercentage;
  @override
  @JsonKey(name: 'total_airtime_purchased')
  @StringToNumSerializer()
  @HiveField(11)
  num get totalAirtimePurchased;
  @override
  @JsonKey(name: 'airtime_percentage')
  @StringToNumSerializer()
  @HiveField(12)
  num get airtimePercentage;
  @override
  @JsonKey(name: 'total_data_purchased')
  @HiveField(13)
  @StringToNumSerializer()
  num get totalDataPurchased;
  @override
  @JsonKey(name: 'data_percentage')
  @StringToNumSerializer()
  @HiveField(14)
  num get dataPercentage;
  @override
  @JsonKey(name: 'total_internet_purchased')
  @StringToNumSerializer()
  @HiveField(15)
  num get totalInternetPurchased;
  @override
  @JsonKey(name: 'internet_percentage')
  @StringToNumSerializer()
  @HiveField(16)
  num get internetPercentage;
  @override
  @JsonKey(name: 'total_cable_purchased')
  @StringToNumSerializer()
  @HiveField(17)
  num get totalCablePurchased;
  @override
  @JsonKey(name: 'cable_percentage')
  @StringToNumSerializer()
  @HiveField(18)
  num get cablePercentage;
  @override
  @JsonKey(name: 'total_education_purchased')
  @StringToNumSerializer()
  @HiveField(19)
  num get totalEducationPurchased;
  @override
  @JsonKey(name: 'education_percentage')
  @StringToNumSerializer()
  @HiveField(20)
  num get educationPercentage;
  @override
  @JsonKey(name: 'total_electricity_purchased')
  @StringToNumSerializer()
  @HiveField(21)
  num get totalElectricityPurchased;
  @override
  @JsonKey(name: 'electricity_percentage')
  @StringToNumSerializer()
  @HiveField(22)
  num get electricityPercentage;
  @override
  @JsonKey(name: 'total_betting_purchased')
  @StringToNumSerializer()
  @HiveField(23)
  num get totalBettingPurchased;
  @override
  @JsonKey(name: 'betting_percentage')
  @StringToNumSerializer()
  @HiveField(24)
  num get bettingPercentage;
  @override
  @JsonKey(ignore: true)
  _$$AnalyticImplCopyWith<_$AnalyticImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
