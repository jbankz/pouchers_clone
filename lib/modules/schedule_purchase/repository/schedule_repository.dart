import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pouchers/app/helpers/network_helpers.dart';
import 'package:pouchers/app/helpers/notifiers.dart';
import 'package:pouchers/modules/schedule_purchase/service/schedule_service.dart';
import 'package:pouchers/modules/utilities/model/utilities_model.dart';

final scheduleRepoProvider =
Provider.autoDispose<ScheduleRepository>((ref) => ScheduleRepository(ref));

class ScheduleRepository {
  final ProviderRef ref;

  ScheduleRepository(this.ref);

  Future<NotifierState<String>> scheduleP2PTransfer({
    required String category,
    required String subCategory,
    required String frequency,
    required String tag,
    required double amount,
    required String note,
    required String transactionPin,
    String? status,
    String? scheduleId
  }) async {
    final accessToken = await getAccessToken();
    return (await ScheduleService.scheduleP2PTransfer(
     category: category,
      subCategory: subCategory,
      frequency: frequency,
      tag: tag,
      amount: amount,
      note: note,
      scheduleId: scheduleId,
      transactionPin: transactionPin,
      status: status,
      token: accessToken!
    ))
        .toNotifierState();
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
    final accessToken = await getAccessToken();
    return (await ScheduleService.scheduleUtility(
        category: category,
        subCategory: subCategory,
        frequency: frequency,
        customerId: customerId,
        amount: amount,
        paymentCode: paymentCode,
        transactionPin: transactionPin,
        serviceId: serviceId,
        token: accessToken!

    ))
        .toNotifierState();
  }

  Future<NotifierState<String>> scheduleLocalTransfer({
    required String frequency,
    required String accountNumber,
    required String bankName,
    required double amount,
    required String transactionPin,
    String? status,
    String? scheduleId
  }) async {
    final accessToken = await getAccessToken();
    return (await ScheduleService.scheduleLocalTransfer(
        frequency: frequency,
        bankName: bankName,
        accountNumber: accountNumber,
        amount: amount,
        transactionPin: transactionPin,
        scheduleId: scheduleId,
        status: status,
        token: accessToken!
    ))
        .toNotifierState();
  }

  Future<NotifierState<GetAllScheduleResponse>> getSchedule({
    required String category,
  }) async {
    final accessToken = await getAccessToken();
    return (await ScheduleService.getSchedule(
        category: category,
        token: accessToken!
    ))
        .toNotifierState();
  }

  Future<NotifierState<String>> editSchedule({
    required String frequency,
    required String transactionPin,
    required String scheduleId,
    required String status
  }) async {
    final accessToken = await getAccessToken();
    return (await ScheduleService.editSchedule(
        frequency: frequency,
        transactionPin: transactionPin,
        scheduleId: scheduleId,
        status: status,
        token: accessToken!
    ))
        .toNotifierState();
  }

  Future<NotifierState<String>> deleteSchedule({
    required String transactionPin,
    required String scheduleId,
  }) async {
    final accessToken = await getAccessToken();
    return (await ScheduleService.deleteSchedule(
        transactionPin: transactionPin,
        scheduleId: scheduleId,
        token: accessToken!
    ))
        .toNotifierState();
  }
}

