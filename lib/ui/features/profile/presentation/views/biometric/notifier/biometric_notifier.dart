import 'package:pouchers/app/app.locator.dart';
import 'package:pouchers/app/app.logger.dart';
import 'package:pouchers/app/app.router.dart';
import 'package:pouchers/app/core/manager/biometric_manager.dart';
import 'package:pouchers/ui/features/profile/presentation/views/biometric/dao/biometric_dao.dart';
import 'package:flutter/material.dart';

import '../../../../../../../app/core/manager/secure_manager.dart';
import '../../../../../../../app/core/router/page_router.dart';

class BiometricNotifier extends ChangeNotifier {
  final logger = getLogger('BiometricNotifier');

  final _biometricManager = locator<BiometricManager>();
  final _securedManager = locator<SecuredManager>();

  Future<void> authenticateUser(
      {Function()? callbackAction, Function()? failure}) async {
    try {
      final response = await _biometricManager.authenticateUsingBiometric();
      if (response) {
        biometricDao.login = response;

        if (callbackAction != null) {
          callbackAction();
          return;
        }

        skip();
      } else {
        if (failure != null) failure();
      }
    } catch (e) {
      logger.e(e.toString());
    }
  }

  void skip() => PageRouter.pushReplacement(Routes.dashboardView);

  Future<void> secureTransactionPin(String pin) async =>
      await _securedManager.storePinCred(pin);

  Future<String> retrieveTransactionPin() async =>
      await _securedManager.readPinCred();
}
