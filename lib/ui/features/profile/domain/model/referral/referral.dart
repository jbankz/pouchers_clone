import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

import '../../../../../../app/core/constants/db_constants.dart';
import 'earning.dart';
import 'referral_trail.dart';
import 'serializer/earning_serializer.dart';
import 'serializer/referral_trail_serializer.dart';

part 'referral.freezed.dart';
part 'referral.g.dart';

@freezed
@HiveType(typeId: DbConstants.two)
class Referral with _$Referral {
  factory Referral(
      {@Default([]) @EarningSerializer() @HiveField(0) List<Earning>? earning,
      @Default([])
      @ReferralTrailSerializer()
      @HiveField(1)
      List<ReferralTrail>? referralTrail}) = _Referral;

  factory Referral.fromJson(Map<String, dynamic> json) =>
      _$ReferralFromJson(json);
}
