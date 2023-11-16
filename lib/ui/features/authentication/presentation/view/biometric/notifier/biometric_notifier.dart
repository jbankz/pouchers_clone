import 'package:Pouchers/app/app.locator.dart';
import 'package:Pouchers/app/app.logger.dart';
import 'package:Pouchers/app/app.router.dart';
import 'package:Pouchers/app/core/manager/biometric_manager.dart';
import 'package:Pouchers/app/core/manager/session_manager.dart';
import 'package:flutter/material.dart';

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

        // PageRouter.pushReplacement(Routes.dashboardView);
      }
    } catch (e) {
      logger.e(e.toString());
    }
  }
}
