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

  set isLoggedIn(bool value) =>
      sharedPreferences.setBool(AppKeys.isLoggedInKey, value);

  bool get isLoggedIn =>
      sharedPreferences.getBool(AppKeys.isLoggedInKey) ?? false;

  set isGuest(bool value) =>
      sharedPreferences.setBool(AppKeys.isGuestKey, value);

  bool get isGuest => sharedPreferences.getBool(AppKeys.isGuestKey) ?? false;

  set toggleBalanceVisibility(bool value) =>
      sharedPreferences.setBool(AppKeys.balanceVisibilityKey, value);

  bool get toggleBalanceVisibility =>
      sharedPreferences.getBool(AppKeys.balanceVisibilityKey) ?? false;

  Future<bool> logOut() async {
    try {
      await sharedPreferences.clear();
      await _securedManager.clearAllSecurities();
      await _hiveManager.clearHiveBox();

      return true;
    } catch (e) {
      _logger.e(e.toString());
      return false;
    }
  }
}
