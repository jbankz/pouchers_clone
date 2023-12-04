import 'package:Pouchers/app/app.locator.dart';
import 'package:Pouchers/app/helpers/network_helpers.dart';
import 'package:Pouchers/app/helpers/notifiers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../core/manager/session_manager.dart';

final refreshRepoProvider =
    Provider.autoDispose<RefreshRepo>((ref) => RefreshRepo(ref));

class RefreshRepo {
  final ProviderRef ref;

  RefreshRepo(this.ref);

  final session = locator<SessionManager>();

  Future<NotifierState<String>> refreshTokenRepo() async =>
      (await refreshToken(refreshToken: session.accessToken)).toNotifierState();
}
