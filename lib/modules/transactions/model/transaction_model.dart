import 'package:pouchers/modules/utilities/screens/voucher/voucher_widgets.dart';
import 'package:pouchers/utils/assets_path.dart';

List<VoucherItems> analyticsTransactions = [
  VoucherItems(
      value: "200,000 ",
      code: "Cable TV",
      expiry: "30%",
      image: AssetPaths.televisionIcon,
      sign: "-"),
  VoucherItems(
    value: "200,000 ",
    code: "Electricity",
    expiry: "10%",
    sign: "+",
    image: AssetPaths.electricityIcon,
  ),
  VoucherItems(
    value: "200,000 ",
    code: "Airtime",
    expiry: "30%",
    sign: "-",
    image: AssetPaths.airtimeIcon,
  ),
  VoucherItems(
    value: "500,000 ",
    code: "Data",
    expiry: "50%",
    sign: "+",
    image: AssetPaths.dataIcon,
  ),
  VoucherItems(
    value: "200,000 ",
    code: "Internet",
    expiry: "30%",
    sign: "-",
    image: AssetPaths.wifiIcon,
  ),
  VoucherItems(
    value: "200,000 ",
    code: "Betting",
    expiry: "20%",
    sign: "-",
    image: AssetPaths.bettingIcon,
  ),
  VoucherItems(
    value: "200,000 ",
    code: "Vouchers",
    expiry: "50%",
    sign: "+",
    image: AssetPaths.voucherIcon,
  ),
];

class GetTransactionsResponse {
  GetTransactionsResponse({
    this.status,
    this.message,
    this.code,
    this.data,
  });

  String? status;
  String? message;
  int? code;
  List<GetTransactionsData>? data;

