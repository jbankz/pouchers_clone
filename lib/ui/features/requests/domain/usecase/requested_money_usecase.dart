import 'package:dio/dio.dart';

import '../../../../../app/core/usecase/poucher_usecase.dart';
import '../dto/request_dto.dart';
import '../model/requested_money_model.dart';
import '../repository/request_repo.dart';

class RequestedUseCaseImpl
    implements
        PoucherUseCaseWithRequiredParam<RequestDto, RequestedMoneyModel> {
  final RequestRepo _requestRepo;

  RequestedUseCaseImpl({required RequestRepo requestRepo})
      : _requestRepo = requestRepo;

  @override
  Future<RequestedMoneyModel?> execute(
          {required RequestDto parameter, CancelToken? cancelToken}) async =>
      await _requestRepo.requestedMoney(parameter, cancelToken: cancelToken);
}
