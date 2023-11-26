import 'package:freezed_annotation/freezed_annotation.dart';

import '../../enum/card_status.dart';

part 'virtual_card_details.freezed.dart';
part 'virtual_card_details.g.dart';

@freezed
class VirtualCardDetails with _$VirtualCardDetails {
  factory VirtualCardDetails(
      {@JsonKey(name: '_id') String? id,
      String? type,
      String? brand,
      String? number,
      String? expiryMonth,
      String? expiryYear,
      String? cvv,
      String? cvv2,
      String? defaultPin,
      @Default(CardStatus.active) CardStatus? status}) = _VirtualCardDetails;

  factory VirtualCardDetails.fromJson(Map<String, dynamic> json) =>
      _$VirtualCardDetailsFromJson(json);
}
