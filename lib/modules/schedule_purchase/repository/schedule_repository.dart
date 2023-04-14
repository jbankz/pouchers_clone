import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pouchers/app/helpers/network_helpers.dart';
import 'package:pouchers/app/helpers/notifiers.dart';
import 'package:pouchers/app/helpers/service_response.dart';
import 'package:pouchers/modules/login/models/login_response.dart';
import 'package:pouchers/modules/schedule_purchase/service/schedule_service.dart';
import 'package:pouchers/modules/utilities/model/utilities_model.dart';
import 'package:pouchers/utils/strings.dart';

final scheduleRepoProvider =
    Provider.autoDispose<ScheduleRepository>((ref) => ScheduleRepository(ref));

class ScheduleRepository {
  final ProviderRef ref;

  ScheduleRepository(this.ref);

  Future<NotifierState<String>> scheduleP2PTransfer(
      {required String category,
      required String subCategory,
      required String frequency,
      required String tag,
      required double amount,
      required String note,
      required String transactionPin,
      String? status,
      String? scheduleId}) async {
    ServiceResponse<String> scheduleP2PTransfer;
    HiveStoreResponseData userProfile = Hive.box(kUserBox).get(kUserInfoKey);
    scheduleP2PTransfer = await ScheduleService.scheduleP2PTransfer(
      token: userProfile.token!,
      category: category,
      subCategory: subCategory,
      frequency: frequency,
      tag: tag,
      amount: amount,
      note: note,
      scheduleId: scheduleId,
      transactionPin: transactionPin,
      status: status,
    );

    if (scheduleP2PTransfer.notAuthenticated) {
      await refreshToken(refreshToken: userProfile.refreshToken!);
      HiveStoreResponseData userProfiles = Hive.box(kUserBox).get(kUserInfoKey);
      scheduleP2PTransfer = await ScheduleService.scheduleP2PTransfer(
        token: userProfiles.token!,
        category: category,
        subCategory: subCategory,
        frequency: frequency,
        tag: tag,
        amount: amount,
        note: note,
        scheduleId: scheduleId,
        transactionPin: transactionPin,
        status: status,
      );
    }
    return scheduleP2PTransfer.toNotifierState();
  }

  Future<NotifierState<String>> scheduleUtility({
    required String category,
    required String subCategory,
    required String frequency,
    required String customerId,
    required String amount,
    required String paymentCode,
    required String transactionPin,
    required String serviceId,
  }) async {

    ServiceResponse<String> scheduleUtility;
    HiveStoreResponseData userProfile = Hive.box(kUserBox).get(kUserInfoKey);
    scheduleUtility = await ScheduleService.scheduleUtility(
      token: userProfile.token!,
      category: category,
      subCategory: subCategory,
      frequency: frequency,
      customerId: customerId,
      amount: amount,
      paymentCode: paymentCode,
      transactionPin: transactionPin,
      serviceId: serviceId,
    );

    if (scheduleUtility.notAuthenticated) {
      await refreshToken(refreshToken: userProfile.refreshToken!);
      HiveStoreResponseData userProfiles = Hive.box(kUserBox).get(kUserInfoKey);
      scheduleUtility = await ScheduleService.scheduleUtility(
        token: userProfiles.token!,
        category: category,
        subCategory: subCategory,
        frequency: frequency,
        customerId: customerId,
        amount: amount,
        paymentCode: paymentCode,
        transactionPin: transactionPin,
        serviceId: serviceId,
      );
    }
    return scheduleUtility.toNotifierState();
  }

  Future<NotifierState<String>> scheduleLocalTransfer(
      {required String frequency,
      required String accountNumber,
      required String bankName,
      required double amount,
      required String transactionPin,
      String? status,
      String? scheduleId}) async {

    ServiceResponse<String> scheduleLocalTransfer;
    HiveStoreResponseData userProfile = Hive.box(kUserBox).get(kUserInfoKey);
    scheduleLocalTransfer = await ScheduleService.scheduleLocalTransfer(
      token: userProfile.token!,
      frequency: frequency,
      bankName: bankName,
      accountNumber: accountNumber,
      amount: amount,
      transactionPin: transactionPin,
      scheduleId: scheduleId,
      status: status,
    );

    if (scheduleLocalTransfer.notAuthenticated) {
      await refreshToken(refreshToken: userProfile.refreshToken!);
      HiveStoreResponseData userProfiles = Hive.box(kUserBox).get(kUserInfoKey);
      scheduleLocalTransfer = await ScheduleService.scheduleLocalTransfer(
        token: userProfiles.token!,
        frequency: frequency,
        bankName: bankName,
        accountNumber: accountNumber,
        amount: amount,
        transactionPin: transactionPin,
        scheduleId: scheduleId,
        status: status,
      );
    }
    return scheduleLocalTransfer.toNotifierState();
  }

  Future<NotifierState<GetAllScheduleResponse>> getSchedule({
    required String category,
  }) async {

    ServiceResponse<GetAllScheduleResponse> getSchedule;
    HiveStoreResponseData userProfile = Hive.box(kUserBox).get(kUserInfoKey);
    getSchedule = await ScheduleService.getSchedule(
      token: userProfile.token!,
      category: category,
    );

    if (getSchedule.notAuthenticated) {
      await refreshToken(refreshToken: userProfile.refreshToken!);
      HiveStoreResponseData userProfiles = Hive.box(kUserBox).get(kUserInfoKey);
      getSchedule = await ScheduleService.getSchedule(
        token: userProfiles.token!,
        category: category,
      );
    }
    return getSchedule.toNotifierState();
  }

  Future<NotifierState<String>> editSchedule(
      {required String frequency,
      required String transactionPin,
      required String scheduleId,
      required String status}) async {

    ServiceResponse<String> editSchedule;
    HiveStoreResponseData userProfile = Hive.box(kUserBox).get(kUserInfoKey);
    editSchedule = await ScheduleService.editSchedule(
      token: userProfile.token!,
      frequency: frequency,
      transactionPin: transactionPin,
      scheduleId: scheduleId,
      status: status,
    );

    if (editSchedule.notAuthenticated) {
      await refreshToken(refreshToken: userProfile.refreshToken!);
      HiveStoreResponseData userProfiles = Hive.box(kUserBox).get(kUserInfoKey);
      editSchedule = await ScheduleService.editSchedule(
        token: userProfiles.token!,
        frequency: frequency,
        transactionPin: transactionPin,
        scheduleId: scheduleId,
        status: status,
      );
    }
    return editSchedule.toNotifierState();
  }

  Future<NotifierState<String>> deleteSchedule({
    required String transactionPin,
    required String scheduleId,
  }) async {

    ServiceResponse<String> deleteSchedule;
    HiveStoreResponseData userProfile = Hive.box(kUserBox).get(kUserInfoKey);
    deleteSchedule = await ScheduleService.deleteSchedule(
      token: userProfile.token!,
      transactionPin: transactionPin,
      scheduleId: scheduleId,
    );

    if (deleteSchedule.notAuthenticated) {
      await refreshToken(refreshToken: userProfile.refreshToken!);
      HiveStoreResponseData userProfiles = Hive.box(kUserBox).get(kUserInfoKey);
      deleteSchedule = await ScheduleService.deleteSchedule(
        token: userProfiles.token!,
        transactionPin: transactionPin,
        scheduleId: scheduleId,
      );
    }
    return deleteSchedule.toNotifierState();
  }
}
