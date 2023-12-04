import 'package:Pouchers/ui/features/profile/presentation/notifier/module/module.dart';
import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../app/app.logger.dart';
import '../../../../../app/core/state/app_state.dart';
import '../../domain/model/wallet.dart';

part 'wallet_notifier.g.dart';

@riverpod
class WalletNotifier extends _$WalletNotifier {
  final _logger = getLogger('WalletNotifier');

  Wallet? _wallet;

  @override
  AppState build() => const AppState();

  Future<void> getWalletBalance([CancelToken? cancelToken]) async {
    try {
      state = state.copyWith(isBusy: true);

      _wallet = await ref
          .read(walletBalanceProvider.call(cancelToken: cancelToken).future);
    } catch (e) {
      _logger.e(e.toString());
    } finally {
      state = state.copyWith(isBusy: false, data: _wallet);
    }
  }
}
