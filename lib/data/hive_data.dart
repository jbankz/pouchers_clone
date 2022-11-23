import 'package:hive_flutter/hive_flutter.dart';
import 'package:pouchers/ui/login/models/login_response.dart';
import 'package:pouchers/utils/strings.dart';

Future<void> cacheUserProfile(HiveStoreResponseData userProfile) async {
  await Hive.box(kUserBox).put(kUserInfoKey, userProfile);
}