import 'package:freezed_annotation/freezed_annotation.dart';

part 'generate_2fa_token.freezed.dart';
part 'generate_2fa_token.g.dart';

@freezed
class Generate2faToken with _$Generate2faToken {
  factory Generate2faToken(
      {@JsonKey(name: 'two_factor_temp_secret') String? twoFactorTempSecret,
      String? qrCodeUrl}) = _Generate2faToken;

  factory Generate2faToken.fromJson(Map<String, dynamic> json) =>
      _$Generate2faTokenFromJson(json);
}
