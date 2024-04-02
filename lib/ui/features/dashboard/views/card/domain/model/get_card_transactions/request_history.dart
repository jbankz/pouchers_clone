import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pouchers/ui/features/dashboard/views/card/domain/enum/currency.dart';

part 'request_history.freezed.dart';
part 'request_history.g.dart';

@freezed
class RequestHistory with _$RequestHistory {
  factory RequestHistory({
    @Default(0) num amount,
    Currency? currency,
    @Default(false) bool approved,
    @Default(0) num merchantAmount,
    String? merchantCurrency,
    String? reason,
    DateTime? createdAt,
    @JsonKey(name: '_id') String? id,
  }) = _RequestHistory;

  factory RequestHistory.fromJson(Map<String, dynamic> json) =>
      _$RequestHistoryFromJson(json);
}
