import 'package:Pouchers/ui/features/dashboard/views/card/domain/enum/card_type.dart';
import 'package:flutter/cupertino.dart';

import '../../../../../../../app/app.router.dart';
import '../../../../../../../app/core/router/page_router.dart';
import '../../../../../../common/app_strings.dart';

class ParamNotifier extends ChangeNotifier {
  CardType _cardType = CardType.naira;
  CardType get cardType => _cardType;

  String _country = '';
  String _bvn = '';

  String get country => _country;
  String get bvn => _bvn;

  num? _exchangeRate;
  num? get exchangeRate => _exchangeRate;

  bool get isNairaCardType => _cardType == CardType.naira;

  String get appTitle =>
      isNairaCardType ? AppString.createNairaCard : AppString.createDollarCard;

  void setCardType(CardType cardType) {
    _cardType = cardType;
    notifyListeners();
  }

  void setUsersInformations({required String country, required String bvn}) {
    _country = country;
    _bvn = bvn;
    notifyListeners();

    PageRouter.pushNamed(Routes.cardCalculatorView);
  }

  void setExchangeRate(num rate) {
    _exchangeRate = rate;
    notifyListeners();
  }
}
