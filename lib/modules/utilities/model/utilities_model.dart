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

  factory GetVoucherResponse.fromJson(Map<String, dynamic> json) =>
      GetVoucherResponse(
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

  factory GetVoucherResponseData.fromJson(Map<String, dynamic> json) =>
      GetVoucherResponseData(
        vouchers: List<Voucher>.from(
            json["vouchers"].map((x) => Voucher.fromJson(x))),
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

class GetUtilitiesResponse {
  GetUtilitiesResponse({
    this.status,
    this.message,
    this.code,
    this.data,
  });

  String? status;
  String? message;
  int? code;
  List<GetUtilitiesData>? data;

  factory GetUtilitiesResponse.fromJson(Map<String, dynamic> json) =>
      GetUtilitiesResponse(
        status: json["status"],
        message: json["message"],
        code: json["code"],
        data: List<GetUtilitiesData>.from(
            json["data"].map((x) => GetUtilitiesData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "code": code,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class GetUtilitiesData {
  GetUtilitiesData({
    this.categoryid,
    this.categoryname,
    this.billerid,
    this.billername,
    this.logoUrl,
  });

  String? categoryid;
  String? categoryname;
  String? billerid;
  String? billername;
  String? logoUrl;

  factory GetUtilitiesData.fromJson(Map<String, dynamic> json) =>
      GetUtilitiesData(
        categoryid: json["categoryid"],
        categoryname: json["categoryname"],
        billerid: json["billerid"],
        billername: json["billername"],
        logoUrl: json["logoUrl"],
      );

  Map<String, dynamic> toJson() => {
        "categoryid": categoryid,
        "categoryname": categoryname,
        "billerid": billerid,
        "billername": billername,
        "logoUrl": logoUrl,
      };
}

class GetUtilitiesTypesResponse {
  GetUtilitiesTypesResponse({
    this.status,
    this.message,
    this.code,
    this.data,
  });

  String? status;
  String? message;
  int? code;
  GetUtilitiesTypesData? data;

  factory GetUtilitiesTypesResponse.fromJson(Map<String, dynamic> json) =>
      GetUtilitiesTypesResponse(
        status: json["status"],
        message: json["message"],
        code: json["code"],
        data: GetUtilitiesTypesData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "code": code,
        "data": data!.toJson(),
      };
}

class GetUtilitiesTypesData {
  GetUtilitiesTypesData({
    required this.paymentitems,
  });

  List<PaymentItem>? paymentitems;

  factory GetUtilitiesTypesData.fromJson(Map<String, dynamic> json) =>
      GetUtilitiesTypesData(
        paymentitems: List<PaymentItem>.from(
            json["paymentitems"].map((x) => PaymentItem.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "paymentitems":
            List<dynamic>.from(paymentitems!.map((x) => x.toJson())),
      };
}

class PaymentItem {
  PaymentItem({
    this.categoryid,
    this.billerid,
    this.isAmountFixed,
    this.paymentitemid,
    this.paymentitemname,
    this.amount,
    this.code,
    this.currencyCode,
    this.currencySymbol,
    this.itemCurrencySymbol,
    this.sortOrder,
    this.pictureId,
    this.paymentCode,
    this.itemFee,
    this.paydirectItemCode,
  });

  String? categoryid;
  String? billerid;
  bool? isAmountFixed;
  String? paymentitemid;
  String? paymentitemname;
  String? amount;
  String? code;
  String? currencyCode;
  String? currencySymbol;
  String? itemCurrencySymbol;
  String? sortOrder;
  String? pictureId;
  String? paymentCode;
  String? itemFee;
  String? paydirectItemCode;

  factory PaymentItem.fromJson(Map<String, dynamic> json) => PaymentItem(
        categoryid: json["categoryid"],
        billerid: json["billerid"],
        isAmountFixed: json["isAmountFixed"],
        paymentitemid: json["paymentitemid"],
        paymentitemname: json["paymentitemname"],
        amount: json["amount"],
        code: json["code"],
        currencyCode: json["currencyCode"],
        currencySymbol: json["currencySymbol"],
        itemCurrencySymbol: json["itemCurrencySymbol"],
        sortOrder: json["sortOrder"],
        pictureId: json["pictureId"],
        paymentCode: json["paymentCode"],
        itemFee: json["itemFee"],
        paydirectItemCode: json["paydirectItemCode"],
      );

  Map<String, dynamic> toJson() => {
        "categoryid": categoryid,
        "billerid": billerid,
        "isAmountFixed": isAmountFixed,
        "paymentitemid": paymentitemid,
        "paymentitemname": paymentitemname,
        "amount": amount,
        "code": code,
        "currencyCode": currencyCode,
        "currencySymbol": currencySymbol,
        "itemCurrencySymbol": itemCurrencySymbol,
        "sortOrder": sortOrder,
        "pictureId": pictureId,
        "paymentCode": paymentCode,
        "itemFee": itemFee,
        "paydirectItemCode": paydirectItemCode,
      };
}
