import 'package:Pouchers/ui/features/dashboard/views/card/domain/dto/card_dto.dart';
import 'package:Pouchers/ui/features/dashboard/views/card/domain/usecase/module/module.dart';
import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../domain/model/created_virtual_card/created_virtual_card.dart';
import '../../../domain/model/freeze_card/freeze_card.dart';
import '../../../domain/model/fund_virtual_account/fund_virtual_account.dart';
import '../../../domain/model/get_card/get_cards.dart';
import '../../../domain/model/get_card_token/get_card_token.dart';
import '../../../domain/model/get_card_transactions/get_card_transactions.dart';
import '../../../domain/model/get_exchange_rate/get_exchange_rate.dart';
import '../../../domain/model/get_virtual_account/get_virtual_account.dart';
import '../../../domain/model/virtual_account_balance/virtual_account_balance.dart';
import '../../../domain/model/virtual_card_details/virtual_card_details.dart';

part 'module.g.dart';

@riverpod
Future<VirtualCardDetails?> getVirtualCardDetails(GetVirtualCardDetailsRef ref,
        {required CardDto parameter, CancelToken? cancelToken}) async =>
    await ref
        .read(getVirtualCardDetailsUseCaseModule)
        .execute(parameter: parameter, cancelToken: cancelToken);

@riverpod
Future<CreatedVirtualCard?> createNairaVirtualCard(
        CreateNairaVirtualCardRef ref,
        {required CardDto parameter,
        CancelToken? cancelToken}) async =>
    await ref
        .read(createNairaVirtualCardUseCaseModule)
        .execute(parameter: parameter, cancelToken: cancelToken);

@riverpod
Future<CreatedVirtualCard?> createDollarVirtualCard(
        CreateDollarVirtualCardRef ref,
        {required CardDto parameter,
        CancelToken? cancelToken}) async =>
    await ref
        .read(createDollarVirtualCardUseCaseModule)
        .execute(parameter: parameter, cancelToken: cancelToken);

@riverpod
Future<VirtualAccountBalance?> getAccountBalance(GetAccountBalanceRef ref,
        {required CardDto parameter, CancelToken? cancelToken}) async =>
    await ref
        .read(getAccountBalanceUseCaseModule)
        .execute(parameter: parameter, cancelToken: cancelToken);

@riverpod
Future<GetVirtualAccount?> getVirtualAccout(GetVirtualAccoutRef ref,
        {required CardDto parameter, CancelToken? cancelToken}) async =>
    await ref
        .read(getVirtualAccountUseCaseModule)
        .execute(parameter: parameter, cancelToken: cancelToken);

@riverpod
Future<FundVirtualAccount?> fundVirtualCard(FundVirtualCardRef ref,
        {required CardDto parameter, CancelToken? cancelToken}) async =>
    await ref
        .read(getFundVirtualAccountUseCaseModule)
        .execute(parameter: parameter, cancelToken: cancelToken);

@riverpod
Future<FreezeCard?> freezeCard(FreezeCardRef ref,
        {required CardDto parameter, CancelToken? cancelToken}) async =>
    await ref
        .read(getFreezedCardUseCaseModule)
        .execute(parameter: parameter, cancelToken: cancelToken);

@riverpod
Future<GetCardTransactions?> getCardTransactions(GetCardTransactionsRef ref,
        {required CardDto parameter, CancelToken? cancelToken}) async =>
    await ref
        .read(getCardTransactionUseCaseModule)
        .execute(parameter: parameter, cancelToken: cancelToken);

@riverpod
Future<GetCards?> getCards(GetCardsRef ref,
        {required CardDto parameter, CancelToken? cancelToken}) async =>
    await ref
        .read(getCardsUseCaseModule)
        .execute(parameter: parameter, cancelToken: cancelToken);

@riverpod
Future<GetCardToken?> getCardToken(GetCardTokenRef ref,
        {required CardDto parameter, CancelToken? cancelToken}) async =>
    await ref
        .read(getCardTokenUseCaseModule)
        .execute(parameter: parameter, cancelToken: cancelToken);

@riverpod
Future<GetExchangeRate?> getExchangeRate(GetExchangeRateRef ref,
        {required CardDto parameter, CancelToken? cancelToken}) async =>
    await ref
        .read(getExchangeRateUseCaseModule)
        .execute(parameter: parameter, cancelToken: cancelToken);
