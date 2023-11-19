import 'package:Pouchers/ui/features/profile/domain/model/wallet.dart';
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
}
