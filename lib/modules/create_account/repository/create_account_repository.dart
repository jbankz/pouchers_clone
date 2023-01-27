import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pouchers/app/helpers/network_helpers.dart';
import 'package:pouchers/app/helpers/notifiers.dart';
import 'package:pouchers/modules/create_account/models/create_account_response.dart';
import 'package:pouchers/modules/create_account/service/create_account_service.dart';

final createAccountRepoProvider = Provider.autoDispose<CreateAccountRepository>(
    (ref) => CreateAccountRepository(ref));

class CreateAccountRepository {
  final ProviderRef ref;

  CreateAccountRepository(this.ref);

  Future<NotifierState<CreateAccountResponse>> createAccount({
    required String firstName,
    required String lastName,
    required String email,
    required String phoneNumber,
    required String password,
  }) async {
    return (await CreateAccountService.createAccount(
      firstName: firstName,
      lastName: lastName,
      email: email,
      phoneNumber: phoneNumber,
      password: password,
    ))
        .toNotifierState();
  }

  Future<NotifierState<VerifyEmailResponse>> verifyEmail({
    required String otp,
  }) async {
    return (await CreateAccountService.verifyEmail(otp: otp)).toNotifierState();
  }

  Future<NotifierState<TagResponse>> createTag({
    required String tag,
  }) async {
    final accessToken = await getAccessToken();
    return (await CreateAccountService.createTag(tag: tag, token: accessToken!))
        .toNotifierState();
  }

  Future<NotifierState<String>> resendVerificationEmail({
    required String email,
  }) async {
    return (await CreateAccountService.resendVerificationEmail(email: email))
        .toNotifierState();
  }

  Future<NotifierState<TagResponse>> createPin({
    required String pin,
  }) async {
    final accessToken = await getAccessToken();
    return (await CreateAccountService.createPin(pin: pin, token: accessToken!))
        .toNotifierState();
  }
}
