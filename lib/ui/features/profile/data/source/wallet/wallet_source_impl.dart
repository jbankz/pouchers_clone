import 'package:Pouchers/ui/features/profile/domain/dto/wallet_dto.dart';
import 'package:Pouchers/ui/features/profile/domain/model/bank_account_details/bank_account_details.dart';
import 'package:dio/dio.dart';

import '../../../../../../app/core/network/api_path.dart';
import '../../../../../../app/core/network/network_service.dart';
import '../../../domain/model/wallet.dart';
import 'wallet_source.dart';

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

  @override
  Future<BankAccountDetails?> bankAccountDetails(WalletDto walletDto,
      {CancelToken? cancelToken}) async {
    final response = await networkService.request(
        path: ApiPath.accountDetails,
        requestType: RequestType.get,
        queryParams: walletDto.toJson(),
        cancelToken: cancelToken);

    return BankAccountDetails.fromJson(
        response.data['data'] as Map<String, dynamic>);
  }
}
