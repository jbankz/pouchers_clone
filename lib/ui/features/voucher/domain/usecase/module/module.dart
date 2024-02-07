import 'package:Pouchers/ui/features/voucher/data/repository/module/voucher_repo_module.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../../app/core/usecase/poucher_usecase.dart';
import '../buy_voucher_usecase.dart';
import '../get_vouchers_usecase.dart';
import '../gift_voucher_usecase.dart';
import '../redeem_voucher_usecase.dart';
import '../vouchers_top_deals_usecase.dart';

final buyVoucherUseCaseModule = Provider<PoucherUseCaseWithRequiredParam>(
    (ref) => BuyVoucherUseCaseImpl(voucherRepo: ref.read(voucherRepoModule)));

final getVouchersUseCaseModule = Provider<PoucherUseCaseWithRequiredParam>(
    (ref) => GetVoucherUseCaseImpl(voucherRepo: ref.read(voucherRepoModule)));

final redeemVoucherUseCaseModule = Provider<PoucherUseCaseWithRequiredParam>(
    (ref) =>
        RedeemVoucherUseCaseImpl(voucherRepo: ref.read(voucherRepoModule)));

final giftVoucherUseCaseModule = Provider<PoucherUseCaseWithRequiredParam>(
    (ref) => GiftVoucherUseCaseImpl(voucherRepo: ref.read(voucherRepoModule)));

final getVouchersTopDealsUseCaseModule = Provider<PoucherUseCaseWithOutParam>(
    (ref) =>
        VoucherTopDealsUseCaseImpl(voucherRepo: ref.read(voucherRepoModule)));
