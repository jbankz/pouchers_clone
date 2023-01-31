class GetVoucherResponse {
  GetVoucherResponse({
     this.status,
     this.message,
     this.code,
     this.data,
  });

  String? status;
  String? message;
  int? code;
  GetVoucherResponseData? data;

  factory GetVoucherResponse.fromJson(Map<String, dynamic> json) => GetVoucherResponse(
    status: json["status"],
    message: json["message"],
    code: json["code"],
    data: GetVoucherResponseData.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "code": code,
    "data": data!.toJson(),
  };
}

class GetVoucherResponseData {
  GetVoucherResponseData({
    required this.vouchers,
    required this.total,
    required this.page,
  });

  List<Voucher> vouchers;
  int total;
  String page;

  factory GetVoucherResponseData.fromJson(Map<String, dynamic> json) => GetVoucherResponseData(
    vouchers: List<Voucher>.from(json["vouchers"].map((x) => Voucher.fromJson(x))),
    total: json["total"],
    page: json["page"],
  );

  Map<String, dynamic> toJson() => {
    "vouchers": List<dynamic>.from(vouchers.map((x) => x.toJson())),
    "total": total,
    "page": page,
  };
}

class Voucher {
  Voucher({
    required this.code,
    required this.amount,
    required this.buyerId,
    this.gifteeId,
    required this.status,
    required this.redeemed,
    required this.createdAt,
  });

  String code;
  String amount;
  String buyerId;
  String? gifteeId;
  String status;
  bool redeemed;
  DateTime createdAt;

  factory Voucher.fromJson(Map<String, dynamic> json) => Voucher(
    code: json["code"],
    amount: json["amount"],
    buyerId: json["buyer_id"],
    gifteeId: json["giftee_id"],
    status: json["status"],
    redeemed: json["redeemed"],
    createdAt: DateTime.parse(json["created_at"]),
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "amount": amount,
    "buyer_id": buyerId,
    "giftee_id": gifteeId,
    "status": status,
    "redeemed": redeemed,
    "created_at": createdAt.toIso8601String(),
  };
}
