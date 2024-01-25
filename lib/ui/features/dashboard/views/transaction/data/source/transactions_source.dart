import 'package:dio/dio.dart';

import '../../domain/dto/transaction_dto.dart';
import '../../domain/model/transaction_analytic.dart';
import '../../domain/model/transaction_history.dart';

abstract class TransactionsSource {
  Future<List<TransactionHistory>> getTransactionsHistory(
      {required TransactionDto transactionDto, CancelToken? cancelToken});
  Future<TransactionAnalytic> getTransactionsAnalytic(
      {required String? month, CancelToken? cancelToken});
}
