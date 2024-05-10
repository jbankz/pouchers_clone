import 'package:pouchers/ui/features/dashboard/views/transaction/data/source/transactions_source.dart';
import 'package:pouchers/ui/features/dashboard/views/transaction/data/source/transactions_source_impl.dart';
import 'package:riverpod/riverpod.dart';

import '../../../../../../../../app/core/network/module/network_module.dart';

final transactionsSourceModule = Provider<TransactionsSource>((ref) =>
    TransactionsSourceImpl(networkService: ref.watch(networkServiceProvider)));
