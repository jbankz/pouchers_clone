import 'package:pouchers/app/core/usecase/poucher_usecase.dart';
import 'package:dio/dio.dart';

import '../model/transaction_analytic.dart';
import '../repository/transactions_repo.dart';

class GetTransactionsAnalyticUseCaseImpl
    extends PoucherUseCaseWithRequiredParam<String, TransactionAnalytic> {
  final TransactionsRepo _transactionsRepo;

  GetTransactionsAnalyticUseCaseImpl(this._transactionsRepo);

  @override
  Future<TransactionAnalytic?> execute(
          {required String parameter, CancelToken? cancelToken}) async =>
      await _transactionsRepo.getTransactionsAnalytic(
          month: parameter, cancelToken: cancelToken);
}
