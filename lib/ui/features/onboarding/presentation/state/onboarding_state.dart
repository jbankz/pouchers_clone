import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'onboarding_state.freezed.dart';

@freezed
class OnboardingState with _$OnboardingState {
  factory OnboardingState.none() = _Idle;
  factory OnboardingState.controller(
      PageController pageController, Function(int)? onPageChanged) = _Loaded;
}
