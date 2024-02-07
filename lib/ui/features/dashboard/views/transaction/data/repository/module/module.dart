import 'package:Pouchers/ui/features/dashboard/views/transaction/data/repository/transactions_repo_impl.dart';
import 'package:Pouchers/ui/features/dashboard/views/transaction/data/source/module/module.dart';
import 'package:Pouchers/ui/features/dashboard/views/transaction/domain/repository/transactions_repo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final transactionRepoModule = Provider<TransactionsRepo>(
    (ref) => TransactionsRepoImpl(ref.read(transactionsSourceModule)));
