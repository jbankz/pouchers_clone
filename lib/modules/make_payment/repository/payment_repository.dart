import 'package:hive_flutter/hive_flutter.dart';
import 'package:Pouchers/app/helpers/network_helpers.dart';
import 'package:Pouchers/app/helpers/notifiers.dart';
import 'package:Pouchers/app/helpers/service_response.dart';
import 'package:Pouchers/modules/login/models/login_response.dart';
import 'package:Pouchers/modules/make_payment/models/make_payment_model.dart';
import 'package:Pouchers/modules/make_payment/service/payment_service.dart';
import 'package:Pouchers/utils/strings.dart';
import 'package:riverpod/riverpod.dart';

final paymentRepoProvider =
    Provider.autoDispose<PaymentRepository>((ref) => PaymentRepository(ref));

class PaymentRepository {
  final ProviderRef ref;

  PaymentRepository(this.ref);

  Future<NotifierState<Map<String, dynamic>>> getContactByPoucherTag(
      {required String poucherTag}) async {
    ServiceResponse<Map<String, dynamic>> getContactByPoucherTag;
    HiveStoreResponseData userProfile = Hive.box(kUserBox).get(kUserInfoKey);
    getContactByPoucherTag = await PaymentService.getContactByPoucherTag(
        token: userProfile.token!, poucherTag: poucherTag);

    if (getContactByPoucherTag.notAuthenticated) {
      await refreshToken(refreshToken: userProfile.refreshToken!);
      HiveStoreResponseData userProfiles = Hive.box(kUserBox).get(kUserInfoKey);
      getContactByPoucherTag = await PaymentService.getContactByPoucherTag(
          token: userProfiles.token!, poucherTag: poucherTag);
    }
    return getContactByPoucherTag.toNotifierState();
  }

  Future<NotifierState<ContactListResponse>> getAllContacts(
      {required List<String> contacts}) async {
    ServiceResponse<ContactListResponse> getAllContacts;
    HiveStoreResponseData userProfile = Hive.box(kUserBox).get(kUserInfoKey);
    getAllContacts = await PaymentService.getAllContacts(
        token: userProfile.token!, contacts: contacts);

    if (getAllContacts.notAuthenticated) {
      await refreshToken(refreshToken: userProfile.refreshToken!);
      HiveStoreResponseData userProfiles = Hive.box(kUserBox).get(kUserInfoKey);
      getAllContacts = await PaymentService.getAllContacts(
          token: userProfiles.token!, contacts: contacts);
    }
    return getAllContacts.toNotifierState();
  }

  Future<NotifierState<RequestResponse>> requestMoney({
    required String tag,
    required String amount,
    required String note,
  }) async {
    ServiceResponse<RequestResponse> requestMoney;
    HiveStoreResponseData userProfile = Hive.box(kUserBox).get(kUserInfoKey);
    requestMoney = await PaymentService.requestMoney(
      token: userProfile.token!,
      amount: amount,
      tag: tag,
      note: note,
    );

    if (requestMoney.notAuthenticated) {
      await refreshToken(refreshToken: userProfile.refreshToken!);
      HiveStoreResponseData userProfiles = Hive.box(kUserBox).get(kUserInfoKey);
      requestMoney = await PaymentService.requestMoney(
        token: userProfiles.token!,
        amount: amount,
        tag: tag,
        note: note,
      );
    }
    return requestMoney.toNotifierState();
  }

  Future<NotifierState<P2PResponse>> p2pMoney({required String tag,
    required String amount,
    required String note,
    required String transactionPin}) async {
    ServiceResponse<P2PResponse> p2pMoney;
    HiveStoreResponseData userProfile = Hive.box(kUserBox).get(kUserInfoKey);
    p2pMoney = await PaymentService.p2p(
        token: userProfile.token!,
        amount: amount,
        tag: tag,
        note: note,
        transactionPin: transactionPin);

    if (p2pMoney.notAuthenticated) {
      await refreshToken(refreshToken: userProfile.refreshToken!);
      HiveStoreResponseData userProfiles = Hive.box(kUserBox).get(kUserInfoKey);
      p2pMoney = await PaymentService.p2p(
          token: userProfiles.token!,
          amount: amount,
          tag: tag,
          note: note,
          transactionPin: transactionPin);
    }
    return p2pMoney.toNotifierState();
  }

