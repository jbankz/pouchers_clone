import 'package:freezed_annotation/freezed_annotation.dart';

part 'verification.freezed.dart';
part 'verification.g.dart';

@freezed
class Verification with _$Verification {
  factory Verification({
    String? billingAddressLine1,
    String? billingAddressPostalCode,
    String? cvv,
    String? expiry,
    String? pin,
    String? threeDSecure,
    String? safeToken,
    String? authentication,
    @JsonKey(name: '_id') String? id,
  }) = _Verification;

  factory Verification.fromJson(Map<String, dynamic> json) =>
      _$VerificationFromJson(json);
}
