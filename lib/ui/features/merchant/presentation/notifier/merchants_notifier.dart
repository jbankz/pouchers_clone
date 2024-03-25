import 'package:pouchers/ui/features/merchant/domain/model/get_merchants.dart';
import 'package:pouchers/ui/features/merchant/presentation/notifier/module/module.dart';
import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../app/app.logger.dart';
import '../state/merchant_state.dart';

part 'merchants_notifier.g.dart';

@riverpod
class MerchantsNotifier extends _$MerchantsNotifier {
  final _logger = getLogger('MerchantsNotifier');

  GetMerchant? _getMerchant;

  @override
  MerchantState build() => const MerchantState();

  Future<void> getMerchants([CancelToken? cancelToken]) async {
    try {
      state = state.copyWith(isBusy: true);
      _getMerchant = await ref
          .read(getMerchantsProvider.call(cancelToken: cancelToken).future);
    } catch (e) {
      _logger.e(e);
    } finally {
      state = state.copyWith(isBusy: false, getMerchant: _getMerchant);
    }
  }
}
