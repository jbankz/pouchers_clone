import 'package:Pouchers/ui/features/transfer/data/source/local_banks/module/module.dart';
import 'package:Pouchers/ui/features/transfer/data/source/transfer/module/module.dart';
import 'package:Pouchers/ui/features/transfer/domain/repository/local_bank_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/repository/transfer_repository.dart';
import '../local_bank_repo_impl.dart';
import '../transfer_repo_impl.dart';

final localBankRepoModule = Provider<LocalBankRepository>(
    (ref) => LocalBankRepoImpl(ref.read(localBankSourceModule)));

final transferRepoModule = Provider<TransferRepository>(
    (ref) => TransferRepoImpl(ref.read(transferSourceModule)));
