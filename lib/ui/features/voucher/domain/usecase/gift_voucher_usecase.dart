import 'package:pouchers/ui/features/voucher/domain/dto/voucher_dto.dart';
import 'package:pouchers/ui/features/voucher/domain/model/vouchers.dart';
import 'package:pouchers/ui/features/voucher/domain/repository/voucher_repository.dart';
import 'package:dio/dio.dart';

import '../../../../../app/core/usecase/poucher_usecase.dart';

class GiftVoucherUseCaseImpl
    implements PoucherUseCaseWithRequiredParam<VoucherDto, Vouchers> {
  final VoucherRepo _voucherRepo;

  GiftVoucherUseCaseImpl({required VoucherRepo voucherRepo})
      : _voucherRepo = voucherRepo;

  @override
  Future<Vouchers> execute(
          {required VoucherDto parameter, CancelToken? cancelToken}) async =>
      await _voucherRepo.giftVoucher(parameter, cancelToken: cancelToken);
}
