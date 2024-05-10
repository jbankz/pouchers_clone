import 'package:freezed_annotation/freezed_annotation.dart';

import '../../enum/currency.dart';
import 'account.dart';
import 'authorization.dart';
import 'card.dart';
import 'customer.dart';
import 'fee_detail.dart';
import 'merchant.dart';
import 'terminal.dart';
import 'transaction_metadata.dart';

part 'transaction.freezed.dart';
part 'transaction.g.dart';

@freezed
class Transaction with _$Transaction {
  factory Transaction({
    @JsonKey(name: '_id') String? id,
    String? business,
    Customer? customer,
    Account? account,
    Card? card,
    Authorization? authorization,
    @Default(0) int amount,
    @Default(0) int fee,
    @Default(0) int vat,
    Currency? currency,
    String? type,
    List<dynamic>? balanceTransactions,
    @Default(0) num merchantAmount,
    String? merchantCurrency,
    Merchant? merchant,
    Terminal? terminal,
    TransactionMetadata? transactionMetadata,
    @Default(false) bool isDeleted,
    DateTime? createdAt,
    DateTime? updatedAt,
    List<FeeDetail>? feeDetails,
    @JsonKey(name: '__v') int? v,
  }) = _Transaction;

  factory Transaction.fromJson(Map<String, dynamic> json) =>
      _$TransactionFromJson(json);
}
