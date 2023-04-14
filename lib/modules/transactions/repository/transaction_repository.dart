import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pouchers/app/helpers/network_helpers.dart';
import 'package:pouchers/app/helpers/notifiers.dart';
import 'package:pouchers/app/helpers/service_response.dart';
import 'package:pouchers/modules/login/models/login_response.dart';
import 'package:pouchers/modules/transactions/model/transaction_model.dart';
import 'package:pouchers/modules/transactions/service/transaction_service.dart';
import 'package:pouchers/utils/strings.dart';

final transactionRepoProvider = Provider.autoDispose<TransactionRepository>(
    (ref) => TransactionRepository(ref));

class TransactionRepository {
  final ProviderRef ref;

  TransactionRepository(this.ref);

  Future<NotifierState<GetTransactionsResponse>> getTransactionHistory(
      {required String status}) async {

    ServiceResponse<GetTransactionsResponse> getTransaction;
    HiveStoreResponseData userProfile = Hive.box(kUserBox).get(kUserInfoKey);
    getTransaction = await TransactionService.getTransactionHistory(
        token: userProfile.token!, status: status,);

    if (getTransaction.notAuthenticated) {
      await refreshToken(refreshToken: userProfile.refreshToken!);
      HiveStoreResponseData userProfiles = Hive.box(kUserBox).get(kUserInfoKey);
      getTransaction = await TransactionService.getTransactionHistory(
          token: userProfiles.token!, status: status,);
    }
    return getTransaction.toNotifierState();
  }

  Future<NotifierState<TransactionAnalyticsResponse>> getTransactionAnalytics({
    required String month,
    required String year,
  }) async {

    ServiceResponse<TransactionAnalyticsResponse> getTransactionAnalytics;
    HiveStoreResponseData userProfile = Hive.box(kUserBox).get(kUserInfoKey);
    getTransactionAnalytics = await TransactionService.getTransactionAnalytics(
      token: userProfile.token!, month: month, year: year,);

    if (getTransactionAnalytics.notAuthenticated) {
      await refreshToken(refreshToken: userProfile.refreshToken!);
      HiveStoreResponseData userProfiles = Hive.box(kUserBox).get(kUserInfoKey);
      getTransactionAnalytics = await TransactionService.getTransactionAnalytics(
        token: userProfiles.token!, month: month, year: year,);
    }
    return getTransactionAnalytics.toNotifierState();
  }
}
