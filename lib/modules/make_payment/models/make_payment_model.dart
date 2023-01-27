class ContactListResponse {
  ContactListResponse({
    this.status,
    this.message,
    this.code,
    this.data,
  });

  String? status;
  String? message;
  int? code;
  List<ContactListData>? data;

  factory ContactListResponse.fromJson(Map<String, dynamic> json) =>
      ContactListResponse(
        status: json["status"],
        message: json["message"],
        code: json["code"],
        data: List<ContactListData>.from(
            json["data"].map((x) => ContactListData.fromJson(x))),
      );

  Map<String, dynamic> toJson() =>
      {
        "status": status,
        "message": message,
        "code": code,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class ContactListData {
  ContactListData({
    this.id,
    this.phoneNumber,
    this.email,
    this.firstName,
    this.lastName,
    this.profilePicture,
    this.tag,
  });

  int? id;
  String? phoneNumber;
  String? email;
  String? firstName;
  String? lastName;
  String? profilePicture;
  String? tag;

  factory ContactListData.fromJson(Map<String, dynamic> json) =>
      ContactListData(
        id: json["id"],
        phoneNumber: json["phone_number"],
        email: json["email"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        profilePicture: json["profile_picture"],
        tag: json["tag"],
      );

  Map<String, dynamic> toJson() =>
      {
        "id": id,
        "phone_number": phoneNumber,
        "email": email,
        "first_name": firstName,
        "last_name": lastName,
        "profile_picture": profilePicture,
        "tag": tag,
      };
}

class RequestResponse {
  RequestResponse({
    this.status,
    this.message,
    this.code,
    this.data,
  });

  String? status;
  String? message;
  int? code;
  RequestResponseData? data;

  factory RequestResponse.fromJson(Map<String, dynamic> json) =>
      RequestResponse(
        status: json["status"],
        message: json["message"],
        code: json["code"],
        data: RequestResponseData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() =>
      {
        "status": status,
        "message": message,
        "code": code,
        "data": data!.toJson(),
      };
}

class RequestResponseData {
  RequestResponseData({
    this.requesterName,
    this.amount,
    this.note,
  });

  String? requesterName;
  int? amount;
  String? note;

  factory RequestResponseData.fromJson(Map<String, dynamic> json) =>
      RequestResponseData(
        requesterName: json["requester_name"],
        amount: json["amount"],
        note: json["note"],
      );

  Map<String, dynamic> toJson() =>
      {
        "requester_name": requesterName,
        "amount": amount,
        "note": note,
      };
}

class P2PResponse {
  P2PResponse({
    this.status,
    this.message,
    this.code,
    this.data,
  });

  String? status;
  String? message;
  int? code;
  P2PData? data;

  factory P2PResponse.fromJson(Map<String, dynamic> json) =>
      P2PResponse(
        status: json["status"],
        message: json["message"],
        code: json["code"],
        data: P2PData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() =>
      {
        "status": status,
        "message": message,
        "code": code,
        "data": data!.toJson(),
      };
}

class P2PData {
  P2PData({
    this.receiverName,
    this.receiverTag,
    this.amount,
  });

  String? receiverName;
  String? receiverTag;
  String? amount;

  factory P2PData.fromJson(Map<String, dynamic> json) =>
      P2PData(
        receiverName: json["receiver_name"],
        receiverTag: json["receiver_tag"],
        amount: json["amount"],
      );

  Map<String, dynamic> toJson() =>
      {
        "receiver_name": receiverName,
        "receiver_tag": receiverTag,
        "amount": amount,
      };
}


class AccountDetailsResponse {
  AccountDetailsResponse({
    this.status,
    this.message,
    this.code,
    this.data,
  });

  String? status;
  String? message;
  int? code;
  AccountDetailsData? data;

  factory AccountDetailsResponse.fromJson(Map<String, dynamic> json) =>
      AccountDetailsResponse(
        status: json["status"],
        message: json["message"],
        code: json["code"],
        data: AccountDetailsData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() =>
      {
        "status": status,
        "message": message,
        "code": code,
        "data": data!.toJson(),
      };
}

class AccountDetailsData {
  AccountDetailsData({
    this.fee,
    this.vat,
    this.accountName,
  });

  int? fee;
  int? vat;
  String? accountName;

  factory AccountDetailsData.fromJson(Map<String, dynamic> json) =>
      AccountDetailsData(
        fee: json["fee"],
        vat: json["vat"],
        accountName: json["accountName"],
      );

  Map<String, dynamic> toJson() =>
      {
        "fee": fee,
        "vat": vat,
        "accountName": accountName,
      };
}

class GetAllBanksResponse {
  GetAllBanksResponse({
    required this.status,
    required this.message,
    required this.code,
    required this.data,
  });

  String status;
  String message;
  int code;
  List<GetAllBanksResponseData> data;

  factory GetAllBanksResponse.fromJson(Map<String, dynamic> json) =>
      GetAllBanksResponse(
        status: json["status"],
        message: json["message"],
        code: json["code"],
        data: json["data"] == null ? [] : List<GetAllBanksResponseData>.from(
            json["data"].map((x) => GetAllBanksResponseData.fromJson(x))),
      );

  Map<String, dynamic> toJson() =>
      {
        "status": status,
        "message": message,
        "code": code,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class GetAllBanksResponseData {
  GetAllBanksResponseData({
    required this.name,
    required this.uuid,
    this.interInstitutionCode,
    this.sortCode,
    this.ussdCode,
  });

  String name;
  String uuid;
  String? interInstitutionCode;
  String? sortCode;
  String? ussdCode;

  factory GetAllBanksResponseData.fromJson(Map<String, dynamic> json) =>
      GetAllBanksResponseData(
        name: json["name"],
        uuid: json["uuid"],
        interInstitutionCode: json["interInstitutionCode"],
        sortCode: json["sortCode"],
        ussdCode: json["ussdCode"],
      );

  Map<String, dynamic> toJson() =>
      {
        "name": name,
        "uuid": uuid,
        "interInstitutionCode": interInstitutionCode,
        "sortCode": sortCode,
        "ussdCode": ussdCode,
      };
}

class TransferModel {
  int? id;
  String? amount;
  String? bank;
  String? accountNumber;
  TransferModel({
    required this.amount,
    required this.bank,
    this.accountNumber,
    this.id
  });
  factory TransferModel.fromJson(Map<String, dynamic> json) => TransferModel(
      amount: json["amount"],
      bank: json["bank"],
      accountNumber: json["accountNumber"],
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "amount": amount,
    "bank": bank,
    "accountNumber": accountNumber,
    "id" : id
  };

  @override
  String toString() {
    return 'TransferModel{amount: $amount, bank: $bank, accountNumber: $accountNumber, id: $id}';
  }
}




