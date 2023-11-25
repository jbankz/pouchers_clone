import 'package:Pouchers/app/core/network/network_service.dart';
import 'package:Pouchers/ui/features/dashboard/views/card/domain/dto/card_dto.dart';
import 'package:Pouchers/ui/features/dashboard/views/card/domain/model/created_virtual_card/created_virtual_card.dart';
import 'package:Pouchers/ui/features/dashboard/views/card/domain/model/freeze_card/freeze_card.dart';
import 'package:Pouchers/ui/features/dashboard/views/card/domain/model/fund_virtual_account/fund_virtual_account.dart';
import 'package:Pouchers/ui/features/dashboard/views/card/domain/model/get_card/get_cards.dart';
import 'package:Pouchers/ui/features/dashboard/views/card/domain/model/get_card_token/get_card_token.dart';
import 'package:Pouchers/ui/features/dashboard/views/card/domain/model/get_card_transactions/get_card_transactions.dart';
import 'package:Pouchers/ui/features/dashboard/views/card/domain/model/get_exchange_rate/get_exchange_rate.dart';
import 'package:Pouchers/ui/features/dashboard/views/card/domain/model/get_virtual_account/get_virtual_account.dart';
import 'package:Pouchers/ui/features/dashboard/views/card/domain/model/virtual_account_balance/virtual_account_balance.dart';
import 'package:Pouchers/ui/features/dashboard/views/card/domain/model/virtual_card_details/virtual_card_details.dart';
import 'package:dio/dio.dart';

import '../../../../../../../app/core/network/api_path.dart';
import 'card_source.dart';

class CardSourceImpl implements CardSource<CardDto> {
  final NetworkService networkService;

  CardSourceImpl({required this.networkService});

  @override
  Future<CreatedVirtualCard?> createDollarVirtualCard(
      {required CardDto cardDto, CancelToken? cancelToken}) async {
    final response = await networkService.request(
        path: ApiPath.createDollarVirtualCard,
        requestType: RequestType.post,
        data: cardDto.toJson(),
        cancelToken: cancelToken);
    return CreatedVirtualCard.fromJson(response.data as Map<String, dynamic>);
  }

  @override
  Future<CreatedVirtualCard?> createNairaVirtualCard(
      {required CardDto cardDto, CancelToken? cancelToken}) async {
    final response = await networkService.request(
        path: ApiPath.createNairaVirtualCard,
        requestType: RequestType.post,
        data: cardDto.toJson(),
        cancelToken: cancelToken);
    return CreatedVirtualCard.fromJson(response.data as Map<String, dynamic>);
  }

  @override
  Future<FreezeCard?> freezeCard(
      {required CardDto cardDto, CancelToken? cancelToken}) async {
    final response = await networkService.request(
        path: ApiPath.freezeCard,
        requestType: RequestType.patch,
        data: cardDto.toJson(),
        cancelToken: cancelToken);
    return FreezeCard.fromJson(response.data as Map<String, dynamic>);
  }

  @override
  Future<FundVirtualAccount?> fundVirtualCard(
      {required CardDto cardDto, CancelToken? cancelToken}) async {
    final response = await networkService.request(
        path: ApiPath.fundVirtualCard,
        requestType: RequestType.patch,
        data: cardDto.toJson(),
        cancelToken: cancelToken);
    return FundVirtualAccount.fromJson(response.data as Map<String, dynamic>);
  }

  @override
  Future<VirtualAccountBalance?> getAccountBalance(
      {required CardDto cardDto, CancelToken? cancelToken}) async {
    final response = await networkService.request(
        path: ApiPath.balance,
        requestType: RequestType.get,
        cancelToken: cancelToken);
    return VirtualAccountBalance.fromJson(
        response.data as Map<String, dynamic>);
  }

  @override
  Future<GetCardToken?> getCardToken(
      {required CardDto cardDto, CancelToken? cancelToken}) async {
    final response = await networkService.request(
        path: '${ApiPath.token}/_/token',
        requestType: RequestType.get,
        cancelToken: cancelToken);
    return GetCardToken.fromJson(response.data as Map<String, dynamic>);
  }

  @override
  Future<GetCardTransactions?> getCardTransactions(
      {required CardDto cardDto, CancelToken? cancelToken}) async {
    final response = await networkService.request(
        path: '${ApiPath.transactions}/_/transactions',
        requestType: RequestType.get,
        cancelToken: cancelToken);
    return GetCardTransactions.fromJson(response.data as Map<String, dynamic>);
  }

  @override
  Future<GetCards?> getCards(
      {required CardDto cardDto, CancelToken? cancelToken}) async {
    final response = await networkService.request(
        path: '${ApiPath.cards}/${cardDto.userId}/all',
        requestType: RequestType.get,
        cancelToken: cancelToken);
    return GetCards.fromJson(response.data as Map<String, dynamic>);
  }

  @override
  Future<GetExchangeRate?> getExchangeRate(
      {required CardDto cardDto, CancelToken? cancelToken}) async {
    final response = await networkService.request(
        path: ApiPath.rate,
        requestType: RequestType.get,
        cancelToken: cancelToken);
    return GetExchangeRate.fromJson(
        response.data?['data'] as Map<String, dynamic>);
  }

  @override
  Future<GetVirtualAccount?> getVirtualAccout(
      {required CardDto cardDto, CancelToken? cancelToken}) async {
    final response = await networkService.request(
        path: ApiPath.virtualAccount,
        requestType: RequestType.get,
        cancelToken: cancelToken);
    return GetVirtualAccount.fromJson(response.data as Map<String, dynamic>);
  }

  @override
  Future<VirtualCardDetails?> getVirtualCardDetails(
      {required CardDto cardDto, CancelToken? cancelToken}) async {
    final response = await networkService.request(
        path: '${ApiPath.cards}/',
        requestType: RequestType.get,
        cancelToken: cancelToken);
    return VirtualCardDetails.fromJson(response.data as Map<String, dynamic>);
  }
}
