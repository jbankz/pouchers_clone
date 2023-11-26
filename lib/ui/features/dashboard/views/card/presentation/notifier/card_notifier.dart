import 'package:Pouchers/ui/common/app_strings.dart';
import 'package:Pouchers/ui/features/dashboard/views/card/data/dao/card_dao.dart';
import 'package:Pouchers/ui/features/dashboard/views/card/domain/dto/card_dto.dart';
import 'package:Pouchers/ui/features/dashboard/views/card/presentation/notifier/module/module.dart';
import 'package:Pouchers/ui/notification/notification_tray.dart';
import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../../../app/app.logger.dart';
import '../../../../../../../app/app.router.dart';
import '../../../../../../../app/core/router/page_router.dart';
import '../../../../../../widgets/dialog/bottom_sheet.dart';
import '../../domain/model/get_card/data.dart';
import '../../domain/model/get_exchange_rate/get_exchange_rate.dart';
import '../../domain/model/virtual_account_balance/virtual_account_balance.dart';
import '../../domain/model/virtual_card_details/virtual_card_details.dart';
import '../state/card_state.dart';
import '../view/sheets/card_details_sheet.dart';
import '../view/sheets/manage_card_sheet.dart';

part 'card_notifier.g.dart';

@riverpod
class CardNotifier extends _$CardNotifier {
  final _logger = getLogger('CardNotifier');

  GetExchangeRate? _exchangeRate;
  List<Data> _cards = [];
  VirtualCardDetails? _cardDetails;
  VirtualAccountBalance? _accountBalance;

  @override
  CardState build() => CardState(isBusy: true, cards: _cards);

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

      _cardDetails = await ref.read(getVirtualCardDetailsProvider
          .call(parameter: parameter, cancelToken: cancelToken)
          .future);
    } catch (e) {
      _logger.e(e.toString());
    }
    state = state.copyWith(isBusy: false, virtualCardDetails: _cardDetails);
  }

  Future<void> getAccountBalance(CardDto parameter,
      [CancelToken? cancelToken]) async {
    try {
      state = state.copyWith(isBusy: true);

      _accountBalance = await ref.read(getAccountBalanceProvider
          .call(parameter: parameter, cancelToken: cancelToken)
          .future);
    } catch (e) {
      _logger.e(e.toString());
    }
    state =
        state.copyWith(isBusy: false, virtualAccountBalance: _accountBalance);
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
      PageRouter.popToRoot(Routes.virtualCardDetailView);
    } catch (e) {
      _logger.e(e.toString());
      triggerNotificationTray(e.toString(), error: true);
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
      state = state.copyWith(isBusy: cardsDao.cards.isEmpty);

      final response = await ref.read(getCardsProvider
          .call(parameter: cardDto, cancelToken: cancelToken)
          .future);

      _cards = response?.data ?? [];
    } catch (e) {
      _logger.e(e.toString());
    }
    state = state.copyWith(isBusy: false, cards: _cards);
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

      _exchangeRate = await ref.read(getExchangeRateProvider
          .call(parameter: parameter, cancelToken: cancelToken)
          .future);
    } catch (e) {
      _logger.e(e.toString());
    }
    state = state.copyWith(isBusy: false, exchangeRate: _exchangeRate);
  }

  void navigateToDetails(Data card) {
    ref.read(paramModule.notifier).setCardDetails(card);
    PageRouter.pushNamed(Routes.virtualCardDetailView);
  }

  void triggerDetails() =>
      BottomSheets.showSheet(child: const CardDetailsSheet());

  Future<void> triggerManageCard() async =>
      await BottomSheets.showSheet(child: const ManageCardSheet());
}
