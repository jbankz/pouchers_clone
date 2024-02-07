import 'package:Pouchers/ui/features/utilities/domain/dto/billers_dto.dart';
import 'package:Pouchers/ui/features/utilities/domain/repository/billers_repo.dart';
import 'package:dio/dio.dart';

import '../../../../../app/core/usecase/poucher_usecase.dart';
import '../model/get_cable_service.dart';

class CableUseCaseImpl
    implements PoucherUseCaseWithRequiredParam<BillersDto, GetCableService> {
  final BillerRepo _billerRepo;

  CableUseCaseImpl(this._billerRepo);

  @override
  Future<GetCableService> execute(
          {required BillersDto parameter, CancelToken? cancelToken}) async =>
      await _billerRepo.cableServices(parameter, cancelToken: cancelToken);
}
