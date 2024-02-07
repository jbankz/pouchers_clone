import '../enum/request_money_action.dart';
import '../enum/request_type.dart';

class RequestDto {
  final int page;
  final int perPage;
  final RequestType? requestType;
  final String? status;
  final String? requestId;
  final String? transactionPin;
  final double? amount;
  final RequestMoneyAction? requestedMoneyAction;
  final String? reason;

  RequestDto(
      {this.page = 1,
      this.perPage = 25,
      this.requestType,
      this.status,
      this.requestId,
      this.amount,
      this.transactionPin,
      this.requestedMoneyAction,
      this.reason});

  Map<String, dynamic> toQuery() => {
        'page': page,
        'per_page': perPage,
        if (requestType != null) 'type': requestType?.name,
        if (status != null) 'status': status
      };

  Map<String, dynamic> toJson() => {
        if (requestId != null) 'requestId': requestId,
        if (transactionPin != null) 'transactionPin': transactionPin,
        if (amount != null) 'amount': amount,
        if (requestedMoneyAction != null) 'action': requestedMoneyAction?.name,
        if (reason != null) 'reason': reason
      };
}
