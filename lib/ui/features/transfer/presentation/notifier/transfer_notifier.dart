import 'package:Pouchers/app/app.dart';
import 'package:Pouchers/app/app.router.dart';
import 'package:Pouchers/app/config/app_helper.dart';
import 'package:Pouchers/app/core/router/page_router.dart';
import 'package:Pouchers/ui/features/profile/presentation/notifier/wallet_notifier.dart';
import 'package:Pouchers/ui/features/requests/domain/enum/request_money_action.dart';
import 'package:Pouchers/ui/features/requests/domain/enum/request_type.dart';
import 'package:Pouchers/ui/features/requests/presentation/notifier/request_notifier.dart';
import 'package:Pouchers/ui/features/transfer/domain/model/transfer.dart';
import 'package:Pouchers/ui/features/transfer/presentation/notifier/module/module.dart';
import 'package:Pouchers/ui/features/transfer/presentation/state/transfer_state.dart';
import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../app/app.logger.dart';
import '../../../../common/app_strings.dart';
import '../../../requests/domain/dto/request_dto.dart';
import '../../../requests/presentation/notifier/module/module.dart';
import '../../../utilities/domain/dto/mobile_dto.dart';
import '../../domain/dto/transfer_money_dto.dart';

part 'transfer_notifier.g.dart';

@riverpod
class TransferNotifier extends _$TransferNotifier {
  final _logger = getLogger('TransferNotifier');

  Transfer? _transfer;

  @override
  TransferState build() => const TransferState();

  Future<void> p2pTransfer(TransferMoneyDto transferMoneyDto,
      [CancelToken? cancelToken]) async {
    try {
      state = state.copyWith(isBusy: true);
      _transfer = await ref.read(p2pTransferProvider
          .call(transferMoneyDto, cancelToken: cancelToken)
          .future);

      await ref
          .read(walletNotifierProvider.notifier)
          .getWalletBalance(cancelToken);

      PageRouter.pushNamed(Routes.transferSuccessState);
    } catch (e) {
      _logger.e(e.toString());
      AppHelper.handleError(e);
    } finally {
      state = state.copyWith(isBusy: false, transfer: _transfer);
    }
  }

  Future<void> schedule(
      {required MobileDto mobileDto, CancelToken? cancelToken}) async {
    try {
      state = state.copyWith(isBusy: true);

      await ref.read(scheduleP2pTransferProvider
          .call(mobileDto, cancelToken: cancelToken)
          .future);

      PageRouter.pushNamed(Routes.successState,
          args: SuccessStateArguments(
              title: AppString.complete,
              message: AppString.successFullTransferSchedule,
              btnTitle: AppString.proceed,
              tap: () => PageRouter.popToRoot(Routes.dashboardView)));
    } catch (e) {
      _logger.e(e.toString());
      AppHelper.handleError(e);
    } finally {
      state = state.copyWith(isBusy: false);
    }
  }

  Future<void> requestMoney(
      {required TransferMoneyDto transferMoneyDto,
      CancelToken? cancelToken}) async {
    try {
      state = state.copyWith(isBusy: true);

      await ref.read(requestMoneyProvider
          .call(transferMoneyDto, cancelToken: cancelToken)
          .future);

      PageRouter.pushNamed(Routes.successState,
          args: SuccessStateArguments(
              title: AppString.requestComplete,
              message: AppString.requestCompleteMessage,
              btnTitle: AppString.proceed,
              tap: () => PageRouter.popToRoot(Routes.dashboardView)));
    } catch (e) {
      _logger.e(e.toString());
      AppHelper.handleError(e);
    } finally {
      state = state.copyWith(isBusy: false);
    }
  }

  Future<void> requestedMoney(
      {required RequestDto requestDto, CancelToken? cancelToken}) async {
    try {
      state = state.copyWith(isBusy: true);

      final request = ref.read(requestNotifierProvider.notifier);

      await ref.read(requestedMoneyProvider
          .call(requestDto, cancelToken: cancelToken)
          .future);

      await Future.wait([
        request.fetchRequests(requestType: RequestType.sent),
        request.fetchRequests(requestType: RequestType.received)
      ]);

      PageRouter.pushNamed(Routes.successState,
          args: SuccessStateArguments(
              title:
                  requestDto.requestedMoneyAction == RequestMoneyAction.accept
                      ? AppString.paymentSuccessful
                      : AppString.requestDeclined,
              message:
                  requestDto.requestedMoneyAction == RequestMoneyAction.accept
                      ? AppString.successfullyPaid
                      : AppString.declinedSuccessfully,
              btnTitle: AppString.proceed,
              tap: () => PageRouter.popToRoot(Routes.requestView)));
    } catch (e) {
      _logger.e(e.toString());
      AppHelper.handleError(e);
    } finally {
      state = state.copyWith(isBusy: false);
    }
  }
}
