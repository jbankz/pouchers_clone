import 'package:freezed_annotation/freezed_annotation.dart';

part 'merchant.freezed.dart';
part 'merchant.g.dart';

@freezed
class Merchant with _$Merchant {
  factory Merchant({
    String? category,
    String? name,
    String? merchantId,
    String? city,
    String? state,
    String? country,
    String? postalCode,
    @JsonKey(name: '_id') String? id,
  }) = _Merchant;

  factory Merchant.fromJson(Map<String, dynamic> json) =>
      _$MerchantFromJson(json);
}
