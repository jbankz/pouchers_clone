import 'package:pouchers/app/helpers/network_helpers.dart';
import 'package:pouchers/app/helpers/notifiers.dart';
import 'package:pouchers/ui/make_payment/models/make_payment_model.dart';
import 'package:pouchers/ui/make_payment/service/payment_service.dart';
import 'package:riverpod/riverpod.dart';

final paymentRepoProvider =
    Provider.autoDispose<PaymentRepository>((ref) => PaymentRepository(ref));

class PaymentRepository {
  final ProviderRef ref;

  PaymentRepository(this.ref);

  Future<NotifierState<Map<String, dynamic>>> getContactByPoucherTag(
      {required String poucherTag}) async {
    final accessToken = await getAccessToken();
    return (await PaymentService.getContactByPoucherTag(
            token: accessToken!, poucherTag: poucherTag))
        .toNotifierState();
  }

  Future<NotifierState<ContactListResponse>> getAllContacts(
      {required List<String> contacts}) async {
    final accessToken = await getAccessToken();
    return (await PaymentService.getAllContacts(
            token: accessToken!, contacts: contacts))
        .toNotifierState();
  }
}
