import 'dart:async';

import 'package:Pouchers/app/helpers/response_handler.dart';
import 'package:flutter/foundation.dart';

import '../../config/app_logger.dart';

class TimerService with ResponseHandler {
  final StreamController<int> _timerController = StreamController<int>();
  Timer? _timer;
  int _secondsElapsed = 0;

  Stream<int> get timerStream => _timerController.stream;

  TimerService();

  void startTimer() {
    if (kDebugMode) return;

    _timer = Timer.periodic(const Duration(seconds: 1), _onTimerTick);
  }

  void stopTimer({VoidCallback? callback}) {
    if (_timer?.isActive ?? false) {
      _timer?.cancel();
      _timer = null;
      _secondsElapsed = 0;

      if (callback != null) callback();
    }
  }

  void reStartTimer() => stopTimer(callback: startTimer);

  void _onTimerTick(Timer timer) {
    _secondsElapsed++;
    _timerController.add(_secondsElapsed);
    if (_secondsElapsed == 120) {
      stopTimer();
      handleExpiredToken();
    }
  }

  void dispose() {
    _timer?.cancel();
    _timerController.close();
  }
}
