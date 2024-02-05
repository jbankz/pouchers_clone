import 'package:Pouchers/utils/extension.dart';

import '../enum/card_brand.dart';
import '../enum/card_status.dart';
import '../enum/currency.dart';

class CardDto {
  num? amount;
  String? country;
  String? bvn;
  String? transactionPin;
  Currency? currency;
  String? userId;
  String? cardId;
  CardBrand? brand;
  CardStatus? status;

  CardDto(
      {this.userId,
      this.cardId,
      this.amount,
      this.country,
      this.bvn,
      this.currency,
      this.brand,
      this.transactionPin,
      this.status});

  Map<String, dynamic> toJson() => {
        if (amount != null) 'amount': amount,
        if (country != null) 'country': country,
        if (bvn != null) 'bvn': bvn,
        if (currency != null) 'currency': currency?.name.toUpperCase(),
        if (transactionPin != null) 'transactionPin': transactionPin,
        if (brand != null) 'brand': brand?.name.titleCase,
        if (status != null) 'status': status?.name
      };
}
