import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pouchers/app/helpers/notifiers.dart';
import 'package:pouchers/app/helpers/response_handler.dart';
import 'package:pouchers/modules/tab_layout/models/profile_model.dart';
import 'package:pouchers/modules/tab_layout/models/security_question.dart';
import 'package:pouchers/modules/tab_layout/models/tier_list.dart';
import 'package:pouchers/modules/tab_layout/repository/account_repository.dart';

final accountProvider =
    StateNotifierProvider.autoDispose<AccountNotifier, NotifierState<String>>(
        (ref) {
  return AccountNotifier(ref.read(accountRepoProvider));
});

final requestPhoneChangeProvider = StateNotifierProvider.autoDispose<
    RequestPhoneChangeNotifier, NotifierState<String>>((ref) {
  return RequestPhoneChangeNotifier(ref.read(accountRepoProvider));
});

final changePhoneProvider = StateNotifierProvider.autoDispose<
    ChangePhoneNotifier, NotifierState<EditProfileResponse>>((ref) {
  return ChangePhoneNotifier(ref.read(accountRepoProvider));
});

final authFactorProvider = StateProvider<bool>((ref) => false);

final editProfileInHouseProvider = StateProvider<EditProfileData>((ref) => EditProfileData());


final editProfileProvider = StateNotifierProvider<EditProfileNotifier,
    NotifierState<EditProfileResponse>>((ref) {
  return EditProfileNotifier(ref.read(accountRepoProvider));
});

final editProfileProvider2 = StateNotifierProvider<EditProfileNotifier,
    NotifierState<EditProfileResponse>>((ref) {
  return EditProfileNotifier(ref.read(accountRepoProvider));
});

final getSecurityQuestionsProvider = StateNotifierProvider.autoDispose<
    GetSecurityQuestionsNotifier,
    NotifierState<SecurityQuestionResponse>>((ref) {
  return GetSecurityQuestionsNotifier(ref.read(accountRepoProvider));
});

final disableUserProvider = StateNotifierProvider.autoDispose<
    DisableUserNotifier, NotifierState<String>>((ref) {
  return DisableUserNotifier(ref.read(accountRepoProvider));
});

final deleteUserProvider = StateNotifierProvider.autoDispose<DeleteUserNotifier,
    NotifierState<String>>((ref) {
  return DeleteUserNotifier(ref.read(accountRepoProvider));
});

final getSelectedQuestionsProvider = StateNotifierProvider.autoDispose<
    GetSelectedQuestionsNotifier,
    NotifierState<SelectedQuestionResponse>>((ref) {
  return GetSelectedQuestionsNotifier(ref.read(accountRepoProvider));
});

final setQuestionProvider = StateNotifierProvider.autoDispose<
    SetQuestionNotifier, NotifierState<String>>((ref) {
  return SetQuestionNotifier(ref.read(accountRepoProvider));
});

final set2QuestionProvider = StateNotifierProvider.autoDispose<
    SetQuestionNotifier, NotifierState<String>>((ref) {
  return SetQuestionNotifier(ref.read(accountRepoProvider));
});

final calculateQuestionProvider = StateProvider<int>((ref) => 0);

final calculateAnswerProvider = StateProvider<int>((ref) => 0);

final checkResendProvider = StateProvider<int>((ref) => 0);

final resetPinProvider =
    StateNotifierProvider.autoDispose<ResetPinNotifier, NotifierState<String>>(
        (ref) {
  return ResetPinNotifier(ref.read(accountRepoProvider));
});

final validatePinProvider = StateNotifierProvider.autoDispose<
    ValidatePinNotifier, NotifierState<String>>((ref) {
  return ValidatePinNotifier(ref.read(accountRepoProvider));
});

final resendOtpProvider =
    StateNotifierProvider.autoDispose<ResendOTPNotifier, NotifierState<String>>(
        (ref) {
  return ResendOTPNotifier(ref.read(accountRepoProvider));
});

