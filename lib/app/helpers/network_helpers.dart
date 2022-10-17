import 'package:hive/hive.dart';
import 'package:pouchers/utils/strings.dart';

Future<void> persistAccessToken({required String accessToken, required DateTime tokenExpiry}) async {
  try {
    await Hive.box(kTokenBox).put(kAccessTokenKey, accessToken);
    await Hive.box(kTokenBox).put(kAccessTokenExpiryKey, tokenExpiry);

  } catch (e) {
    throw  "An error occurred.";
  }
}

Future<void> persistRefreshToken(String refreshToken) async {
  try {
    await Hive.box(kTokenBox).put(kRefreshTokenKey, refreshToken);

  } catch (e) {
    throw "An error occurred.";
  }
}

Future<String?> getAccessToken() async {
var expiredToken =   await Hive.box(kTokenBox).get(kAccessTokenExpiryKey);

  if (Hive.box(kTokenBox).get("session_start") != null && DateTime.now()
      .isAfter(Hive.box(kTokenBox).get("session_start").add(Duration(hours: expiredToken.hour, minutes: expiredToken.minute)))) {

    try {
      // await AuthRepositoryImpl().refreshToken();
      String? token = Hive.box(kTokenBox).get(kAccessTokenKey);

      if (token != null) {
        return Future.value(token);
      } else {
        throw "Token error occurred.";
      }
    } catch (e, s) {
      print(e);
      print(s);
      throw "Something went wrong.";

    }
  } else {
    String? token = Hive.box(kTokenBox).get(kAccessTokenKey);

    if (token != null) {
      return Future.value(token);
    } else {
      throw "An error occurred.";
    }
  }
}
