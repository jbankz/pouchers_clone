import 'package:pouchers/app/core/network/api_path.dart';
import 'package:pouchers/app/core/network/network_service.dart';
import 'package:pouchers/ui/features/dashboard/views/transaction/domain/dto/transaction_dto.dart';
import 'package:pouchers/ui/features/dashboard/views/transaction/domain/model/transaction_analytic.dart';
import 'package:pouchers/ui/features/dashboard/views/transaction/domain/model/transaction_history.dart';
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

  @override
  Future<TransactionAnalytic> getTransactionsAnalytic(
      {required String? month, CancelToken? cancelToken}) async {
    try {
      final response = await networkService.request(
          path: ApiPath.analytics,
          requestType: RequestType.get,
          queryParams: {"month": month, "year": DateTime.now().year},
          cancelToken: cancelToken);

      return TransactionAnalytic.fromJson(
          response.data?['data'] as Map<String, dynamic>);
    } catch (e) {
      rethrow;
    }
  }
}
