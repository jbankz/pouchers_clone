class GetAllCardsResponse {
  GetAllCardsResponse({
    this.status,
    this.message,
    this.code,
    this.data,
  });

  String? status;
  String? message;
  int? code;
  List<GetAllCardsResponseData?>? data;

  factory GetAllCardsResponse.fromJson(Map<String, dynamic> json) =>
      GetAllCardsResponse(
        status: json["status"],
        message: json["message"],
        code: json["code"],
        data: List<GetAllCardsResponseData?>.from(json["data"].map(
            (x) => x == null ? null : GetAllCardsResponseData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "code": code,
        "data": List<dynamic>.from(data!.map((x) => x?.toJson())),
      };
}

class GetAllCardsResponseData {
  GetAllCardsResponseData({
    this.userId,
    this.accountId,
    this.accountType,
    this.accountNumber,
    this.accountName,
    this.brand,
    this.last4,
    this.expiryMonth,
    this.expiryYear,
    this.balance,
    this.cardStatus,
    this.cardId,
    this.currency,
  });

  String? userId;
  String? accountId;
  String? accountType;
  String? accountNumber;
  String? accountName;
  String? brand;
  String? last4;
  String? expiryMonth;
  String? expiryYear;
  String? balance;
  String? cardStatus;
  String? cardId;
  String? currency;

  factory GetAllCardsResponseData.fromJson(Map<String, dynamic> json) =>
      GetAllCardsResponseData(
        userId: json["user_id"],
        accountId: json["account_id"],
        accountType: json["account_type"],
        accountNumber: json["account_number"],
        accountName: json["account_name"],
        brand: json["brand"],
        last4: json["last4"],
        expiryMonth: json["expiry_month"],
        expiryYear: json["expiry_year"],
        balance: json["balance"],
        cardStatus: json["card_status"],
        cardId: json["card_id"],
        currency: json["currency"],
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "account_id": accountId,
        "account_type": accountType,
        "account_number": accountNumber,
        "account_name": accountName,
        "brand": brand,
        "last4": last4,
        "expiry_month": expiryMonth,
        "expiry_year": expiryYear,
        "balance": balance,
        "card_status": cardStatus,
        "card_id": cardId,
        "currency": currency,
      };
}

class GetCardDetailsResponse {
  GetCardDetailsResponse({
    this.status,
    this.message,
    this.code,
    this.data,
  });

  String? status;
  String? message;
  int? code;
  GetCardDetailsData? data;

  factory GetCardDetailsResponse.fromJson(Map<String, dynamic> json) =>
      GetCardDetailsResponse(
        status: json["status"],
        message: json["message"],
        code: json["code"],
        data: GetCardDetailsData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "code": code,
        "data": data!.toJson(),
      };
}

class GetCardDetailsData {
  GetCardDetailsData({
    this.id,
    this.business,
    this.customer,
    this.account,
    this.fundingSource,
    this.type,
    this.brand,
    this.currency,
    this.maskedPan,
    this.expiryMonth,
    this.expiryYear,
    this.status,
    this.is2FaEnrolled,
    this.isDeleted,
    this.isDefaultPinChanged,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  String? id;
  String? business;
  Customer? customer;
  Account? account;
  FundingSource? fundingSource;
  String? type;
  String? brand;
  String? currency;
  String? maskedPan;
  String? expiryMonth;
  String? expiryYear;
  String? status;
  bool? is2FaEnrolled;
  bool? isDefaultPinChanged;
  bool? isDeleted;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  factory GetCardDetailsData.fromJson(Map<String, dynamic> json) =>
      GetCardDetailsData(
          id: json["_id"],
          business: json["business"],
          customer: json["customer"] == null
              ? null
              : Customer.fromJson(json["customer"]),
          account: json["account"] == null
              ? null
              : Account.fromJson(json["account"]),
          fundingSource: json["fundingSource"] == null
              ? null
              : FundingSource.fromJson(json["fundingSource"]),
          type: json["type"],
          brand: json["brand"],
          currency: json["currency"],
          maskedPan: json["maskedPan"],
          expiryMonth: json["expiryMonth"],
          expiryYear: json["expiryYear"],
          status: json["status"],
          is2FaEnrolled: json["is2FAEnrolled"],
          isDeleted: json["isDeleted"],
          createdAt: json["createdAt"] == null
              ? null
              : DateTime.parse(json["createdAt"]),
          updatedAt: json["updatedAt"] == null
              ? null
              : DateTime.parse(json["updatedAt"]),
          v: json["__v"],
          isDefaultPinChanged: json["isDefaultPinChanged"]);

  Map<String, dynamic> toJson() => {
        "_id": id,
        "business": business,
        "customer": customer!.toJson(),
        "account": account!.toJson(),
        "fundingSource": fundingSource!.toJson(),
        "type": type,
        "brand": brand,
        "currency": currency,
        "maskedPan": maskedPan,
        "expiryMonth": expiryMonth,
        "expiryYear": expiryYear,
        "status": status,
        "is2FAEnrolled": is2FaEnrolled,
        "isDeleted": isDeleted,
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
        "__v": v,
        "isDefaultPinChanged": isDefaultPinChanged
      };
}

class Account {
  Account({
    required this.id,
    required this.business,
    required this.type,
    required this.currency,
    required this.accountName,
    required this.bankCode,
    required this.accountType,
    required this.accountNumber,
    required this.currentBalance,
    required this.availableBalance,
    required this.provider,
    required this.providerReference,
    required this.referenceCode,
    required this.isDefault,
    required this.isDeleted,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  String id;
  String business;
  String type;
  String currency;
  String accountName;
  String bankCode;
  String accountType;
  String accountNumber;
  int currentBalance;
  int availableBalance;
  String provider;
  String providerReference;
  String referenceCode;
  bool isDefault;
  bool isDeleted;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  factory Account.fromJson(Map<String, dynamic> json) => Account(
        id: json["_id"],
        business: json["business"],
        type: json["type"],
        currency: json["currency"],
        accountName: json["accountName"],
        bankCode: json["bankCode"],
        accountType: json["accountType"],
        accountNumber: json["accountNumber"],
        currentBalance: json["currentBalance"],
        availableBalance: json["availableBalance"],
        provider: json["provider"],
        providerReference: json["providerReference"],
        referenceCode: json["referenceCode"],
        isDefault: json["isDefault"],
        isDeleted: json["isDeleted"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "business": business,
        "type": type,
        "currency": currency,
        "accountName": accountName,
        "bankCode": bankCode,
        "accountType": accountType,
        "accountNumber": accountNumber,
        "currentBalance": currentBalance,
        "availableBalance": availableBalance,
        "provider": provider,
        "providerReference": providerReference,
        "referenceCode": referenceCode,
        "isDefault": isDefault,
        "isDeleted": isDeleted,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
      };
}

class BillingAddress {
  BillingAddress({
    this.line1,
    this.city,
    this.state,
    this.country,
    this.postalCode,
    this.id,
  });

  String? line1;
  String? city;
  String? state;
  String? country;
  String? postalCode;
  String? id;

  factory BillingAddress.fromJson(Map<String, dynamic> json) => BillingAddress(
        line1: json["line1"],
        city: json["city"],
        state: json["state"],
        country: json["country"],
        postalCode: json["postalCode"],
        id: json["_id"],
      );

  Map<String, dynamic> toJson() => {
        "line1": line1,
        "city": city,
        "state": state,
        "country": country,
        "postalCode": postalCode,
        "_id": id,
      };
}

class Customer {
  Customer({
    this.id,
    this.business,
    this.type,
    this.name,
    this.phoneNumber,
    this.emailAddress,
    this.status,
    this.individual,
    this.billingAddress,
    this.isDeleted,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  String? id;
  String? business;
  String? type;
  String? name;
  String? phoneNumber;
  String? emailAddress;
  String? status;
  Individual? individual;
  BillingAddress? billingAddress;
  bool? isDeleted;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
        id: json["_id"],
        business: json["business"],
        type: json["type"],
        name: json["name"],
        phoneNumber: json["phoneNumber"],
        emailAddress: json["emailAddress"],
        status: json["status"],
        individual: Individual.fromJson(json["individual"]),
        billingAddress: BillingAddress.fromJson(json["billingAddress"]),
        isDeleted: json["isDeleted"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "business": business,
        "type": type,
        "name": name,
        "phoneNumber": phoneNumber,
        "emailAddress": emailAddress,
        "status": status,
        "individual": individual!.toJson(),
        "billingAddress": billingAddress!.toJson(),
        "isDeleted": isDeleted,
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
        "__v": v,
      };
}

class Individual {
  Individual({
    this.firstName,
    this.lastName,
    this.dob,
    this.identity,
    this.id,
  });

  String? firstName;
  String? lastName;
  DateTime? dob;
  Identity? identity;
  String? id;

  factory Individual.fromJson(Map<String, dynamic> json) => Individual(
        firstName: json["firstName"],
        lastName: json["lastName"],
        dob: json["dob"] == null ? null : DateTime.parse(json["dob"]),
        identity: json["identity"] == null
            ? null
            : Identity.fromJson(json["identity"]),
        id: json["_id"],
      );

  Map<String, dynamic> toJson() => {
        "firstName": firstName,
        "lastName": lastName,
        "dob": dob!.toIso8601String(),
        "identity": identity!.toJson(),
        "_id": id,
      };
}

class Identity {
  Identity({
    this.type,
    this.number,
    this.id,
  });

  String? type;
  String? number;
  String? id;

  factory Identity.fromJson(Map<String, dynamic> json) => Identity(
        type: json["type"],
        number: json["number"],
        id: json["_id"],
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "number": number,
        "_id": id,
      };
}

class FundingSource {
  FundingSource({
    this.id,
    this.business,
    this.type,
    this.status,
    this.jitGateway,
    this.isDefault,
    this.isDeleted,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  String? id;
  String? business;
  String? type;
  String? status;
  dynamic jitGateway;
  bool? isDefault;
  bool? isDeleted;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  factory FundingSource.fromJson(Map<String, dynamic> json) => FundingSource(
        id: json["_id"],
        business: json["business"],
        type: json["type"],
        status: json["status"],
        jitGateway: json["jitGateway"],
        isDefault: json["isDefault"],
        isDeleted: json["isDeleted"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "business": business,
        "type": type,
        "status": status,
        "jitGateway": jitGateway,
        "isDefault": isDefault,
        "isDeleted": isDeleted,
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
        "__v": v,
      };
}

class FetchEnvs {
  FetchEnvs({
    this.status,
    this.message,
    this.code,
    this.data,
  });

  String? status;
  String? message;
  int? code;
  List<FetchEnvsData>? data;

  factory FetchEnvs.fromJson(Map<String, dynamic> json) => FetchEnvs(
        status: json["status"],
        message: json["message"],
        code: json["code"],
        data: List<FetchEnvsData>.from(
            json["data"].map((x) => FetchEnvsData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "code": code,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class FetchEnvsData {
  FetchEnvsData({
    this.name,
    this.value,
  });

  String? name;
  String? value;

  factory FetchEnvsData.fromJson(Map<String, dynamic> json) => FetchEnvsData(
        name: json["name"],
        value: json["value"].toString(),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "value": value,
      };
}
