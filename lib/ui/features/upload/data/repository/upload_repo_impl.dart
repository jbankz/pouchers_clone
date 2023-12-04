import 'package:Pouchers/ui/features/upload/data/source/upload_source.dart';
import 'package:Pouchers/ui/features/upload/domain/dto/upload_dto.dart';
import 'package:Pouchers/ui/features/upload/domain/repository/upload_repo.dart';
import 'package:dio/dio.dart';

class UploadRepImpl implements UploadRepo {
  final UploadSource _uploadSource;

  UploadRepImpl({required UploadSource uploadSource})
      : _uploadSource = uploadSource;

  @override
  Future<String> uploadFile(
          {required UploadDto uploadDto, CancelToken? cancelToken}) async =>
      await _uploadSource.uploadFile(uploadDto: uploadDto);
}
