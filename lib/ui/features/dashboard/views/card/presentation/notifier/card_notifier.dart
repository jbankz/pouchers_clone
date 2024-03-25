import 'package:pouchers/ui/common/app_strings.dart';
import 'package:pouchers/ui/features/admin/domain/enum/fees.dart';
import 'package:pouchers/ui/features/dashboard/views/card/data/dao/card_dao.dart';
import 'package:pouchers/ui/features/dashboard/views/card/domain/dto/card_dto.dart';
import 'package:pouchers/ui/features/dashboard/views/card/domain/enum/card_activity_type.dart';
import 'package:pouchers/ui/features/dashboard/views/card/presentation/notifier/module/module.dart';
import 'package:pouchers/ui/notification/notification_tray.dart';
import 'package:collection/collection.dart';
import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../../../app/app.logger.dart';
import '../../../../../../../app/app.router.dart';
import '../../../../../../../app/core/router/page_router.dart';
import '../../../../../../widgets/dialog/bottom_sheet.dart';
import '../../../../../admin/domain/model/envs/envs.dart';
import '../../../../../profile/data/dao/user_dao.dart';
import '../../domain/model/cards/cards.dart';
import '../../domain/model/get_card_transactions/datum.dart';
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
  List<Datum> _transactions = [];

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
      state = state.copyWith(isGettingCardTransactions: true);

      final getCardTransactions = await ref.read(getCardTransactionsProvider
          .call(parameter: parameter, cancelToken: cancelToken)
          .future);
      _transactions = getCardTransactions?.data ?? [];
    } catch (e) {
      _logger.e(e.toString());
    }
    state = state.copyWith(
        isGettingCardTransactions: false, transactions: _transactions);
  }

  Future<void> getCards(CardDto cardDto, [CancelToken? cancelToken]) async {
    try {
      state = state.copyWith(isBusy: cardsDao.cards.isEmpty);

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

      _exchangeRate = await ref.read(getExchangeRateProvider
          .call(parameter: parameter, cancelToken: cancelToken)
          .future);
    } catch (e) {
      _logger.e(e.toString());
    }
    state = state.copyWith(isBusy: false, exchangeRate: _exchangeRate);
  }

  num calculateTotalNairaFee(List<Envs> envs) {
    final Envs? creationFee =
        envs.firstWhereOrNull((env) => env.name == Fees.nairaCardCreationFee);

    final Envs? sudoVerveFee = envs.firstWhereOrNull(
        (env) => env.name == Fees.sudoVerveNairaCardCreationFee);

    final Envs? fundingFee =
        envs.firstWhereOrNull((env) => env.name == Fees.nairaCardFundingFee);

    return ((num.parse(creationFee?.value ?? '0')) +
        (num.parse(sudoVerveFee?.value ?? '0')) +
        (num.parse(fundingFee?.value ?? '0')));
  }

  num calculateTotalDollarFee(List<Envs> envs) {
    final Envs? creationFee =
        envs.firstWhereOrNull((env) => env.name == Fees.dollarCardCreationFee);

    final Envs? sudoCreationFee = envs
        .firstWhereOrNull((env) => env.name == Fees.sudoDollarCardCreationfee);

    final Envs? fundingFee =
        envs.firstWhereOrNull((env) => env.name == Fees.dollarCardFundingFee);

    return ((num.parse(creationFee?.value ?? '0')) +
        (num.parse(sudoCreationFee?.value ?? '0')) +
        (num.parse(fundingFee?.value ?? '0')));
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
}
