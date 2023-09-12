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
     this.transactionId,
     this.currency,
     this.transactionDate,
    this.anchorTransactionId
  });

  String? senderName;
  String? receiverName;
  String? bankName;
  String? receiverAccountNumber;
  String? transactionAmount;
  double? transactionFee;
  String? referenceNumber;
  String? transactionId;
  String? currency;
  String? transactionDate;
  String? anchorTransactionId;

  factory LocalTransferData.fromJson(Map<String, dynamic> json) => LocalTransferData(
    senderName: json["sender_name"],
    receiverName: json["receiver_name"],
    bankName: json["bank_name"],
    receiverAccountNumber: json["receiver_account_number"],
    transactionAmount: json["transaction_amount"],
    transactionFee: json["transaction_fee"]?.toDouble(),
    referenceNumber: json["referenceNumber"],
    transactionId: json["transactionId"],
    currency: json["currency"],
    transactionDate: json["transaction_date"],
      anchorTransactionId:json["anchorTransactionId"]
  );

  Map<String, dynamic> toJson() => {
    "sender_name": senderName,
    "receiver_name": receiverName,
    "bank_name": bankName,
    "receiver_account_number": receiverAccountNumber,
    "transaction_amount": transactionAmount,
    "transaction_fee": transactionFee,
    "referenceNumber": referenceNumber,
    "transactionId": transactionId,
    "currency": currency,
    "transaction_date": transactionDate,
    "anchorTransactionId":anchorTransactionId
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
        transactionFee: json["transactionFee"].toDouble(),
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
  GetAllBanksResponseData? data;

  factory GetAllBanksResponse.fromJson(Map<String, dynamic> json) =>
      GetAllBanksResponse(
        status: json["status"],
        message: json["message"],
        code: json["code"],
        data: GetAllBanksResponseData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() =>
      {
        "status": status,
        "message": message,
        "code": code,
        "data": data!.toJson(),
      };
}

class GetAllBanksResponseData {
  List<GetAllBanksDetail>? data;

  GetAllBanksResponseData({
     this.data,
  });

  factory GetAllBanksResponseData.fromJson(Map<String, dynamic> json) => GetAllBanksResponseData(
    data: List<GetAllBanksDetail>.from(json["data"].map((x) => GetAllBanksDetail.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class GetAllBanksDetail {
  String? id;
  String? type;
  Attributes? attributes;

  GetAllBanksDetail({
      this.id,
      this.type,
      this.attributes,
  });

  factory GetAllBanksDetail.fromJson(Map<String, dynamic> json) => GetAllBanksDetail(
    id: json["id"],
    type: json["type"],
    attributes: Attributes.fromJson(json["attributes"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "type": type,
    "attributes": attributes!.toJson(),
  };
}

class Attributes {
  String? nipCode;
  String? name;
  String? cbnCode;

  Attributes({
      this.nipCode,
      this.name,
    this.cbnCode,
  });

  factory Attributes.fromJson(Map<String, dynamic> json) => Attributes(
    nipCode: json["nipCode"],
    name: json["name"],
    cbnCode: json["cbnCode"],
  );

  Map<String, dynamic> toJson() => {
    "nipCode": nipCode,
    "name": name,
    "cbnCode": cbnCode,
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

  @override
  String toString() {
    return 'NotificationResponse{status: $status, message: $message, code: $code, data: $data}';
  }
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
    notifications: json["notifications"] == null ? [] : List<Notification>.from(json["notifications"].map((x) => Notification.fromJson(x))),
    total: json["total"],
    page: json["page"],
  );

  Map<String, dynamic> toJson() => {
    "notifications": List<dynamic>.from(notifications.map((x) => x.toJson())),
    "total": total,
    "page": page,
  };

  @override
  String toString() {
    return 'NotificationData{notifications: $notifications, total: $total, page: $page}';
  }
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

  @override
  String toString() {
    return 'Notification{title: $title, body: $body, createdAt: $createdAt}';
  }
}


class MoneyRequestResponse {
  String? status;
  String? message;
  int? code;
  MoneyRequestData? data;

  MoneyRequestResponse({
      this.status,
      this.message,
      this.code,
      this.data,
  });

  factory MoneyRequestResponse.fromJson(Map<String, dynamic> json) => MoneyRequestResponse(
    status: json["status"],
    message: json["message"],
    code: json["code"],
    data: MoneyRequestData.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "code": code,
    "data": data!.toJson(),
  };
}

class MoneyRequestData {
  int? id;
  String? requestId;
  String? requesterUserId;
  String? requesteeUserId;
  String? note;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? amount;
  String? status;
  String? fulfilledAmount;
  String? reason;

  MoneyRequestData({
      this.id,
      this.requestId,
      this.requesterUserId,
      this.requesteeUserId,
      this.note,
      this.createdAt,
      this.updatedAt,
      this.amount,
      this.status,
       this.fulfilledAmount,
      this.reason,
  });

  factory MoneyRequestData.fromJson(Map<String, dynamic> json) => MoneyRequestData(
    id: json["id"],
    requestId: json["request_id"],
    requesterUserId: json["requester_user_id"],
    requesteeUserId: json["requestee_user_id"],
    note: json["note"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    amount: json["amount"],
    status: json["status"],
    fulfilledAmount: json["fulfilled_amount"],
    reason: json["reason"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "request_id": requestId,
    "requester_user_id": requesterUserId,
    "requestee_user_id": requesteeUserId,
    "note": note,
    "created_at": createdAt!.toIso8601String(),
    "updated_at": updatedAt!.toIso8601String(),
    "amount": amount,
    "status": status,
    "fulfilled_amount": fulfilledAmount,
    "reason": reason,
  };
}








