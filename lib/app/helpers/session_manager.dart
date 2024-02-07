import 'package:shared_preferences/shared_preferences.dart';

class SessionManager {
  static late SharedPreferences prefs;

  static Future initSharedPreference() async {
    prefs = await SharedPreferences.getInstance();
  }

  static Future reloadSharedPreference() async {
    prefs = await SharedPreferences.getInstance();
    await prefs.reload();
  }

  ///User setters
  static String userId = "user_id";
  static String walletBalance = "walletBalance";
  static String fetchEnv = "fetchEnv";

  /// Sessions
  static String sessionToken = "session_token";
  static String accessToken = "accessToken";
  static String refreshAccessToken = "refreshAccessToken";
  static String fingerPrint = "fingerPrint";
  static String inactivityTime = "inactiveTime";
  static String failedBio = "failedAttempts";

  /// SETTERS
  static void setUserId(String value) {
    SessionManager.prefs.setString(userId, value);
  }

  static void setInactiveTime(DateTime time) {
    SessionManager.prefs.setString(inactivityTime, time.toIso8601String());
  }

  static void setFailedAttempt(int failedAttempt) async {
    await SessionManager.prefs.setInt(failedBio, failedAttempt);
  }

  static DateTime? getInactiveTime() {
    String? _time = SessionManager.prefs.getString(inactivityTime);
    if (_time != null) return DateTime.parse(_time);
    return null;
  }

  static void deleteInactiveTime() {
    SessionManager.prefs.remove(inactivityTime);
  }

  static void setWalletBalance(String value) {
    SessionManager.prefs.setString(walletBalance, value);
  }

  static void setAccessToken(String value) {
    SessionManager.prefs.setString(accessToken, value);
    // reloadSharedPreference();
  }

  static void setRefreshAccessToken(String value) {
    SessionManager.prefs.setString(refreshAccessToken, value);
    // reloadSharedPreference();
  }

  //62eaf
  static void setFingerPrint(bool value) {
    SessionManager.prefs.setBool(fingerPrint, value);
  }

  /// GETTERS
  static String? getUserId() {
    return SessionManager.prefs.getString(userId);
  }

  static String? getWalletBalance() {
    return SessionManager.prefs.getString(walletBalance);
  }

  static String? getAccessToken() {
    return SessionManager.prefs.getString(accessToken);
  }

  static String? getRefreshAccessToken() {
    return SessionManager.prefs.getString(refreshAccessToken);
  }

  static bool? getFingerPrint() {
    return SessionManager.prefs.getBool(fingerPrint);
  }

  static int? getFailedAttempt() {
    return SessionManager.prefs.getInt(failedBio) ?? 0;
  }

  static void clear() {
    SessionManager.prefs.remove(sessionToken);
  }
}
