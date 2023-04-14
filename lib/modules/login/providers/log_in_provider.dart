import 'package:pouchers/app/helpers/notifiers.dart';
import 'package:pouchers/app/helpers/response_handler.dart';
import 'package:pouchers/modules/create_account/models/create_account_response.dart';
import 'package:pouchers/modules/login/repository/log_in_repository.dart';
import 'package:riverpod/riverpod.dart';

final logInProvider = StateNotifierProvider.autoDispose<
    LogInNotifier, NotifierState<VerifyEmailResponse>>((ref) {
  return LogInNotifier(ref.read(logInRepoProvider));
});

final forgotPasswordProvider = StateNotifierProvider.autoDispose<
    ForgotPasswordNotifier, NotifierState<String>>((ref) {
  return ForgotPasswordNotifier(ref.read(logInRepoProvider));
});

final forgotPasswordProvider2 = StateNotifierProvider.autoDispose<
    ForgotPasswordNotifier, NotifierState<String>>((ref) {
  return ForgotPasswordNotifier(ref.read(logInRepoProvider));
});

final validateForgotPasswordProvider = StateNotifierProvider.autoDispose<
    ValidateForgotPasswordNotifier, NotifierState<String>>((ref) {
  return ValidateForgotPasswordNotifier(ref.read(logInRepoProvider));
});

final resetPasswordProvider = StateNotifierProvider.autoDispose<
    ResetPasswordNotifier, NotifierState<String>>((ref) {
  return ResetPasswordNotifier(ref.read(logInRepoProvider));
});

class LogInNotifier
    extends StateNotifier<NotifierState<VerifyEmailResponse>>
     {
  final LogInRepository _repo;

  LogInNotifier(this._repo) : super(NotifierState());


  void logIn(
      {required String phoneNumber,
        required String password,
        required bool isEmail,
        Function()? then,  Function(bool)? noAuth,}) async {
    state = notifyLoading();
    state = await _repo.logIn(
      phoneNumber: phoneNumber,
      password: password,
      isEmail: isEmail,
    );
    if (state.status == NotifierStatus.done) {
      if (then != null) then();
    }else if(state.noAuth){
      if (noAuth != null) noAuth(state.noAuth);
    }
  }
}

class ForgotPasswordNotifier
    extends StateNotifier<NotifierState<String>>
    {
  final LogInRepository _repo;

  ForgotPasswordNotifier(this._repo) : super(NotifierState());


  void forgotPassword(
      {required String email,
        Function()? then}) async {
    state = notifyLoading();
    state = await _repo.forgotPassword(
      email: email
    );
    if (state.status == NotifierStatus.done) {
      if (then != null) then();
    }
  }
}

class ValidateForgotPasswordNotifier
    extends StateNotifier<NotifierState<String>>
     {
  final LogInRepository _repo;

  ValidateForgotPasswordNotifier(this._repo) : super(NotifierState());


  void validateForgotPassword(
      {required String email,
        required String resetCode,
        Function()? then}) async {
    state = notifyLoading();
    state = await _repo.validateForgotPassword(
        email: email,
      resetCode: resetCode
    );
    if (state.status == NotifierStatus.done) {
      if (then != null) then();
    }
  }
}

class ResetPasswordNotifier
    extends StateNotifier<NotifierState<String>>
    {
  final LogInRepository _repo;

  ResetPasswordNotifier(this._repo) : super(NotifierState());


  void resetPassword(
      {required String email,
        required String password,
        Function()? then}) async {
    state = notifyLoading();
    state = await _repo.resetPassword(
        email: email,
        password: password
    );
    if (state.status == NotifierStatus.done) {
      if (then != null) then();
    }
  }
}