import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pouchers/app/helpers/network_helpers.dart';
import 'package:pouchers/app/helpers/notifiers.dart';
import 'package:pouchers/modules/transactions/model/transaction_model.dart';
import 'package:pouchers/modules/transactions/service/transaction_service.dart';

final transactionRepoProvider = Provider.autoDispose<TransactionRepository>(
    (ref) => TransactionRepository(ref));

class TransactionRepository {
  final ProviderRef ref;

  TransactionRepository(this.ref);

  Future<NotifierState<GetTransactionsResponse>> getTransactionHistory(
      {required String status}) async {
    final accessToken = await getAccessToken();

    return (await TransactionService.getTransactionHistory(
      token: accessToken!,
      status: status,
    ))
        .toNotifierState();
  }

  Future<NotifierState<TransactionAnalyticsResponse>> getTransactionAnalytics({
    required String month,
    required String year,
  }) async {
    final accessToken = await getAccessToken();

    return (await TransactionService.getTransactionAnalytics(
            token: accessToken!, month: month, year: year))
        .toNotifierState();
  }
}
