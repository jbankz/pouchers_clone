import 'package:Pouchers/app/app.locator.dart';
import 'package:Pouchers/app/app.logger.dart';
import 'package:Pouchers/ui/common/app_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'hive_manager.dart';
import 'secure_manager.dart';

class SessionManager {
  final _logger = getLogger('SessionManager');

  final SecuredManager _securedManager = locator<SecuredManager>();
  final HiveManager _hiveManager = locator<HiveManager>();

  SessionManager._internal();

  late SharedPreferences sharedPreferences;

  static final SessionManager _instance = SessionManager._internal();

  factory SessionManager() => _instance;

  static SessionManager get instance => _instance;

  Future<void> initializeSession() async =>
      sharedPreferences = await SharedPreferences.getInstance();

  set accessToken(String value) =>
      sharedPreferences.setString(AppKeys.usersTokenKey, value);

  String get accessToken =>
      sharedPreferences.getString(AppKeys.usersTokenKey) ?? '';

  set isBiometricEnabled(bool value) =>
      sharedPreferences.setBool(AppKeys.isBiometricEnabledKey, value);

  bool get isBiometricEnabled =>
      sharedPreferences.getBool(AppKeys.isBiometricEnabledKey) ?? false;

  set isLoggedIn(bool value) =>
      sharedPreferences.setBool(AppKeys.isLoggedInKey, value);

  bool get isLoggedIn =>
      sharedPreferences.getBool(AppKeys.isLoggedInKey) ?? false;

  Future<bool> logOut() async {
    try {
      await Future.wait([
        sharedPreferences.clear(),
        _securedManager.clearAllSecurities(),
        _hiveManager.clearAllBox(),
        locator.reset(),
        setupLocator()
      ]);

      return true;
    } catch (e) {
      _logger.e(e.toString());
      return false;
    }
  }
}
