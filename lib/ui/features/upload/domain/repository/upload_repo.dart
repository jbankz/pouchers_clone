import 'package:dio/dio.dart';

import '../dto/upload_dto.dart';

abstract class UploadRepo {
  Future<String> uploadFile(
      {required UploadDto uploadDto, CancelToken? cancelToken});
}
