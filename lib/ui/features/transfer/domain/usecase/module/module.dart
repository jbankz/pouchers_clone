import 'package:Pouchers/ui/features/transfer/data/repository/module/module.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../../app/core/usecase/poucher_usecase.dart';
import '../local_bank_usecase.dart';
import '../p2p_transfer_usecase.dart';
import '../request_money_usecase.dart';
import '../schedule_p2p_transfer_usecase.dart';
import '../transfer_to_local_bank_usecase.dart';

final getLocalBanksUseCaseModule = Provider<PoucherUseCaseWithOutParam>(
    (ref) => LocalBankUseCaseImpl(ref.read(localBankRepoModule)));

final transferToLocalBankUseCaseModule =
    Provider<PoucherUseCaseWithRequiredParam>(
        (ref) => TransferToLocalBankUseCaseImpl(ref.read(localBankRepoModule)));

final p2pTransferCaseModule = Provider<PoucherUseCaseWithRequiredParam>(
    (ref) => P2PTransferUseCaseImpl(ref.read(transferRepoModule)));

final scheduleP2pTransferUseCaseModule =
    Provider<PoucherUseCaseWithRequiredParam>(
        (ref) => ScheduleP2PTransferUseCaseImpl(ref.read(transferRepoModule)));

final requestMoneyUseCaseModule = Provider<PoucherUseCaseWithRequiredParam>(
    (ref) => RequestMoneyUseCaseImpl(ref.read(transferRepoModule)));
