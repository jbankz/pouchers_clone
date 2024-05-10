import 'package:pouchers/ui/common/app_strings.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/error_codes.dart' as auth_error;
import 'package:local_auth/local_auth.dart';
import 'package:local_auth_android/local_auth_android.dart';
import 'package:local_auth_ios/local_auth_ios.dart';

import '../../config/app_logger.dart';

class BiometricManager {
  final LocalAuthentication _localAuthentication = LocalAuthentication();

  final logger = getLogger('BiometricManager');

  Future<bool> isBiometricEnabled() async =>
      await _localAuthentication.canCheckBiometrics;

  Future<bool> authenticateUsingBiometric() async {
    bool didAuthenticate = false;
    try {
      didAuthenticate = await _localAuthentication.authenticate(
          localizedReason: AppString.localizedReason,
          authMessages: <AuthMessages>[
            AndroidAuthMessages(
                signInTitle: AppString.signInTitle,
                cancelButton: AppString.cancelButton),
            IOSAuthMessages(cancelButton: AppString.cancelButton)
          ]);
    } on PlatformException catch (e) {
      if (e.code == auth_error.notEnrolled) {
        // Add handling of no hardware here.
      } else if (e.code == auth_error.lockedOut ||
          e.code == auth_error.permanentlyLockedOut) {
      } else {}
    }
    return didAuthenticate;
  }
}
