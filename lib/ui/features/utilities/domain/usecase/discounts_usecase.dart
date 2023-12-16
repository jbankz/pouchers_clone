import 'package:Pouchers/ui/features/utilities/domain/dto/billers_dto.dart';
import 'package:Pouchers/ui/features/utilities/domain/repository/billers_repo.dart';
import 'package:dio/dio.dart';

import '../../../../../app/core/usecase/poucher_usecase.dart';
import '../model/discounts.dart';

class BillersDiscountsUseCaseImpl
    implements PoucherUseCaseWithRequiredParam<BillersDto, Discounts> {
  final BillerRepo _billerRepo;

  BillersDiscountsUseCaseImpl(this._billerRepo);

  @override
  Future<Discounts?> execute(
          {required BillersDto parameter, CancelToken? cancelToken}) async =>
      await _billerRepo.discounts(parameter, cancelToken: cancelToken);
}
