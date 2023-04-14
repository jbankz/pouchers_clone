import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pouchers/app/helpers/notifiers.dart';
import 'package:pouchers/modules/create_account/models/create_account_response.dart';
import 'package:pouchers/modules/create_account/repository/create_account_repository.dart';

final createAccountProvider = StateNotifierProvider.autoDispose<
    CreateAccountNotifier, NotifierState<CreateAccountResponse>>((ref) {
  return CreateAccountNotifier(ref.read(createAccountRepoProvider));
});

final verifyEmailProvider = StateNotifierProvider.autoDispose<
    VerifyEmailNotifier, NotifierState<VerifyEmailResponse>>((ref) {
  return VerifyEmailNotifier(ref.read(createAccountRepoProvider));
});

final createTagProvider = StateNotifierProvider.autoDispose<CreateTagNotifier,
    NotifierState<TagResponse>>((ref) {
  return CreateTagNotifier(ref.read(createAccountRepoProvider));
});

final createPinProvider = StateNotifierProvider.autoDispose<CreatePinNotifier,
    NotifierState<TagResponse>>((ref) {
  return CreatePinNotifier(ref.read(createAccountRepoProvider));
});

final resendEmailProvider = StateNotifierProvider.autoDispose<
    ResendEmailNotifier, NotifierState<String>>((ref) {
  return ResendEmailNotifier(ref.read(createAccountRepoProvider));
});



class CreateAccountNotifier
    extends StateNotifier<NotifierState<CreateAccountResponse>>
     {
  final CreateAccountRepository _repo;

  CreateAccountNotifier(this._repo) : super(NotifierState());

  void createAccount(
      {required String firstName,
      required String lastName,
      required String email,
      required String phoneNumber,
      required String password,
      Function()? then}) async {
    state = notifyLoading();
    state = await _repo.createAccount(
      firstName: firstName,
      lastName: lastName,
      email: email,
      phoneNumber: phoneNumber,
      password: password,
    );
    if (state.status == NotifierStatus.done) {
      if (then != null) then();
    }
  }
}

class VerifyEmailNotifier
    extends StateNotifier<NotifierState<VerifyEmailResponse>>
     {
  final CreateAccountRepository _repo;

  VerifyEmailNotifier(this._repo) : super(NotifierState());

  void verifyEmail({required String otp, Function()? then}) async {
    state = notifyLoading();
    state = await _repo.verifyEmail(otp: otp);
    if (state.status == NotifierStatus.done) {
      if (then != null) then();
    }
  }
}

class CreateTagNotifier extends StateNotifier<NotifierState<TagResponse>>
   {
  final CreateAccountRepository _repo;

  CreateTagNotifier(this._repo) : super(NotifierState());

  void createTag({required String tag, Function()? then}) async {
    state = notifyLoading();
    state = await _repo.createTag(tag: tag);
    if (state.status == NotifierStatus.done) {
      if (then != null) then();
    }
  }
}

class CreatePinNotifier extends StateNotifier<NotifierState<TagResponse>>
     {
  final CreateAccountRepository _repo;

  CreatePinNotifier(this._repo) : super(NotifierState());

  void createPin({required String pin, Function()? then}) async {
    state = notifyLoading();
    state = await _repo.createPin(pin: pin);
    if (state.status == NotifierStatus.done) {
      if (then != null) then();
    }
  }
}



class ResendEmailNotifier extends StateNotifier<NotifierState<String>>
     {
  final CreateAccountRepository _repo;

  ResendEmailNotifier(this._repo) : super(NotifierState());

  void resendVerificationEmail(
      {required String email, Function()? then}) async {
    state = notifyLoading();
    state = await _repo.resendVerificationEmail(email: email);
    if (state.status == NotifierStatus.done) {
      if (then != null) then();
    }
  }
}
