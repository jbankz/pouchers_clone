import 'package:pouchers/app/core/manager/session_manager.dart';
import 'package:pouchers/ui/features/guest/state/guest_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../app/app.locator.dart';
import '../../../../app/app.router.dart';
import '../../../../app/core/router/page_router.dart';

part 'guest_notifier.g.dart';

@riverpod
class GuestNotifier extends _$GuestNotifier {
  final _session = locator<SessionManager>();

  @override
  GuestState build() => const GuestState();

  void setGuessStatus() {
    _session.isGuest = true;
    PageRouter.pushNamed(Routes.guestView);
  }

  void resetGuest() => _session.isGuest = false;

  void setRouteDestination(String route) =>
      PageRouter.pushNamed(Routes.getGuestEmailView,
          args: GetGuestEmailViewArguments(route: route));

  void setGuestInformation(
      {required String route,
      required String fullName,
      required String email}) {
    state = state.copyWith(fullName: fullName, email: email);

    PageRouter.pushNamed(route);
  }
}
