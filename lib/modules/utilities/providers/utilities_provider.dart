import 'dart:math';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pouchers/app/helpers/notifiers.dart';
import 'package:pouchers/app/helpers/response_handler.dart';
import 'package:pouchers/modules/utilities/model/utilities_model.dart';
import 'package:pouchers/modules/utilities/repository/utilities_repository.dart';

final buyVoucherProvider = StateNotifierProvider.autoDispose<BuyVoucherNotifier,
    NotifierState<String>>((ref) {
  return BuyVoucherNotifier(ref.read(utilitiesRepoProvider));
});

final fetchVoucherProvider = StateNotifierProvider.autoDispose<
    FetchVoucherNotifier, NotifierState<GetVoucherResponse>>((ref) {
  return FetchVoucherNotifier(ref.read(utilitiesRepoProvider));
});

final giftVoucherProvider = StateNotifierProvider.autoDispose<
    GiftVoucherNotifier, NotifierState<String>>((ref) {
  return GiftVoucherNotifier(ref.read(utilitiesRepoProvider));
});

final redeemVoucherProvider = StateNotifierProvider.autoDispose<
    RedeemVoucherNotifier, NotifierState<String>>((ref) {
  return RedeemVoucherNotifier(ref.read(utilitiesRepoProvider));
});

final getUtilitiesProvider = StateNotifierProvider.autoDispose<
    GetUtilitiesNotifier, NotifierState<GetUtilitiesResponse>>((ref) {
  return GetUtilitiesNotifier(ref.read(utilitiesRepoProvider));
});

final getUtilitiesTypeProvider = StateNotifierProvider.autoDispose<
    GetUtilitiesTypeNotifier, NotifierState<GetUtilitiesTypesResponse>>((ref) {
  return GetUtilitiesTypeNotifier(ref.read(utilitiesRepoProvider));
});

final buyUtilitiesProvider = StateNotifierProvider.autoDispose<
    BuyUtilitiesNotifier, NotifierState<String>>((ref) {
  return BuyUtilitiesNotifier(ref.read(utilitiesRepoProvider));
});

class BuyVoucherNotifier extends StateNotifier<NotifierState<String>>
    with ResponseHandler {
  final UtilitiesRepository _repo;

  BuyVoucherNotifier(this._repo) : super(NotifierState());

  void buyVoucher(
      {required String amount,
      required String transactionPin,
      Function()? then}) async {
    state = notifyLoading();
    state =
        await _repo.buyVoucher(amount: amount, transactionPin: transactionPin);
    if (state.status == NotifierStatus.done) {
      if (then != null) then();
    }
  }
}

class FetchVoucherNotifier
    extends StateNotifier<NotifierState<GetVoucherResponse>>
    with ResponseHandler {
  final UtilitiesRepository _repo;

  FetchVoucherNotifier(this._repo) : super(NotifierState());

  void fetchVoucher({required String status, Function()? then}) async {
    state = notifyLoading();
    state = await _repo.fetchVoucher(status: status);
    if (state.status == NotifierStatus.done) {
      if (then != null) then();
    }
  }
}

class GiftVoucherNotifier extends StateNotifier<NotifierState<String>>
    with ResponseHandler {
  final UtilitiesRepository _repo;

  GiftVoucherNotifier(this._repo) : super(NotifierState());

  void giftVoucher(
      {String? email,
      String? tag,
      required String transactionPin,
      required String code,
      Function()? then}) async {
    state = notifyLoading();
    state = await _repo.giftVoucher(
        email: email, code: code, tag: tag, transactionPin: transactionPin);
    if (state.status == NotifierStatus.done) {
      if (then != null) then();
    }
  }
}

class RedeemVoucherNotifier extends StateNotifier<NotifierState<String>>
    with ResponseHandler {
  final UtilitiesRepository _repo;

  RedeemVoucherNotifier(this._repo) : super(NotifierState());

  void redeemVoucher(
      {required String transactionPin,
      required String code,
      Function()? then}) async {
    state = notifyLoading();
    state =
        await _repo.redeemVoucher(code: code, transactionPin: transactionPin);
    if (state.status == NotifierStatus.done) {
      if (then != null) then();
    }
  }
}

class GetUtilitiesNotifier
    extends StateNotifier<NotifierState<GetUtilitiesResponse>>
    with ResponseHandler {
  final UtilitiesRepository _repo;

  GetUtilitiesNotifier(this._repo) : super(NotifierState());

  void getUtilities({required String utility, Function()? then}) async {
    state = notifyLoading();
    state = await _repo.getUtilities(
      utility: utility,
    );
    if (state.status == NotifierStatus.done) {
      if (then != null) then();
    }
  }
}

class GetUtilitiesTypeNotifier
    extends StateNotifier<NotifierState<GetUtilitiesTypesResponse>>
    with ResponseHandler {
  final UtilitiesRepository _repo;

  GetUtilitiesTypeNotifier(this._repo) : super(NotifierState());

  void getUtilitiesType({required int categoryId, Function()? then}) async {
    state = notifyLoading();
    state = await _repo.getUtilitiesType(
      categoryId: categoryId,
    );
    if (state.status == NotifierStatus.done) {
      if (then != null) then();
    }
  }
}

class BuyUtilitiesNotifier extends StateNotifier<NotifierState<String>>
    with ResponseHandler {
  final UtilitiesRepository _repo;

  BuyUtilitiesNotifier(this._repo) : super(NotifierState());

  void buyUtilities(
      {required String paymentCode,
      required String amount,
      required String customerId,
      required String transactionPin,
      required String subCategory,
      required String category,
      Function()? then}) async {
    state = notifyLoading();
    state = await _repo.buyUtilities(
      category: category,
      customerId: customerId,
      transactionPin: transactionPin,
      amount: amount,
      subCategory: subCategory,
      paymentCode: paymentCode,
    );
    if (state.status == NotifierStatus.done) {
      if (then != null) then();
    }
  }
}
