import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_exchange_rate.freezed.dart';
part 'get_exchange_rate.g.dart';

@freezed
class GetExchangeRate with _$GetExchangeRate {
  factory GetExchangeRate({String? rate, String? sell, String? buy}) =
      _GetExchangeRate;

  factory GetExchangeRate.fromJson(Map<String, dynamic> json) =>
      _$GetExchangeRateFromJson(json);
}
