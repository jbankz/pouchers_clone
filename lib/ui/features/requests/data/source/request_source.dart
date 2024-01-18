import 'package:dio/dio.dart';

import '../../domain/dto/request_dto.dart';
import '../../domain/model/request_model.dart';
import '../../domain/model/requested_money_model.dart';

abstract class RequestSource {
  Future<List<RequestModel>> requests(RequestDto requestDto,
      {CancelToken? cancelToken});
  Future<RequestedMoneyModel> requestedMoney(RequestDto requestDto,
      {CancelToken? cancelToken});
}
