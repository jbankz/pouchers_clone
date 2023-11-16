import 'package:Pouchers/ui/features/profile/domain/model/wallet.dart';
import 'package:dio/dio.dart';

abstract class WalletRepo {
  Future<Wallet?> walletBalance({CancelToken? cancelToken});
}
