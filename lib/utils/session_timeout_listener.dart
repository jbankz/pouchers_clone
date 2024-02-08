import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class SessionTimeOutListener extends StatefulWidget {
  final Widget child;
  final Duration duration;
  final VoidCallback onTimeOut;

  const SessionTimeOutListener(
      {required this.child,
      required this.onTimeOut,
      this.duration = const Duration(minutes: 2),
      super.key});

  @override
  State<SessionTimeOutListener> createState() => _SessionTimeOutListenerState();
}

class _SessionTimeOutListenerState extends State<SessionTimeOutListener> {
  Timer? _timer;

  void _startTimer() {
    _cancelTimer();

    _timer = Timer(widget.duration, widget.onTimeOut);
  }

  void _cancelTimer() {
    if (_timer != null) {
      _timer?.cancel();
      _timer = null;
    }
  }

  @override
  void initState() {
    super.initState();
    if (kReleaseMode) _startTimer();
  }

  @override
  void dispose() {
    _cancelTimer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Listener(
      behavior: HitTestBehavior.translucent,
      onPointerDown: (event) => _startTimer(),
      child: widget.child);
}
