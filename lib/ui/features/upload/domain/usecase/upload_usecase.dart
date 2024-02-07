import 'package:Pouchers/app/core/usecase/poucher_usecase.dart';
import 'package:Pouchers/ui/features/upload/domain/dto/upload_dto.dart';
import 'package:Pouchers/ui/features/upload/domain/repository/upload_repo.dart';
import 'package:dio/dio.dart';

class UploadUseCaseImpl
    implements PoucherUseCaseWithRequiredParam<UploadDto, String> {
  final UploadRepo _uploadRepo;

  UploadUseCaseImpl({required UploadRepo uploadRepo})
      : _uploadRepo = uploadRepo;

  @override
  Future<String> execute(
          {required UploadDto parameter, CancelToken? cancelToken}) async =>
      await _uploadRepo.uploadFile(
          uploadDto: parameter, cancelToken: cancelToken);
}
