import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pouchers/ui/features/dashboard/views/card/domain/enum/currency.dart';

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
    @Default(0) num amount,
    @Default(0) num fee,
    @Default(0) num vat,
    @Default(false) bool approved,
    Currency? currency,
    String? status,
    String? authorizationMethod,
    List<dynamic>? balanceTransactions,
    @Default(0) num merchantAmount,
    String? merchantCurrency,
    Merchant? merchant,
    Terminal? terminal,
    TransactionMetadata? transactionMetadata,
    dynamic pendingRequest,
    List<RequestHistory>? requestHistory,
    Verification? verification,
    @Default(false) bool isDeleted,
    DateTime? createdAt,
    DateTime? updatedAt,
    List<FeeDetail>? feeDetails,
    @JsonKey(name: '__v') int? v,
  }) = _Authorization;

  factory Authorization.fromJson(Map<String, dynamic> json) =>
      _$AuthorizationFromJson(json);
}
