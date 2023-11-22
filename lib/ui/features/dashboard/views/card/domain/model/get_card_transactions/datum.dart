import 'package:freezed_annotation/freezed_annotation.dart';

import 'account.dart';
import 'authorization.dart';
import 'card.dart';
import 'customer.dart';
import 'fee_detail.dart';
import 'merchant.dart';
import 'terminal.dart';
import 'transaction_metadata.dart';

part 'datum.freezed.dart';
part 'datum.g.dart';

@freezed
class Datum with _$Datum {
  factory Datum({
    @JsonKey(name: '_id') String? id,
    String? business,
    Customer? customer,
    Account? account,
    Card? card,
    Authorization? authorization,
    int? amount,
    int? fee,
    int? vat,
    String? currency,
    String? type,
    List<dynamic>? balanceTransactions,
    int? merchantAmount,
    String? merchantCurrency,
    Merchant? merchant,
    Terminal? terminal,
    TransactionMetadata? transactionMetadata,
    bool? isDeleted,
    DateTime? createdAt,
    DateTime? updatedAt,
    List<FeeDetail>? feeDetails,
    @JsonKey(name: '__v') int? v,
  }) = _Datum;

  factory Datum.fromJson(Map<String, dynamic> json) => _$DatumFromJson(json);
}
