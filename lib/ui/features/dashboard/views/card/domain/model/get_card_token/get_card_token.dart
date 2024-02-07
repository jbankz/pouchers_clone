import 'package:freezed_annotation/freezed_annotation.dart';

import 'data.dart';

part 'get_card_token.freezed.dart';
part 'get_card_token.g.dart';

@freezed
class GetCardToken with _$GetCardToken {
  factory GetCardToken({
    String? status,
    String? message,
    int? code,
    Data? data,
  }) = _GetCardToken;

  factory GetCardToken.fromJson(Map<String, dynamic> json) =>
      _$GetCardTokenFromJson(json);
}
