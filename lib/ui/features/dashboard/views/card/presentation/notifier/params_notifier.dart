import 'package:Pouchers/ui/features/dashboard/views/card/domain/enum/card_type.dart';
import 'package:Pouchers/ui/features/dashboard/views/card/domain/enum/currency.dart';
import 'package:Pouchers/ui/features/dashboard/views/card/domain/model/get_card/data.dart';
import 'package:flutter/cupertino.dart';

import '../../../../../../../app/app.router.dart';
import '../../../../../../../app/core/router/page_router.dart';
import '../../../../../../common/app_strings.dart';
import '../../domain/enum/card_activity_type.dart';

class ParamNotifier extends ChangeNotifier {
  CardType _cardType = CardType.naira;

  CardType get cardType => _cardType;

  String _country = '';
  String _bvn = '';

  String get country => _country;
  String get bvn => _bvn;

  String _customerEmail = '';
  String _customerName = '';

  String get customerEmail => _customerEmail;
  String get customerName => _customerName;

  CardActivityType _cardActivityType = CardActivityType.creating;
  CardActivityType get cardActivityType => _cardActivityType;

  num? _exchangeRate;
  num? get exchangeRate => _exchangeRate;

  bool get isCreatingCardActivity =>
      _cardActivityType == CardActivityType.creating;

  bool get isNairaCardType =>
      (_cardDetail?.currency == Currency.NGN || _cardType == CardType.naira);

  Data? _cardDetail;
  Data? get cardDetail => _cardDetail;

  String get appTitle => _cardActivityType == CardActivityType.creating
      ? (isNairaCardType
          ? AppString.createNairaCard
          : AppString.createDollarCard)
      : (isNairaCardType ? AppString.fundNairaCard : AppString.fundDollarCard);

  String get cardDetailsTitle => isNairaCardType
      ? AppString.virtualNairaCard
      : AppString.virtualDollarCard;

  bool _userJustWantsToChangeTherePassword = false;
  bool get userJustWantsToChangeTherePassword =>
      _userJustWantsToChangeTherePassword;

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

  void setCardDetails(Data card) {
    _cardDetail = card;
    notifyListeners();
  }

  void setCardActivityType(CardActivityType cardActivityType) {
    _cardActivityType = cardActivityType;
    notifyListeners();
  }

  void setChangePassword(bool value) {
    _userJustWantsToChangeTherePassword = value;
    notifyListeners();
  }

  void setGuestInformations({required String email, required String name}) {
    _customerEmail = email;
    _customerName = name;
    notifyListeners();
  }
}
