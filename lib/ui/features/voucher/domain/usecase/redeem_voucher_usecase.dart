import 'package:Pouchers/ui/features/utilities/domain/dto/mobile_dto.dart';
import 'package:Pouchers/ui/features/utilities/domain/repository/billers_repo.dart';
import 'package:Pouchers/ui/features/voucher/domain/dto/voucher_dto.dart';
import 'package:Pouchers/ui/features/voucher/domain/model/buy_voucher.dart';
import 'package:Pouchers/ui/features/voucher/domain/model/vouchers.dart';
import 'package:Pouchers/ui/features/voucher/domain/repository/voucher_repository.dart';
import 'package:dio/dio.dart';

import '../../../../../app/core/usecase/poucher_usecase.dart';

class RedeemVoucherUseCaseImpl
    implements PoucherUseCaseWithRequiredParam<VoucherDto, Vouchers> {
  final VoucherRepo _voucherRepo;

  RedeemVoucherUseCaseImpl({required VoucherRepo voucherRepo})
      : _voucherRepo = voucherRepo;

  @override
  Future<Vouchers> execute(
          {required VoucherDto parameter, CancelToken? cancelToken}) async =>
      await _voucherRepo.redeemVoucher(parameter, cancelToken: cancelToken);
}
