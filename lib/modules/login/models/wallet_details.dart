import 'package:hive_flutter/hive_flutter.dart';
part 'wallet_details.g.dart';

@HiveType(typeId: 1)
class WalletDetails {
  WalletDetails({
    this.balance,
    this.walletType,
    this.accountName,
    this.accountNumber,
    this.bankProvider,
  });
  @HiveField(0)
  String? balance;
  @HiveField(1)
  String? walletType;
  @HiveField(2)
  String? accountName;
  @HiveField(3)
  String? accountNumber;
  @HiveField(4)
  String? bankProvider;

  factory WalletDetails.fromJson(Map<String, dynamic> json) => WalletDetails(
    balance: json["balance"],
    walletType: json["wallet_type"],
    accountName: json["account_name"],
    accountNumber: json["account_number"],
    bankProvider: json["bank_provider"],
  );

  Map<String, dynamic> toJson() => {
    "balance": balance,
    "wallet_type": walletType,
    "account_name": accountName,
    "account_number": accountNumber,
    "bank_provider": bankProvider,
  };
}
