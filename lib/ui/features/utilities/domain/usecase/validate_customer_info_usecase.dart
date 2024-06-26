import 'package:pouchers/ui/features/utilities/domain/dto/billers_dto.dart';
import 'package:pouchers/ui/features/utilities/domain/model/validate_customer.dart';
import 'package:pouchers/ui/features/utilities/domain/repository/billers_repo.dart';
import 'package:dio/dio.dart';

import '../../../../../app/core/usecase/poucher_usecase.dart';

class ValidateCustomerInfoUseCaseImpl
    implements PoucherUseCaseWithRequiredParam<BillersDto, ValidateCustomer> {
  final BillerRepo _billerRepo;

  ValidateCustomerInfoUseCaseImpl(this._billerRepo);

  @override
  Future<ValidateCustomer> execute(
          {required BillersDto parameter, CancelToken? cancelToken}) async =>
      await _billerRepo.customerInfo(parameter, cancelToken: cancelToken);
}
