import 'dart:async';

import 'package:Pouchers/app/app.router.dart';
import 'package:Pouchers/app/core/router/page_router.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class SessionTimeOutListener extends StatefulWidget {
  const SessionTimeOutListener({required this.child, super.key});

  final Widget child;

  @override
  State<SessionTimeOutListener> createState() => _SessionTimeOutListenerState();
}

class _SessionTimeOutListenerState extends State<SessionTimeOutListener> {
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    if (kReleaseMode) _startTimer();
  }

  @override
  void dispose() {
    super.dispose();
    _disposeTimer();
  }

  void _startTimer() {
    _disposeTimer();

    _timer = Timer(const Duration(minutes: 5),
        () => PageRouter.pushReplacement(Routes.signInView));
  }

  void _disposeTimer() {
    if (_timer != null) {
      _timer?.cancel();
      _timer = null;
    }
  }

  @override
  Widget build(BuildContext context) => Listener(
        behavior: HitTestBehavior.translucent,
        child: widget.child,
      );
}
