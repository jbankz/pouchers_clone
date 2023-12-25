import 'package:Pouchers/ui/features/voucher/domain/repository/voucher_repository.dart';
import 'package:dio/dio.dart';

import '../../../../../app/core/usecase/poucher_usecase.dart';

class VoucherTopDealsUseCaseImpl
    implements PoucherUseCaseWithOutParam<List<num>> {
  final VoucherRepo _voucherRepo;

  VoucherTopDealsUseCaseImpl({required VoucherRepo voucherRepo})
      : _voucherRepo = voucherRepo;

  @override
  List<num> execute([CancelToken? cancelToken]) =>
      _voucherRepo.vouchersTopDeals();
}
