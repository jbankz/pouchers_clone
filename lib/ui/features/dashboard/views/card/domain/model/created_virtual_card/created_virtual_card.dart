import 'package:freezed_annotation/freezed_annotation.dart';

import 'data.dart';

part 'created_virtual_card.freezed.dart';
part 'created_virtual_card.g.dart';

@freezed
class CreatedVirtualCard with _$CreatedVirtualCard {
  factory CreatedVirtualCard({
    String? status,
    String? message,
    int? code,
    Data? data,
  }) = _CreatedVirtualCard;

  factory CreatedVirtualCard.fromJson(Map<String, dynamic> json) =>
      _$CreatedVirtualCardFromJson(json);
}
