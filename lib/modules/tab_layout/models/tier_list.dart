class TierListResponse {
  TierListResponse({
    this.status,
    this.message,
    this.code,
    this.data,
  });

  String? status;
  String? message;
  int? code;
  TierListResponseData? data;

  factory TierListResponse.fromJson(Map<String, dynamic> json) => TierListResponse(
    status: json["status"],
    message: json["message"],
    code: json["code"],
    data: TierListResponseData.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "code": code,
    "data": data!.toJson(),
  };
}

class TierListResponseData {
  TierListResponseData({
    this.tier1,
    this.tier2,
    this.tier3,
  });

  Tier? tier1;
  Tier? tier2;
  Tier? tier3;

  factory TierListResponseData.fromJson(Map<String, dynamic> json) => TierListResponseData(
    tier1: Tier.fromJson(json["tier1"]),
    tier2: Tier.fromJson(json["tier2"]),
    tier3: Tier.fromJson(json["tier3"]),
  );

  Map<String, dynamic> toJson() => {
    "tier1": tier1!.toJson(),
    "tier2": tier2!.toJson(),
    "tier3": tier3!.toJson(),
  };
}

class Tier {
  Tier({
    this.dailyTxLimit,
    this.maxBalance,
  });

  String? dailyTxLimit;
  String? maxBalance;

  factory Tier.fromJson(Map<String, dynamic> json) => Tier(
    dailyTxLimit: json["dailyTxLimit"],
    maxBalance: json["maxBalance"],
  );

  Map<String, dynamic> toJson() => {
    "dailyTxLimit": dailyTxLimit,
    "maxBalance": maxBalance,
  };
}