import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pouchers/app/helpers/network_helpers.dart';
import 'package:pouchers/app/helpers/notifiers.dart';
import 'package:pouchers/modules/onboarding/model/onboarding_model.dart';
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
    return (await UtilitiesService.getUtilities(
      utility: utility,
    ))
        .toNotifierState();
  }

  Future<NotifierState<DiscountResponse>> getDiscount({required String utility}) async {
    final accessToken = await getAccessToken();

    return (await UtilitiesService.getDiscount(
            utility: utility, token: accessToken!))
        .toNotifierState();
  }

  Future<NotifierState<GetUtilitiesTypesResponse>> getUtilitiesType(
      {required String merchantServiceId}) async {
    return (await UtilitiesService.getUtilitiesType(
      merchantServiceId: merchantServiceId,
    ))
        .toNotifierState();
  }

  Future<NotifierState<String>> buyUtilities({
    required List<String> merchantService,
    required double amount,
    required String merchantAccount,
    required String transactionPin,
    required String subCategory,
    required String merchantReferenceNumber,
    required String category,
    String? frequency,
    required bool isSchedule, bool? applyDiscount,
  }) async {
    final accessToken = await getAccessToken();
    return (await UtilitiesService.buyUtilities(
            merchantAccount: merchantAccount,
            amount: amount,
            merchantReferenceNumber: merchantReferenceNumber,
            merchantService: merchantService,
            transactionPin: transactionPin,
            subCategory: subCategory,
            category: category,
        applyDiscount: applyDiscount,
            frequency: frequency,
            token: accessToken!,
            isSchedule: isSchedule))
        .toNotifierState();
  }

  Future<NotifierState<String>> buyAirtime({
    required String subCategory,
    required String amount,
    required String category,
    required String destinationPhoneNumber,
    required String transactionPin,
    required String mobileOperatorPublicId,
    required bool isAirtime,
    required bool applyDiscount,
    String? mobileOperatorServiceId,
  }) async {
    final accessToken = await getAccessToken();
    return (await UtilitiesService.buyAirtime(
      amount: amount,
      transactionPin: transactionPin,
      subCategory: subCategory,
      category: category,
      isAirtime: isAirtime,
      applyDiscount: applyDiscount,
      mobileOperatorServiceId: mobileOperatorServiceId,
      mobileOperatorPublicId: mobileOperatorPublicId,
      destinationPhoneNumber: destinationPhoneNumber,
      token: accessToken!,
    ))
        .toNotifierState();
  }

  Future<NotifierState<String>> isGuestBuyAirtime(
      {required String subCategory,
      required String amount,
      required String category,
      required String destinationPhoneNumber,
      required String mobileOperatorPublicId,
      required bool isAirtime,
      String? mobileOperatorServiceId,
      email,
      bank,
      name}) async {
    return (await UtilitiesService.isGuestBuyAirtime(
      amount: amount,
      subCategory: subCategory,
      category: category,
      isAirtime: isAirtime,
      email: email,
      name: name,
      bank: bank,
      mobileOperatorServiceId: mobileOperatorServiceId,
      mobileOperatorPublicId: mobileOperatorPublicId,
      destinationPhoneNumber: destinationPhoneNumber,
    ))
        .toNotifierState();
  }

  Future<NotifierState<UssdResponse>> isGuestUssd(
      {required String subCategory,
      required String amount,
      required String category,
      required String destinationPhoneNumber,
      required String mobileOperatorPublicId,
      required bool isAirtime,
      String? mobileOperatorServiceId,
      email,
      bank,
      name}) async {
    return (await UtilitiesService.isGuestUssd(
      amount: amount,
      subCategory: subCategory,
      category: category,
      isAirtime: isAirtime,
      email: email,
      name: name,
      bank: bank,
      mobileOperatorServiceId: mobileOperatorServiceId,
      mobileOperatorPublicId: mobileOperatorPublicId,
      destinationPhoneNumber: destinationPhoneNumber,
    ))
        .toNotifierState();
  }

  Future<NotifierState<UssdResponse>> isGuestUtilityUssd({
    required List<String> merchantService,
    required double amount,
    required String merchantAccount,
    required String subCategory,
    required String merchantReferenceNumber,
    required String category,
    String? email,
    name,
    bank,
  }) async {
    return (await UtilitiesService.isGuestUtilityUssd(
            merchantService: merchantService,
            merchantReferenceNumber: merchantReferenceNumber,
            amount: amount,
            subCategory: subCategory,
            category: category,
            email: email,
            name: name,
            bank: bank,
            merchantAccount: merchantAccount))
        .toNotifierState();
  }

  Future<NotifierState<DataBundleResponse>> getDataBundles(
      {required String merchantServiceId}) async {
    return (await UtilitiesService.getDataBundles(
      merchantServiceId: merchantServiceId,
    ))
        .toNotifierState();
  }

  Future<NotifierState<String>> checkPaymentStatus(
      {required String reference}) async {
    return (await UtilitiesService.checkPaymentStatus(
      reference: reference,
    ))
        .toNotifierState();
  }
}
