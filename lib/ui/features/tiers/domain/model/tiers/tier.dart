import 'package:freezed_annotation/freezed_annotation.dart';

part 'tier.freezed.dart';
part 'tier.g.dart';

@freezed
class Tier with _$Tier {
  factory Tier({String? dailyTxLimit, String? maxBalance}) = _Tier;

  factory Tier.fromJson(Map<String, dynamic> json) => _$TierFromJson(json);
}
