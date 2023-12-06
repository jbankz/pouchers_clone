import 'package:Pouchers/ui/features/transfer/data/repository/module/module.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../../app/core/usecase/poucher_usecase.dart';
import '../local_bank_usecase.dart';
import '../transfer_to_local_bank_usecase.dart';

final getLocalBanksUseCaseModule = Provider<PoucherUseCaseWithOutParam>(
    (ref) => LocalBankUseCaseImpl(ref.read(localBankRepoModule)));

final transferToLocalBankUseCaseModule =
    Provider<PoucherUseCaseWithRequiredParam>(
        (ref) => TransferToLocalBankUseCaseImpl(ref.read(localBankRepoModule)));
