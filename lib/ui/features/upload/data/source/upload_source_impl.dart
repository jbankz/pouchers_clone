import 'dart:typed_data';

import 'package:pouchers/app/core/network/api_path.dart';
import 'package:pouchers/app/core/network/network_service.dart';
import 'package:dio/dio.dart';

import '../../domain/dto/upload_dto.dart';
import 'upload_source.dart';

class UploadSourceImpl implements UploadSource {
  final NetworkService _networkService;

  UploadSourceImpl({required NetworkService networkService})
      : _networkService = networkService;

  @override
  Future<String> uploadFile(
      {required UploadDto uploadDto, CancelToken? cancelToken}) async {
    try {
      final getSignedUrl = await _networkService.request(
          path: ApiPath.getSignedUrl,
          requestType: RequestType.patch,
          data: uploadDto.toJson(),
          cancelToken: cancelToken);

      final String bucketUrl = getSignedUrl.data?['data'] ?? '';

      final Uint8List? rawImage = await uploadDto.file?.readAsBytes();

      await _networkService.request(
          path: bucketUrl,
          requestType: RequestType.put,
          data: rawImage,
          options: Options(),
          cancelToken: cancelToken);

      return bucketUrl.split('?').first;
    } catch (e) {
      rethrow;
    }
  }
}
