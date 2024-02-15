import 'package:Pouchers/ui/features/transfer/domain/dto/transfer_money_dto.dart';
import 'package:Pouchers/ui/features/transfer/domain/model/local_bank.dart';
import 'package:Pouchers/ui/features/transfer/domain/usecase/module/module.dart';
import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../utilities/domain/dto/mobile_dto.dart';
import '../../../../utilities/domain/model/schedule.dart';
import '../../../domain/model/guest_local_bank.dart';
import '../../../domain/model/transfer.dart';

part 'module.g.dart';

@riverpod
Future<List<GuestLocalBank>> guestLocalBanks(GuestLocalBanksRef ref,
        {CancelToken? cancelToken}) async =>
    await ref.read(getGuestLocalBanksUseCaseModule).execute(cancelToken);

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

@riverpod
Future<Transfer> p2pTransfer(
        P2pTransferRef ref, TransferMoneyDto transferMoneyDto,
        {CancelToken? cancelToken}) async =>
    await ref
        .read(p2pTransferCaseModule)
        .execute(parameter: transferMoneyDto, cancelToken: cancelToken);

@riverpod
Future<Schedule> scheduleP2pTransfer(
        ScheduleP2pTransferRef ref, MobileDto mobileDto,
        {CancelToken? cancelToken}) async =>
    await ref
        .read(scheduleP2pTransferUseCaseModule)
        .execute(parameter: mobileDto, cancelToken: cancelToken);

@riverpod
Future<bool> requestMoney(
        RequestMoneyRef ref, TransferMoneyDto transferMoneyDto,
        {CancelToken? cancelToken}) async =>
    await ref
        .read(requestMoneyUseCaseModule)
        .execute(parameter: transferMoneyDto, cancelToken: cancelToken);
