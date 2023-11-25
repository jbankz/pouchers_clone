import 'package:Pouchers/ui/features/dashboard/views/card/domain/enum/card_brand.dart';
import 'package:Pouchers/ui/features/dashboard/views/card/domain/enum/currency.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'data.freezed.dart';
part 'data.g.dart';

@freezed
class Data with _$Data {
  factory Data(
      {@JsonKey(name: 'user_id') String? userId,
      @JsonKey(name: 'sudo_id') String? sudoId,
      @JsonKey(name: 'account_type') String? accountType,
      @JsonKey(name: 'account_number') String? accountNumber,
      @JsonKey(name: 'account_name') String? accountName,
      @Default(CardBrand.Verve) CardBrand? brand,
      @Default(Currency.NGN) Currency? currency}) = _Data;

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}
