import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:Pouchers/app/helpers/response_handler.dart';
import 'package:Pouchers/modules/cards/model/cards_model.dart';
import 'package:Pouchers/modules/cards/repository/cards_repository.dart';

import '../../../app/helpers/notifiers.dart';

final createVirtualCardProvider = StateNotifierProvider.autoDispose<
    CreateVirtualCardNotifier, NotifierState<String>>((ref) {
  return CreateVirtualCardNotifier(ref.read(cardsRepoProvider));
});

final getAllVirtualCardProvider = StateNotifierProvider.autoDispose<
    GetAllVirtualCardNotifier, NotifierState<GetAllCardsResponse>>((ref) {
  return GetAllVirtualCardNotifier(ref.read(cardsRepoProvider));
});

final getAllFeesProvider =
    StateNotifierProvider<GetAllFeesNotifier, NotifierState<FetchEnvs>>((ref) {
  return GetAllFeesNotifier(ref.read(cardsRepoProvider));
});

final fundVirtualCardProvider = StateNotifierProvider.autoDispose<
    FundVirtualCardNotifier, NotifierState<String>>((ref) {
  return FundVirtualCardNotifier(ref.read(cardsRepoProvider));
});

final getCardDetailsProvider = StateNotifierProvider.autoDispose<
    GetDetailsCardNotifier, NotifierState<GetCardDetailsResponse>>((ref) {
  return GetDetailsCardNotifier(ref.read(cardsRepoProvider));
});

final getCardTokenProvider =
    StateNotifierProvider<GetCardTokenNotifier, NotifierState<String>>((ref) {
  return GetCardTokenNotifier(ref.read(cardsRepoProvider));
});

final freezeCardProvider = StateNotifierProvider.autoDispose<FreezeCardNotifier,
    NotifierState<String>>((ref) {
  return FreezeCardNotifier(ref.read(cardsRepoProvider));
});

final getCardBalanceProvider =
    StateNotifierProvider<GetCardBalanceNotifier, NotifierState<String>>((ref) {
  return GetCardBalanceNotifier(ref.read(cardsRepoProvider));
});

class CreateVirtualCardNotifier extends StateNotifier<NotifierState<String>> {
  final CardsRepository _repo;

  CreateVirtualCardNotifier(this._repo) : super(NotifierState());

  void createVirtualCard(
      {
      //   required String address,
      // required String city,
      // required String residentState,
      required String country,
      // required String postalCode,
      required String currency,
      required String bvn,
      required String brand,
      required double amount,
      required String transactionPin,
      Function()? then}) async {
    state = notifyLoading();
    state = await _repo.createVirtualCards(
        // address: address,
        // city: city,
        // state: residentState,
        country: country,
        // postalCode: postalCode,
        currency: currency,
        brand: brand,
        bvn: bvn,
        amount: amount,
        transactionPin: transactionPin);
    if (state.status == NotifierStatus.done) {
      if (then != null) then();
    }
  }
}

class GetAllVirtualCardNotifier
    extends StateNotifier<NotifierState<GetAllCardsResponse>> {
  final CardsRepository _repo;

  GetAllVirtualCardNotifier(this._repo) : super(NotifierState());

  void getAllVirtualCards({Function()? then}) async {
    state = notifyLoading();
    state = await _repo.getAllVirtualCards();
    if (state.status == NotifierStatus.done) {
      if (then != null) then();
    } else if (state.noAuth) {
      print("nkjgnjkg");
    }
  }
}

class GetAllFeesNotifier extends StateNotifier<NotifierState<FetchEnvs>> {
  final CardsRepository _repo;

  GetAllFeesNotifier(this._repo) : super(NotifierState());

  void getAllFees({required double amount, Function()? then}) async {
    // state = state.data.data!;
    state = notifyLoading();
    //
    state = await _repo.getAllFees(amount: amount);
    if (state.status == NotifierStatus.done) {
      if (then != null) then();
    }
  }
}

class FundVirtualCardNotifier extends StateNotifier<NotifierState<String>> {
  final CardsRepository _repo;

  FundVirtualCardNotifier(this._repo) : super(NotifierState());

  void fundVirtualCard(
      {required String type,
      required double amount,
      required String transactionPin,
      Function()? then}) async {
    state = notifyLoading();
    state = await _repo.fundVirtualCard(
        type: type, amount: amount, transactionPin: transactionPin);
    if (state.status == NotifierStatus.done) {
      if (then != null) then();
    }
  }
}

class GetDetailsCardNotifier
    extends StateNotifier<NotifierState<GetCardDetailsResponse>> {
  final CardsRepository _repo;

  GetDetailsCardNotifier(this._repo) : super(NotifierState());

  void getCardDetails({required cardId, Function()? then}) async {
    state = notifyLoading();
    state = await _repo.getCardDetails(cardId: cardId);
    if (state.status == NotifierStatus.done) {
      if (then != null) then();
    }
  }
}

class GetCardTokenNotifier extends StateNotifier<NotifierState<String>> {
  final CardsRepository _repo;

  GetCardTokenNotifier(this._repo) : super(NotifierState());

  void getCardToken({required cardId, Function()? then}) async {
    state = notifyLoading();
    state = await _repo.getCardToken(cardId: cardId);
    if (state.status == NotifierStatus.done) {
      if (then != null) then();
    }
  }
}

class GetCardBalanceNotifier extends StateNotifier<NotifierState<String>> {
  final CardsRepository _repo;

  GetCardBalanceNotifier(this._repo) : super(NotifierState());

  void getCardBalance({required cardId, Function()? then}) async {
    state = notifyLoading();
    state = await _repo.getCardBalance(cardId: cardId);
    if (state.status == NotifierStatus.done) {
      if (then != null) then();
    }
  }
}

class FreezeCardNotifier extends StateNotifier<NotifierState<String>> {
  final CardsRepository _repo;

  FreezeCardNotifier(this._repo) : super(NotifierState());

  void freezeCard(
      {required String cardId,
      required String type,
      required String transactionPin,
      Function()? then}) async {
    state = notifyLoading();
    state = await _repo.freezeCard(
        cardId: cardId, type: type, transactionPin: transactionPin);
    if (state.status == NotifierStatus.done) {
      if (then != null) then();
    }
  }
}
