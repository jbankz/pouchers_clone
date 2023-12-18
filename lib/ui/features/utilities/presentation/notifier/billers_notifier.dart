import 'package:Pouchers/app/app.router.dart';
import 'package:Pouchers/app/core/router/page_router.dart';
import 'package:Pouchers/ui/common/app_strings.dart';
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
import '../../domain/model/mobile_data_services.dart';
import '../state/billers_state.dart';

part 'billers_notifier.g.dart';

@riverpod
class BillersNotifier extends _$BillersNotifier {
  final _logger = getLogger('BillersNotifier');

  List<Billers> _billers = [];
  List<MobileOperatorServices> _mobileOperatorServices = [];
  Discounts? _discounts;

  @override
  BillersState build() => BillersState(
      billers: _billers,
      airtimeTopDeals: ref.read(airtimeTopDealsProvider),
      mobileOperatorServices: _mobileOperatorServices);

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

  Future<void> purchaseService(
      {required MobileDto mobileDto,
      required Function() onSuccess,
      CancelToken? cancelToken}) async {
    try {
      state = state.copyWith(isPurchasing: true);

      await ref.read(utilityPurchaseProvider
          .call(parameter: mobileDto, cancelToken: cancelToken)
          .future);

      onSuccess();

      await ref
          .read(walletNotifierProvider.notifier)
          .getWalletBalance(cancelToken);
    } catch (e) {
      _logger.e(e.toString());
      AppHelper.handleError(e);
    } finally {
      state = state.copyWith(isPurchasing: false);
    }
  }

  Future<void> mobileDataServices(String mobileOperatorPublicId,
      [CancelToken? cancelToken]) async {
    try {
      state = state.copyWith(isGettingServices: true);

      _mobileOperatorServices = await ref.read(mobileDataServicesProvider
          .call(
              parameter:
                  MobileDto(mobileOperatorPublicId: mobileOperatorPublicId),
              cancelToken: cancelToken)
          .future);
    } catch (e) {
      _logger.e(e.toString());
      AppHelper.handleError(e);
      PageRouter.pop();
    } finally {
      state = state.copyWith(
          isGettingServices: false,
          mobileOperatorServices: _mobileOperatorServices);
    }
  }

  Future<void> schedule(
      {required MobileDto mobileDto,
      required String route,
      CancelToken? cancelToken}) async {
    try {
      state = state.copyWith(isScheduling: true);

      await ref.read(scheduleProvider
          .call(parameter: mobileDto, cancelToken: cancelToken)
          .future);

      PageRouter.pushNamed(Routes.successState,
          args: SuccessStateArguments(
              title: AppString.complete,
              message: AppString.successFullBillSchedule,
              btnTitle: AppString.proceed,
              tap: () => PageRouter.popToRoot(route)));
    } catch (e) {
      _logger.e(e.toString());
      AppHelper.handleError(e);
    } finally {
      state = state.copyWith(isScheduling: false);
    }
  }
}
