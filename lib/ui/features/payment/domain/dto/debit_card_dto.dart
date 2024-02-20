class DebitCardDto {
  final String? cardNumber;
  final String? expiry;
  final String? cvv;
  final String? bank;
  final String? reference;

  DebitCardDto(
      {this.cardNumber, this.expiry, this.cvv, this.bank, this.reference});
}
