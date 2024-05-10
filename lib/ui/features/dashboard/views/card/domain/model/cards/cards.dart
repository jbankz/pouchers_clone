import 'package:pouchers/app/core/constants/db_constants.dart';
import 'package:pouchers/ui/features/dashboard/views/card/domain/enum/card_brand.dart';
import 'package:pouchers/ui/features/dashboard/views/card/domain/enum/currency.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'cards.freezed.dart';
part 'cards.g.dart';

@freezed
@HiveType(typeId: DbConstants.twentySeven)
class Cards with _$Cards {
  factory Cards(
      {@HiveField(0) @JsonKey(name: 'user_id') String? userId,
      @HiveField(1) @JsonKey(name: 'account_id') String? accountId,
      @HiveField(2) @JsonKey(name: 'account_type') String? accountType,
      @HiveField(3) @JsonKey(name: 'account_number') String? accountNumber,
      @HiveField(4) @JsonKey(name: 'account_name') String? accountName,
      @HiveField(5) @Default(CardBrand.verve) CardBrand? brand,
      @HiveField(6) @Default(Currency.ngn) Currency? currency,
      @HiveField(7) String? last4,
      @HiveField(8) @JsonKey(name: 'expiry_month') String? expiryMonth,
      @HiveField(9) @JsonKey(name: 'expiry_year') String? expiryYear,
      @HiveField(10) @JsonKey(name: 'card_status') String? cardStatus,
      @HiveField(11) @JsonKey(name: 'card_id') String? cardId}) = _Cards;

  factory Cards.fromJson(Map<String, dynamic> json) => _$CardsFromJson(json);
}
