import 'dart:ffi';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:pouchers/app/helpers/network_helpers.dart';
import 'package:pouchers/app/helpers/notifiers.dart';
import 'package:pouchers/app/helpers/service_response.dart';
import 'package:pouchers/data/hive_data.dart';
import 'package:pouchers/modules/create_account/models/create_account_response.dart';
import 'package:pouchers/modules/login/models/login_response.dart';
import 'package:pouchers/modules/login/service/log_in_service.dart';
import 'package:pouchers/utils/extras.dart';
import 'package:pouchers/utils/strings.dart';
import 'package:riverpod/riverpod.dart';

final logInRepoProvider =
    Provider.autoDispose<LogInRepository>((ref) => LogInRepository(ref));

class LogInRepository {
  final ProviderRef ref;

  LogInRepository(this.ref);

  Future<NotifierState<VerifyEmailResponse>> logIn({
    required String phoneNumber,
    required String password,
    required bool isEmail,
  }) async {
    final result = await LogInService.logIn(
        phoneNumber: phoneNumber, password: password, isEmail: isEmail);
    print(result);

    if (result.data != null) {
      await cacheUserProfile(
          HiveStoreResponseData.fromJson(result.data!.data!.toJson()));
    }
    ;
    return result.toNotifierState();
  }

  Future<NotifierState<String>> forgotPassword({
    required String email,
  }) async {

    try{
      return (await LogInService.forgotPassword(
           email: email))
          .toNotifierState();
    }catch(e){
      NotifierState<String> state = NotifierState(
          message: "Please login first to access this feature",
        status: NotifierStatus.error,
        data: "error",
        noAuth: false
      );
      return state;
    }

  }

  Future<NotifierState<String>> validateForgotPassword({
    required String email,
    required String resetCode,
  }) async {
      return (await LogInService.validateForgotPassword(
        email: email,
        resetCode: resetCode,
      ))
          .toNotifierState();
  }

  Future<NotifierState<String>> resetPassword({
    required String email,
    required String password,
  }) async {
    return (await LogInService.resetPassword(
      email: email,
      password: password,
    ))
        .toNotifierState();
  }
}
