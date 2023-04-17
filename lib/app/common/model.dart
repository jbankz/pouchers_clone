import 'dart:convert';

import 'package:equatable/equatable.dart';

class UserCredentials extends Equatable {
  final String? password;
  final String? transactionPin;
  final String? email;


  const UserCredentials({this.password, this.transactionPin, this.email});

  UserCredentials copyWith({
    String? password,
    String? transactionPin,
    String? email,
  }) =>
      UserCredentials(
        password: password ?? this.password,
        transactionPin: transactionPin ?? this.password,
        email: email ?? this.email
      );

  factory UserCredentials.fromJson(Map<String, dynamic> json) => UserCredentials(
      password: json["password"],
      transactionPin: json["transaction_pin"],
    email: json["email"]
  );

  Map<String, dynamic> toJson() => {
    "password": password,
    "transaction_pin": transactionPin,
    "email": email
  };

  String serialize() => jsonEncode(toJson());

  // Map<String, dynamic> deserialize(String str) => jsonDecode(str);
  // UserCredentials deserialize(String str) => UserCredentials.fromJson(jsonDecode(str));
  factory UserCredentials.deserialize(String str) => UserCredentials.fromJson(jsonDecode(str));


  @override
  List<Object?> get props => [password, transactionPin];

}
