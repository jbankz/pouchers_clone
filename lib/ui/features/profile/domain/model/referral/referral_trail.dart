import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

import '../../../../../../app/core/constants/db_constants.dart';
import '../../../../../../app/serializer/date_time_serializer.dart';

part 'referral_trail.freezed.dart';
part 'referral_trail.g.dart';

@freezed
@HiveType(typeId: DbConstants.four)
class ReferralTrail with _$ReferralTrail {
  factory ReferralTrail({
    @HiveField(0) int? id,
    @JsonKey(name: 'referred_user_id') @HiveField(1) String? referredUserId,
    @JsonKey(name: 'is_paid') @HiveField(2) bool? isPaid,
    @JsonKey(name: 'referral_amount') @HiveField(3) String? referralAmount,
    @JsonKey(name: 'first_name') @HiveField(4) String? firstName,
    @JsonKey(name: 'last_name') @HiveField(5) String? lastName,
    @JsonKey(name: 'created_at')
    @DateTimeSerializer()
    @HiveField(6)
    DateTime? createdAt,
    @JsonKey(name: 'updated_at')
    @DateTimeSerializer()
    @HiveField(7)
    DateTime? updatedAt,
  }) = _ReferralTrail;

  factory ReferralTrail.fromJson(Map<String, dynamic> json) =>
      _$ReferralTrailFromJson(json);
}
