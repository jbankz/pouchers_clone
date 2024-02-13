// Define a provider for the timer service
import 'package:riverpod/riverpod.dart';

import '../timer_service.dart';

final timerProvider = Provider((ref) => TimerService());

final timerStreamProvider = StreamProvider.autoDispose<int>((ref) {
  final timerService = ref.watch(timerProvider);
  return timerService.timerStream;
});
