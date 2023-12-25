import 'package:Pouchers/app/config/app_helper.dart';
import 'package:Pouchers/ui/common/app_strings.dart';
import 'package:Pouchers/ui/features/voucher/data/dao/vouchers_dao.dart';
import 'package:Pouchers/ui/features/voucher/domain/dto/voucher_dto.dart';
import 'package:Pouchers/ui/features/voucher/domain/model/buy_voucher.dart';
import 'package:Pouchers/ui/features/voucher/domain/model/vouchers.dart';
import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../app/app.logger.dart';
import '../../../../../app/app.router.dart';
import '../../../../../app/core/router/page_router.dart';
import '../state/voucher_state.dart';
import 'module/module.dart';

part 'vouchers_notifier.g.dart';

@riverpod
class VouchersNotifier extends _$VouchersNotifier {
  final _logger = getLogger('VoucherNotifier');

  List<Vouchers> _vouchers = [];
  BuyVoucher? _buyVoucher;
  int _page = 1;

  @override
  VoucherState build() => VoucherState(
      vouchers: _vouchers,
      vouchersTopDeals: ref.read(getVouchersTopDealsProvider));

  void increamentPageCount() => _page++;

  void resetPageCount() => _page = 1;

  Future<void> buyVoucher(VoucherDto voucherDto,
      {CancelToken? cancelToken}) async {
    try {
      state = state.copyWith(isBusy: true);
      _buyVoucher = await ref.read(purchaseVoucherProvider
          .call(parameter: voucherDto, cancelToken: cancelToken)
          .future);

      PageRouter.pushNamed(Routes.voucherSuccessView);
    } catch (e) {
      _logger.e(e.toString());
      AppHelper.handleError(e);
    } finally {
      state = state.copyWith(isBusy: false, buyVoucher: _buyVoucher);
    }
  }

  Future<void> giftVoucher(VoucherDto voucherDto,
      {CancelToken? cancelToken}) async {
    try {
      state = state.copyWith(isBusy: true);
      await ref.read(giftVoucherProvider
          .call(parameter: voucherDto, cancelToken: cancelToken)
          .future);

      PageRouter.pushNamed(Routes.successState,
          args: SuccessStateArguments(
              title: AppString.complete,
              message: AppString.giftVoucherSuccess,
              btnTitle: AppString.proceed,
              tap: () => PageRouter.popToRoot(Routes.voucherView)));
    } catch (e) {
      _logger.e(e.toString());
    } finally {
      state = state.copyWith(isBusy: false);
    }
  }

  Future<void> redeemVoucher(VoucherDto voucherDto,
      {CancelToken? cancelToken}) async {
    try {
      state = state.copyWith(isBusy: true);
      await ref.read(redeemVoucherProvider
          .call(parameter: voucherDto, cancelToken: cancelToken)
          .future);

      PageRouter.pushNamed(Routes.successState,
          args: SuccessStateArguments(
              title: AppString.complete,
              message: AppString.redeemVoucherSuccess,
              btnTitle: AppString.proceed,
              tap: () => PageRouter.popToRoot(Routes.voucherView)));
    } catch (e) {
      _logger.e(e.toString());
      AppHelper.handleError(e);
    } finally {
      state = state.copyWith(isBusy: false);
    }
  }

  Future<void> getVouchers({CancelToken? cancelToken}) async {
    try {
      state = state.copyWith(isBusy: vouchersDao.box.isEmpty);
      _vouchers = await ref.read(getVouchersProvider
          .call(parameter: VoucherDto(page: _page), cancelToken: cancelToken)
          .future);
    } catch (e) {
      _logger.e(e.toString());
    } finally {
      state = state.copyWith(isBusy: false, vouchers: _vouchers);
    }
  }
}