final validateOtpProvider = StateNotifierProvider.autoDispose<
    ValidateOTPNotifier, NotifierState<String>>((ref) {
  return ValidateOTPNotifier(ref.read(accountRepoProvider));
});

final validateBvnProvider = StateNotifierProvider.autoDispose<
    ValidateBVNNotifier, NotifierState<EditProfileResponse>>((ref) {
  return ValidateBVNNotifier(ref.read(accountRepoProvider));
});

final validateIDProvider = StateNotifierProvider.autoDispose<ValidateIDNotifier,
    NotifierState<EditProfileResponse>>((ref) {
  return ValidateIDNotifier(ref.read(accountRepoProvider));
});

final getTiersProvider = StateNotifierProvider.autoDispose<GetTiersNotifier,
    NotifierState<TierListResponse>>((ref) {
  return GetTiersNotifier(ref.read(accountRepoProvider));
});

final getSignedProvider = StateNotifierProvider.autoDispose<
    GetSignedUrlNotifier, NotifierState<String>>((ref) {
  return GetSignedUrlNotifier(ref.read(accountRepoProvider));
});

final generate2FAProvider = StateNotifierProvider.autoDispose<
    Generate2FANotifier, NotifierState<String>>((ref) {
  return Generate2FANotifier(ref.read(accountRepoProvider));
});

final validate2FAProvider =
    StateNotifierProvider.autoDispose<Validate2FANotifier, NotifierState<bool>>(
        (ref) {
  return Validate2FANotifier(ref.read(accountRepoProvider));
});

final disable2FAProvider =
    StateNotifierProvider.autoDispose<Disable2FANotifier, NotifierState<bool>>(
        (ref) {
  return Disable2FANotifier(ref.read(accountRepoProvider));
});

class AccountNotifier extends StateNotifier<NotifierState<String>>
    with ResponseHandler {
  final AccountRepository _repo;

  AccountNotifier(this._repo) : super(NotifierState());

  void requestChangePassword({Function()? then}) async {
    state = notifyLoading();
    state = await _repo.requestPasswordChange();
    if (state.status == NotifierStatus.done) {
      if (then != null) then();
    }
  }
}

class RequestPhoneChangeNotifier extends StateNotifier<NotifierState<String>>
    with ResponseHandler {
  final AccountRepository _repo;

  RequestPhoneChangeNotifier(this._repo) : super(NotifierState());

  void requestChangePhone({Function()? then}) async {
    state = notifyLoading();
    state = await _repo.requestPhoneChange();
    if (state.status == NotifierStatus.done) {
      if (then != null) then();
    }
  }
}

class ChangePhoneNotifier
    extends StateNotifier<NotifierState<EditProfileResponse>>
    with ResponseHandler {
  final AccountRepository _repo;

  ChangePhoneNotifier(this._repo) : super(NotifierState());

  void changePhone({required String phoneNumber, Function()? then}) async {
    state = notifyLoading();
    state = await _repo.changePhoneNumber(phoneNumber: phoneNumber);
    if (state.status == NotifierStatus.done) {
      if (then != null) then();
    }
  }
}

class DisableUserNotifier extends StateNotifier<NotifierState<String>>
    with ResponseHandler {
  final AccountRepository _repo;

  DisableUserNotifier(this._repo) : super(NotifierState());

  void disableUser(
      {Function()? then,
      required String reason,
      required String password}) async {
    state = notifyLoading();
    state = await _repo.disableUser(reason, password);
    if (state.status == NotifierStatus.done) {
      if (then != null) then();
    }
  }
}

class DeleteUserNotifier extends StateNotifier<NotifierState<String>>
    with ResponseHandler {
  final AccountRepository _repo;

  DeleteUserNotifier(this._repo) : super(NotifierState());

  void deleteUser({Function()? then, required String reason}) async {
    state = notifyLoading();
    state = await _repo.deleteUser(reason);
    if (state.status == NotifierStatus.done) {
      if (then != null) then();
    }
  }
}

