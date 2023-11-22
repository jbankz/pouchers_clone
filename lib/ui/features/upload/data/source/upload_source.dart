import 'package:dio/dio.dart';

import '../../domain/dto/upload_dto.dart';

abstract class UploadSource {
  Future<bool> uploadFile(
      {required UploadDto uploadDto, CancelToken? cancelToken});
}
