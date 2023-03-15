import 'package:flutter/material.dart';

class GuestClass {
  final String title;
  final String? mb;
      final String? days;
  final String icon;
  final Widget page;

  GuestClass(this.title, this.icon, {required this.page, this.mb, this.days,});
}


class UssdResponse {
  UssdResponse({
     this.status,
     this.message,
     this.code,
     this.data,
  });

  String? status;
  String? message;
  int? code;
  UssdResponseData? data;

  factory UssdResponse.fromJson(Map<String, dynamic> json) => UssdResponse(
    status: json["status"],
    message: json["message"],
    code: json["code"],
    data: UssdResponseData.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "code": code,
    "data": data!.toJson(),
  };
}

class UssdResponseData {
  UssdResponseData({
     this.referenceNumber,
     this.statusCode,
     this.statusMessage,
     this.requestAmount,
     this.totalPaymentAmount,
     this.currency,
     this.paymentMethods,
     this.expiryDateTimeUtc,
     this.isPayerPagaAccountHolder,
  });

  String? referenceNumber;
  String? statusCode;
  String? statusMessage;
  int? requestAmount;
  double? totalPaymentAmount;
  String? currency;
  List<PaymentMethod>? paymentMethods;
  DateTime? expiryDateTimeUtc;
  bool? isPayerPagaAccountHolder;

  factory UssdResponseData.fromJson(Map<String, dynamic> json) => UssdResponseData(
    referenceNumber: json["referenceNumber"],
    statusCode: json["statusCode"],
    statusMessage: json["statusMessage"],
    requestAmount: json["requestAmount"],
    totalPaymentAmount: json["totalPaymentAmount"]?.toDouble(),
    currency: json["currency"],
    paymentMethods: List<PaymentMethod>.from(json["paymentMethods"].map((x) => PaymentMethod.fromJson(x))),
    expiryDateTimeUtc: DateTime.parse(json["expiryDateTimeUTC"]),
    isPayerPagaAccountHolder: json["isPayerPagaAccountHolder"],
  );

  Map<String, dynamic> toJson() => {
    "referenceNumber": referenceNumber,
    "statusCode": statusCode,
    "statusMessage": statusMessage,
    "requestAmount": requestAmount,
    "totalPaymentAmount": totalPaymentAmount,
    "currency": currency,
    "paymentMethods": List<dynamic>.from(paymentMethods!.map((x) => x.toJson())),
    "expiryDateTimeUTC": expiryDateTimeUtc!.toIso8601String(),
    "isPayerPagaAccountHolder": isPayerPagaAccountHolder,
  };
}

class PaymentMethod {
  PaymentMethod({
     this.name,
     this.properties,
  });

  String? name;
  Properties? properties;

  factory PaymentMethod.fromJson(Map<String, dynamic> json) => PaymentMethod(
    name: json["name"],
    properties: Properties.fromJson(json["properties"]),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "properties": properties!.toJson(),
  };
}

class Properties {
  Properties({
     this.ussdShortCode,
     this.paymentReference,
  });

  String? ussdShortCode;
  String? paymentReference;

  factory Properties.fromJson(Map<String, dynamic> json) => Properties(
    ussdShortCode: json["USSDShortCode"],
    paymentReference: json["PaymentReference"],
  );

  Map<String, dynamic> toJson() => {
    "USSDShortCode": ussdShortCode,
    "PaymentReference": paymentReference,
  };
}


