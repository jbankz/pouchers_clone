import 'package:freezed_annotation/freezed_annotation.dart';

import 'data.dart';

part 'get_cards.freezed.dart';
part 'get_cards.g.dart';

@freezed
class GetCards with _$GetCards {
  factory GetCards({
    String? status,
    String? message,
    int? code,
    Data? data,
  }) = _GetCards;

  factory GetCards.fromJson(Map<String, dynamic> json) =>
      _$GetCardsFromJson(json);
}
