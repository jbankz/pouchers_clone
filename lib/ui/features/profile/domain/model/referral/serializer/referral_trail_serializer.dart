import 'package:json_annotation/json_annotation.dart';

import '../referral_trail.dart';

class ReferralTrailSerializer
    implements JsonConverter<List<ReferralTrail>?, Object?> {
  const ReferralTrailSerializer();

  @override
  List<ReferralTrail>? fromJson(Object? json) {
    if (json is List<dynamic>) {
      return json
          .map((dynamic e) => ReferralTrail.fromJson(e as Map<String, dynamic>))
          .toList();
    }
    return [];
  }

  @override
  Object? toJson(List<ReferralTrail>? object) =>
      object?.map((ReferralTrail e) => e.toJson()).toList();
}
