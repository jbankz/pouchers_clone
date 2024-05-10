import 'package:pouchers/ui/features/onboarding/domain/usecase/module/module.dart';
import 'package:pouchers/ui/features/onboarding/presentation/state/onboarding_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../timer_notifier.dart';

part 'module.g.dart';

@riverpod
List<Widget> sliders(SlidersRef ref) =>
    ref.watch(getSliderUseCaseModule).execute();

final _timerProvider = StateNotifierProvider<TimerNotifier, OnboardingState>(
    (ref) => TimerNotifier(ref));

final sliderModel =
    Provider<TimerNotifier>((ref) => ref.watch(_timerProvider.notifier));
