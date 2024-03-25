import 'package:pouchers/ui/features/profile/domain/dto/wallet_dto.dart';
import 'package:pouchers/ui/features/profile/domain/model/bank_account_details/bank_account_details.dart';
import 'package:pouchers/ui/features/profile/domain/model/wallet.dart';
import 'package:dio/dio.dart';

import '../../domain/repository/wallet_repo.dart';
import '../dao/wallet_dao.dart';
import '../source/wallet/wallet_source.dart';

class WalletRepoImpl implements WalletRepo {
  final WalletSource _walletSource;

  WalletRepoImpl(this._walletSource);

  @override
  Future<Wallet?> walletBalance({CancelToken? cancelToken}) async {
    final wallet = await _walletSource.walletBalance();
    await walletDao.save(wallet);
    return wallet;
  }

  @override
  Future<BankAccountDetails?> bankAccountDetails(WalletDto walletDto,
          {CancelToken? cancelToken}) async =>
      await _walletSource.bankAccountDetails(walletDto,
          cancelToken: cancelToken);
}
