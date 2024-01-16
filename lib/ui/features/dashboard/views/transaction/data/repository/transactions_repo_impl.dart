import 'package:Pouchers/ui/features/dashboard/views/transaction/data/dao/transaction_dao.dart';
import 'package:Pouchers/ui/features/dashboard/views/transaction/data/source/transactions_source.dart';
import 'package:Pouchers/ui/features/dashboard/views/transaction/domain/model/transaction_history.dart';
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
}
