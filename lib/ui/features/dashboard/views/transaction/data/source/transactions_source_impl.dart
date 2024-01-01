import 'package:Pouchers/app/core/network/api_path.dart';
import 'package:Pouchers/app/core/network/network_service.dart';
import 'package:Pouchers/ui/features/dashboard/views/transaction/domain/dto/transaction_dto.dart';
import 'package:Pouchers/ui/features/dashboard/views/transaction/domain/model/transaction_history.dart';
import 'package:dio/dio.dart';

import 'transactions_source.dart';

class TransactionsSourceImpl implements TransactionsSource {
  final NetworkService networkService;

  TransactionsSourceImpl({required this.networkService});

  @override
  Future<List<TransactionHistory>> getTransactionsHistory(
      {required TransactionDto transactionDto,
      CancelToken? cancelToken}) async {
    try {
      final response = await networkService.request(
          path: ApiPath.transactionsHistory,
          requestType: RequestType.get,
          queryParams: transactionDto.toJson(),
          cancelToken: cancelToken);

      return (response.data?['data']?['history'] as List<dynamic>)
          .map((data) =>
              TransactionHistory.fromJson(data as Map<String, dynamic>))
          .toList();
    } catch (e) {
      rethrow;
    }
  }
}
