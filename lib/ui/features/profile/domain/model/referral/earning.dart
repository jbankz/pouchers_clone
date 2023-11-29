import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'earning.freezed.dart';
part 'earning.g.dart';

@freezed
class Earning with _$Earning {
  @HiveType(typeId: 3, adapterName: 'EarningAdapter')
  factory Earning({
    @JsonKey(name: 'total_earnings') @HiveField(0) String? totalEarnings,
  }) = _Earning;

  factory Earning.fromJson(Map<String, dynamic> json) =>
      _$EarningFromJson(json);
}
