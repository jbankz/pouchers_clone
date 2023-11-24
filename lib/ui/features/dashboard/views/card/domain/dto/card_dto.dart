import 'package:Pouchers/utils/extension.dart';

import '../enum/card_brand.dart';
import '../enum/currency.dart';

class CardDto {
  num? amount;
  String? country;
  String? bvn;
  String? transactionPin;
  Currency? currency;
  String? userId;
  CardBrand? brand;

  CardDto({
    this.userId,
    this.amount = 0,
    this.country,
    this.bvn,
    this.currency,
    this.brand,
    this.transactionPin,
  });

  Map<String, dynamic> toJson() => {
        if (amount != null) 'amount': amount,
        if (country != null) 'country': country,
        if (bvn != null) 'bvn': bvn,
        if (currency != null) 'currency': currency?.name.toUpperCase(),
        if (transactionPin != null) 'transactionPin': transactionPin,
        if (brand != null) 'brand': brand?.name.titleCase
      };
}
