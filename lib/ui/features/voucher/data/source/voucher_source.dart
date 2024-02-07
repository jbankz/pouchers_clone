import 'package:Pouchers/ui/features/voucher/domain/dto/voucher_dto.dart';
import 'package:Pouchers/ui/features/voucher/domain/model/buy_voucher.dart';
import 'package:dio/dio.dart';

import '../../domain/model/vouchers.dart';

abstract class VoucherSource {
  Future<BuyVoucher> buyVoucher(VoucherDto voucherDto,
      {CancelToken? cancelToken});

  Future<List<Vouchers>> vouchers(VoucherDto voucherDto,
      {CancelToken? cancelToken});

  Future<Vouchers> redeemVoucher(VoucherDto voucherDto,
      {CancelToken? cancelToken});

  Future<Vouchers> giftVoucher(VoucherDto voucherDto,
      {CancelToken? cancelToken});
  List<num> vouchersTopDeals();
}
