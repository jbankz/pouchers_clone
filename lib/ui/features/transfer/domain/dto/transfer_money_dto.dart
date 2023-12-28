class TransferMoneyDto {
  final String? amount;
  final String? accountNumber;
  final String? bankName;
  final String? transactionPin;
  final String? tag;
  final String? note;

  TransferMoneyDto(
      {this.amount,
      this.accountNumber,
      this.bankName,
      this.transactionPin,
      this.tag,
      this.note});

  Map<String, dynamic> toJson() {
    final result = <String, dynamic>{};

    if (amount != null) {
      result.addAll({'amount': amount});
    }
    if (accountNumber != null) {
      result.addAll({'account_number': accountNumber});
    }
    if (bankName != null) {
      result.addAll({'bank_name': bankName});
    }
    if (transactionPin != null) {
      result.addAll({'transactionPin': transactionPin});
    }
    if (tag != null) {
      result.addAll({'tag': tag!.replaceAll('@', '')});
    }
    if (note != null) {
      result.addAll({'note': note});
    }

    return result;
  }
}
