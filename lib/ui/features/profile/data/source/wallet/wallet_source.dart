import 'package:dio/dio.dart';

import '../../../domain/model/wallet.dart';

abstract class WalletSource {
  Future<Wallet?> walletBalance({CancelToken? cancelToken});
}
