import 'package:dio/dio.dart';

import '../../../../../app/core/network/api_path.dart';
import '../../../../../app/core/network/network_service.dart';

import '../../domain/model/wallet.dart';
import 'wallet_sorce.dart';

class WalletSourceImpl implements WalletSource {
  final NetworkService networkService;

  WalletSourceImpl({required this.networkService});
  @override
  Future<Wallet?> walletBalance({CancelToken? cancelToken}) async {
    final response = await networkService.request(
        path: ApiPath.wallet,
        requestType: RequestType.get,
        cancelToken: cancelToken);
    return Wallet.fromJson(response.data['data'] as Map<String, dynamic>);
  }
}
