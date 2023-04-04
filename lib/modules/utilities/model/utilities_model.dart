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
    this.name,
    this.displayName,
    this.category,
    this.status,
    this.operatorpublicid,
  });

  String? name;
  String? displayName;
  String? category;
  String? status;
  String? operatorpublicid;

  factory GetUtilitiesData.fromJson(Map<String, dynamic> json) =>
      GetUtilitiesData(
        name: json["name"],
        displayName: json["display_name"],
        category: json["category"],
        status: json["status"],
        operatorpublicid: json["operatorpublicid"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "display_name": displayName,
        "category": category,
        "status": status,
        "operatorpublicid": operatorpublicid,
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
    this.responseCode,
    this.responseCategoryCode,
    this.message,
    this.referenceNumber,
    this.services,
  });

  int? responseCode;
  dynamic responseCategoryCode;
  String? message;
  String? referenceNumber;
  List<Service>? services;

  factory GetUtilitiesTypesData.fromJson(Map<String, dynamic> json) =>
      GetUtilitiesTypesData(
        responseCode: json["responseCode"],
        responseCategoryCode: json["responseCategoryCode"],
        message: json["message"],
        referenceNumber: json["referenceNumber"],
        services: List<Service>.from(
            json["services"].map((x) => Service.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "responseCode": responseCode,
        "responseCategoryCode": responseCategoryCode,
        "message": message,
        "referenceNumber": referenceNumber,
        "services": List<dynamic>.from(services!.map((x) => x.toJson())),
      };
}

class Service {
  Service({
    this.name,
    this.code,
    this.price,
    this.shortCode,
  });

  String? name;
  String? code;
  int? price;
  String? shortCode;

  factory Service.fromJson(Map<String, dynamic> json) => Service(
        name: json["name"],
        code: json["code"],
        price: json["price"],
        shortCode: json["shortCode"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "code": code,
        "price": price,
        "shortCode": shortCode,
      };
}


class DataBundleResponse {
  DataBundleResponse({
     this.status,
     this.message,
     this.code,
     this.data,
  });

  String? status;
  String? message;
  int? code;
  BundleData? data;

  factory DataBundleResponse.fromJson(Map<String, dynamic> json) => DataBundleResponse(
    status: json["status"],
    message: json["message"],
    code: json["code"],
    data: BundleData.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "code": code,
    "data": data!.toJson(),
  };
}

class BundleData {
  BundleData({
    required this.responseCode,
    this.responseCategoryCode,
    this.message,
    required this.mobileOperatorServices,
  });

  int? responseCode;
  dynamic responseCategoryCode;
  dynamic message;
  List<MobileOperatorService>? mobileOperatorServices;

  factory BundleData.fromJson(Map<String, dynamic> json) => BundleData(
    responseCode: json["responseCode"],
    responseCategoryCode: json["responseCategoryCode"],
    message: json["message"],
    mobileOperatorServices: List<MobileOperatorService>.from(json["mobileOperatorServices"].map((x) => MobileOperatorService.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "responseCode": responseCode,
    "responseCategoryCode": responseCategoryCode,
    "message": message,
    "mobileOperatorServices": List<dynamic>.from(mobileOperatorServices!.map((x) => x.toJson())),
  };
}

class MobileOperatorService {
  MobileOperatorService({
     this.mobileOperatorId,
     this.servicePrice,
     this.serviceName,
     this.serviceId,
  });

  int? mobileOperatorId;
  int? servicePrice;
  String? serviceName;
  int? serviceId;

  factory MobileOperatorService.fromJson(Map<String, dynamic> json) => MobileOperatorService(
    mobileOperatorId: json["mobileOperatorId"],
    servicePrice: json["servicePrice"],
    serviceName: json["serviceName"],
    serviceId: json["serviceId"],
  );

  Map<String, dynamic> toJson() => {
    "mobileOperatorId": mobileOperatorId,
    "servicePrice": servicePrice,
    "serviceName": serviceName,
    "serviceId": serviceId,
  };
}


class GetAllScheduleResponse {
  GetAllScheduleResponse({
     this.status,
     this.message,
     this.code,
     this.data,
  });

  String? status;
  String? message;
  int? code;
  List<GetAllScheduleData>? data;

  factory GetAllScheduleResponse.fromJson(Map<String, dynamic> json) => GetAllScheduleResponse(
    status: json["status"],
    message: json["message"],
    code: json["code"],
    data: List<GetAllScheduleData>.from(json["data"].map((x) => GetAllScheduleData.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "code": code,
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class GetAllScheduleData {
  GetAllScheduleData({
    this.scheduleId,
     this.amount,
     this.recipient,
     this.category,
     this.subCategory,
     this.frequency,
    this.bankName,
     this.createdAt,
    this.beneficiaryAccountName,
  });

  String? scheduleId;
  String? amount;
  String? recipient;
  String? category;
  String? subCategory;
  String? frequency;
  String? bankName;
  DateTime? createdAt;
  dynamic beneficiaryAccountName;


  factory GetAllScheduleData.fromJson(Map<String, dynamic> json) => GetAllScheduleData(
    scheduleId: json["schedule_id"],
    amount: json["amount"].toString(),
    recipient: json["recipient"],
    category: json["category"],
    subCategory: json["sub_category"],
    frequency: json["frequency"],
    bankName: json["bank_name"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    beneficiaryAccountName: json["beneficiary_account_name"],
  );

  Map<String, dynamic> toJson() => {
    "schedule_id": scheduleId,
    "amount": amount,
    "recipient": recipient,
    "category": category,
    "sub_category": subCategory,
    "frequency": frequency,
    "bank_name": bankName,
    "created_at": createdAt!.toIso8601String(),
    "beneficiary_account_name": beneficiaryAccountName,
  };
}


class DiscountResponse {
  DiscountResponse({
     this.status,
     this.message,
     this.code,
     this.data,
  });

  String? status;
  String? message;
  int? code;
  DiscountResponseData? data;

  factory DiscountResponse.fromJson(Map<String, dynamic> json) => DiscountResponse(
    status: json["status"],
    message: json["message"],
    code: json["code"],
    data: DiscountResponseData.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "code": code,
    "data": data!.toJson(),
  };
}

class DiscountResponseData {
  DiscountResponseData({
     this.productCategory,
     this.discountValue,
     this.discountType,
     this.threshold,
     this.frequency,
     this.status,
     this.startDate,
     this.endDate,
  });

  String? productCategory;
  String? discountValue;
  String? discountType;
  String? threshold;
  String? frequency;
  String? status;
  DateTime? startDate;
  DateTime? endDate;

  factory DiscountResponseData.fromJson(Map<String, dynamic> json) => DiscountResponseData(
    productCategory: json["product_category"],
    discountValue: json["discount_value"],
    discountType: json["discount_type"],
    threshold: json["threshold"],
    frequency: json["frequency"],
    status: json["status"],
    startDate: json["start_date"] == null ? null : DateTime.parse(json["start_date"]),
    endDate: json["end_date"] == null ? null : DateTime.parse(json["end_date"]),
  );

  Map<String, dynamic> toJson() => {
    "product_category": productCategory,
    "discount_value": discountValue,
    "discount_type": discountType,
    "threshold": threshold,
    "frequency": frequency,
    "status": status,
    "start_date": startDate!.toIso8601String(),
    "end_date": endDate!.toIso8601String(),
  };
}



