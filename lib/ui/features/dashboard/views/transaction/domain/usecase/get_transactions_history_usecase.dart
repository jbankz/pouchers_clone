import 'package:pouchers/app/core/usecase/poucher_usecase.dart';
import 'package:pouchers/ui/features/dashboard/views/transaction/domain/dto/transaction_dto.dart';
import 'package:pouchers/ui/features/dashboard/views/transaction/domain/model/transaction_history.dart';
import 'package:dio/dio.dart';

import '../repository/transactions_repo.dart';

class GetTransactionsHistoryUseCaseImpl extends PoucherUseCaseWithRequiredParam<
    TransactionDto, List<TransactionHistory>> {
  final TransactionsRepo _transactionsRepo;

  GetTransactionsHistoryUseCaseImpl(this._transactionsRepo);

  @override
  Future<List<TransactionHistory>?> execute(
          {required TransactionDto parameter,
          CancelToken? cancelToken}) async =>
      await _transactionsRepo.getTransactionsHistory(
          transactionDto: parameter, cancelToken: cancelToken);
}
