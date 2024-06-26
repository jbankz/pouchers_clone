import 'package:freezed_annotation/freezed_annotation.dart';

import 'transaction.dart';

part 'get_card_transactions.freezed.dart';
part 'get_card_transactions.g.dart';

@freezed
class GetCardTransactions with _$GetCardTransactions {
  factory GetCardTransactions({
    String? status,
    String? message,
    int? code,
    List<Transaction>? data,
  }) = _GetCardTransactions;

  factory GetCardTransactions.fromJson(Map<String, dynamic> json) =>
      _$GetCardTransactionsFromJson(json);
}
