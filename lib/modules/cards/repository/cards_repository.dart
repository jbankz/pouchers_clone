import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pouchers/app/helpers/network_helpers.dart';
import 'package:pouchers/app/helpers/notifiers.dart';
import 'package:pouchers/modules/cards/model/cards_model.dart';
import 'package:pouchers/modules/cards/service/cards_service.dart';
import 'package:pouchers/modules/login/models/login_response.dart';
import 'package:pouchers/utils/strings.dart';

final cardsRepoProvider =
    Provider.autoDispose<CardsRepository>((ref) => CardsRepository(ref));

class CardsRepository {
  final ProviderRef ref;

  CardsRepository(this.ref);

  Future<NotifierState<String>> createVirtualCards(
      {required String address,
      required String city,
      required String state,
      required String country,
      required String postalCode,
      required String currency,
      required String bvn,
      required double amount,
        required String brand,
      required String transactionPin}) async {
    final accessToken = await getAccessToken();
    return (await CardsService.createVirtualCard(
            address: address,
            token: accessToken!,
            amount: amount,
            transactionPin: transactionPin,
            bvn: bvn,
            city: city,
            country: country,
            brand: brand,
            currency: currency,
            postalCode: postalCode,
            state: state))
        .toNotifierState();
  }

  Future<NotifierState<GetAllCardsResponse>> getAllVirtualCards() async {
    final accessToken = await getAccessToken();
    HiveStoreResponseData userProfile = Hive.box(kUserBox).get(kUserInfoKey);

    return (await CardsService.getAllVirtualCards(
            token: accessToken!, userId: userProfile.userId!))
        .toNotifierState();
  }

  Future<NotifierState<FetchEnvs>> getAllFees({required double amount}) async {
    final accessToken = await getAccessToken();

    return (await CardsService.getAllFees(token: accessToken!, amount: amount))
        .toNotifierState();
  }

  Future<NotifierState<String>> fundVirtualCard(
      {required String type,
      required double amount,
      required String transactionPin}) async {
    final accessToken = await getAccessToken();
    return (await CardsService.fundVirtualCard(
      type: type,
      token: accessToken!,
      amount: amount,
      transactionPin: transactionPin,
    ))
        .toNotifierState();
  }

  Future<NotifierState<GetCardDetailsResponse>> getCardDetails(
      {required cardId}) async {
    final accessToken = await getAccessToken();

    return (await CardsService.getCardDetails(
            token: accessToken!, cardId: cardId))
        .toNotifierState();
  }

  Future<NotifierState<String>> getCardToken({required cardId}) async {
    final accessToken = await getAccessToken();

    return (await CardsService.getCardToken(
            token: accessToken!, cardId: cardId))
        .toNotifierState();
  }

  Future<NotifierState<int>> getCardBalance({required cardId}) async {
    final accessToken = await getAccessToken();

    return (await CardsService.getCardBalance(
        token: accessToken!, cardId: cardId))
        .toNotifierState();
  }

  Future<NotifierState<String>> freezeCard(
      {required String cardId,
      required String type,
      required String transactionPin}) async {
    final accessToken = await getAccessToken();

    return (await CardsService.freezeCard(
            token: accessToken!,
            cardId: cardId,
            transactionPin: transactionPin,
            type: type))
        .toNotifierState();
  }
}
