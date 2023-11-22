import 'package:freezed_annotation/freezed_annotation.dart';

import 'data.dart';

part 'get_exchange_rate.freezed.dart';
part 'get_exchange_rate.g.dart';

@freezed
class GetExchangeRate with _$GetExchangeRate {
  factory GetExchangeRate({
    String? status,
    String? message,
    int? code,
    Data? data,
  }) = _GetExchangeRate;

  factory GetExchangeRate.fromJson(Map<String, dynamic> json) =>
      _$GetExchangeRateFromJson(json);
}
