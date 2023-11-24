import 'package:Pouchers/ui/features/dashboard/views/card/domain/enum/card_type.dart';
import 'package:flutter/cupertino.dart';

import '../../../../../../../app/app.router.dart';
import '../../../../../../../app/core/router/page_router.dart';

class ParamNotifier extends ChangeNotifier {
  CardType _cardType = CardType.naira;
  CardType get cardType => _cardType;

  String _country = '';
  String _bvn = '';

  String get country => _country;
  String get bvn => _bvn;

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
}
