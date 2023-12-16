import 'package:Pouchers/app/app.router.dart';
import 'package:Pouchers/app/core/router/page_router.dart';
import 'package:Pouchers/ui/features/profile/presentation/notifier/wallet_notifier.dart';
import 'package:Pouchers/ui/features/utilities/domain/dto/billers_dto.dart';
import 'package:Pouchers/ui/features/utilities/domain/model/discounts.dart';
import 'package:Pouchers/ui/features/utilities/presentation/notifier/module/module.dart';
import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../app/app.logger.dart';
import '../../../../../app/config/app_helper.dart';
import '../../domain/dto/mobile_dto.dart';
import '../../domain/enum/billers_category.dart';
import '../../domain/model/billers.dart';
import '../state/billers_state.dart';

part 'billers_notifier.g.dart';

@riverpod
class BillersNotifier extends _$BillersNotifier {
  final _logger = getLogger('BillersNotifier');

  List<Billers> _billers = [];
  Discounts? _discounts;

  @override
  BillersState build() => BillersState(
      billers: _billers, airtimeTopDeals: ref.read(airtimeTopDealsProvider));

  Future<void> billers(BillersCategory parameter,
      [CancelToken? cancelToken]) async {
    try {
      state = state.copyWith(isBusy: true);

      _billers = await ref.read(billersProvider
          .call(
              parameter: BillersDto(billersCategory: parameter),
              cancelToken: cancelToken)
          .future);
    } catch (e) {
      _logger.e(e.toString());
      AppHelper.handleError(e);
    } finally {
      state = state.copyWith(isBusy: false, billers: _billers);
    }
  }

  Future<void> billersDiscounts(BillersCategory parameter,
      [CancelToken? cancelToken]) async {
    try {
      state = state.copyWith(isBusy: true);

      _discounts = await ref.read(billersDiscountsProvider
          .call(
              parameter: BillersDto(billersCategory: parameter),
              cancelToken: cancelToken)
          .future);
    } catch (e) {
      _logger.e(e.toString());

      AppHelper.handleError(e);
    } finally {
      state = state.copyWith(isBusy: false, discounts: _discounts);
    }
  }

  Future<void> purchaseService(MobileDto mobileDto,
      [CancelToken? cancelToken]) async {
    try {
      state = state.copyWith(purchasing: true);

      await ref.read(utilityPurchaseProvider
          .call(parameter: mobileDto, cancelToken: cancelToken)
          .future);

      await ref
          .read(walletNotifierProvider.notifier)
          .getWalletBalance(cancelToken);

      PageRouter.pushNamed(Routes.successState,
          args: SuccessStateArguments(
              title: 'Recharge successful',
              message: 'Your airtime has been delivered',
              btnTitle: 'Continue',
              tap: () => PageRouter.popToRoot(Routes.airtimeView)));
    } catch (e) {
      _logger.e(e.toString());
      AppHelper.handleError(e);
    } finally {
      state = state.copyWith(purchasing: false);
    }
  }
}
