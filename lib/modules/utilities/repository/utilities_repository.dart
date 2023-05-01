import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:Pouchers/app/helpers/network_helpers.dart';
import 'package:Pouchers/app/helpers/notifiers.dart';
import 'package:Pouchers/app/helpers/service_response.dart';
import 'package:Pouchers/modules/login/models/login_response.dart';
import 'package:Pouchers/modules/onboarding/model/onboarding_model.dart';
import 'package:Pouchers/modules/utilities/model/utilities_model.dart';
import 'package:Pouchers/modules/utilities/service/utilities_service.dart';
import 'package:Pouchers/utils/strings.dart';

final utilitiesRepoProvider = Provider.autoDispose<UtilitiesRepository>(
        (ref) => UtilitiesRepository(ref));

class UtilitiesRepository {
  final ProviderRef ref;

  UtilitiesRepository(this.ref);

  Future<NotifierState<String>> buyVoucher(
      {required String amount, required String transactionPin}) async {
    ServiceResponse<String> buyVoucher;
    HiveStoreResponseData userProfile = Hive.box(kUserBox).get(kUserInfoKey);
    buyVoucher = await UtilitiesService.buyVoucher(
      token: userProfile.token!, amount: amount,
      transactionPin: transactionPin,);

    if (buyVoucher.notAuthenticated) {
      await refreshToken(refreshToken: userProfile.refreshToken!);
      HiveStoreResponseData userProfiles = Hive.box(kUserBox).get(kUserInfoKey);
      buyVoucher = await UtilitiesService.buyVoucher(
        token: userProfiles.token!, amount: amount,
        transactionPin: transactionPin,);
    }
    return buyVoucher.toNotifierState();
  }

  Future<NotifierState<GetVoucherResponse>> fetchVoucher(
      {required String status}) async {
    ServiceResponse<GetVoucherResponse> fetchVoucher;
    HiveStoreResponseData userProfile = Hive.box(kUserBox).get(kUserInfoKey);
    fetchVoucher = await UtilitiesService.fetchVouchers(
      token: userProfile.token!, status: status,
    );

    if (fetchVoucher.notAuthenticated) {
      await refreshToken(refreshToken: userProfile.refreshToken!);
      HiveStoreResponseData userProfiles = Hive.box(kUserBox).get(kUserInfoKey);
      fetchVoucher = await UtilitiesService.fetchVouchers(
        token: userProfiles.token!, status: status,);
    }
    return fetchVoucher.toNotifierState();
  }

  Future<NotifierState<String>> giftVoucher({String? email,
    String? tag,
    required String transactionPin,
    required String code}) async {
    ServiceResponse<String> giftVoucher;
    HiveStoreResponseData userProfile = Hive.box(kUserBox).get(kUserInfoKey);
    giftVoucher = await UtilitiesService.giftVoucher(
      token: userProfile.token!,
      email: email,
      tag: tag,
      code: code,
      transactionPin: transactionPin,
    );

    if (giftVoucher.notAuthenticated) {
      await refreshToken(refreshToken: userProfile.refreshToken!);
      HiveStoreResponseData userProfiles = Hive.box(kUserBox).get(kUserInfoKey);
      giftVoucher = await UtilitiesService.giftVoucher(
          token: userProfiles.token!,
          email: email,
          tag: tag,
          code: code,
          transactionPin: transactionPin,);
    }
    return giftVoucher.toNotifierState();
  }

  Future<NotifierState<String>> redeemVoucher(
      {required String transactionPin, required String code}) async {

    ServiceResponse<String> redeemVoucher;
    HiveStoreResponseData userProfile = Hive.box(kUserBox).get(kUserInfoKey);
    redeemVoucher = await UtilitiesService.redeemVoucher(
      token: userProfile.token!,
      code: code, transactionPin: transactionPin,
    );

    if (redeemVoucher.notAuthenticated) {
      await refreshToken(refreshToken: userProfile.refreshToken!);
      HiveStoreResponseData userProfiles = Hive.box(kUserBox).get(kUserInfoKey);
      redeemVoucher = await UtilitiesService.redeemVoucher(
        token: userProfiles.token!,
        code: code, transactionPin: transactionPin,);
    }
    return redeemVoucher.toNotifierState();
  }

  Future<NotifierState<GetUtilitiesResponse>> getUtilities(
      {required String utility}) async {
    return (await UtilitiesService.getUtilities(
      utility: utility,
    ))
        .toNotifierState();
  }

