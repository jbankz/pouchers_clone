import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

import 'earning.dart';
import 'referral_trail.dart';
import 'serializer/earning_serializer.dart';
import 'serializer/referral_trail_serializer.dart';

part 'referral.freezed.dart';
part 'referral.g.dart';

@freezed
class Referral with _$Referral {
  @HiveType(typeId: 2, adapterName: 'ReferralAdapter')
  factory Referral(
      {@Default([]) @EarningSerializer() @HiveField(0) List<Earning>? earning,
      @Default([])
      @ReferralTrailSerializer()
      @HiveField(1)
      List<ReferralTrail>? referralTrail}) = _Referral;

  factory Referral.fromJson(Map<String, dynamic> json) =>
      _$ReferralFromJson(json);
}
