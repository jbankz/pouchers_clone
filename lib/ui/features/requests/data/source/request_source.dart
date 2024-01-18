import 'package:dio/dio.dart';

import '../../domain/dto/request_dto.dart';
import '../../domain/model/request_model.dart';

abstract class RequestSource {
  Future<List<RequestModel>> requests(RequestDto requestDto,
      {CancelToken? cancelToken});
}
