import 'package:dio/dio.dart';

import '../dto/upload_dto.dart';

abstract class UploadRepo {
  Future<bool> uploadFile(
      {required UploadDto uploadDto, CancelToken? cancelToken});
}
