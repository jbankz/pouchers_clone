import 'package:flutter/widgets.dart';

import '../../../../../../../app/app.router.dart';
import '../../../../../../../app/core/router/page_router.dart';

class PinNotifier extends ChangeNotifier {
  String _pin = '';
  String get pin => _pin;

  void setPinValue(String p1) {
    _pin = p1;
    notifyListeners();
    PageRouter.pushNamed(Routes.confirmPinView);
  }
}
