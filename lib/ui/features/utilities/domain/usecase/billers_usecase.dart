import 'package:pouchers/ui/features/utilities/domain/dto/billers_dto.dart';
import 'package:pouchers/ui/features/utilities/domain/model/billers.dart';
import 'package:pouchers/ui/features/utilities/domain/repository/billers_repo.dart';
import 'package:dio/dio.dart';

import '../../../../../app/core/usecase/poucher_usecase.dart';

class BillersUseCaseImpl
    implements PoucherUseCaseWithRequiredParam<BillersDto, List<Billers>> {
  final BillerRepo _billerRepo;

  BillersUseCaseImpl(this._billerRepo);

  @override
  Future<List<Billers>> execute(
          {required BillersDto parameter, CancelToken? cancelToken}) async =>
      await _billerRepo.billers(parameter, cancelToken: cancelToken);
}
