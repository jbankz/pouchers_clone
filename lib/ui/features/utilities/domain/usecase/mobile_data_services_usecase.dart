import 'package:Pouchers/ui/features/utilities/domain/dto/mobile_dto.dart';
import 'package:Pouchers/ui/features/utilities/domain/repository/billers_repo.dart';
import 'package:dio/dio.dart';

import '../../../../../app/core/usecase/poucher_usecase.dart';
import '../model/mobile_data_services.dart';

class MobileDataServicesUseCaseImpl
    implements
        PoucherUseCaseWithRequiredParam<MobileDto,
            List<MobileOperatorServices>> {
  final BillerRepo _billerRepo;

  MobileDataServicesUseCaseImpl(this._billerRepo);

  @override
  Future<List<MobileOperatorServices>> execute(
          {required MobileDto parameter, CancelToken? cancelToken}) async =>
      await _billerRepo.mobileOperatorServices(parameter,
          cancelToken: cancelToken);
}
