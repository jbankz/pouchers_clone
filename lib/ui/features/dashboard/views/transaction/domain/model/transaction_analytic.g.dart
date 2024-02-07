// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_analytic.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TransactionAnalyticAdapter extends TypeAdapter<TransactionAnalytic> {
  @override
  final int typeId = 23;

  @override
  TransactionAnalytic read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TransactionAnalytic(
      analyticsSummary: (fields[0] as List).cast<AnalyticSummary>(),
      analytic: (fields[1] as List).cast<Analytic>(),
      chunkedTransactions: (fields[2] as List)
          .map((dynamic e) => (e as List).cast<AnalyticSummary>())
          .toList(),
    );
  }

  @override
  void write(BinaryWriter writer, TransactionAnalytic obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.analyticsSummary)
      ..writeByte(1)
      ..write(obj.analytic)
      ..writeByte(2)
      ..write(obj.chunkedTransactions);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TransactionAnalyticAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class AnalyticSummaryAdapter extends TypeAdapter<AnalyticSummary> {
  @override
  final int typeId = 24;

  @override
  AnalyticSummary read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AnalyticSummary(
      day: fields[0] as num,
      totalOutflow: fields[1] as num,
    );
  }

  @override
  void write(BinaryWriter writer, AnalyticSummary obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.day)
      ..writeByte(1)
      ..write(obj.totalOutflow);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AnalyticSummaryAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class AnalyticAdapter extends TypeAdapter<Analytic> {
  @override
  final int typeId = 25;

  @override
  Analytic read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Analytic(
      totalSpending: fields[0] as num,
      totalInflow: fields[1] as num,
      totalOutflow: fields[2] as num,
      totalTransfers: fields[3] as num,
      transferPercentage: fields[4] as num,
      totalAdminCreditWallet: fields[5] as num,
      adminCreditWalletPercentage: fields[6] as num,
      totalAdminDebitWallet: fields[7] as num,
      totalVoucherPurchased: fields[8] as num,
      voucherPercentage: fields[10] as num,
      totalAirtimePurchased: fields[11] as num,
      airtimePercentage: fields[12] as num,
      totalDataPurchased: fields[13] as num,
      dataPercentage: fields[14] as num,
      totalInternetPurchased: fields[15] as num,
      internetPercentage: fields[16] as num,
      totalCablePurchased: fields[17] as num,
      cablePercentage: fields[18] as num,
      totalEducationPurchased: fields[19] as num,
      educationPercentage: fields[20] as num,
      totalElectricityPurchased: fields[21] as num,
      electricityPercentage: fields[22] as num,
      totalBettingPurchased: fields[23] as num,
      bettingPercentage: fields[24] as num,
    );
  }

  @override
  void write(BinaryWriter writer, Analytic obj) {
    writer
      ..writeByte(24)
      ..writeByte(0)
      ..write(obj.totalSpending)
      ..writeByte(1)
      ..write(obj.totalInflow)
      ..writeByte(2)
      ..write(obj.totalOutflow)
      ..writeByte(3)
      ..write(obj.totalTransfers)
      ..writeByte(4)
      ..write(obj.transferPercentage)
      ..writeByte(5)
      ..write(obj.totalAdminCreditWallet)
      ..writeByte(6)
      ..write(obj.adminCreditWalletPercentage)
      ..writeByte(7)
      ..write(obj.totalAdminDebitWallet)
      ..writeByte(8)
      ..write(obj.totalVoucherPurchased)
      ..writeByte(10)
      ..write(obj.voucherPercentage)
      ..writeByte(11)
      ..write(obj.totalAirtimePurchased)
      ..writeByte(12)
      ..write(obj.airtimePercentage)
      ..writeByte(13)
      ..write(obj.totalDataPurchased)
      ..writeByte(14)
      ..write(obj.dataPercentage)
      ..writeByte(15)
      ..write(obj.totalInternetPurchased)
      ..writeByte(16)
      ..write(obj.internetPercentage)
      ..writeByte(17)
      ..write(obj.totalCablePurchased)
      ..writeByte(18)
      ..write(obj.cablePercentage)
      ..writeByte(19)
      ..write(obj.totalEducationPurchased)
      ..writeByte(20)
      ..write(obj.educationPercentage)
      ..writeByte(21)
      ..write(obj.totalElectricityPurchased)
      ..writeByte(22)
      ..write(obj.electricityPercentage)
      ..writeByte(23)
      ..write(obj.totalBettingPurchased)
      ..writeByte(24)
      ..write(obj.bettingPercentage);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AnalyticAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TransactionAnalyticImpl _$$TransactionAnalyticImplFromJson(
        Map<String, dynamic> json) =>
    _$TransactionAnalyticImpl(
      analyticsSummary: (json['analyticsSummary'] as List<dynamic>?)
              ?.map((e) => AnalyticSummary.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      analytic: (json['analytics'] as List<dynamic>?)
              ?.map((e) => Analytic.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      chunkedTransactions: (json['chunkedTransactions'] as List<dynamic>?)
              ?.map((e) => (e as List<dynamic>)
                  .map((e) =>
                      AnalyticSummary.fromJson(e as Map<String, dynamic>))
                  .toList())
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$TransactionAnalyticImplToJson(
        _$TransactionAnalyticImpl instance) =>
    <String, dynamic>{
      'analyticsSummary': instance.analyticsSummary,
      'analytics': instance.analytic,
      'chunkedTransactions': instance.chunkedTransactions,
    };

_$AnalyticSummaryImpl _$$AnalyticSummaryImplFromJson(
        Map<String, dynamic> json) =>
    _$AnalyticSummaryImpl(
      day: json['day'] == null
          ? 0
          : const StringToNumSerializer().fromJson(json['day']),
      totalOutflow: json['total_outflow'] == null
          ? 0
          : const StringToNumSerializer().fromJson(json['total_outflow']),
    );

Map<String, dynamic> _$$AnalyticSummaryImplToJson(
        _$AnalyticSummaryImpl instance) =>
    <String, dynamic>{
      'day': const StringToNumSerializer().toJson(instance.day),
      'total_outflow':
          const StringToNumSerializer().toJson(instance.totalOutflow),
    };

_$AnalyticImpl _$$AnalyticImplFromJson(Map<String, dynamic> json) =>
    _$AnalyticImpl(
      totalSpending: json['total_spending'] == null
          ? 0
          : const StringToNumSerializer().fromJson(json['total_spending']),
      totalInflow: json['total_inflow'] == null
          ? 0
          : const StringToNumSerializer().fromJson(json['total_inflow']),
      totalOutflow: json['total_outflow'] == null
          ? 0
          : const StringToNumSerializer().fromJson(json['total_outflow']),
      totalTransfers: json['total_transfers'] == null
          ? 0
          : const StringToNumSerializer().fromJson(json['total_transfers']),
      transferPercentage: json['transfer_percentage'] == null
          ? 0
          : const StringToNumSerializer().fromJson(json['transfer_percentage']),
      totalAdminCreditWallet: json['total_admin_credit_wallet'] == null
          ? 0
          : const StringToNumSerializer()
              .fromJson(json['total_admin_credit_wallet']),
      adminCreditWalletPercentage:
          json['admin_credit_wallet_percentage'] == null
              ? 0
              : const StringToNumSerializer()
                  .fromJson(json['admin_credit_wallet_percentage']),
      totalAdminDebitWallet: json['total_admin_debit_wallet'] == null
          ? 0
          : const StringToNumSerializer()
              .fromJson(json['total_admin_debit_wallet']),
      adminDebitWalletPercentage: json['admin_debit_wallet_percentage'] == null
          ? 0
          : const StringToNumSerializer()
              .fromJson(json['admin_debit_wallet_percentage']),
      totalVoucherPurchased: json['total_voucher_purchased'] == null
          ? 0
          : const StringToNumSerializer()
              .fromJson(json['total_voucher_purchased']),
      voucherPercentage: json['voucher_percentage'] == null
          ? 0
          : const StringToNumSerializer().fromJson(json['voucher_percentage']),
      totalAirtimePurchased: json['total_airtime_purchased'] == null
          ? 0
          : const StringToNumSerializer()
              .fromJson(json['total_airtime_purchased']),
      airtimePercentage: json['airtime_percentage'] == null
          ? 0
          : const StringToNumSerializer().fromJson(json['airtime_percentage']),
      totalDataPurchased: json['total_data_purchased'] == null
          ? 0
          : const StringToNumSerializer()
              .fromJson(json['total_data_purchased']),
      dataPercentage: json['data_percentage'] == null
          ? 0
          : const StringToNumSerializer().fromJson(json['data_percentage']),
      totalInternetPurchased: json['total_internet_purchased'] == null
          ? 0
          : const StringToNumSerializer()
              .fromJson(json['total_internet_purchased']),
      internetPercentage: json['internet_percentage'] == null
          ? 0
          : const StringToNumSerializer().fromJson(json['internet_percentage']),
      totalCablePurchased: json['total_cable_purchased'] == null
          ? 0
          : const StringToNumSerializer()
              .fromJson(json['total_cable_purchased']),
      cablePercentage: json['cable_percentage'] == null
          ? 0
          : const StringToNumSerializer().fromJson(json['cable_percentage']),
      totalEducationPurchased: json['total_education_purchased'] == null
          ? 0
          : const StringToNumSerializer()
              .fromJson(json['total_education_purchased']),
      educationPercentage: json['education_percentage'] == null
          ? 0
          : const StringToNumSerializer()
              .fromJson(json['education_percentage']),
      totalElectricityPurchased: json['total_electricity_purchased'] == null
          ? 0
          : const StringToNumSerializer()
              .fromJson(json['total_electricity_purchased']),
      electricityPercentage: json['electricity_percentage'] == null
          ? 0
          : const StringToNumSerializer()
              .fromJson(json['electricity_percentage']),
      totalBettingPurchased: json['total_betting_purchased'] == null
          ? 0
          : const StringToNumSerializer()
              .fromJson(json['total_betting_purchased']),
      bettingPercentage: json['betting_percentage'] == null
          ? 0
          : const StringToNumSerializer().fromJson(json['betting_percentage']),
    );

Map<String, dynamic> _$$AnalyticImplToJson(_$AnalyticImpl instance) =>
    <String, dynamic>{
      'total_spending':
          const StringToNumSerializer().toJson(instance.totalSpending),
      'total_inflow':
          const StringToNumSerializer().toJson(instance.totalInflow),
      'total_outflow':
          const StringToNumSerializer().toJson(instance.totalOutflow),
      'total_transfers':
          const StringToNumSerializer().toJson(instance.totalTransfers),
      'transfer_percentage':
          const StringToNumSerializer().toJson(instance.transferPercentage),
      'total_admin_credit_wallet':
          const StringToNumSerializer().toJson(instance.totalAdminCreditWallet),
      'admin_credit_wallet_percentage': const StringToNumSerializer()
          .toJson(instance.adminCreditWalletPercentage),
      'total_admin_debit_wallet':
          const StringToNumSerializer().toJson(instance.totalAdminDebitWallet),
      'admin_debit_wallet_percentage': const StringToNumSerializer()
          .toJson(instance.adminDebitWalletPercentage),
      'total_voucher_purchased':
          const StringToNumSerializer().toJson(instance.totalVoucherPurchased),
      'voucher_percentage':
          const StringToNumSerializer().toJson(instance.voucherPercentage),
      'total_airtime_purchased':
          const StringToNumSerializer().toJson(instance.totalAirtimePurchased),
      'airtime_percentage':
          const StringToNumSerializer().toJson(instance.airtimePercentage),
      'total_data_purchased':
          const StringToNumSerializer().toJson(instance.totalDataPurchased),
      'data_percentage':
          const StringToNumSerializer().toJson(instance.dataPercentage),
      'total_internet_purchased':
          const StringToNumSerializer().toJson(instance.totalInternetPurchased),
      'internet_percentage':
          const StringToNumSerializer().toJson(instance.internetPercentage),
      'total_cable_purchased':
          const StringToNumSerializer().toJson(instance.totalCablePurchased),
      'cable_percentage':
          const StringToNumSerializer().toJson(instance.cablePercentage),
      'total_education_purchased': const StringToNumSerializer()
          .toJson(instance.totalEducationPurchased),
      'education_percentage':
          const StringToNumSerializer().toJson(instance.educationPercentage),
      'total_electricity_purchased': const StringToNumSerializer()
          .toJson(instance.totalElectricityPurchased),
      'electricity_percentage':
          const StringToNumSerializer().toJson(instance.electricityPercentage),
      'total_betting_purchased':
          const StringToNumSerializer().toJson(instance.totalBettingPurchased),
      'betting_percentage':
          const StringToNumSerializer().toJson(instance.bettingPercentage),
    };
