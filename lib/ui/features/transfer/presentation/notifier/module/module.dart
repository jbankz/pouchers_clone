import 'package:Pouchers/ui/features/transfer/domain/dto/transfer_money_dto.dart';
import 'package:Pouchers/ui/features/transfer/domain/model/local_bank.dart';
import 'package:Pouchers/ui/features/transfer/domain/usecase/module/module.dart';
import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'module.g.dart';

@riverpod
Future<List<LocalBank>> localBanks(LocalBanksRef ref,
        {CancelToken? cancelToken}) async =>
    await ref.read(getLocalBanksUseCaseModule).execute(cancelToken);

@riverpod
Future<bool> transferToLocalBank(
        TransferToLocalBankRef ref, TransferMoneyDto transferMoneyDto,
        {CancelToken? cancelToken}) async =>
    await ref
        .read(transferToLocalBankUseCaseModule)
        .execute(parameter: transferMoneyDto, cancelToken: cancelToken);
