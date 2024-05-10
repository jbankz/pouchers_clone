import 'package:pouchers/ui/features/requests/domain/model/request_model.dart';
import 'package:dio/dio.dart';

import '../../../../../app/core/usecase/poucher_usecase.dart';
import '../dto/request_dto.dart';
import '../repository/request_repo.dart';

class RequestUseCaseImpl
    implements PoucherUseCaseWithRequiredParam<RequestDto, List<RequestModel>> {
  final RequestRepo _requestRepo;

  RequestUseCaseImpl({required RequestRepo requestRepo})
      : _requestRepo = requestRepo;

  @override
  Future<List<RequestModel>?> execute(
          {required RequestDto parameter, CancelToken? cancelToken}) async =>
      await _requestRepo.requests(parameter, cancelToken: cancelToken);
}
