import 'package:pouchers/ui/features/profile/presentation/notifier/module/module.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../app/core/state/app_state.dart';

part 'valid_id_notifier.g.dart';

@riverpod
class ValidIdNotifier extends _$ValidIdNotifier {
  @override
  AppState build() => AppState(data: ref.watch(validIdsProvider));
}
