import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

import '../../../../../../app/core/constants/db_constants.dart';

part 'earning.freezed.dart';
part 'earning.g.dart';

@freezed
@HiveType(typeId: DbConstants.three)
class Earning with _$Earning {
  factory Earning({
    @JsonKey(name: 'total_earnings') @HiveField(0) String? totalEarnings,
  }) = _Earning;

  factory Earning.fromJson(Map<String, dynamic> json) =>
      _$EarningFromJson(json);
}
