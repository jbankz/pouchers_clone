import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pouchers/app/helpers/network_helpers.dart';
import 'package:pouchers/app/helpers/notifiers.dart';
import 'package:pouchers/modules/login/models/login_response.dart';
import 'package:pouchers/utils/strings.dart';

final refreshRepoProvider =
    Provider.autoDispose<RefreshRepo>((ref) => RefreshRepo(ref));

class RefreshRepo {
  final ProviderRef ref;

  RefreshRepo(this.ref);

  Future<NotifierState<String>> refreshTokenRepo() async {
    HiveStoreResponseData userProfile = Hive.box(kUserBox).get(kUserInfoKey);

    return (await refreshToken(
      refreshToken: userProfile.token!,
    ))
        .toNotifierState();
  }
}
