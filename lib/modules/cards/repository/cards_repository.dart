import 'package:Pouchers/ui/features/profile/data/dao/user_dao.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:Pouchers/app/helpers/network_helpers.dart';
import 'package:Pouchers/app/helpers/notifiers.dart';
import 'package:Pouchers/app/helpers/service_response.dart';
import 'package:Pouchers/app/helpers/session_manager.dart';
import 'package:Pouchers/modules/cards/model/cards_model.dart';
import 'package:Pouchers/modules/cards/service/cards_service.dart';
import 'package:Pouchers/modules/login/models/login_response.dart';
import 'package:Pouchers/utils/strings.dart';

final cardsRepoProvider =
    Provider.autoDispose<CardsRepository>((ref) => CardsRepository(ref));

class CardsRepository {
  final ProviderRef ref;

  CardsRepository(this.ref);

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
    HiveStoreResponseData userProfile = Hive.box(kUserBox).get(kUserInfoKey);
    createCard = await CardsService.createVirtualCard(
      // address: address,
      token: userProfile.token!,
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
      HiveStoreResponseData userProfiles = Hive.box(kUserBox).get(kUserInfoKey);
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
    // HiveStoreResponseData userProfile = Hive.box(kUserBox).get(kUserInfoKey);
    final userProfile = userDao.returnUser(userDao.box);

    print("access Token ${userProfile.token}");
    print("refresh Token ${userProfile.refreshToken}");
    cardsResponse = await CardsService.getAllVirtualCards(
        token: userProfile.token!, userId: userProfile.userId!);
    if (cardsResponse.notAuthenticated) {
      await refreshToken(refreshToken: userProfile.refreshToken!);
      HiveStoreResponseData userProfiles = Hive.box(kUserBox).get(kUserInfoKey);
      cardsResponse = await CardsService.getAllVirtualCards(
          token: userProfiles.token!, userId: userProfiles.userId!);
    }
    print("cardsResponse${cardsResponse.notAuthenticated}");
    return cardsResponse.toNotifierState();
  }

  Future<NotifierState<FetchEnvs>> getAllFees({required double amount}) async {
    ServiceResponse<FetchEnvs> fetchEnv;
    // HiveStoreResponseData userProfile = Hive.box(kUserBox).get(kUserInfoKey);
    final userProfile = userDao.returnUser(userDao.box);
    fetchEnv = await CardsService.getAllFees(
        token: userProfile.token!, amount: amount);

    if (fetchEnv.notAuthenticated) {
      await refreshToken(refreshToken: userProfile.refreshToken!);
      HiveStoreResponseData userProfiles = Hive.box(kUserBox).get(kUserInfoKey);
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
    HiveStoreResponseData userProfile = Hive.box(kUserBox).get(kUserInfoKey);
    fundCard = await CardsService.fundVirtualCard(
      type: type,
      token: userProfile.token!,
      amount: amount,
      transactionPin: transactionPin,
    );

    if (fundCard.notAuthenticated) {
      await refreshToken(refreshToken: userProfile.refreshToken!);
      HiveStoreResponseData userProfiles = Hive.box(kUserBox).get(kUserInfoKey);
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
    HiveStoreResponseData userProfile = Hive.box(kUserBox).get(kUserInfoKey);
    cardDetails = await CardsService.getCardDetails(
        token: userProfile.token!, cardId: cardId);

    if (cardDetails.notAuthenticated) {
      await refreshToken(refreshToken: userProfile.refreshToken!);
      HiveStoreResponseData userProfiles = Hive.box(kUserBox).get(kUserInfoKey);
      cardDetails = await CardsService.getCardDetails(
          token: userProfiles.token!, cardId: cardId);
    }
    return cardDetails.toNotifierState();
  }

  Future<NotifierState<String>> getCardToken({required cardId}) async {
    ServiceResponse<String> getCardToken;
    HiveStoreResponseData userProfile = Hive.box(kUserBox).get(kUserInfoKey);
    getCardToken = await CardsService.getCardToken(
        token: userProfile.token!, cardId: cardId);

    if (getCardToken.notAuthenticated) {
      await refreshToken(refreshToken: userProfile.refreshToken!);
      HiveStoreResponseData userProfiles = Hive.box(kUserBox).get(kUserInfoKey);
      getCardToken = await CardsService.getCardToken(
          token: userProfiles.token!, cardId: cardId);
    }
    return getCardToken.toNotifierState();
  }

  Future<NotifierState<String>> getCardBalance({required cardId}) async {
    ServiceResponse<String> cardBalance;
    HiveStoreResponseData userProfile = Hive.box(kUserBox).get(kUserInfoKey);
    cardBalance = await CardsService.getCardBalance(
        token: userProfile.token!, cardId: cardId);

    if (cardBalance.notAuthenticated) {
      await refreshToken(refreshToken: userProfile.refreshToken!);
      HiveStoreResponseData userProfiles = Hive.box(kUserBox).get(kUserInfoKey);
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
    HiveStoreResponseData userProfile = Hive.box(kUserBox).get(kUserInfoKey);
    freeze = await CardsService.freezeCard(
        token: userProfile.token!,
        cardId: cardId,
        transactionPin: transactionPin,
        type: type);

    if (freeze.notAuthenticated) {
      await refreshToken(refreshToken: userProfile.refreshToken!);
      HiveStoreResponseData userProfiles = Hive.box(kUserBox).get(kUserInfoKey);
      freeze = await CardsService.freezeCard(
          token: userProfiles.token!,
          cardId: cardId,
          transactionPin: transactionPin,
          type: type);
    }
    return freeze.toNotifierState();
  }
}
