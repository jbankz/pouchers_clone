import 'package:pouchers/ui/features/dashboard/views/transaction/domain/dto/transaction_dto.dart';
import 'package:pouchers/ui/features/dashboard/views/transaction/domain/model/transaction_history.dart';
import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../domain/model/transaction_analytic.dart';
import '../../../domain/usecase/module/module.dart';

part 'module.g.dart';

@riverpod
Future<List<TransactionHistory>> getTransactionsHistory(
        GetTransactionsHistoryRef ref,
        {required TransactionDto parameter,
        CancelToken? cancelToken}) async =>
    await ref
        .read(getTransactionsHistoryUseCase)
        .execute(parameter: parameter, cancelToken: cancelToken);

@riverpod
Future<TransactionAnalytic> getTransactionsAnalytic(
        GetTransactionsAnalyticRef ref, String month,
        {CancelToken? cancelToken}) async =>
    await ref
        .read(getTransactionsAnalyticUseCase)
        .execute(parameter: month, cancelToken: cancelToken);
