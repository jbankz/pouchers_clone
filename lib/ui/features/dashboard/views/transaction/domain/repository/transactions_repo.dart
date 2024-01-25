import 'package:dio/dio.dart';

import '../dto/transaction_dto.dart';
import '../model/transaction_analytic.dart';
import '../model/transaction_history.dart';

abstract class TransactionsRepo {
  Future<List<TransactionHistory>> getTransactionsHistory(
      {required TransactionDto transactionDto, CancelToken? cancelToken});
  Future<TransactionAnalytic> getTransactionsAnalytic(
      {required String? month, CancelToken? cancelToken});
}