  Future<NotifierState<DiscountResponse>> getDiscount(
      {required String utility}) async {

    ServiceResponse<DiscountResponse> getDiscount;
    HiveStoreResponseData userProfile = Hive.box(kUserBox).get(kUserInfoKey);
    getDiscount = await UtilitiesService.getDiscount(
      token: userProfile.token!,
      utility: utility,
    );

    if (getDiscount.notAuthenticated) {
      await refreshToken(refreshToken: userProfile.refreshToken!);
      HiveStoreResponseData userProfiles = Hive.box(kUserBox).get(kUserInfoKey);
      getDiscount = await UtilitiesService.getDiscount(
        token: userProfiles.token!,
          utility: utility,);
    }
    return getDiscount.toNotifierState();

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

    ServiceResponse<String> buyUtilities;
    HiveStoreResponseData userProfile = Hive.box(kUserBox).get(kUserInfoKey);
    buyUtilities = await UtilitiesService.buyUtilities(
      token: userProfile.token!,
      merchantAccount: merchantAccount,
      amount: amount,
      merchantReferenceNumber: merchantReferenceNumber,
      merchantService: merchantService,
      transactionPin: transactionPin,
      subCategory: subCategory,
      category: category,
      applyDiscount: applyDiscount,
      frequency: frequency,
      isSchedule: isSchedule,
    );

    if (buyUtilities.notAuthenticated) {
      await refreshToken(refreshToken: userProfile.refreshToken!);
      HiveStoreResponseData userProfiles = Hive.box(kUserBox).get(kUserInfoKey);
      buyUtilities = await UtilitiesService.buyUtilities(
        token: userProfiles.token!,
        merchantAccount: merchantAccount,
        amount: amount,
        merchantReferenceNumber: merchantReferenceNumber,
        merchantService: merchantService,
        transactionPin: transactionPin,
        subCategory: subCategory,
        category: category,
        applyDiscount: applyDiscount,
        frequency: frequency,
        isSchedule: isSchedule,);
    }
    return buyUtilities.toNotifierState();
  }

  Future<NotifierState<String>> validateUtilities({
    required String merchantAccount,
    required String merchantReferenceNumber,
    required String merchantProductCode,

  }) async {

    ServiceResponse<String> validateUtilities;
    HiveStoreResponseData userProfile = Hive.box(kUserBox).get(kUserInfoKey);
    validateUtilities = await UtilitiesService.validateUtilities(
      merchantAccount: merchantAccount,
      merchantReferenceNumber: merchantReferenceNumber,
      merchantProductCode: merchantProductCode
    );

    if (validateUtilities.notAuthenticated) {
      await refreshToken(refreshToken: userProfile.refreshToken!);
      validateUtilities = await UtilitiesService.validateUtilities(
        merchantAccount: merchantAccount,
        merchantReferenceNumber: merchantReferenceNumber,
        merchantProductCode: merchantProductCode
       );
    }
    return  validateUtilities.toNotifierState();
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

    ServiceResponse<String> buyAirtime;
    HiveStoreResponseData userProfile = Hive.box(kUserBox).get(kUserInfoKey);
    buyAirtime = await UtilitiesService.buyAirtime(
      token: userProfile.token!,
      amount: amount,
      transactionPin: transactionPin,
      subCategory: subCategory,
      category: category,
      isAirtime: isAirtime,
      applyDiscount: applyDiscount,
      mobileOperatorServiceId: mobileOperatorServiceId,
      mobileOperatorPublicId: mobileOperatorPublicId,
      destinationPhoneNumber: destinationPhoneNumber,
    );

    if (buyAirtime.notAuthenticated) {
      await refreshToken(refreshToken: userProfile.refreshToken!);
      HiveStoreResponseData userProfiles = Hive.box(kUserBox).get(kUserInfoKey);
      buyAirtime = await UtilitiesService.buyAirtime(
        token: userProfiles.token!,
        amount: amount,
        transactionPin: transactionPin,
        subCategory: subCategory,
        category: category,
        isAirtime: isAirtime,
        applyDiscount: applyDiscount,
        mobileOperatorServiceId: mobileOperatorServiceId,
        mobileOperatorPublicId: mobileOperatorPublicId,
        destinationPhoneNumber: destinationPhoneNumber,);
    }
    return buyAirtime.toNotifierState();
  }

  Future<NotifierState<String>> isGuestBuyAirtime({required String subCategory,
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

  Future<NotifierState<UssdResponse>> isGuestUssd({required String subCategory,
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
