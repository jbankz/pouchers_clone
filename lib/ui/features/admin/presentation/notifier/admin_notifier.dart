import 'dart:ffi';

import 'package:Pouchers/ui/features/admin/presentation/notifier/module/module.dart';
import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../app/app.logger.dart';
import '../../../../../app/core/state/app_state.dart';
import '../../domain/model/envs/envs.dart';

part 'admin_notifier.g.dart';

@riverpod
class AdminNotifier extends _$AdminNotifier {
  final _logger = getLogger('AdminNotifier');

  List<Envs> _env = [];

  @override
  AppState build() => AppState(data: _env);

  Future<void> getEnvs([CancelToken? cancelToken]) async {
    try {
      state = state.copyWith(isBusy: true);
      _env = await ref.read(envsProvider.call(cancelToken: cancelToken).future);
    } catch (e) {
      _logger.e(e);
    }
    state = state.copyWith(isBusy: false, data: _env);
  }
}
