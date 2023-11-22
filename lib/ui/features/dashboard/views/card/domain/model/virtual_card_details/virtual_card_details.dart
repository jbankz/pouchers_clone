import 'package:freezed_annotation/freezed_annotation.dart';

import 'data.dart';

part 'virtual_card_details.freezed.dart';
part 'virtual_card_details.g.dart';

@freezed
class VirtualCardDetails with _$VirtualCardDetails {
  factory VirtualCardDetails({
    String? status,
    String? message,
    int? code,
    Data? data,
  }) = _VirtualCardDetails;

  factory VirtualCardDetails.fromJson(Map<String, dynamic> json) =>
      _$VirtualCardDetailsFromJson(json);
}
