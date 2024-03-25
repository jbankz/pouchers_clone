import 'package:pouchers/ui/features/profile/domain/model/wallet.dart';
import 'package:pouchers/ui/features/profile/domain/repository/wallet_repo.dart';
import 'package:dio/dio.dart';

import '../../../../../app/core/usecase/poucher_usecase.dart';

class WalletUseCaseImpl implements PoucherUseCaseWithOutParam<Future<Wallet?>> {
  final WalletRepo _walletRepo;

  WalletUseCaseImpl(this._walletRepo);

  @override
  Future<Wallet?> execute([CancelToken? cancelToken]) async =>
      _walletRepo.walletBalance(cancelToken: cancelToken);
}
