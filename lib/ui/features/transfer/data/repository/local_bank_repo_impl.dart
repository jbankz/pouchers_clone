import 'package:pouchers/ui/features/transfer/data/dao/local_bank_dao.dart';
import 'package:pouchers/ui/features/transfer/data/source/local_banks/local_bank_source.dart';
import 'package:pouchers/ui/features/transfer/domain/dto/transfer_money_dto.dart';
import 'package:pouchers/ui/features/transfer/domain/model/guest_local_bank.dart';
import 'package:pouchers/ui/features/transfer/domain/model/local_bank.dart';
import 'package:pouchers/ui/features/transfer/domain/repository/local_bank_repository.dart';
import 'package:dio/dio.dart';

class LocalBankRepoImpl implements LocalBankRepository {
  final LocalBankSource _localBankSource;

  LocalBankRepoImpl(this._localBankSource);

  @override
  Future<List<LocalBank>> localBanks({CancelToken? cancelToken}) async {
    final banks = await _localBankSource.localBanks(cancelToken: cancelToken);
    await localBankDao.save(banks);
    return banks;
  }

  @override
  Future<bool> transferToLocalBank(TransferMoneyDto transferMoneyDto,
          {CancelToken? cancelToken}) async =>
      await _localBankSource.transferToLocalBank(transferMoneyDto,
          cancelToken: cancelToken);

  @override
  Future<List<GuestLocalBank>> guestLocalBanks(
          {CancelToken? cancelToken}) async =>
      await _localBankSource.guestLocalBanks(cancelToken: cancelToken);
}
