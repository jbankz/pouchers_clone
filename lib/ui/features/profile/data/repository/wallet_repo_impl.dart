import 'package:Pouchers/ui/features/profile/data/source/wallet_sorce.dart';
import 'package:Pouchers/ui/features/profile/domain/model/wallet.dart';
import 'package:dio/dio.dart';

import '../../domain/repository/wallet_repo.dart';

class WalletRepoImpl implements WalletRepo {
  final WalletSource _walletSource;

  WalletRepoImpl(this._walletSource);

  @override
  Future<Wallet?> walletBalance({CancelToken? cancelToken}) async =>
      await _walletSource.walletBalance();
}
