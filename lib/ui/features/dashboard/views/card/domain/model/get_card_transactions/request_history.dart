import 'package:freezed_annotation/freezed_annotation.dart';

part 'request_history.freezed.dart';
part 'request_history.g.dart';

@freezed
class RequestHistory with _$RequestHistory {
  factory RequestHistory({
    int? amount,
    String? currency,
    bool? approved,
    int? merchantAmount,
    String? merchantCurrency,
    String? reason,
    DateTime? createdAt,
    @JsonKey(name: '_id') String? id,
  }) = _RequestHistory;

  factory RequestHistory.fromJson(Map<String, dynamic> json) =>
      _$RequestHistoryFromJson(json);
}
