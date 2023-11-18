import 'package:Pouchers/ui/features/tiers/domain/model/tiers/data.dart';
import 'package:Pouchers/ui/features/tiers/presentation/notifier/module/module.dart';
import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../app/app.logger.dart';
import '../../../../../app/core/state/app_state.dart';

part 'tier_notifier.g.dart';

@riverpod
class TierNotifier extends _$TierNotifier {
  final _logger = getLogger('TierNotifier');

  Data? _data;

  @override
  AppState build() => const AppState();

  Future<void> fetchTier({CancelToken? cancelToken}) async {
    try {
      state = state.copyWith(isBusy: true);

      _data =
          await ref.read(tierProvider.call(cancelToken: cancelToken).future);
    } catch (e) {
      _logger.e(e.toString());
    }
    state = state.copyWith(isBusy: false, data: _data);
  }
}
