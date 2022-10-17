import 'package:pouchers/app/helpers/network_helpers.dart';
import 'package:pouchers/app/helpers/notifiers.dart';
import 'package:pouchers/ui/create_account/models/create_account_response.dart';
import 'package:pouchers/ui/login/service/log_in_service.dart';
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
    return (await LogInService.logIn(
            phoneNumber: phoneNumber,
            password: password,
            isEmail: isEmail))
        .toNotifierState();
  }

  Future<NotifierState<String>> forgotPassword({
    required String email,
  }) async {
    final accessToken = await getAccessToken();
    return (await LogInService.forgotPassword(
            token: accessToken!, email: email))
        .toNotifierState();
  }

  Future<NotifierState<String>> validateForgotPassword({
    required String email,
    required String resetCode,
  }) async {
    final accessToken = await getAccessToken();
    return (await LogInService.validateForgotPassword(
      token: accessToken!,
      email: email,
      resetCode: resetCode,
    ))
        .toNotifierState();
  }

  Future<NotifierState<String>> resetPassword({
    required String email,
    required String password,
  }) async {
    final accessToken = await getAccessToken();
    return (await LogInService.resetPassword(
      token: accessToken!,
      email: email,
      password: password,
    ))
        .toNotifierState();
  }
}
