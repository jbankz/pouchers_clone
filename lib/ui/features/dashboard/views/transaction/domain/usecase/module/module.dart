import 'package:Pouchers/ui/features/dashboard/views/transaction/data/repository/module/module.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../../../../app/core/usecase/poucher_usecase.dart';
import '../get_transactions_analytics_usecase.dart';
import '../get_transactions_history_usecase.dart';

final getTransactionsHistoryUseCase = Provider<PoucherUseCaseWithRequiredParam>(
    (ref) =>
        GetTransactionsHistoryUseCaseImpl(ref.read(transactionRepoModule)));

final getTransactionsAnalyticUseCase =
    Provider<PoucherUseCaseWithRequiredParam>((ref) =>
        GetTransactionsAnalyticUseCaseImpl(ref.read(transactionRepoModule)));
