class WalletDto {
  final String? accountNumber;
  final String? amount;
  final String? bankName;

  WalletDto({this.accountNumber, this.amount, this.bankName});

  Map<String, dynamic> toJson() => {
        if (accountNumber != null) 'account_number': accountNumber,
        if (amount != null) 'amount': amount,
        if (bankName != null) 'bank_name': bankName
      };
}
