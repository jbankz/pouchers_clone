import 'package:freezed_annotation/freezed_annotation.dart';

part 'card.freezed.dart';
part 'card.g.dart';

@freezed
class Card with _$Card {
  factory Card({
    @JsonKey(name: '_id') String? id,
    String? business,
    String? customer,
    String? account,
    String? fundingSource,
    String? type,
    String? brand,
    String? currency,
    String? maskedPan,
    String? expiryMonth,
    String? expiryYear,
    String? status,
    @JsonKey(name: 'is2FAEnrolled') bool? is2FaEnrolled,
    @JsonKey(name: 'isDefaultPINChanged') bool? isDefaultPinChanged,
    bool? isDeleted,
    DateTime? createdAt,
    DateTime? updatedAt,
    @JsonKey(name: '__v') int? v,
  }) = _Card;

  factory Card.fromJson(Map<String, dynamic> json) => _$CardFromJson(json);
}
