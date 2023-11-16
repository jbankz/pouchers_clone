import 'package:Pouchers/app/app.locator.dart';
import 'package:Pouchers/app/app.logger.dart';
import 'package:Pouchers/app/core/manager/biometric_manager.dart';
import 'package:Pouchers/app/core/manager/session_manager.dart';
import 'package:flutter/material.dart';

import '../../../../../../../app/core/router/page_router.dart';
import '../../../../../../../app/navigators/navigators.dart';
import '../../../../../../../modules/tab_layout/screens/tab_layout.dart';

class BiometricNotifier extends ChangeNotifier {
  final logger = getLogger('BiometricNotifier');

  final _sessionManager = locator<SessionManager>();
  final _biometricManager = locator<BiometricManager>();

  Future<void> authenticateUser({Function()? callbackAction}) async {
    try {
      final response = await _biometricManager.authenticateUsingBiometric();
      if (response) {
        _sessionManager.isBiometricEnabled = response;

        if (callbackAction != null) {
          callbackAction();
          return;
        }

        skip();
      }
    } catch (e) {
      logger.e(e.toString());
    }
  }

  void skip() {
    ///TODO: Don't use 'BuildContext's across async gaps.
    ///Try rewriting the code to not reference the 'BuildContext'.
    pushToAndClearStack(PageRouter.globalContext, TabLayout());
  }
}
