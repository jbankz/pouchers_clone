import 'package:pouchers/app/helpers/notifiers.dart';
import 'package:pouchers/app/helpers/response_handler.dart';
import 'package:pouchers/modules/transactions/model/transaction_model.dart';
import 'package:pouchers/modules/transactions/repository/transaction_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final getTransactionHistoryProvider = StateNotifierProvider<
    TransactionHistoryNotifier, NotifierState<GetTransactionsResponse>>((ref) {
  return TransactionHistoryNotifier(ref.read(transactionRepoProvider));
});

final getTransactionAnalyticsProvider = StateNotifierProvider.autoDispose<
    TransactionAnalyticsNotifier,
    NotifierState<TransactionAnalyticsResponse>>((ref) {
  return TransactionAnalyticsNotifier(ref.read(transactionRepoProvider));
});

class TransactionHistoryNotifier
    extends StateNotifier<NotifierState<GetTransactionsResponse>>
    {
  final TransactionRepository _repo;

  TransactionHistoryNotifier(this._repo) : super(NotifierState());

  void getTransactionHistory({required String status, Function()? then}) async {
    state = notifyLoading();
    state = await _repo.getTransactionHistory(status: status);
    if (state.status == NotifierStatus.done) {
      if (then != null) then();
    }
  }
}

class TransactionAnalyticsNotifier
    extends StateNotifier<NotifierState<TransactionAnalyticsResponse>>
    {
  final TransactionRepository _repo;

  TransactionAnalyticsNotifier(this._repo) : super(NotifierState());

  void getTransactionAnalytics(
      {required String month, required String year, Function()? then}) async {
    state = notifyLoading();
    state = await _repo.getTransactionAnalytics(month: month, year: year);
    if (state.status == NotifierStatus.done) {
      if (then != null) then();
    }
  }
}


