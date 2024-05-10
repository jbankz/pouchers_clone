import 'package:pouchers/ui/features/admin/presentation/notifier/module/module.dart';
import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../app/app.logger.dart';
import '../../domain/dto/admin_dto.dart';
import '../../domain/model/banner.dart';
import '../state/admin_state.dart';

part 'admin_notifier.g.dart';

@riverpod
class AdminNotifier extends _$AdminNotifier {
  final _logger = getLogger('AdminNotifier');

  List<Banner> _banner = [];

  @override
  AdminState build() => const AdminState();

  Future<void> getEnvs({AdminDto? parameter, CancelToken? cancelToken}) async {
    try {
      state = state.copyWith(isBusy: true);
      await ref.read(envsProvider
          .call(parameter: parameter, cancelToken: cancelToken)
          .future);
    } catch (e) {
      _logger.e(e);
    } finally {
      state = state.copyWith(isBusy: false);
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
