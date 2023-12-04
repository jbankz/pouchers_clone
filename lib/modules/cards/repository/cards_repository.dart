import 'package:Pouchers/ui/features/profile/data/dao/user_dao.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:Pouchers/app/helpers/network_helpers.dart';
import 'package:Pouchers/app/helpers/notifiers.dart';
import 'package:Pouchers/app/helpers/service_response.dart';
import 'package:Pouchers/modules/cards/model/cards_model.dart';
import 'package:Pouchers/modules/cards/service/cards_service.dart';
import 'package:Pouchers/modules/login/models/login_response.dart';
import 'package:Pouchers/utils/strings.dart';

import '../../../app/app.locator.dart';
import '../../../app/core/manager/session_manager.dart';

final cardsRepoProvider =
    Provider.autoDispose<CardsRepository>((ref) => CardsRepository(ref));

class CardsRepository {
  final ProviderRef ref;

  CardsRepository(this.ref);

  static final session = locator<SessionManager>();

  Future<NotifierState<String>> createVirtualCards(
      {
      //   required String address,
      // required String city,
      // required String state,
      required String country,
      // required String postalCode,
      required String currency,
      required String bvn,
      required double amount,
      required String brand,
      required String transactionPin}) async {
    ServiceResponse<String> createCard;
    final userProfile = userDao.returnUser(userDao.box);
    createCard = await CardsService.createVirtualCard(
      // address: address,
      token: session.accessToken,
      amount: amount,
      transactionPin: transactionPin,
      bvn: bvn,
      // city: city,
      country: country,
      brand: brand,
      currency: currency,
      // postalCode: postalCode,
      // state: state
    );
    if (createCard.notAuthenticated) {
      await refreshToken(refreshToken: userProfile.refreshToken!);
      final userProfiles = userDao.returnUser(userDao.box);
      createCard = await CardsService.createVirtualCard(
        // address: address,
        token: userProfiles.token!,
        amount: amount,
        transactionPin: transactionPin,
        bvn: bvn,
        // city: city,
        country: country,
        brand: brand,
        currency: currency,
        // postalCode: postalCode,
        // state: state
      );
    }
    return createCard.toNotifierState();
  }

  Future<NotifierState<GetAllCardsResponse>> getAllVirtualCards() async {
    ServiceResponse<GetAllCardsResponse> cardsResponse;
    final userProfile = userDao.returnUser(userDao.box);
    print("access Token ${userProfile.token}");
    print("refresh Token ${userProfile.refreshToken}");
    cardsResponse = await CardsService.getAllVirtualCards(
        token: session.accessToken, userId: userProfile.userId!);
    if (cardsResponse.notAuthenticated) {
      await refreshToken(refreshToken: userProfile.refreshToken!);
      final userProfiles = userDao.returnUser(userDao.box);
      cardsResponse = await CardsService.getAllVirtualCards(
          token: userProfiles.token!, userId: userProfiles.userId!);
    }
    print("cardsResponse${cardsResponse.notAuthenticated}");
    return cardsResponse.toNotifierState();
  }

  Future<NotifierState<FetchEnvs>> getAllFees({required double amount}) async {
    ServiceResponse<FetchEnvs> fetchEnv;
    // final userProfile = userDao.returnUser(userDao.box);
    final userProfile = userDao.returnUser(userDao.box);
    fetchEnv = await CardsService.getAllFees(
        token: session.accessToken, amount: amount);

    if (fetchEnv.notAuthenticated) {
      await refreshToken(refreshToken: userProfile.refreshToken!);
      final userProfiles = userDao.returnUser(userDao.box);
      fetchEnv = await CardsService.getAllFees(
          token: userProfiles.token!, amount: amount);
    }
    return fetchEnv.toNotifierState();
  }

  Future<NotifierState<String>> fundVirtualCard(
      {required String type,
      required double amount,
      required String transactionPin}) async {
    ServiceResponse<String> fundCard;
    final userProfile = userDao.returnUser(userDao.box);
    fundCard = await CardsService.fundVirtualCard(
      type: type,
      token: session.accessToken,
      amount: amount,
      transactionPin: transactionPin,
    );

    if (fundCard.notAuthenticated) {
      await refreshToken(refreshToken: userProfile.refreshToken!);
      final userProfiles = userDao.returnUser(userDao.box);
      fundCard = await CardsService.fundVirtualCard(
        type: type,
        token: userProfiles.token!,
        amount: amount,
        transactionPin: transactionPin,
      );
    }
    return fundCard.toNotifierState();
  }

  Future<NotifierState<GetCardDetailsResponse>> getCardDetails(
      {required cardId}) async {
    ServiceResponse<GetCardDetailsResponse> cardDetails;
    final userProfile = userDao.returnUser(userDao.box);
    cardDetails = await CardsService.getCardDetails(
        token: session.accessToken, cardId: cardId);

    if (cardDetails.notAuthenticated) {
      await refreshToken(refreshToken: userProfile.refreshToken!);
      final userProfiles = userDao.returnUser(userDao.box);
      cardDetails = await CardsService.getCardDetails(
          token: userProfiles.token!, cardId: cardId);
    }
    return cardDetails.toNotifierState();
  }

  Future<NotifierState<String>> getCardToken({required cardId}) async {
    ServiceResponse<String> getCardToken;
    final userProfile = userDao.returnUser(userDao.box);
    getCardToken = await CardsService.getCardToken(
        token: session.accessToken, cardId: cardId);

    if (getCardToken.notAuthenticated) {
      await refreshToken(refreshToken: userProfile.refreshToken!);
      final userProfiles = userDao.returnUser(userDao.box);
      getCardToken = await CardsService.getCardToken(
          token: userProfiles.token!, cardId: cardId);
    }
    return getCardToken.toNotifierState();
  }

  Future<NotifierState<String>> getCardBalance({required cardId}) async {
    ServiceResponse<String> cardBalance;
    final userProfile = userDao.returnUser(userDao.box);
    cardBalance = await CardsService.getCardBalance(
        token: session.accessToken, cardId: cardId);

    if (cardBalance.notAuthenticated) {
      await refreshToken(refreshToken: userProfile.refreshToken!);
      final userProfiles = userDao.returnUser(userDao.box);
      cardBalance = await CardsService.getCardBalance(
          token: userProfiles.token!, cardId: cardId);
    }
    return cardBalance.toNotifierState();
  }

  Future<NotifierState<String>> freezeCard(
      {required String cardId,
      required String type,
      required String transactionPin}) async {
    ServiceResponse<String> freeze;
    final userProfile = userDao.returnUser(userDao.box);
    freeze = await CardsService.freezeCard(
        token: session.accessToken,
        cardId: cardId,
        transactionPin: transactionPin,
        type: type);

    if (freeze.notAuthenticated) {
      await refreshToken(refreshToken: userProfile.refreshToken!);
      final userProfiles = userDao.returnUser(userDao.box);
      freeze = await CardsService.freezeCard(
          token: userProfiles.token!,
          cardId: cardId,
          transactionPin: transactionPin,
          type: type);
    }
    return freeze.toNotifierState();
  }
}
