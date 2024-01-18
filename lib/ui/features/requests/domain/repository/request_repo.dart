import 'package:dio/dio.dart';

import '../dto/request_dto.dart';
import '../model/request_model.dart';

abstract class RequestRepo {
  Future<List<RequestModel>> requests(RequestDto requestDto,
      {CancelToken? cancelToken});
}
