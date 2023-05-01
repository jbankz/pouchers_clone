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
    this.senderName,
    this.status,
    this.transactionId
  });

  String? receiverName;
  String? receiverTag;
  String? amount;
  String? senderName;
  String? status;
  String? transactionId;

  factory P2PData.fromJson(Map<String, dynamic> json) =>
      P2PData(
        receiverName: json["receiver_name"],
        receiverTag: json["receiver_tag"],
        amount: json["amount"],
        senderName: json["sender_name"],
        status: json["status"],
        transactionId: json["transaction_id"]
      );

  Map<String, dynamic> toJson() =>
      {
        "receiver_name": receiverName,
        "receiver_tag": receiverTag,
        "amount": amount,
        "sender_name" : senderName,
        "status" : status,
        "transaction_id" : transactionId
      };
}

class LocalTransferResponse {
  LocalTransferResponse({
     this.status,
     this.message,
     this.code,
     this.data,
  });

  String? status;
  String? message;
  int? code;
  LocalTransferData? data;

  factory LocalTransferResponse.fromJson(Map<String, dynamic> json) => LocalTransferResponse(
    status: json["status"],
    message: json["message"],
    code: json["code"],
    data: LocalTransferData.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "code": code,
    "data": data!.toJson(),
  };
}

class LocalTransferData {
  LocalTransferData({
     this.senderName,
     this.receiverName,
     this.bankName,
     this.receiverAccountNumber,
     this.transactionAmount,
     this.transactionFee,
     this.referenceNumber,
     this.pagaTransactionId,
     this.currency,
     this.transactionDate,
  });

  String? senderName;
  String? receiverName;
  String? bankName;
  String? receiverAccountNumber;
  String? transactionAmount;
  double? transactionFee;
  String? referenceNumber;
  String? pagaTransactionId;
  String? currency;
  String? transactionDate;

  factory LocalTransferData.fromJson(Map<String, dynamic> json) => LocalTransferData(
    senderName: json["sender_name"],
    receiverName: json["receiver_name"],
    bankName: json["bank_name"],
    receiverAccountNumber: json["receiver_account_number"],
    transactionAmount: json["transaction_amount"],
    transactionFee: json["transaction_fee"]?.toDouble(),
    referenceNumber: json["referenceNumber"],
    pagaTransactionId: json["pagaTransactionId"],
    currency: json["currency"],
    transactionDate: json["transaction_date"],
  );

  Map<String, dynamic> toJson() => {
    "sender_name": senderName,
    "receiver_name": receiverName,
    "bank_name": bankName,
    "receiver_account_number": receiverAccountNumber,
    "transaction_amount": transactionAmount,
    "transaction_fee": transactionFee,
    "referenceNumber": referenceNumber,
    "pagaTransactionId": pagaTransactionId,
    "currency": currency,
    "transaction_date": transactionDate,
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
    this.transactionFee,
    this.destinationBankUUID,
    this.accountName,
  });

  double? transactionFee;
  String? destinationBankUUID;
  String? accountName;

  factory AccountDetailsData.fromJson(Map<String, dynamic> json) =>
      AccountDetailsData(
        transactionFee: json["transactionFee"],
        destinationBankUUID: json["destinationBankUUID"],
        accountName: json["accountName"],
      );

  Map<String, dynamic> toJson() =>
      {
        "transactionFee": transactionFee,
        "destinationBankUUID": destinationBankUUID,
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


class GetWalletResponse {
  GetWalletResponse({
    required this.status,
    required this.message,
    required this.code,
    required this.data,
  });

  String status;
  String message;
  int code;
  GetWalletData? data;

  factory GetWalletResponse.fromJson(Map<String, dynamic> json) => GetWalletResponse(
    status: json["status"],
    message: json["message"],
    code: json["code"],
    data: GetWalletData.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "code": code,
    "data": data!.toJson(),
  };
}

class GetWalletData {
  GetWalletData({
     this.walletId,
     this.userId,
     this.credit,
     this.debit,
     this.balance,
     this.walletType,
     this.accountName,
     this.accountNumber,
     this.bankProvider,
  });

  String? walletId;
  String? userId;
  String? credit;
  String? debit;
  String? balance;
  String? walletType;
  String? accountName;
  String? accountNumber;
  String? bankProvider;

  factory GetWalletData.fromJson(Map<String, dynamic> json) => GetWalletData(
    walletId: json["wallet_id"],
    userId: json["user_id"],
    credit: json["credit"],
    debit: json["debit"],
    balance: json["balance"],
    walletType: json["wallet_type"],
    accountName: json["account_name"],
    accountNumber: json["account_number"],
    bankProvider: json["bank_provider"],
  );

  Map<String, dynamic> toJson() => {
    "wallet_id": walletId,
    "user_id": userId,
    "credit": credit,
    "debit": debit,
    "balance": balance,
    "wallet_type": walletType,
    "account_name": accountName,
    "account_number": accountNumber,
    "bank_provider": bankProvider,
  };
}

class NotificationResponse {
  String? status;
  String? message;
  int? code;
  NotificationData? data;

  NotificationResponse({
     this.status,
     this.message,
     this.code,
     this.data,
  });

  factory NotificationResponse.fromJson(Map<String, dynamic> json) => NotificationResponse(
    status: json["status"],
    message: json["message"],
    code: json["code"],
    data: NotificationData.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "code": code,
    "data": data!.toJson(),
  };
}

class NotificationData {
  List<Notification> notifications;
  int total;
  String page;

  NotificationData({
    required this.notifications,
    required this.total,
    required this.page,
  });

  factory NotificationData.fromJson(Map<String, dynamic> json) => NotificationData(
    notifications: json["notfications"] == null ? [] : List<Notification>.from(json["notfications"].map((x) => Notification.fromJson(x))),
    total: json["total"],
    page: json["page"],
  );

  Map<String, dynamic> toJson() => {
    "notfications": List<dynamic>.from(notifications.map((x) => x.toJson())),
    "total": total,
    "page": page,
  };
}

class Notification {
  String? title;
  String? body;
  DateTime? createdAt;

  Notification({
     this.title,
     this.body,
     this.createdAt,
  });

  factory Notification.fromJson(Map<String, dynamic> json) => Notification(
    title: json["title"],
    body: json["body"],
    createdAt: DateTime.parse(json["created_at"]),
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "body": body,
    "created_at": createdAt!.toIso8601String(),
  };
}







