import 'package:Pouchers/ui/features/dashboard/views/transaction/domain/dto/transaction_dto.dart';
import 'package:Pouchers/ui/features/dashboard/views/transaction/domain/model/transaction_history.dart';
import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

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
