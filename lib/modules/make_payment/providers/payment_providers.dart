import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pouchers/app/helpers/notifiers.dart';
import 'package:pouchers/app/helpers/response_handler.dart';
import 'package:pouchers/modules/make_payment/models/make_payment_model.dart';
import 'package:pouchers/modules/make_payment/repository/payment_repository.dart';

final getContactByPoucherTagProvider = StateNotifierProvider.autoDispose<
    GetContactByPoucherTagNotifier, NotifierState<Map<String, dynamic>>>((ref) {
  return GetContactByPoucherTagNotifier(ref.read(paymentRepoProvider));
});

final getAllContactsProvider = StateNotifierProvider.autoDispose<
    GetAllContactsNotifier, NotifierState<ContactListResponse>>((ref) {
  return GetAllContactsNotifier(ref.read(paymentRepoProvider));
});

final requestMoneyProvider = StateNotifierProvider.autoDispose<
    RequestMoneyNotifier, NotifierState<RequestResponse>>((ref) {
  return RequestMoneyNotifier(ref.read(paymentRepoProvider));
});

final p2pMoneyProvider = StateNotifierProvider.autoDispose<P2PMoneyNotifier,
    NotifierState<P2PResponse>>((ref) {
  return P2PMoneyNotifier(ref.read(paymentRepoProvider));
});

final getAccountDetailsProvider = StateNotifierProvider.autoDispose<
    GetAccountDetailsNotifier, NotifierState<AccountDetailsResponse>>((ref) {
  return GetAccountDetailsNotifier(ref.read(paymentRepoProvider));
});

final getAllBanksProvider = StateNotifierProvider.autoDispose<
    GetAllBanksNotifier, NotifierState<GetAllBanksResponse>>((ref) {
  return GetAllBanksNotifier(ref.read(paymentRepoProvider));
});

final localBankTransferProvider =
    StateNotifierProvider.autoDispose<LocalBankTransferNotifier, NotifierState<LocalTransferResponse>>(
        (ref) {
  return LocalBankTransferNotifier(ref.read(paymentRepoProvider));
});

final getWalletProvider = StateNotifierProvider<GetWalletNotifier,
    NotifierState<GetWalletResponse>>((ref) {
  return GetWalletNotifier(ref.read(paymentRepoProvider));
});

class GetContactByPoucherTagNotifier
    extends StateNotifier<NotifierState<Map<String, dynamic>>>
    with ResponseHandler {
  final PaymentRepository _repo;

  GetContactByPoucherTagNotifier(this._repo) : super(NotifierState());

  void getContactByPoucherTag(
      {Function()? then, required String poucherTag}) async {
    state = notifyLoading();
    state = await _repo.getContactByPoucherTag(poucherTag: poucherTag);
    if (state.status == NotifierStatus.done) {
      if (then != null) then();
    }
  }
}

class GetAllContactsNotifier
    extends StateNotifier<NotifierState<ContactListResponse>>
    with ResponseHandler {
  final PaymentRepository _repo;

  GetAllContactsNotifier(this._repo) : super(NotifierState());

  void getAllContacts(
      {Function()? then, required List<String> contacts}) async {
    state = notifyLoading();
    state = await _repo.getAllContacts(contacts: contacts);
    if (state.status == NotifierStatus.done) {
      if (then != null) then();
    }
  }
}

class RequestMoneyNotifier extends StateNotifier<NotifierState<RequestResponse>>
    with ResponseHandler {
  final PaymentRepository _repo;

  RequestMoneyNotifier(this._repo) : super(NotifierState());

  void requestMoney({
    Function()? then,
    required String tag,
    required String amount,
    required String note,
  }) async {
    state = notifyLoading();
    state = await _repo.requestMoney(tag: tag, note: note, amount: amount);
    if (state.status == NotifierStatus.done) {
      if (then != null) then();
    }
  }
}

class P2PMoneyNotifier extends StateNotifier<NotifierState<P2PResponse>>
    with ResponseHandler {
  final PaymentRepository _repo;

  P2PMoneyNotifier(this._repo) : super(NotifierState());

  void p2pMoney(
      {Function()? then,
      required String tag,
      required String amount,
      required String note,
      required String transactionPin}) async {
    state = notifyLoading();
    state = await _repo.p2pMoney(
        tag: tag, note: note, amount: amount, transactionPin: transactionPin);
    if (state.status == NotifierStatus.done) {
      if (then != null) then();
    }
  }
}

class GetAccountDetailsNotifier
    extends StateNotifier<NotifierState<AccountDetailsResponse>>
    with ResponseHandler {
  final PaymentRepository _repo;

  GetAccountDetailsNotifier(this._repo) : super(NotifierState());

  void getAccountDetails({
    Function()? then,
    required String accountNumber,
    required String amount,
    required String bankName,
  }) async {
    state = notifyLoading();
    state = await _repo.accountDetails(
        accountNumber: accountNumber, amount: amount, bankName: bankName);
    if (state.status == NotifierStatus.done) {
      if (then != null) then();
    }
  }
}

class GetAllBanksNotifier
    extends StateNotifier<NotifierState<GetAllBanksResponse>>
    with ResponseHandler {
  final PaymentRepository _repo;

  GetAllBanksNotifier(this._repo) : super(NotifierState());

  void getAllBanks({
    Function()? then,
  }) async {
    state = notifyLoading();
    state = await _repo.getAllBanks();
    if (state.status == NotifierStatus.done) {
      if (then != null) then();
    }
  }
}

class LocalBankTransferNotifier extends StateNotifier<NotifierState<LocalTransferResponse>>
    with ResponseHandler {
  final PaymentRepository _repo;

  LocalBankTransferNotifier(this._repo) : super(NotifierState());

  void localBankTransfer({
    required String accountNumber,
    required String bankName,
    required String amount,
    required String transactionPin,
    Function()? then,
  }) async {
    state = notifyLoading();
    state = await _repo.localBankTransfer(
        bankName: bankName,
        amount: amount,
        accountNumber: accountNumber,
        transactionPin: transactionPin);
    if (state.status == NotifierStatus.done) {
      if (then != null) then();
    }
  }
}

class GetWalletNotifier extends StateNotifier<NotifierState<GetWalletResponse>>
    with ResponseHandler {
  final PaymentRepository _repo;

  GetWalletNotifier(this._repo) : super(NotifierState());

  void getWalletDetails({
    Function()? then,
  }) async {
    state = notifyLoading();
    state = await _repo.getWalletDetails();
    if (state.status == NotifierStatus.done) {
      if (then != null) then();
    }
  }
}
