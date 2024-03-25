import 'package:pouchers/ui/features/voucher/domain/dto/voucher_dto.dart';
import 'package:pouchers/ui/features/voucher/domain/model/buy_voucher.dart';
import 'package:pouchers/ui/features/voucher/domain/model/vouchers.dart';
import 'package:pouchers/ui/features/voucher/domain/usecase/module/module.dart';
import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'module.g.dart';

@riverpod
Future<BuyVoucher> purchaseVoucher(PurchaseVoucherRef ref,
        {required VoucherDto parameter, CancelToken? cancelToken}) async =>
    await ref
        .read(buyVoucherUseCaseModule)
        .execute(parameter: parameter, cancelToken: cancelToken);

@riverpod
Future<List<Vouchers>> getVouchers(GetVouchersRef ref,
        {required VoucherDto parameter, CancelToken? cancelToken}) async =>
    await ref
        .read(getVouchersUseCaseModule)
        .execute(parameter: parameter, cancelToken: cancelToken);

@riverpod
Future<Vouchers> redeemVoucher(RedeemVoucherRef ref,
        {required VoucherDto parameter, CancelToken? cancelToken}) async =>
    await ref
        .read(redeemVoucherUseCaseModule)
        .execute(parameter: parameter, cancelToken: cancelToken);

@riverpod
Future<Vouchers> giftVoucher(GiftVoucherRef ref,
        {required VoucherDto parameter, CancelToken? cancelToken}) async =>
    await ref
        .read(giftVoucherUseCaseModule)
        .execute(parameter: parameter, cancelToken: cancelToken);

@riverpod
List<num> getVouchersTopDeals(GetVouchersTopDealsRef ref) =>
    ref.read(getVouchersTopDealsUseCaseModule).execute();
