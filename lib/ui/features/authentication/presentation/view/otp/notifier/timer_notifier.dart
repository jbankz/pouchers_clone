import 'dart:async';

import 'package:flutter/material.dart';

class OtpTimerNotifier extends ChangeNotifier {
  int _timerCount = 60;
  int get timerCount => _timerCount;

  bool _isTimerFinished = false;
  bool get isTimerFinished => _isTimerFinished;

  Timer? _timer;

  Future<void> startTimer() async {
    _timer = Timer.periodic(const Duration(seconds: 1), (time) {
      if (_timerCount == 1) {
        _isTimerFinished = true;
        cancelTimer();
      }
      _timerCount -= 1;
      notifyListeners();
    });
  }

  void cancelTimer() => _timer?.cancel();

  void resetTimer() {
    _timerCount = 60;
    _isTimerFinished = false;
    cancelTimer();
    notifyListeners();

    startTimer();
  }
}
