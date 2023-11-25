import 'package:Pouchers/ui/common/app_strings.dart';
import 'package:Pouchers/ui/features/dashboard/views/card/domain/dto/card_dto.dart';
import 'package:Pouchers/ui/features/dashboard/views/card/domain/enum/card_type.dart';
import 'package:Pouchers/ui/features/dashboard/views/card/presentation/notifier/module/module.dart';
import 'package:Pouchers/ui/notification/notification_tray.dart';
import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../../../app/app.logger.dart';
import '../../../../../../../app/app.router.dart';
import '../../../../../../../app/core/router/page_router.dart';
import '../../../../../../../app/core/state/app_state.dart';
import '../../domain/model/get_exchange_rate/data.dart';

part 'card_notifier.g.dart';

@riverpod
class CardNotifier extends _$CardNotifier {
  final _logger = getLogger('CardNotifier');

  Data? _exchangeRate;

  @override
  AppState build() => const AppState();

  Future<void> createNairaVirtualCard(CardDto parameter,
      [CancelToken? cancelToken]) async {
    try {
      state = state.copyWith(isBusy: true);

      await ref.read(createNairaVirtualCardProvider
          .call(parameter: parameter, cancelToken: cancelToken)
          .future);

      PageRouter.pushNamed(Routes.successState,
          args: SuccessStateArguments(
              title: AppString.completed,
              message: AppString.cardCreated,
              btnTitle: AppString.proceed,
              tap: () => PageRouter.pop()));
    } catch (e) {
      _logger.e(e.toString());
      triggerNotificationTray(e.toString(), error: true);
    }
    state = state.copyWith(isBusy: false);
  }

  Future<void> createDollarVirtualCard(CardDto parameter,
      [CancelToken? cancelToken]) async {
    try {
      state = state.copyWith(isBusy: true);

      await ref.read(createDollarVirtualCardProvider
          .call(parameter: parameter, cancelToken: cancelToken)
          .future);

      PageRouter.pushNamed(Routes.successState,
          args: SuccessStateArguments(
              title: AppString.completed,
              message: AppString.cardCreated,
              btnTitle: AppString.proceed,
              tap: () => PageRouter.pop()));
    } catch (e) {
      _logger.e(e.toString());
      triggerNotificationTray(e.toString(), error: true);
    }
    state = state.copyWith(isBusy: false);
  }

  Future<void> getVirtualCardDetails(CardDto parameter,
      [CancelToken? cancelToken]) async {
    try {
      state = state.copyWith(isBusy: true);

      await ref.read(getVirtualCardDetailsProvider
          .call(parameter: parameter, cancelToken: cancelToken)
          .future);
    } catch (e) {
      _logger.e(e.toString());
    }
    state = state.copyWith(isBusy: false);
  }

  Future<void> getAccountBalance(CardDto parameter,
      [CancelToken? cancelToken]) async {
    try {
      state = state.copyWith(isBusy: true);

      await ref.read(getAccountBalanceProvider
          .call(parameter: parameter, cancelToken: cancelToken)
          .future);
    } catch (e) {
      _logger.e(e.toString());
    }
    state = state.copyWith(isBusy: false);
  }

  Future<void> getVirtualAccout(CardDto parameter,
      [CancelToken? cancelToken]) async {
    try {
      state = state.copyWith(isBusy: true);

      await ref.read(getVirtualAccoutProvider
          .call(parameter: parameter, cancelToken: cancelToken)
          .future);
    } catch (e) {
      _logger.e(e.toString());
    }
    state = state.copyWith(isBusy: false);
  }

  Future<void> fundVirtualCard(CardDto parameter,
      [CancelToken? cancelToken]) async {
    try {
      state = state.copyWith(isBusy: true);

      await ref.read(fundVirtualCardProvider
          .call(parameter: parameter, cancelToken: cancelToken)
          .future);
    } catch (e) {
      _logger.e(e.toString());
    }
    state = state.copyWith(isBusy: false);
  }

  Future<void> freezeCard(CardDto parameter, [CancelToken? cancelToken]) async {
    try {
      state = state.copyWith(isBusy: true);

      await ref.read(freezeCardProvider
          .call(parameter: parameter, cancelToken: cancelToken)
          .future);
    } catch (e) {
      _logger.e(e.toString());
    }
    state = state.copyWith(isBusy: false);
  }

  Future<void> getCardTransactions(CardDto parameter,
      [CancelToken? cancelToken]) async {
    try {
      state = state.copyWith(isBusy: true);

      await ref.read(getCardTransactionsProvider
          .call(parameter: parameter, cancelToken: cancelToken)
          .future);
    } catch (e) {
      _logger.e(e.toString());
    }
    state = state.copyWith(isBusy: false);
  }

  Future<void> getCards(CardDto cardDto, [CancelToken? cancelToken]) async {
    try {
      state = state.copyWith(isBusy: true);

      await ref.read(getCardsProvider
          .call(parameter: cardDto, cancelToken: cancelToken)
          .future);
    } catch (e) {
      _logger.e(e.toString());
    }
    state = state.copyWith(isBusy: false);
  }

  Future<void> getToken(CardDto parameter, [CancelToken? cancelToken]) async {
    try {
      state = state.copyWith(isBusy: true);

      await ref.read(getCardTokenProvider
          .call(parameter: parameter, cancelToken: cancelToken)
          .future);
    } catch (e) {
      _logger.e(e.toString());
    }
    state = state.copyWith(isBusy: false);
  }

  Future<void> getExchangeRate(CardDto parameter,
      [CancelToken? cancelToken]) async {
    try {
      state = state.copyWith(isBusy: true);

      final response = await ref.read(getExchangeRateProvider
          .call(parameter: parameter, cancelToken: cancelToken)
          .future);

      _exchangeRate = response?.data;
    } catch (e) {
      _logger.e(e.toString());
    }
    state = state.copyWith(isBusy: false, data: _exchangeRate);
  }
}
