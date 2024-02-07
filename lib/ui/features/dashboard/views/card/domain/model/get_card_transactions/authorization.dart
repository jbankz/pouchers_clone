import 'package:freezed_annotation/freezed_annotation.dart';

import 'fee_detail.dart';
import 'merchant.dart';
import 'request_history.dart';
import 'terminal.dart';
import 'transaction_metadata.dart';
import 'verification.dart';

part 'authorization.freezed.dart';
part 'authorization.g.dart';

@freezed
class Authorization with _$Authorization {
  factory Authorization({
    @JsonKey(name: '_id') String? id,
    String? business,
    String? customer,
    String? account,
    String? card,
    int? amount,
    int? fee,
    int? vat,
    bool? approved,
    String? currency,
    String? status,
    String? authorizationMethod,
    List<dynamic>? balanceTransactions,
    int? merchantAmount,
    String? merchantCurrency,
    Merchant? merchant,
    Terminal? terminal,
    TransactionMetadata? transactionMetadata,
    dynamic pendingRequest,
    List<RequestHistory>? requestHistory,
    Verification? verification,
    bool? isDeleted,
    DateTime? createdAt,
    DateTime? updatedAt,
    List<FeeDetail>? feeDetails,
    @JsonKey(name: '__v') int? v,
  }) = _Authorization;

  factory Authorization.fromJson(Map<String, dynamic> json) =>
      _$AuthorizationFromJson(json);
}