  factory GetTransactionsResponse.fromJson(Map<String, dynamic> json) =>
      GetTransactionsResponse(
        status: json["status"],
        message: json["message"],
        code: json["code"],
        data: List<GetTransactionsData>.from(
            json["data"].map((x) => GetTransactionsData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "code": code,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class GetTransactionsData {
  GetTransactionsData({
    this.transactionId,
    this.userId,
    this.amount,
    this.transactionFee,
    this.transactionType,
    this.transactionCategory,
    this.transactionReference,
    this.beneficiaryName,
    this.extraDetails,
    this.currency,
    this.remarks,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  String? transactionId;
  String? userId;
  String? amount;
  String? transactionFee;
  String? transactionType;
  String? transactionCategory;
  String? transactionReference;
  dynamic beneficiaryName;
  ExtraDetails? extraDetails;
  String? currency;
  String? remarks;
  String? status;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory GetTransactionsData.fromJson(Map<String, dynamic> json) =>
      GetTransactionsData(
        transactionId: json["transaction_id"],
        userId: json["user_id"],
        amount: json["amount"],
        transactionFee: json["transaction_fee"],
        transactionType: json["transaction_type"],
        transactionCategory: json["transaction_category"],
        transactionReference: json["transaction_reference"],
        beneficiaryName: json["beneficiary_name"],
        extraDetails: json["extra_details"] == null
            ? null
            : ExtraDetails.fromJson(json["extra_details"]),
        remarks: json["remarks"],
        currency: json["currency"],
        status: json["status"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "transaction_id": transactionId,
        "user_id": userId,
        "amount": amount,
        "transaction_fee": transactionFee,
        "transaction_type": transactionType,
        "transaction_category": transactionCategory,
        "transaction_reference": transactionReference,
        "currency": currency,
        "beneficiary_name": beneficiaryName,
        "extra_details": extraDetails!.toJson(),
        "remarks": remarks,
        "status": status,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
      };
}

class ExtraDetails {
  ExtraDetails({
    this.senderName,
    this.senderTag,
    this.receiverTag,
    this.receiverPicture,
    this.phoneNumber,
    this.category,
    this.subCategory,
    this.amount,
  });

  String? senderName;
  String? senderTag;
  String? receiverTag;
  String? receiverPicture;
  String? phoneNumber;
  String? category;
  String? subCategory;
  String? amount;

  factory ExtraDetails.fromJson(Map<String, dynamic> json) => ExtraDetails(
        senderName: json["sender_name"],
        senderTag: json["sender_tag"],
        receiverTag: json["receiver_tag"],
        receiverPicture: json["receiver_picture"],
        phoneNumber: json["phoneNumber"],
        category: json["category"],
        subCategory: json["subCategory"],
        amount: json["amount"].toString(),
      );

  Map<String, dynamic> toJson() => {
        "sender_name": senderName,
        "sender_tag": senderTag,
        "receiver_tag": receiverTag,
        "receiver_picture": receiverPicture,
        "phoneNumber": phoneNumber,
        "category": category,
        "subCategory": subCategory,
        "amount": amount,
      };
}

class TransactionAnalyticsResponse {
  TransactionAnalyticsResponse({
    this.status,
    this.message,
    this.code,
    this.data,
  });

  String? status;
  String? message;
  int? code;
  TransactionAnalyticsData? data;

  factory TransactionAnalyticsResponse.fromJson(Map<String, dynamic> json) =>
      TransactionAnalyticsResponse(
        status: json["status"],
        message: json["message"],
        code: json["code"],
        data: TransactionAnalyticsData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "code": code,
        "data": data!.toJson(),
      };
}

class TransactionAnalyticsData {
  TransactionAnalyticsData({
    this.analyticsSummary,
    this.analytics,
  });

  List<AnalyticsSummary>? analyticsSummary;
  List<Analytics>? analytics;

  factory TransactionAnalyticsData.fromJson(Map<String, dynamic> json) =>
      TransactionAnalyticsData(
        analyticsSummary: List<AnalyticsSummary>.from(
            json["analyticsSummary"].map((x) => AnalyticsSummary.fromJson(x))),
        analytics: List<Analytics>.from(
            json["analytics"].map((x) => Analytics.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "analyticsSummary":
            List<dynamic>.from(analyticsSummary!.map((x) => x.toJson())),
        "analytics": List<dynamic>.from(analytics!.map((x) => x.toJson())),
      };
}

class Analytics {
  Analytics({
    this.totalSpending,
    this.totalInflow,
    this.totalOutflow,
    this.totalTransfers,
    this.transferPercentage,
    this.totalVoucherPurchased,
    this.voucherPercentage,
    this.totalAirtimePurchased,
    this.airtimePercentage,
    this.totalDataPurchased,
    this.dataPercentage,
    this.totalInternetPurchased,
    this.internetPercentage,
    this.totalCablePurchased,
    this.cablePercentage,
    this.totalElectricityPurchased,
    this.electricityPercentage,
    this.totalBettingPurchased,
    this.bettingPercentage,
  });

  String? totalSpending;
  String? totalInflow;
  String? totalOutflow;
  String? totalTransfers;
  String? transferPercentage;
  String? totalVoucherPurchased;
  String? voucherPercentage;
  dynamic totalAirtimePurchased;
  dynamic airtimePercentage;
  dynamic totalDataPurchased;
  dynamic dataPercentage;
  dynamic totalInternetPurchased;
  dynamic internetPercentage;
  dynamic totalCablePurchased;
  dynamic cablePercentage;
  dynamic totalElectricityPurchased;
  dynamic electricityPercentage;
  dynamic totalBettingPurchased;
  dynamic bettingPercentage;

  factory Analytics.fromJson(Map<String, dynamic> json) => Analytics(
        totalSpending: json["total_spending"],
        totalInflow: json["total_inflow"],
        totalOutflow: json["total_outflow"],
        totalTransfers: json["total_transfers"],
        transferPercentage: json["transfer_percentage"],
        totalVoucherPurchased: json["total_voucher_purchased"],
        voucherPercentage: json["voucher_percentage"],
        totalAirtimePurchased: json["total_airtime_purchased"],
        airtimePercentage: json["airtime_percentage"],
        totalDataPurchased: json["total_data_purchased"],
        dataPercentage: json["data_percentage"],
        totalInternetPurchased: json["total_internet_purchased"],
        internetPercentage: json["internet_percentage"],
        totalCablePurchased: json["total_cable_purchased"],
        cablePercentage: json["cable_percentage"],
        totalElectricityPurchased: json["total_electricity_purchased"],
        electricityPercentage: json["electricity_percentage"],
        totalBettingPurchased: json["total_betting_purchased"],
        bettingPercentage: json["betting_percentage"],
      );

  Map<String, dynamic> toJson() => {
        "total_spending": totalSpending,
        "total_inflow": totalInflow,
        "total_outflow": totalOutflow,
        "total_transfers": totalTransfers,
        "transfer_percentage": transferPercentage,
        "total_voucher_purchased": totalVoucherPurchased,
        "voucher_percentage": voucherPercentage,
        "total_airtime_purchased": totalAirtimePurchased,
        "airtime_percentage": airtimePercentage,
        "total_data_purchased": totalDataPurchased,
        "data_percentage": dataPercentage,
        "total_internet_purchased": totalInternetPurchased,
        "internet_percentage": internetPercentage,
        "total_cable_purchased": totalCablePurchased,
        "cable_percentage": cablePercentage,
        "total_electricity_purchased": totalElectricityPurchased,
        "electricity_percentage": electricityPercentage,
        "total_betting_purchased": totalBettingPurchased,
        "betting_percentage": bettingPercentage,
      };
}

class AnalyticsSummary {
  AnalyticsSummary({
    required this.day,
    this.totalOutflow,
  });

  int day;
  String? totalOutflow;

  factory AnalyticsSummary.fromJson(Map<String, dynamic> json) =>
      AnalyticsSummary(
        day: json["day"],
        totalOutflow: json["total_outflow"],
      );

  Map<String, dynamic> toJson() => {
        "day": day,
        "total_outflow": totalOutflow,
      };
}
