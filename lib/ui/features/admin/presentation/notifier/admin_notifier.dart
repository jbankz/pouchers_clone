import 'package:Pouchers/ui/features/admin/presentation/notifier/module/module.dart';
import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../app/app.logger.dart';
import '../../../../../app/core/state/app_state.dart';
import '../../domain/model/banner.dart';
import '../../domain/model/envs/envs.dart';
import '../state/admin_state.dart';

part 'admin_notifier.g.dart';

@riverpod
class AdminNotifier extends _$AdminNotifier {
  final _logger = getLogger('AdminNotifier');

  List<Envs> _env = [];
  List<Banner> _banner = [];

  @override
  AdminState build() => AdminState(data: _env);

  Future<void> getEnvs([CancelToken? cancelToken]) async {
    try {
      state = state.copyWith(isBusy: true);
      _env = await ref.read(envsProvider.call(cancelToken: cancelToken).future);
    } catch (e) {
      _logger.e(e);
    } finally {
      state = state.copyWith(isBusy: false, data: _env);
    }
  }

  Future<void> getBanners([CancelToken? cancelToken]) async {
    try {
      state = state.copyWith(isBusy: true);
      _banner =
          await ref.read(bannersProvider.call(cancelToken: cancelToken).future);
    } catch (e) {
      _logger.e(e);
    } finally {
      state = state.copyWith(isBusy: false, banner: _banner);
    }
  }
}
