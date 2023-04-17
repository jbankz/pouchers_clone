import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pouchers/app/common/repo.dart';
import 'package:pouchers/app/helpers/network_helpers.dart';
import 'package:pouchers/app/helpers/notifiers.dart';
import 'package:pouchers/app/navigators/navigators.dart';
import 'package:pouchers/modules/login/screens/login.dart';

final refreshProvider =
    StateNotifierProvider<RefreshNotifier, NotifierState<String>>((ref) {
  return RefreshNotifier(ref.read(refreshRepoProvider));
});

class RefreshNotifier extends StateNotifier<NotifierState<String>> {
  final RefreshRepo _repo;

  RefreshNotifier(this._repo) : super(NotifierState());

  void refresh({Function()? then, }) async {
    state = notifyLoading();
    state = await _repo.refreshTokenRepo();
    if (state.status == NotifierStatus.done) {
      if (then != null) then();
    }else if(state.message == ""){
      // pushToAndClearStack(context, LogInAccount(
      //   sessionTimeOut: true,
      // ));
    }
  }
}