class EditProfileNotifier
    extends StateNotifier<NotifierState<EditProfileResponse>>
    with ResponseHandler {
  final AccountRepository _repo;

  EditProfileNotifier(this._repo) : super(NotifierState());

  void editProfile(
      {String? firstName,
      String? lastName,
      String? tag,
      String? dob,
      String? address,
      String? gender,
      String? profilePicture,
      String? utilityBill,
      bool? isLoginBiometricActive,
      bool? isPaymentBiometricActive,
      Function()? then}) async {
    state = notifyLoading();
    state = await _repo.editProfile(
        firstName: firstName,
        lastName: lastName,
        tag: tag,
        dob: dob,
        address: address,
        gender: gender,
        profilePicture: profilePicture,
        utilityBill: utilityBill,
        isLoginBiometricActive: isLoginBiometricActive,
        isPaymentBiometricActive: isPaymentBiometricActive);
    if (state.status == NotifierStatus.done) {
      if (then != null) then();
    }
  }
}

class GetSecurityQuestionsNotifier
    extends StateNotifier<NotifierState<SecurityQuestionResponse>>
    with ResponseHandler {
  final AccountRepository _repo;

  GetSecurityQuestionsNotifier(this._repo) : super(NotifierState());

  void getSecurityQuestions({Function()? then}) async {
    state = notifyLoading();
    state = await _repo.getSecurityQuestion();
    if (state.status == NotifierStatus.done) {
      if (then != null) then();
    }
  }
}

class GetSelectedQuestionsNotifier
    extends StateNotifier<NotifierState<SelectedQuestionResponse>>
    with ResponseHandler {
  final AccountRepository _repo;

  GetSelectedQuestionsNotifier(this._repo) : super(NotifierState());

  void getSelectedQuestion({Function()? then}) async {
    state = notifyLoading();
    state = await _repo.getSelectedQuestion();
    if (state.status == NotifierStatus.done) {
      if (then != null) then();
    }
  }
}

class SetQuestionNotifier extends StateNotifier<NotifierState<String>>
    with ResponseHandler {
  final AccountRepository _repo;

  SetQuestionNotifier(this._repo) : super(NotifierState());

  void setSecurityQuestion(
      {required String questionId,
      required String answer,
      required bool isValidate,
      Function()? then}) async {
    state = notifyLoading();
    state = await _repo.setSecurityQuestion(
        questionId: questionId, answer: answer, isValidate: isValidate);
    if (state.status == NotifierStatus.done) {
      if (then != null) then();
    }
  }
}

class ResetPinNotifier extends StateNotifier<NotifierState<String>>
    with ResponseHandler {
  final AccountRepository _repo;

  ResetPinNotifier(this._repo) : super(NotifierState());

  void resetPin(
      {required String oldPin,
      required String newPin,
      Function()? then}) async {
    state = notifyLoading();
    state = await _repo.resetPin(oldPin: oldPin, newPin: newPin);
    if (state.status == NotifierStatus.done) {
      if (then != null) then();
    }
  }
}

class ValidatePinNotifier extends StateNotifier<NotifierState<String>>
    with ResponseHandler {
  final AccountRepository _repo;

  ValidatePinNotifier(this._repo) : super(NotifierState());

  void validatePin(
      {required String pin,
      Function()? then,
      Function(String? val)? error}) async {
    state = notifyLoading();
    state = await _repo.validatePin(pin: pin);
    if (state.status == NotifierStatus.done) {
      if (then != null) then();
    } else if (state.status == NotifierStatus.error) {
      if (error != null) error(state.message);
    }
  }
}

class ResendOTPNotifier extends StateNotifier<NotifierState<String>>
    with ResponseHandler {
  final AccountRepository _repo;

  ResendOTPNotifier(this._repo) : super(NotifierState());

  void resendOtp({
    required String email,
    Function()? then,
  }) async {
    state = notifyLoading();
    state = await _repo.resendOtp(email: email);
    if (state.status == NotifierStatus.done) {
      if (then != null) then();
    }
  }
}

