import 'package:freezed_annotation/freezed_annotation.dart';

import 'data.dart';

part 'freeze_card.freezed.dart';
part 'freeze_card.g.dart';

@freezed
class FreezeCard with _$FreezeCard {
  factory FreezeCard({
    String? status,
    String? message,
    int? code,
    Data? data,
  }) = _FreezeCard;

  factory FreezeCard.fromJson(Map<String, dynamic> json) =>
      _$FreezeCardFromJson(json);
}
