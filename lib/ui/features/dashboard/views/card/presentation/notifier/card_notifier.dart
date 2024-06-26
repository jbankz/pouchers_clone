import 'package:pouchers/ui/common/app_strings.dart';
import 'package:pouchers/ui/features/admin/data/dao/env_dao.dart';
import 'package:pouchers/ui/features/admin/domain/dto/admin_dto.dart';
import 'package:pouchers/ui/features/admin/domain/enum/fees.dart';
import 'package:pouchers/ui/features/admin/presentation/notifier/admin_notifier.dart';
import 'package:pouchers/ui/features/dashboard/views/card/data/dao/card_dao.dart';
import 'package:pouchers/ui/features/dashboard/views/card/domain/dto/card_dto.dart';
import 'package:pouchers/ui/features/dashboard/views/card/domain/enum/card_activity_type.dart';
import 'package:pouchers/ui/features/dashboard/views/card/presentation/notifier/module/module.dart';
import 'package:pouchers/ui/notification/notification_tray.dart';
import 'package:collection/collection.dart';
import 'package:dio/dio.dart';
import 'package:pouchers/utils/extension.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../../../app/app.logger.dart';
import '../../../../../../../app/app.router.dart';
import '../../../../../../../app/core/router/page_router.dart';
import '../../../../../../widgets/dialog/bottom_sheet.dart';
import '../../../../../admin/domain/model/envs/envs.dart';
import '../../../../../profile/data/dao/user_dao.dart';
import '../../domain/model/cards/cards.dart';
import '../../domain/model/get_card_transactions/transaction.dart';
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
  VirtualCardDetails? _cardDetails;
  VirtualAccountBalance? _accountBalance;
  List<Transaction> _transactions = [];

  @override
  CardState build() => const CardState();

  Future<void> createNairaVirtualCard(CardDto parameter,
      [CancelToken? cancelToken]) async {
    try {
      state = state.copyWith(isBusy: true);

      await ref.read(createNairaVirtualCardProvider
          .call(parameter: parameter, cancelToken: cancelToken)
          .future);

      await getCards(CardDto(userId: userDao.user.userId), cancelToken);

      PageRouter.pushNamed(Routes.successState,
          args: SuccessStateArguments(
              title: AppString.completed,
              message: AppString.cardCreated,
              btnTitle: AppString.proceed,
              tap: () => PageRouter.popToRoot(Routes.dashboardView)));
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

      await getCards(CardDto(userId: userDao.user.userId), cancelToken);

      PageRouter.pushNamed(Routes.successState,
          args: SuccessStateArguments(
              title: AppString.completed,
              message: AppString.cardCreated,
              btnTitle: AppString.proceed,
              tap: () => PageRouter.popToRoot(Routes.dashboardView)));
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
    } finally {
      state = state.copyWith(isBusy: false, virtualCardDetails: _cardDetails);
    }
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
      triggerNotificationTray(AppString.fundedCardSuccess);

      PageRouter.popToRoot(Routes.virtualCardDetailView);
    } catch (e) {
      _logger.e(e.toString());
      triggerNotificationTray(e.toString(), error: true);
    } finally {
      state = state.copyWith(isBusy: false);
    }
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
    } finally {
      state = state.copyWith(isBusy: false);
    }
  }

  Future<void> getCardTransactions(CardDto parameter,
      [CancelToken? cancelToken]) async {
    try {
      state = state.copyWith(isGettingCardTransactions: true);

      final getCardTransactions = await ref.read(getCardTransactionsProvider
          .call(parameter: parameter, cancelToken: cancelToken)
          .future);
      _transactions = getCardTransactions?.data ?? [];
    } catch (e) {
      _logger.e(e.toString());
    } finally {
      state = state.copyWith(
          isGettingCardTransactions: false, transactions: _transactions);
    }
  }

  Future<void> getCards(CardDto cardDto, [CancelToken? cancelToken]) async {
    try {
      state = state.copyWith(isBusy: cardsDao.cards.isEmpty);

      await ref.read(getCardsProvider
          .call(parameter: cardDto, cancelToken: cancelToken)
          .future);
    } catch (e) {
      _logger.e(e.toString());
    } finally {
      state = state.copyWith(isBusy: false);
    }
  }

  Future<void> getToken(CardDto parameter, [CancelToken? cancelToken]) async {
    try {
      state = state.copyWith(isBusy: true);

      await ref.read(getCardTokenProvider
          .call(parameter: parameter, cancelToken: cancelToken)
          .future);
    } catch (e) {
      _logger.e(e.toString());
    } finally {
      state = state.copyWith(isBusy: false);
    }
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
    } finally {
      state = state.copyWith(isBusy: false, exchangeRate: _exchangeRate);
    }
  }

  num _returnFee(Fees fees) =>
      envDao.envs
          .firstWhereOrNull((element) => element.name == fees)
          ?.value
          ?.toNum ??
      0;

  num calculateCreationFeeTotalNairaFee(List<Envs> envs,
      {bool isFunding = false, double amount = 0}) {
    final nairaCardCreationFee = _returnFee(Fees.nairaCardCreationFee);
    final sudoVerveNairaCardCreationFee =
        _returnFee(Fees.sudoVerveNairaCardCreationFee);
    final sudoVerveNairaCardFundingFee =
        _returnFee(Fees.sudoVerveNairaCardFundingFee);
    final nairaCardFundingFee = _returnFee(Fees.nairaCardFundingFee);

    if (isFunding) {
      return sudoVerveNairaCardFundingFee +
          ((nairaCardFundingFee / 100) * amount);
    }

    return nairaCardCreationFee +
        sudoVerveNairaCardCreationFee +
        sudoVerveNairaCardFundingFee +
        ((nairaCardFundingFee / 100) * amount);
  }

  num calculateCreationFeeTotalDollarFee(List<Envs> envs,
      {bool isFunding = false, double amount = 0}) {
    final dollarCardCreationFee = _returnFee(Fees.dollarCardCreationFee);
    final dollarCardFundingFee = _returnFee(Fees.dollarCardFundingFee);
    final sudoDollarCardFundingFee = _returnFee(Fees.sudoDollarCardFundingFee);
    final sudoDollarCardCreationfee =
        _returnFee(Fees.sudoDollarCardCreationfee);

    if (isFunding) {
      return sudoDollarCardFundingFee + ((dollarCardFundingFee / 100) * amount);
    }

    return dollarCardCreationFee +
        ((dollarCardFundingFee / 100) * amount) +
        sudoDollarCardFundingFee +
        sudoDollarCardCreationfee;
  }

  void navigateToDetails(Cards card) {
    ref.read(paramModule.notifier).setCardDetails(card);
    PageRouter.pushNamed(Routes.virtualCardDetailView);
  }

  void navigateToFundCard() {
    ref
        .read(paramModule.notifier)
        .setCardActivityType(CardActivityType.funding);
    PageRouter.pushNamed(Routes.cardCalculatorView);
  }

  void triggerDetails() =>
      BottomSheets.showSheet(child: const CardDetailsSheet());

  Future<void> triggerManageCard() async =>
      await BottomSheets.showSheet(child: const ManageCardSheet());

  Future<void> getSudoRate(double value, {CancelToken? cancelToken}) async {
    try {
      state = state.copyWith(isGettingFundingFee: true);
      await ref.read(adminNotifierProvider.notifier).getEnvs(
          parameter: AdminDto(amount: value), cancelToken: cancelToken);
    } catch (e) {
      _logger.e(e);
    } finally {
      state = state.copyWith(isGettingFundingFee: false);
    }
  }
}
