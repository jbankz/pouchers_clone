import 'package:Pouchers/app/core/manager/session_manager.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:Pouchers/app/helpers/network_helpers.dart';
import 'package:Pouchers/app/helpers/notifiers.dart';
import 'package:Pouchers/app/helpers/service_response.dart';
import 'package:Pouchers/modules/login/models/login_response.dart';
import 'package:Pouchers/modules/make_payment/models/make_payment_model.dart';
import 'package:Pouchers/modules/make_payment/service/payment_service.dart';
import 'package:Pouchers/utils/strings.dart';
import 'package:riverpod/riverpod.dart';

import '../../../app/app.locator.dart';
import '../../../ui/features/profile/data/dao/user_dao.dart';

final paymentRepoProvider =
    Provider.autoDispose<PaymentRepository>((ref) => PaymentRepository(ref));

class PaymentRepository {
  final ProviderRef ref;

  PaymentRepository(this.ref);

  static final session = locator<SessionManager>();

  Future<NotifierState<Map<String, dynamic>>> getContactByPoucherTag(
      {required String poucherTag}) async {
    ServiceResponse<Map<String, dynamic>> getContactByPoucherTag;
    final userProfile = userDao.returnUser(userDao.box);
    getContactByPoucherTag = await PaymentService.getContactByPoucherTag(
        token: session.accessToken, poucherTag: poucherTag);

    if (getContactByPoucherTag.notAuthenticated) {
      await refreshToken(refreshToken: session.accessToken);
      final userProfiles = userDao.returnUser(userDao.box);
      getContactByPoucherTag = await PaymentService.getContactByPoucherTag(
          token: userProfiles.token!, poucherTag: poucherTag);
    }
    return getContactByPoucherTag.toNotifierState();
  }

  Future<NotifierState<ContactListResponse>> getAllContacts(
      {required List<String> contacts}) async {
    ServiceResponse<ContactListResponse> getAllContacts;
    final userProfile = userDao.returnUser(userDao.box);
    getAllContacts = await PaymentService.getAllContacts(
        token: session.accessToken, contacts: contacts);

    if (getAllContacts.notAuthenticated) {
      await refreshToken(refreshToken: session.accessToken);
      final userProfiles = userDao.returnUser(userDao.box);
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
    final userProfile = userDao.returnUser(userDao.box);
    requestMoney = await PaymentService.requestMoney(
      token: session.accessToken,
      amount: amount,
      tag: tag,
      note: note,
    );

    if (requestMoney.notAuthenticated) {
      await refreshToken(refreshToken: session.accessToken);
      final userProfiles = userDao.returnUser(userDao.box);
      requestMoney = await PaymentService.requestMoney(
        token: userProfiles.token!,
        amount: amount,
        tag: tag,
        note: note,
      );
    }
    return requestMoney.toNotifierState();
  }

  Future<NotifierState<P2PResponse>> p2pMoney(
      {required String tag,
      required String amount,
      required String note,
      required String transactionPin}) async {
    ServiceResponse<P2PResponse> p2pMoney;
    final userProfile = userDao.returnUser(userDao.box);
    p2pMoney = await PaymentService.p2p(
        token: session.accessToken,
        amount: amount,
        tag: tag,
        note: note,
        transactionPin: transactionPin);

    if (p2pMoney.notAuthenticated) {
      await refreshToken(refreshToken: session.accessToken);
      final userProfiles = userDao.returnUser(userDao.box);
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
    final userProfile = userDao.returnUser(userDao.box);
    accountDetails = await PaymentService.accountDetails(
        token: session.accessToken,
        amount: amount,
        accountNumber: accountNumber,
        bankName: bankName);

    if (accountDetails.notAuthenticated) {
      await refreshToken(refreshToken: session.accessToken);
      final userProfiles = userDao.returnUser(userDao.box);
      accountDetails = await PaymentService.accountDetails(
          token: userProfiles.token!,
          amount: amount,
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
    final userProfile = userDao.returnUser(userDao.box);
    localBankTransfer = await PaymentService.localBankTransfer(
        token: session.accessToken,
        accountNumber: accountNumber,
        amount: amount,
        bankName: bankName,
        transactionPin: transactionPin);

    if (localBankTransfer.notAuthenticated) {
      await refreshToken(refreshToken: session.accessToken);
      final userProfiles = userDao.returnUser(userDao.box);
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
    final userProfile = userDao.returnUser(userDao.box);
    getWalletDetails = await PaymentService.getWalletDetails(
      token: session.accessToken,
    );

    if (getWalletDetails.notAuthenticated) {
      await refreshToken(refreshToken: session.accessToken);
      final userProfiles = userDao.returnUser(userDao.box);
      getWalletDetails = await PaymentService.getWalletDetails(
        token: userProfiles.token!,
      );
    }
    return getWalletDetails.toNotifierState();
  }

  Future<NotifierState<NotificationResponse>> getNotifications() async {
    ServiceResponse<NotificationResponse> getNotifications;
    final userProfile = userDao.returnUser(userDao.box);
    getNotifications = await PaymentService.getNotifications(
      token: session.accessToken,
    );

    if (getNotifications.notAuthenticated) {
      await refreshToken(refreshToken: session.accessToken);
      final userProfiles = userDao.returnUser(userDao.box);
      getNotifications = await PaymentService.getNotifications(
        token: userProfiles.token!,
      );
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
    final userProfile = userDao.returnUser(userDao.box);
    requestMoney = await PaymentService.moneyRequestStatus(
        token: session.accessToken,
        amount: amount,
        action: action,
        requestId: requestId,
        note: note,
        pin: pin);

    if (requestMoney.notAuthenticated) {
      await refreshToken(refreshToken: session.accessToken);
      final userProfiles = userDao.returnUser(userDao.box);
      requestMoney = await PaymentService.moneyRequestStatus(
          token: userProfiles.token!,
          amount: amount,
          action: action,
          requestId: requestId,
          note: note,
          pin: pin);
    }
    return requestMoney.toNotifierState();
  }
}
