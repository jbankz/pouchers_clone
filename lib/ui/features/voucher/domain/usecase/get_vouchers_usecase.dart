import 'package:Pouchers/ui/features/voucher/domain/dto/voucher_dto.dart';
import 'package:Pouchers/ui/features/voucher/domain/model/vouchers.dart';
import 'package:Pouchers/ui/features/voucher/domain/repository/voucher_repository.dart';
import 'package:dio/dio.dart';

import '../../../../../app/core/usecase/poucher_usecase.dart';

class GetVoucherUseCaseImpl
    implements PoucherUseCaseWithRequiredParam<VoucherDto, List<Vouchers>> {
  final VoucherRepo _voucherRepo;

  GetVoucherUseCaseImpl({required VoucherRepo voucherRepo})
      : _voucherRepo = voucherRepo;

  @override
  Future<List<Vouchers>> execute(
          {required VoucherDto parameter, CancelToken? cancelToken}) async =>
      await _voucherRepo.vouchers(parameter, cancelToken: cancelToken);
}
