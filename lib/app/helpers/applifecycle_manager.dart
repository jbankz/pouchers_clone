import 'package:flutter/material.dart';
import 'package:pouchers/app/helpers/response_handler.dart';
import 'package:pouchers/app/helpers/session_manager.dart';
import 'package:pouchers/utils/logger.dart';

bool disableExpiry = false;
bool isTracking = false;

class AppLifeCycleManager extends StatefulWidget {
  final Widget child;

  const AppLifeCycleManager({Key? key, required this.child}) : super(key: key);

  @override
  State<AppLifeCycleManager> createState() => _AppLifeCycleManagerState();
}

class _AppLifeCycleManagerState extends State<AppLifeCycleManager>
    with WidgetsBindingObserver, ResponseHandler {

  void trackInactiveTime() {
    if (!isTracking) {
      logPrint("Tracking inactive time");
      DateTime loggedTime =
          DateTime.now().toLocal().add(const Duration(minutes: 4));
      SessionManager.setInactiveTime(loggedTime);
      logPrint("Log: $loggedTime");
      isTracking = true;
    }
  }

  void checkResumedTime() {
    DateTime? inactiveTime = SessionManager.getInactiveTime();
    DateTime timeNow = DateTime.now();
    if (inactiveTime != null && timeNow.isAfter(inactiveTime)) {
      restartApplication(context, "Your session is expired");
    }
    SessionManager.deleteInactiveTime();
    isTracking = false;
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    logPrint("AppLifecycleState: $state");
    switch (state) {
      case AppLifecycleState.paused:
      case AppLifecycleState.inactive:
      case AppLifecycleState.detached:
        if (!disableExpiry) {
          trackInactiveTime();
        }
        break;
      case AppLifecycleState.resumed:
        checkResumedTime();
        break;
    }
    super.didChangeAppLifecycleState(state);
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