  Future<NotifierState<AccountDetailsResponse>> accountDetails({
    required String accountNumber,
    required String amount,
    required String bankName,
  }) async {
    ServiceResponse<AccountDetailsResponse> accountDetails;
    HiveStoreResponseData userProfile = Hive.box(kUserBox).get(kUserInfoKey);
    accountDetails = await PaymentService.accountDetails(
        token: userProfile.token!, amount: amount,
        accountNumber: accountNumber,
        bankName: bankName);

    if (accountDetails.notAuthenticated) {
      await refreshToken(refreshToken: userProfile.refreshToken!);
      HiveStoreResponseData userProfiles = Hive.box(kUserBox).get(kUserInfoKey);
      accountDetails = await PaymentService.accountDetails(
          token: userProfiles.token!, amount: amount,
          accountNumber: accountNumber,
          bankName: bankName);
    }
    return accountDetails.toNotifierState();
  }

  Future<NotifierState<GetAllBanksResponse>> getAllBanks() async {
    return (await PaymentService.getAllBanks()).toNotifierState();
  }

  Future<NotifierState<LocalTransferResponse>> localBankTransfer(
      {required String accountNumber,
        required String bankName,
        required String amount,
        required String transactionPin}) async {
    ServiceResponse<LocalTransferResponse> localBankTransfer;
    HiveStoreResponseData userProfile = Hive.box(kUserBox).get(kUserInfoKey);
    localBankTransfer = await PaymentService.localBankTransfer(
        token: userProfile.token!,
        accountNumber: accountNumber,
        amount: amount,
        bankName: bankName,
        transactionPin: transactionPin);

    if (localBankTransfer.notAuthenticated) {
      await refreshToken(refreshToken: userProfile.refreshToken!);
      HiveStoreResponseData userProfiles = Hive.box(kUserBox).get(kUserInfoKey);
      localBankTransfer = await PaymentService.localBankTransfer(
          token: userProfiles.token!,
          accountNumber: accountNumber,
          amount: amount,
          bankName: bankName,
          transactionPin: transactionPin);
    }
    return localBankTransfer.toNotifierState();
  }

  Future<NotifierState<GetWalletResponse>> getWalletDetails() async {
    ServiceResponse<GetWalletResponse> getWalletDetails;
    HiveStoreResponseData userProfile = Hive.box(kUserBox).get(kUserInfoKey);
    getWalletDetails = await PaymentService.getWalletDetails(
      token: userProfile.token!,);

    if (getWalletDetails.notAuthenticated) {
      await refreshToken(refreshToken: userProfile.refreshToken!);
      HiveStoreResponseData userProfiles = Hive.box(kUserBox).get(kUserInfoKey);
      getWalletDetails = await PaymentService.getWalletDetails(
        token: userProfiles.token!,);
    }
    return getWalletDetails.toNotifierState();
  }

  Future<NotifierState<NotificationResponse>> getNotifications() async {
    ServiceResponse<NotificationResponse> getNotifications;
    HiveStoreResponseData userProfile = Hive.box(kUserBox).get(kUserInfoKey);
    getNotifications = await PaymentService.getNotifications(
      token: userProfile.token!,);

    if (getNotifications.notAuthenticated) {
      await refreshToken(refreshToken: userProfile.refreshToken!);
      HiveStoreResponseData userProfiles = Hive.box(kUserBox).get(kUserInfoKey);
      getNotifications = await PaymentService.getNotifications(
        token: userProfiles.token!,);
    }
    return getNotifications.toNotifierState();
  }

  Future<NotifierState<MoneyRequestResponse>> moneyRequestStatus({
    required String action,
    required double amount,
    required String requestId,
    required String pin,
    String? note,
  }) async {
    ServiceResponse<MoneyRequestResponse> requestMoney;
    HiveStoreResponseData userProfile = Hive.box(kUserBox).get(kUserInfoKey);
    requestMoney = await PaymentService.moneyRequestStatus(
        token: userProfile.token!,
        amount: amount,
        action: action,
        requestId: requestId,
        note: note,
        pin: pin
    );

    if (requestMoney.notAuthenticated) {
      await refreshToken(refreshToken: userProfile.refreshToken!);
      HiveStoreResponseData userProfiles = Hive.box(kUserBox).get(kUserInfoKey);
      requestMoney = await PaymentService.moneyRequestStatus(
          token: userProfiles.token!,
          amount: amount,
          action: action,
          requestId: requestId,
          note: note,
          pin: pin
      );
    }
    return requestMoney.toNotifierState();
  }
}
