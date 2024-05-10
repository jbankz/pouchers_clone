import 'package:pouchers/ui/features/dashboard/views/card/data/dao/card_dao.dart';
import 'package:pouchers/ui/features/dashboard/views/card/data/source/card_source.dart';
import 'package:pouchers/ui/features/dashboard/views/card/domain/model/created_virtual_card/created_virtual_card.dart';
import 'package:pouchers/ui/features/dashboard/views/card/domain/model/freeze_card/freeze_card.dart';
import 'package:pouchers/ui/features/dashboard/views/card/domain/model/fund_virtual_account/fund_virtual_account.dart';
import 'package:pouchers/ui/features/dashboard/views/card/domain/model/get_card_token/get_card_token.dart';
import 'package:pouchers/ui/features/dashboard/views/card/domain/model/get_card_transactions/get_card_transactions.dart';
import 'package:pouchers/ui/features/dashboard/views/card/domain/model/get_exchange_rate/get_exchange_rate.dart';
import 'package:pouchers/ui/features/dashboard/views/card/domain/model/get_virtual_account/get_virtual_account.dart';
import 'package:pouchers/ui/features/dashboard/views/card/domain/model/virtual_account_balance/virtual_account_balance.dart';
import 'package:pouchers/ui/features/dashboard/views/card/domain/model/virtual_card_details/virtual_card_details.dart';
import 'package:pouchers/ui/features/dashboard/views/card/domain/repository/card_repo.dart';
import 'package:dio/dio.dart';

import '../../domain/dto/card_dto.dart';
import '../../domain/model/cards/cards.dart';

class CardRepoImpl implements CardRepo<CardDto> {
  final CardSource _cardSource;

  CardRepoImpl(this._cardSource);

  @override
  Future<CreatedVirtualCard?> createDollarVirtualCard(
          {required CardDto cardDto, CancelToken? cancelToken}) async =>
      await _cardSource.createDollarVirtualCard(
          cardDto: cardDto, cancelToken: cancelToken);

  @override
  Future<CreatedVirtualCard?> createNairaVirtualCard(
          {required CardDto cardDto, CancelToken? cancelToken}) async =>
      await _cardSource.createNairaVirtualCard(
          cardDto: cardDto, cancelToken: cancelToken);

  @override
  Future<FreezeCard?> freezeCard(
          {required CardDto cardDto, CancelToken? cancelToken}) async =>
      await _cardSource.freezeCard(cardDto: cardDto, cancelToken: cancelToken);

  @override
  Future<FundVirtualAccount?> fundVirtualCard(
          {required CardDto cardDto, CancelToken? cancelToken}) async =>
      await _cardSource.fundVirtualCard(
          cardDto: cardDto, cancelToken: cancelToken);

  @override
  Future<VirtualAccountBalance?> getAccountBalance(
          {required CardDto cardDto, CancelToken? cancelToken}) async =>
      await _cardSource.getAccountBalance(
          cardDto: cardDto, cancelToken: cancelToken);

  @override
  Future<GetCardToken?> getCardToken(
          {required CardDto cardDto, CancelToken? cancelToken}) async =>
      await _cardSource.getCardToken(
          cardDto: cardDto, cancelToken: cancelToken);

  @override
  Future<GetCardTransactions?> getCardTransactions(
          {required CardDto cardDto, CancelToken? cancelToken}) async =>
      await _cardSource.getCardTransactions(
          cardDto: cardDto, cancelToken: cancelToken);

  @override
  Future<List<Cards>?> getCards(
      {required CardDto cardDto, CancelToken? cancelToken}) async {
    final cards =
        await _cardSource.getCards(cardDto: cardDto, cancelToken: cancelToken);
    cardsDao.saveCards(cards ?? []);
    return cards;
  }

  @override
  Future<GetExchangeRate?> getExchangeRate(
          {required CardDto cardDto, CancelToken? cancelToken}) async =>
      await _cardSource.getExchangeRate(
          cardDto: cardDto, cancelToken: cancelToken);

  @override
  Future<GetVirtualAccount?> getVirtualAccout(
          {required CardDto cardDto, CancelToken? cancelToken}) async =>
      await _cardSource.getVirtualAccout(
          cardDto: cardDto, cancelToken: cancelToken);

  @override
  Future<VirtualCardDetails?> getVirtualCardDetails(
          {required CardDto cardDto, CancelToken? cancelToken}) async =>
      await _cardSource.getVirtualCardDetails(
          cardDto: cardDto, cancelToken: cancelToken);
}
