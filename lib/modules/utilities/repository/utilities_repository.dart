import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pouchers/app/helpers/network_helpers.dart';
import 'package:pouchers/app/helpers/notifiers.dart';
import 'package:pouchers/modules/utilities/model/utilities_model.dart';
import 'package:pouchers/modules/utilities/service/utilities_service.dart';

final utilitiesRepoProvider = Provider.autoDispose<UtilitiesRepository>(
    (ref) => UtilitiesRepository(ref));

class UtilitiesRepository {
  final ProviderRef ref;

  UtilitiesRepository(this.ref);

  Future<NotifierState<String>> buyVoucher(
      {required String amount, required String transactionPin}) async {
    final accessToken = await getAccessToken();
    return (await UtilitiesService.buyVoucher(
            amount: amount,
            transactionPin: transactionPin,
            token: accessToken!))
        .toNotifierState();
  }

  Future<NotifierState<GetVoucherResponse>> fetchVoucher(
      {required String status}) async {
    final accessToken = await getAccessToken();
    return (await UtilitiesService.fetchVouchers(
            status: status, token: accessToken!))
        .toNotifierState();
  }

  Future<NotifierState<String>> giftVoucher(
      {String? email,
      String? tag,
      required String transactionPin,
      required String code}) async {
    final accessToken = await getAccessToken();
    return (await UtilitiesService.giftVoucher(
            email: email,
            tag: tag,
            code: code,
            transactionPin: transactionPin,
            token: accessToken!))
        .toNotifierState();
  }

  Future<NotifierState<String>> redeemVoucher(
      {required String transactionPin, required String code}) async {
    final accessToken = await getAccessToken();
    return (await UtilitiesService.redeemVoucher(
            code: code, transactionPin: transactionPin, token: accessToken!))
        .toNotifierState();
  }

  Future<NotifierState<GetUtilitiesResponse>> getUtilities(
      {required String utility}) async {
    final accessToken = await getAccessToken();
    return (await UtilitiesService.getUtilities(
            utility: utility, token: accessToken!))
        .toNotifierState();
  }

  Future<NotifierState<GetUtilitiesTypesResponse>> getUtilitiesType(
      {required int categoryId}) async {
    final accessToken = await getAccessToken();
    return (await UtilitiesService.getUtilitiesType(
            categoryId: categoryId, token: accessToken!))
        .toNotifierState();
  }

  Future<NotifierState<String>> buyUtilities(
      {required String paymentCode,
      required String amount,
      required String customerId,
      required String transactionPin,
      required String subCategory,
      required String category,
      }) async {
    final accessToken = await getAccessToken();
    return (await UtilitiesService.buyUtilities(
      paymentCode: paymentCode,
      amount: amount,
      customerId: customerId,
      transactionPin: transactionPin,
      subCategory: subCategory,
      category: category,
      token: accessToken!,
    ))
        .toNotifierState();
  }
}
