import 'package:pouchers/ui/features/utilities/domain/dto/mobile_dto.dart';
import 'package:pouchers/ui/features/utilities/domain/model/utility.dart';
import 'package:pouchers/ui/features/utilities/domain/repository/billers_repo.dart';
import 'package:dio/dio.dart';

import '../../../../../app/core/usecase/poucher_usecase.dart';

class UtilityUseCaseImpl
    implements PoucherUseCaseWithRequiredParam<MobileDto, Utility> {
  final BillerRepo _billerRepo;

  UtilityUseCaseImpl(this._billerRepo);

  @override
  Future<Utility?> execute(
          {required MobileDto parameter, CancelToken? cancelToken}) async =>
      await _billerRepo.utilityPurchase(parameter, cancelToken: cancelToken);
}
