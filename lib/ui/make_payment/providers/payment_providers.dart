import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pouchers/app/helpers/notifiers.dart';
import 'package:pouchers/app/helpers/response_handler.dart';
import 'package:pouchers/ui/make_payment/models/make_payment_model.dart';
import 'package:pouchers/ui/make_payment/repository/payment_repository.dart';

final getContactByPoucherTagProvider = StateNotifierProvider.autoDispose<
    GetContactByPoucherTagNotifier, NotifierState<Map<String, dynamic>>>((ref) {
  return GetContactByPoucherTagNotifier(ref.read(paymentRepoProvider));
});

final getAllContactsProvider = StateNotifierProvider.autoDispose<
    GetAllContactsNotifier, NotifierState<ContactListResponse>>((ref) {
  return GetAllContactsNotifier(ref.read(paymentRepoProvider));
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


