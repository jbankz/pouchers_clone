import 'package:pouchers/ui/features/dashboard/views/transaction/presentation/notifier/module/module.dart';
import 'package:pouchers/ui/features/dashboard/views/transaction/presentation/state/transaction_state.dart';
import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../../../app/app.logger.dart';
import '../../domain/dto/transaction_dto.dart';
import '../../domain/model/transaction_analytic.dart';
import '../../domain/model/transaction_history.dart';

part 'transaction_notifier.g.dart';

@riverpod
class TransactionHistoryNotifier extends _$TransactionHistoryNotifier {
  final _logger = getLogger('TransactionHistoryNotifier');

  @override
  TransactionState build() => TransactionState(
      transaction: TransactionAnalytic(analytic: [], analyticsSummary: []));

  int _page = 1;
  List<TransactionHistory> _history = [];

  TransactionAnalytic? _transaction;

  void increamentPageCount() => _page++;

  void resetPageCount() => _page = 1;

  Future<void> getTransactionsHistory(
      {String? category, CancelToken? cancelToken, bool isBusy = false}) async {
    try {
      state = state.copyWith(isBusy: isBusy);

      final response = await ref.read(getTransactionsHistoryProvider
          .call(
              parameter: TransactionDto(page: _page, category: category),
              cancelToken: cancelToken)
          .future);

      _page > 1 ? _history.addAll(response) : _history = response;
    } catch (e) {
      _logger.e(e);
    } finally {
      state = state.copyWith(isBusy: false, history: _history);
    }
  }

  Future<void> getTransactionsAnalytic(
      {required String month,
      CancelToken? cancelToken,
      bool isBusy = true}) async {
    try {
      state = state.copyWith(isBusy: isBusy);

      _transaction = await ref.read(getTransactionsAnalyticProvider
          .call(month, cancelToken: cancelToken)
          .future);
    } catch (e) {
      _logger.e(e);
    } finally {
      state = state.copyWith(isBusy: false, transaction: _transaction);
    }
  }
}
