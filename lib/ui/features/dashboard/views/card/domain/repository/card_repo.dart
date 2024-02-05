import 'package:Pouchers/ui/features/dashboard/views/card/domain/model/freeze_card/freeze_card.dart';
import 'package:Pouchers/ui/features/dashboard/views/card/domain/model/fund_virtual_account/fund_virtual_account.dart';
import 'package:Pouchers/ui/features/dashboard/views/card/domain/model/get_card_token/get_card_token.dart';
import 'package:Pouchers/ui/features/dashboard/views/card/domain/model/get_card_transactions/get_card_transactions.dart';
import 'package:Pouchers/ui/features/dashboard/views/card/domain/model/get_exchange_rate/get_exchange_rate.dart';
import 'package:Pouchers/ui/features/dashboard/views/card/domain/model/get_virtual_account/get_virtual_account.dart';
import 'package:Pouchers/ui/features/dashboard/views/card/domain/model/virtual_account_balance/virtual_account_balance.dart';
import 'package:Pouchers/ui/features/dashboard/views/card/domain/model/virtual_card_details/virtual_card_details.dart';
import 'package:dio/dio.dart';

import '../model/cards/cards.dart';
import '../model/created_virtual_card/created_virtual_card.dart';

abstract class CardRepo<T> {
  Future<VirtualCardDetails?> getVirtualCardDetails(
      {required T cardDto, CancelToken? cancelToken});

  Future<CreatedVirtualCard?> createNairaVirtualCard(
      {required T cardDto, CancelToken? cancelToken});

  Future<CreatedVirtualCard?> createDollarVirtualCard(
      {required T cardDto, CancelToken? cancelToken});

  Future<VirtualAccountBalance?> getAccountBalance(
      {required T cardDto, CancelToken? cancelToken});

  Future<GetVirtualAccount?> getVirtualAccout(
      {required T cardDto, CancelToken? cancelToken});

  Future<FundVirtualAccount?> fundVirtualCard(
      {required T cardDto, CancelToken? cancelToken});

  Future<FreezeCard?> freezeCard(
      {required T cardDto, CancelToken? cancelToken});

  Future<GetCardTransactions?> getCardTransactions(
      {required T cardDto, CancelToken? cancelToken});

  Future<List<Cards>?> getCards({required T cardDto, CancelToken? cancelToken});

  Future<GetCardToken?> getCardToken(
      {required T cardDto, CancelToken? cancelToken});

  Future<GetExchangeRate?> getExchangeRate(
      {required T cardDto, CancelToken? cancelToken});
}
