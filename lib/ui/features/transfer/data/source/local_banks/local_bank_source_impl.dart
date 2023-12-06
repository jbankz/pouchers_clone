import 'package:Pouchers/ui/features/transfer/domain/dto/transfer_money_dto.dart';
import 'package:Pouchers/ui/features/transfer/domain/model/local_bank.dart';
import 'package:dio/dio.dart';

import '../../../../../../app/core/network/api_path.dart';
import '../../../../../../app/core/network/network_service.dart';
import 'local_bank_source.dart';

class LocalBankSourceImpl implements LocalBankSource {
  final NetworkService networkService;

  LocalBankSourceImpl({required this.networkService});

  @override
  Future<List<LocalBank>> localBanks({CancelToken? cancelToken}) async {
    final response = await networkService.request(
        path: ApiPath.localBanks,
        requestType: RequestType.get,
        cancelToken: cancelToken);
    return (response.data?['data']?['data'] as List<dynamic>)
        .map((data) => LocalBank.fromJson(data as Map<String, dynamic>))
        .toList();
  }

  @override
  Future<bool> transferToLocalBank(TransferMoneyDto transferMoneyDto,
      {CancelToken? cancelToken}) async {
    final response = await networkService.request(
        path: ApiPath.localBankTransfer,
        requestType: RequestType.post,
        data: transferMoneyDto.toJson(),
        cancelToken: cancelToken);
    return response.statusCode == 200;
  }
}
