import 'package:Pouchers/app/core/manager/session_manager.dart';
import 'package:Pouchers/modules/transactions/screens/history.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:Pouchers/app/helpers/network_helpers.dart';
import 'package:Pouchers/app/helpers/notifiers.dart';
import 'package:Pouchers/app/helpers/service_response.dart';
import 'package:Pouchers/modules/login/models/login_response.dart';
import 'package:Pouchers/modules/transactions/model/transaction_model.dart';
import 'package:Pouchers/modules/transactions/service/transaction_service.dart';
import 'package:Pouchers/utils/strings.dart';

import '../../../app/app.locator.dart';
import '../../../ui/features/profile/data/dao/user_dao.dart';

final transactionRepoProvider = Provider.autoDispose<TransactionRepository>(
    (ref) => TransactionRepository(ref));

class TransactionRepository {
  final ProviderRef ref;

  TransactionRepository(this.ref);

  final session = locator<SessionManager>();

  Future<NotifierState<GetTransactionsResponse>> getTransactionHistory(
      {OrderHistoryStatus? status, int? page}) async {
    ServiceResponse<GetTransactionsResponse> getTransaction;
    final userProfile = userDao.returnUser(userDao.box);
    getTransaction = await TransactionService.getTransactionHistory(
        token: session.accessToken, status: status, page: page);

    if (getTransaction.notAuthenticated) {
      await refreshToken(refreshToken: userProfile.refreshToken!);
      // HiveStoreResponseData userProfiles = Hive.box(kUserBox).get(kUserInfoKey);
      final userProfiles = userDao.returnUser(userDao.box);
      getTransaction = await TransactionService.getTransactionHistory(
        token: userProfiles.token!,
        status: status,
      );
    }
    return getTransaction.toNotifierState();
  }

  Future<NotifierState<TransactionAnalyticsResponse>> getTransactionAnalytics({
    required String month,
    required String year,
  }) async {
    ServiceResponse<TransactionAnalyticsResponse> getTransactionAnalytics;
    final userProfile = userDao.returnUser(userDao.box);
    getTransactionAnalytics = await TransactionService.getTransactionAnalytics(
      token: session.accessToken,
      month: month,
      year: year,
    );

    if (getTransactionAnalytics.notAuthenticated) {
      await refreshToken(refreshToken: userProfile.refreshToken!);
      // HiveStoreResponseData userProfiles = Hive.box(kUserBox).get(kUserInfoKey);
      final userProfiles = userDao.returnUser(userDao.box);
      getTransactionAnalytics =
          await TransactionService.getTransactionAnalytics(
        token: userProfiles.token!,
        month: month,
        year: year,
      );
    }
    return getTransactionAnalytics.toNotifierState();
  }
}
