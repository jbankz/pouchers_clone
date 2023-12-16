class SummaryDto {
  final String? imageUrl;
  final String? title;
  final String? recipient;
  final num? amount;
  final num? fee;
  final num? cashBack;

  SummaryDto(
      {this.imageUrl,
      this.title,
      this.recipient,
      this.amount,
      this.fee,
      this.cashBack});
}
