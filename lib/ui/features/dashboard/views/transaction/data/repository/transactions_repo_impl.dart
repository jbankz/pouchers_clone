import 'package:pouchers/ui/features/dashboard/views/transaction/data/dao/transaction_analytics_dao.dart';
import 'package:pouchers/ui/features/dashboard/views/transaction/data/dao/transaction_dao.dart';
import 'package:pouchers/ui/features/dashboard/views/transaction/data/source/transactions_source.dart';
import 'package:pouchers/ui/features/dashboard/views/transaction/domain/model/transaction_analytic.dart';
import 'package:pouchers/ui/features/dashboard/views/transaction/domain/model/transaction_history.dart';
import 'package:dio/dio.dart';

import '../../domain/dto/transaction_dto.dart';
import '../../domain/repository/transactions_repo.dart';

class TransactionsRepoImpl implements TransactionsRepo {
  final TransactionsSource _transactionsSource;

  TransactionsRepoImpl(this._transactionsSource);

  @override
  Future<List<TransactionHistory>> getTransactionsHistory(
      {required TransactionDto transactionDto,
      CancelToken? cancelToken}) async {
    final transactions = await _transactionsSource.getTransactionsHistory(
        transactionDto: transactionDto, cancelToken: cancelToken);

    if (transactionDto.category == null) {
      transactionHistoryDao.save(transactions, clear: transactionDto.page == 1);
    }
    return transactions;
  }

  @override
  Future<TransactionAnalytic> getTransactionsAnalytic(
      {required String? month, CancelToken? cancelToken}) async {
    final response = await _transactionsSource.getTransactionsAnalytic(
        month: month, cancelToken: cancelToken);

    final chunked = response.copyWith(
        chunkedTransactions: _chunk(response.analyticsSummary));

    transactionAnalyticsDao.save(chunked);
    return chunked;
  }

  List<List<T>> _chunk<T>(List<T> list, {int chunkSize = 5}) {
    final List<List<T>> chunks = [];
    for (int i = 0; i < list.length; i += chunkSize) {
      chunks.add(list.sublist(
          i, i + chunkSize > list.length ? list.length : i + chunkSize));
    }
    return chunks;
  }
}
