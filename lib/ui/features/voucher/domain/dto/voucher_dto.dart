import '../enum/voucher_status.dart';

class VoucherDto {
  final num? amount;
  final String? transactionPin;
  final String? code;
  final String? email;
  final String? tag;
  final int page;
  final int perPage;
  final VoucherStatus? status;

  VoucherDto(
      {this.amount,
      this.transactionPin,
      this.code,
      this.email,
      this.tag,
      this.status,
      this.page = 1,
      this.perPage = 25});

  Map<String, dynamic> toJson() {
    final result = <String, dynamic>{};
    if (amount != null) result.addAll({'amount': amount});
    if (transactionPin != null) {
      result.addAll({'transactionPin': transactionPin});
    }
    if (code != null) result.addAll({'code': code});
    if (email != null) result.addAll({'email': email});
    if (tag != null) result.addAll({'tag': tag});
    if (status != null) result.addAll({'status': status?.value});

    return result;
  }
}
