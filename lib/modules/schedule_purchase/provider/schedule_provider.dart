import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pouchers/app/helpers/notifiers.dart';
import 'package:pouchers/app/helpers/response_handler.dart';
import 'package:pouchers/modules/schedule_purchase/repository/schedule_repository.dart';
import 'package:pouchers/modules/utilities/model/utilities_model.dart';

final scheduleP2PProvider = StateNotifierProvider.autoDispose<
    ScheduleP2PNotifier, NotifierState<String>>((ref) {
  return ScheduleP2PNotifier(ref.read(scheduleRepoProvider));
});

final scheduleLocalProvider = StateNotifierProvider.autoDispose<
    ScheduleLocalNotifier, NotifierState<String>>((ref) {
  return ScheduleLocalNotifier(ref.read(scheduleRepoProvider));
});

final scheduleUtilityProvider = StateNotifierProvider.autoDispose<
    ScheduleUtilityNotifier, NotifierState<String>>((ref) {
  return ScheduleUtilityNotifier(ref.read(scheduleRepoProvider));
});

final getScheduleProvider = StateNotifierProvider.autoDispose<
    GetScheduleNotifier, NotifierState<GetAllScheduleResponse>>((ref) {
  return GetScheduleNotifier(ref.read(scheduleRepoProvider));
});

final editScheduleProvider = StateNotifierProvider.autoDispose<
    EditScheduleNotifier, NotifierState<String>>((ref) {
  return EditScheduleNotifier(ref.read(scheduleRepoProvider));
});

final deleteScheduleProvider = StateNotifierProvider.autoDispose<
    DeleteScheduleNotifier, NotifierState<String>>((ref) {
  return DeleteScheduleNotifier(ref.read(scheduleRepoProvider));
});

class ScheduleP2PNotifier extends StateNotifier<NotifierState<String>>
    with ResponseHandler {
  final ScheduleRepository _repo;

  ScheduleP2PNotifier(this._repo) : super(NotifierState());

  void scheduleP2PTransfer({
    Function()? then,
    required String category,
    required String subCategory,
    required String frequency,
    required String tag,
    required double amount,
    required String note,
    required String transactionPin,
    String? scheduleId,
    String? status,
  }) async {
    state = notifyLoading();
    state = await _repo.scheduleP2PTransfer(
        category: category,
        subCategory: subCategory,
        frequency: frequency,
        tag: tag,
        amount: amount,
        scheduleId: scheduleId,
        note: note,
        status: status,
        transactionPin: transactionPin);
    if (state.status == NotifierStatus.done) {
      if (then != null) then();
    }
  }
}

class ScheduleUtilityNotifier extends StateNotifier<NotifierState<String>>
    with ResponseHandler {
  final ScheduleRepository _repo;

  ScheduleUtilityNotifier(this._repo) : super(NotifierState());

  void scheduleUtility({
    Function()? then,
    Function(String)? error,
    required String category,
    required String subCategory,
    required String frequency,
    required String customerId,
    required String amount,
    required String paymentCode,
    required String serviceId,
    required String transactionPin,
  }) async {
    state = notifyLoading();
    state = await _repo.scheduleUtility(
        category: category,
        subCategory: subCategory,
        frequency: frequency,
        customerId: customerId,
        amount: amount,
        serviceId: serviceId,
        paymentCode: paymentCode,
        transactionPin: transactionPin);
    if (state.status == NotifierStatus.done) {
      if (then != null) then();
    } else if (state.status == NotifierStatus.error) {
      if (error != null) error(state.message ?? state.data ?? "");
    }
  }
}

class ScheduleLocalNotifier extends StateNotifier<NotifierState<String>>
    with ResponseHandler {
  final ScheduleRepository _repo;

  ScheduleLocalNotifier(this._repo) : super(NotifierState());

  void scheduleLocalTransfer({
    Function()? then,
    required String frequency,
    required String accountNumber,
    required String bankName,
    required double amount,
    required String transactionPin,
    String? status,
    String? scheduleId
  }) async {
    state = notifyLoading();
    state = await _repo.scheduleLocalTransfer(
        frequency: frequency,
        bankName: bankName,
        amount: amount,
        accountNumber: accountNumber,
        scheduleId: scheduleId,
        status: status,
        transactionPin: transactionPin);
    if (state.status == NotifierStatus.done) {
      if (then != null) then();
    }
  }
}

class GetScheduleNotifier
    extends StateNotifier<NotifierState<GetAllScheduleResponse>>
    with ResponseHandler {
  final ScheduleRepository _repo;

  GetScheduleNotifier(this._repo) : super(NotifierState());

  void getSchedule({
    Function()? then,
    required String category,
  }) async {
    state = notifyLoading();
    state = await _repo.getSchedule(category: category);
    if (state.status == NotifierStatus.done) {
      if (then != null) then();
    }
  }
}

class EditScheduleNotifier extends StateNotifier<NotifierState<String>>
    with ResponseHandler {
  final ScheduleRepository _repo;

  EditScheduleNotifier(this._repo) : super(NotifierState());

  void editSchedule(
      {Function()? then, Function(String)? error,
      required String frequency,
      required String transactionPin,
      required String scheduleId, required String status}) async {
    state = notifyLoading();
    state = await _repo.editSchedule(
        frequency: frequency,
        transactionPin: transactionPin,
        status: status,
        scheduleId: scheduleId);
    if (state.status == NotifierStatus.done) {
      if (then != null) then();
    } else if (state.status == NotifierStatus.error) {
      if (error != null) error(state.data ?? state.message ?? "");
    }
  }
}

class DeleteScheduleNotifier extends StateNotifier<NotifierState<String>>
    with ResponseHandler {
  final ScheduleRepository _repo;

  DeleteScheduleNotifier(this._repo) : super(NotifierState());

  void deleteSchedule(
      {Function()? then, Function(String)? error,
        required String transactionPin,
        required String scheduleId,}) async {
    state = notifyLoading();
    state = await _repo.deleteSchedule(

        transactionPin: transactionPin,
        scheduleId: scheduleId);
    if (state.status == NotifierStatus.done) {
      if (then != null) then();
    } else if (state.status == NotifierStatus.error) {
      if (error != null) error(state.data ?? state.message ?? "");
    }
  }
}


