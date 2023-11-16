import 'package:freezed_annotation/freezed_annotation.dart';

part 'data.freezed.dart';
part 'data.g.dart';

@freezed
class Data with _$Data {
  factory Data({
    @JsonKey(name: 'user_id') String? userId,
    @JsonKey(name: 'first_name') String? firstName,
    @JsonKey(name: 'last_name') String? lastName,
    String? email,
    @JsonKey(name: 'phone_number') String? phoneNumber,
    @JsonKey(name: 'referral_code') String? referralCode,
    String? status,
    @JsonKey(name: 'verification_token') String? verificationToken,
    @JsonKey(name: 'verification_token_expires')
    DateTime? verificationTokenExpires,
    String? tag,
  }) = _Data;

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}
