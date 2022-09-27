
import 'package:shared_preferences/shared_preferences.dart';

class SessionManager {
  static late SharedPreferences prefs;

  static Future initSharedPreference() async {
    prefs = await SharedPreferences.getInstance();
  }

  ///User setters
  static String userId = "user_id";

  /// Sessions
  static String sessionToken = "session_token";

  /// SETTERS
  static void setUserId(String value) {
    SessionManager.prefs.setString(userId, value);
  }

  /// GETTERS
  static String? getUserId() {
    return SessionManager.prefs.getString(userId);
  }

  static void clear() {
    SessionManager.prefs.remove(sessionToken);
  }
}
