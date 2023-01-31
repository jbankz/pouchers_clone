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
      {
        required String transactionPin,
        required String code,
        Function()? then}) async {
    state = notifyLoading();
    state = await _repo.redeemVoucher(
    code: code,  transactionPin: transactionPin);
    if (state.status == NotifierStatus.done) {
      if (then != null) then();
    }
  }
}
