import 'package:pouchers/app/core/constants/db_constants.dart';
import 'package:pouchers/app/serializer/string_to_num_serializer.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'transaction_analytic.freezed.dart';
part 'transaction_analytic.g.dart';

@freezed
@HiveType(typeId: DbConstants.twentyThree)
class TransactionAnalytic with _$TransactionAnalytic {
  factory TransactionAnalytic(
      {@JsonKey(name: 'analyticsSummary')
      @Default([])
      @HiveField(0)
      List<AnalyticSummary> analyticsSummary,
      @JsonKey(name: 'analytics')
      @Default([])
      @HiveField(1)
      List<Analytic> analytic,
      @Default([])
      @HiveField(2)
      List<List<AnalyticSummary>> chunkedTransactions}) = _TransactionAnalytic;

  factory TransactionAnalytic.fromJson(Map<String, dynamic> json) =>
      _$TransactionAnalyticFromJson(json);
}

@freezed
@HiveType(typeId: DbConstants.twentyFour)
class AnalyticSummary with _$AnalyticSummary {
  factory AnalyticSummary(
      {@JsonKey(name: 'day')
      @Default(0)
      @HiveField(0)
      @StringToNumSerializer()
      num day,
      @JsonKey(name: 'total_outflow')
      @Default(0)
      @StringToNumSerializer()
      @HiveField(1)
      num totalOutflow}) = _AnalyticSummary;

  factory AnalyticSummary.fromJson(Map<String, dynamic> json) =>
      _$AnalyticSummaryFromJson(json);
}

@freezed
@HiveType(typeId: DbConstants.twentyFive)
class Analytic with _$Analytic {
  factory Analytic(
      {@JsonKey(name: 'total_spending')
      @StringToNumSerializer()
      @Default(0)
      @HiveField(0)
      num totalSpending,
      @JsonKey(name: 'total_inflow')
      @StringToNumSerializer()
      @Default(0)
      @HiveField(1)
      num totalInflow,
      @JsonKey(name: 'total_outflow')
      @StringToNumSerializer()
      @Default(0)
      @HiveField(2)
      num totalOutflow,
      @JsonKey(name: 'total_transfers')
      @StringToNumSerializer()
      @Default(0)
      @HiveField(3)
      num totalTransfers,
      @JsonKey(name: 'transfer_percentage')
      @Default(0)
      @StringToNumSerializer()
      @HiveField(4)
      num transferPercentage,
      @JsonKey(name: 'total_admin_credit_wallet')
      @Default(0)
      @StringToNumSerializer()
      @HiveField(5)
      num totalAdminCreditWallet,
      @JsonKey(name: 'admin_credit_wallet_percentage')
      @Default(0)
      @StringToNumSerializer()
      @HiveField(6)
      num adminCreditWalletPercentage,
      @JsonKey(name: 'total_admin_debit_wallet')
      @Default(0)
      @StringToNumSerializer()
      @HiveField(7)
      num totalAdminDebitWallet,
      @JsonKey(name: 'admin_debit_wallet_percentage')
      @Default(0)
      @StringToNumSerializer()
      num adminDebitWalletPercentage,
      @HiveField(8)
      @JsonKey(name: 'total_voucher_purchased')
      @Default(0)
      @StringToNumSerializer()
      @HiveField(9)
      num totalVoucherPurchased,
      @JsonKey(name: 'voucher_percentage')
      @Default(0)
      @StringToNumSerializer()
      @HiveField(10)
      num voucherPercentage,
      @JsonKey(name: 'total_airtime_purchased')
      @Default(0)
      @StringToNumSerializer()
      @HiveField(11)
      num totalAirtimePurchased,
      @JsonKey(name: 'airtime_percentage')
      @Default(0)
      @StringToNumSerializer()
      @HiveField(12)
      num airtimePercentage,
      @JsonKey(name: 'total_data_purchased')
      @Default(0)
      @HiveField(13)
      @StringToNumSerializer()
      num totalDataPurchased,
      @JsonKey(name: 'data_percentage')
      @Default(0)
      @StringToNumSerializer()
      @HiveField(14)
      num dataPercentage,
      @JsonKey(name: 'total_internet_purchased')
      @Default(0)
      @StringToNumSerializer()
      @HiveField(15)
      num totalInternetPurchased,
      @JsonKey(name: 'internet_percentage')
      @Default(0)
      @StringToNumSerializer()
      @HiveField(16)
      num internetPercentage,
      @JsonKey(name: 'total_cable_purchased')
      @Default(0)
      @StringToNumSerializer()
      @HiveField(17)
      num totalCablePurchased,
      @JsonKey(name: 'cable_percentage')
      @Default(0)
      @StringToNumSerializer()
      @HiveField(18)
      num cablePercentage,
      @JsonKey(name: 'total_education_purchased')
      @Default(0)
      @StringToNumSerializer()
      @HiveField(19)
      num totalEducationPurchased,
      @JsonKey(name: 'education_percentage')
      @Default(0)
      @StringToNumSerializer()
      @HiveField(20)
      num educationPercentage,
      @JsonKey(name: 'total_electricity_purchased')
      @Default(0)
      @StringToNumSerializer()
      @HiveField(21)
      num totalElectricityPurchased,
      @JsonKey(name: 'electricity_percentage')
      @Default(0)
      @StringToNumSerializer()
      @HiveField(22)
      num electricityPercentage,
      @JsonKey(name: 'total_betting_purchased')
      @Default(0)
      @StringToNumSerializer()
      @HiveField(23)
      num totalBettingPurchased,
      @JsonKey(name: 'betting_percentage')
      @Default(0)
      @StringToNumSerializer()
      @HiveField(24)
      num bettingPercentage}) = _Analytic;

  factory Analytic.fromJson(Map<String, dynamic> json) =>
      _$AnalyticFromJson(json);
}