class ValidateOTPNotifier extends StateNotifier<NotifierState<String>>
    with ResponseHandler {
  final AccountRepository _repo;

  ValidateOTPNotifier(this._repo) : super(NotifierState());

  void validateResendOtp({
    required String otp,
    Function()? then,
  }) async {
    state = notifyLoading();
    state = await _repo.validateResendOtp(otp: otp);
    if (state.status == NotifierStatus.done) {
      if (then != null) then();
    }
  }
}

class ValidateBVNNotifier
    extends StateNotifier<NotifierState<EditProfileResponse>>
    with ResponseHandler {
  final AccountRepository _repo;

  ValidateBVNNotifier(this._repo) : super(NotifierState());

  void validateBVN({
    required String bvn,
    Function()? then,
  }) async {
    state = notifyLoading();
    state = await _repo.validateBvn(bvn: bvn);
    if (state.status == NotifierStatus.done) {
      if (then != null) then();
    }
  }
}

class ValidateIDNotifier
    extends StateNotifier<NotifierState<EditProfileResponse>>
    with ResponseHandler {
  final AccountRepository _repo;

  ValidateIDNotifier(this._repo) : super(NotifierState());

  void validateID({
    required String idType,
    required String idNumber,
    Function()? then,
  }) async {
    state = notifyLoading();
    state = await _repo.validateId(idNumber: idNumber, idType: idType);
    if (state.status == NotifierStatus.done) {
      if (then != null) then();
    }
  }
}

class GetTiersNotifier extends StateNotifier<NotifierState<TierListResponse>>
    with ResponseHandler {
  final AccountRepository _repo;

  GetTiersNotifier(this._repo) : super(NotifierState());

  void getTierList({
    Function()? then,
  }) async {
    state = notifyLoading();
    state = await _repo.getTierList();
    if (state.status == NotifierStatus.done) {
      if (then != null) then();
    }
  }
}

class GetSignedUrlNotifier extends StateNotifier<NotifierState<String>>
    with ResponseHandler {
  final AccountRepository _repo;

  GetSignedUrlNotifier(this._repo) : super(NotifierState());

  void getSignedUrl(
      {Function()? then,
      required String fileName,
      required bool isPhoto}) async {
    state = notifyLoading();
    state = await _repo.getSignedUrl(fileName: fileName, isPhoto: isPhoto);
    if (state.status == NotifierStatus.done) {
      if (then != null) then();
    }
  }
}

class Generate2FANotifier extends StateNotifier<NotifierState<String>>
    with ResponseHandler {
  final AccountRepository _repo;

  Generate2FANotifier(this._repo) : super(NotifierState());

  void generate2FA({
    Function()? then,
  }) async {
    state = notifyLoading();
    state = await _repo.generate2FA();
    if (state.status == NotifierStatus.done) {
      if (then != null) then();
    }
  }
}

class Validate2FANotifier extends StateNotifier<NotifierState<bool>>
    with ResponseHandler {
  final AccountRepository _repo;

  Validate2FANotifier(this._repo) : super(NotifierState());

  void validate2FA({Function()? then, required String userToken}) async {
    state = notifyLoading();
    state = await _repo.validate2FA(userToken: userToken);
    if (state.status == NotifierStatus.done) {
      if (then != null) then();
    }
  }
}

class Disable2FANotifier extends StateNotifier<NotifierState<bool>>
    with ResponseHandler {
  final AccountRepository _repo;

  Disable2FANotifier(this._repo) : super(NotifierState());

  void disable2FA({
    Function()? then,
  }) async {
    state = notifyLoading();
    state = await _repo.disable2FA();
    if (state.status == NotifierStatus.done) {
      if (then != null) then();
    }
  }
}
