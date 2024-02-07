import 'package:Pouchers/app/core/network/network_service.dart';
import 'package:Pouchers/ui/features/utilities/domain/dto/mobile_dto.dart';
import 'package:Pouchers/ui/features/utilities/domain/model/schedule.dart';
import 'package:dio/dio.dart';

import '../../../../../../app/core/network/api_path.dart';
import '../../../domain/dto/transfer_money_dto.dart';
import '../../../domain/model/transfer.dart';
import 'transfer_source.dart';

class TransferSourceImpl implements TransferSource {
  final NetworkService _networkService;

  TransferSourceImpl({required NetworkService networkService})
      : _networkService = networkService;

  @override
  Future<Transfer> p2pTransfer(TransferMoneyDto transferMoneyDto,
      {CancelToken? cancelToken}) async {
    final response = await _networkService.request(
        path: ApiPath.transferP2P,
        requestType: RequestType.post,
        data: transferMoneyDto.toJson(),
        cancelToken: cancelToken);
    return Transfer.fromJson(response.data['data'] as Map<String, dynamic>);
  }

  @override
  Future<Schedule> schedule(MobileDto mobileDto,
      {CancelToken? cancelToken}) async {
    final response = await _networkService.request(
        path: ApiPath.scheduleP2P,
        requestType: RequestType.post,
        data: mobileDto.toJson(),
        cancelToken: cancelToken);
    return Schedule.fromJson(response.data['data'] as Map<String, dynamic>);
  }

  @override
  Future<bool> requestMoney(TransferMoneyDto transferMoneyDto,
      {CancelToken? cancelToken}) async {
    final response = await _networkService.request(
        path: ApiPath.requestMoney,
        requestType: RequestType.post,
        data: transferMoneyDto.toJson(),
        cancelToken: cancelToken);
    return response.statusCode == 200;
  }
}
