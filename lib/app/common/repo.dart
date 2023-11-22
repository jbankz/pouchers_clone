import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:Pouchers/app/helpers/network_helpers.dart';
import 'package:Pouchers/app/helpers/notifiers.dart';
import 'package:Pouchers/modules/login/models/login_response.dart';
import 'package:Pouchers/utils/strings.dart';

import '../../ui/features/profile/data/dao/user_dao.dart';

final refreshRepoProvider =
    Provider.autoDispose<RefreshRepo>((ref) => RefreshRepo(ref));

class RefreshRepo {
  final ProviderRef ref;

  RefreshRepo(this.ref);

  Future<NotifierState<String>> refreshTokenRepo() async {
    // HiveStoreResponseData userProfile = Hive.box(kUserBox).get(kUserInfoKey);
    final userProfile = userDao.returnUser(userDao.box);
    return (await refreshToken(
      refreshToken: userProfile.token!,
    ))
        .toNotifierState();
  }
}
