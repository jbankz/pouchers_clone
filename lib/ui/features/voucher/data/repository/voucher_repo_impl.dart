import 'package:pouchers/ui/features/voucher/data/dao/vouchers_dao.dart';
import 'package:pouchers/ui/features/voucher/data/source/voucher_source.dart';
import 'package:pouchers/ui/features/voucher/domain/dto/voucher_dto.dart';
import 'package:pouchers/ui/features/voucher/domain/model/buy_voucher.dart';
import 'package:pouchers/ui/features/voucher/domain/model/vouchers.dart';
import 'package:dio/dio.dart';

import '../../domain/repository/voucher_repository.dart';

class VoucherRepoImpl implements VoucherRepo {
  final VoucherSource _voucherSource;

  VoucherRepoImpl(this._voucherSource);

  @override
  Future<BuyVoucher> buyVoucher(VoucherDto voucherDto,
          {CancelToken? cancelToken}) async =>
      await _voucherSource.buyVoucher(voucherDto, cancelToken: cancelToken);

  @override
  Future<List<Vouchers>> vouchers(VoucherDto voucherDto,
      {CancelToken? cancelToken}) async {
    final vouchers =
        await _voucherSource.vouchers(voucherDto, cancelToken: cancelToken);
    vouchersDao.save(vouchers, clear: voucherDto.page <= 1);

    return vouchers;
  }

  @override
  Future<Vouchers> giftVoucher(VoucherDto voucherDto,
          {CancelToken? cancelToken}) async =>
      await _voucherSource.giftVoucher(voucherDto, cancelToken: cancelToken);

  @override
  Future<Vouchers> redeemVoucher(VoucherDto voucherDto,
          {CancelToken? cancelToken}) async =>
      await _voucherSource.redeemVoucher(voucherDto, cancelToken: cancelToken);

  @override
  List<num> vouchersTopDeals() => _voucherSource.vouchersTopDeals();
}
