import 'package:pouchers/app/helpers/network_helpers.dart';
import 'package:pouchers/app/helpers/notifiers.dart';
import 'package:pouchers/modules/make_payment/models/make_payment_model.dart';
import 'package:pouchers/modules/make_payment/service/payment_service.dart';
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

  Future<NotifierState<RequestResponse>> requestMoney({
    required String tag,
    required String amount,
    required String note,
  }) async {
    final accessToken = await getAccessToken();
    return (await PaymentService.requestMoney(
      token: accessToken!,
      amount: amount,
      tag: tag,
      note: note,
    ))
        .toNotifierState();
  }

  Future<NotifierState<P2PResponse>> p2pMoney({
    required String tag,
    required String amount,
    required String note,
    required String transactionPin
  }) async {
    final accessToken = await getAccessToken();
    return (await PaymentService.p2p(
      token: accessToken!,
      amount: amount,
      tag: tag,
      note: note,
      transactionPin: transactionPin
    ))
        .toNotifierState();
  }

  Future<NotifierState<AccountDetailsResponse>> accountDetails({
    required String accountNumber,
    required String amount,
    required String bankName,
  }) async {
    final accessToken = await getAccessToken();
    return (await PaymentService.accountDetails(
      token: accessToken!,
      amount: amount,
      accountNumber: accountNumber,
      bankName: bankName
    ))
        .toNotifierState();
  }

  Future<NotifierState<GetAllBanksResponse>> getAllBanks() async {
    return (await PaymentService.getAllBanks())
        .toNotifierState();
  }

  Future<NotifierState<LocalTransferResponse>> localBankTransfer({required String accountNumber,
    required String bankName,
    required String amount, required String transactionPin}) async {
    final accessToken = await getAccessToken();
    return (await PaymentService.localBankTransfer(
        token: accessToken!,
        accountNumber: accountNumber,
        amount: amount,
        bankName: bankName,
      transactionPin: transactionPin

    ))
        .toNotifierState();
  }

  Future<NotifierState<GetWalletResponse>> getWalletDetails() async {
    final accessToken = await getAccessToken();
    return (await PaymentService.getWalletDetails(
        token: accessToken!,
    ))
        .toNotifierState();
  }
}



