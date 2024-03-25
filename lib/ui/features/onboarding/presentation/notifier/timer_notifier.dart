import 'dart:async';

import 'package:pouchers/ui/features/onboarding/domain/usecase/module/module.dart';
import 'package:pouchers/ui/features/onboarding/presentation/state/onboarding_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TimerNotifier extends StateNotifier<OnboardingState> {
  TimerNotifier(this._ref) : super(OnboardingState.none()) {
    _startTimer();
  }

  final Ref _ref;

  late final getSliders = _ref.read(getSliderUseCaseModule);

  late final Timer _timer;

  final PageController _pageController = PageController();
  PageController get pageController => _pageController;

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      state = OnboardingState.controller(_pageController, (_) {});
      _navigateToNextSlide();
    });
  }

  void _navigateToNextSlide() => _pageController.nextPage(
      duration: const Duration(milliseconds: 500), curve: Curves.easeIn);

  @override
  void dispose() {
    _timer.cancel();
    _pageController.dispose();
    super.dispose();
  }
}
