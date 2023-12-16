import 'package:freezed_annotation/freezed_annotation.dart';

part 'airtime_top_deals.freezed.dart';
part 'airtime_top_deals.g.dart';

@freezed
class AirtimeTopDeals with _$AirtimeTopDeals {
  factory AirtimeTopDeals({@Default(0) num cashBack, @Default(0) num amount}) =
      _AirtimeTopDeals;

  factory AirtimeTopDeals.fromJson(Map<String, dynamic> json) =>
      _$AirtimeTopDealsFromJson(json);
}
