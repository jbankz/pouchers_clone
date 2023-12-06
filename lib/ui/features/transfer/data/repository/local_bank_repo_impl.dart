import 'package:Pouchers/ui/features/transfer/data/dao/local_bank_dao.dart';
import 'package:Pouchers/ui/features/transfer/data/source/local_banks/local_bank_source.dart';
import 'package:Pouchers/ui/features/transfer/domain/dto/transfer_money_dto.dart';
import 'package:Pouchers/ui/features/transfer/domain/model/local_bank.dart';
import 'package:Pouchers/ui/features/transfer/domain/repository/local_bank_repository.dart';
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
}
