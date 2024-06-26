import 'package:pouchers/ui/features/requests/domain/dto/request_dto.dart';
import 'package:pouchers/ui/features/requests/domain/model/request_model.dart';
import 'package:pouchers/ui/features/requests/domain/model/requested_money_model.dart';
import 'package:dio/dio.dart';

import '../../../../../app/core/network/api_path.dart';
import '../../../../../app/core/network/network_service.dart';
import 'request_source.dart';

class RequestSourceImpl implements RequestSource {
  final NetworkService networkService;

  RequestSourceImpl({required this.networkService});

  @override
  Future<List<RequestModel>> requests(RequestDto requestDto,
      {CancelToken? cancelToken}) async {
    final response = await networkService.request(
        path: ApiPath.request,
        requestType: RequestType.get,
        queryParams: requestDto.toQuery(),
        cancelToken: cancelToken);
    return (response.data?['data']?['requests'] as List<dynamic>)
        .map((e) => RequestModel.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  @override
  Future<RequestedMoneyModel> requestedMoney(RequestDto requestDto,
      {CancelToken? cancelToken}) async {
    final response = await networkService.request(
        path: ApiPath.requestedMoney,
        requestType: RequestType.patch,
        data: requestDto.toJson(),
        cancelToken: cancelToken);

    return RequestedMoneyModel.fromJson(
        response.data?['data'] as Map<String, dynamic>);
  }
}
