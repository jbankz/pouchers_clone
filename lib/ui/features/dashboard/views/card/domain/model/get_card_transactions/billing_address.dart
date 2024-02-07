import 'package:freezed_annotation/freezed_annotation.dart';

part 'billing_address.freezed.dart';
part 'billing_address.g.dart';

@freezed
class BillingAddress with _$BillingAddress {
  factory BillingAddress({
    String? line1,
    String? city,
    String? state,
    String? country,
    String? postalCode,
    @JsonKey(name: '_id') String? id,
  }) = _BillingAddress;

  factory BillingAddress.fromJson(Map<String, dynamic> json) =>
      _$BillingAddressFromJson(json);
}
