import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:Pouchers/app/helpers/notifiers.dart';
import 'package:Pouchers/app/helpers/response_handler.dart';
import 'package:Pouchers/modules/account/models/profile_model.dart';
import 'package:Pouchers/modules/account/models/referral_model.dart';
import 'package:Pouchers/modules/account/models/security_question.dart';
import 'package:Pouchers/modules/account/models/tier_list.dart';
import 'package:Pouchers/modules/account/repository/account_repository.dart';

final accountProvider =
    StateNotifierProvider.autoDispose<AccountNotifier, NotifierState<String>>(
        (ref) {
  return AccountNotifier(ref.read(accountRepoProvider));
});

final accountProvider2 =
    StateNotifierProvider.autoDispose<AccountNotifier, NotifierState<String>>(
        (ref) {
  return AccountNotifier(ref.read(accountRepoProvider));
});

final requestPhoneChangeProvider = StateNotifierProvider.autoDispose<
    RequestPhoneChangeNotifier, NotifierState<String>>((ref) {
  return RequestPhoneChangeNotifier(ref.read(accountRepoProvider));
});

final requestPhoneChangeProvider2 = StateNotifierProvider.autoDispose<
    RequestPhoneChangeNotifier, NotifierState<String>>((ref) {
  return RequestPhoneChangeNotifier(ref.read(accountRepoProvider));
});

final changePhoneProvider = StateNotifierProvider.autoDispose<
    ChangePhoneNotifier, NotifierState<EditProfileResponse>>((ref) {
  return ChangePhoneNotifier(ref.read(accountRepoProvider));
});

final authFactorProvider = StateProvider<bool>((ref) => false);

final editProfileInHouseProvider =
    StateProvider<EditProfileData>((ref) => EditProfileData());

final biometricProvider = StateProvider<Biometric>((ref) => Biometric());

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

final checkObscureProvider = StateProvider<bool>((ref) => false);

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

final getReferralProvider = StateNotifierProvider.autoDispose<
    GetReferralNotifier, NotifierState<GetReferralResponse>>((ref) {
  return GetReferralNotifier(ref.read(accountRepoProvider));
});

final getBannerProvider =
    StateNotifierProvider<GetBannerNotifier, NotifierState<BannerResponse>>(
        (ref) {
  return GetBannerNotifier(ref.read(accountRepoProvider));
});

final getUserProfileProvider = StateNotifierProvider<GetUserProfileNotifier,
    NotifierState<EditProfileResponse>>((ref) {
  return GetUserProfileNotifier(ref.read(accountRepoProvider));
});

final manageRequestProvider = StateNotifierProvider<ManageRequestNotifier,
    NotifierState<ManageRequestResponse>>((ref) {
  return ManageRequestNotifier(ref.read(accountRepoProvider));
});

final manageReceivedRequestProvider = StateNotifierProvider<ManageRequestNotifier,
    NotifierState<ManageRequestResponse>>((ref) {
  return ManageRequestNotifier(ref.read(accountRepoProvider));
});

class AccountNotifier extends StateNotifier<NotifierState<String>> {
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

class RequestPhoneChangeNotifier extends StateNotifier<NotifierState<String>> {
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
    extends StateNotifier<NotifierState<EditProfileResponse>> {
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

class DisableUserNotifier extends StateNotifier<NotifierState<String>> {
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

class DeleteUserNotifier extends StateNotifier<NotifierState<String>> {
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
    extends StateNotifier<NotifierState<EditProfileResponse>> {
  final AccountRepository _repo;

  EditProfileNotifier(this._repo) : super(NotifierState());

  void editProfile({
    String? firstName,
    String? lastName,
    String? tag,
    String? dob,
    String? address,
    String? gender,
    String? profilePicture,
    String? fcmToken,
    String? utilityBill,
    String? city,
    String? userState,
    String? postalCode,
    bool? isLoginBiometricActive,
    bool? isPaymentBiometricActive,
    Function()? then,
    Function(bool)? noAuth,
  }) async {
    state = notifyLoading();
    state = await _repo.editProfile(
        firstName: firstName,
        lastName: lastName,
        tag: tag,
        dob: dob,
        address: address,
        fcmToken: fcmToken,
        gender: gender,
        city: city,
        userState: userState,
        postalCode: postalCode,
        profilePicture: profilePicture,
        utilityBill: utilityBill,
        isLoginBiometricActive: isLoginBiometricActive,
        isPaymentBiometricActive: isPaymentBiometricActive);
    if (state.status == NotifierStatus.done) {
      if (then != null) then();
    } else if (state.noAuth) {
      if (noAuth != null) noAuth(state.noAuth);
    }
  }
}

class GetSecurityQuestionsNotifier
    extends StateNotifier<NotifierState<SecurityQuestionResponse>> {
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
    extends StateNotifier<NotifierState<SelectedQuestionResponse>> {
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

class SetQuestionNotifier extends StateNotifier<NotifierState<String>> {
  final AccountRepository _repo;

  SetQuestionNotifier(this._repo) : super(NotifierState());

  void setSecurityQuestion(
      {required String questionId,
      required String answer,
      required bool isValidate,
      Function()? then}) async {
    state = notifyLoading();
    state = await _repo.setSecurityQuestion(
      questionId: questionId,
      answer: answer,
      isValidate: isValidate,
    );
    if (state.status == NotifierStatus.done) {
      if (then != null) then();
    }
  }
}

class ResetPinNotifier extends StateNotifier<NotifierState<String>> {
  final AccountRepository _repo;

  ResetPinNotifier(this._repo) : super(NotifierState());

  void resetPin(
      {required String oldPin,
      required String newPin,
      Function()? then,
      Function(bool)? noAuth}) async {
    state = notifyLoading();
    state = await _repo.resetPin(oldPin: oldPin, newPin: newPin);
    if (state.status == NotifierStatus.done) {
      if (then != null) then();
    } else if (state.noAuth) {
      if (noAuth != null) noAuth(state.noAuth);
    }
  }
}

class ValidatePinNotifier extends StateNotifier<NotifierState<String>> {
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

class ResendOTPNotifier extends StateNotifier<NotifierState<String>> {
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

class ValidateOTPNotifier extends StateNotifier<NotifierState<String>> {
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
    extends StateNotifier<NotifierState<EditProfileResponse>> {
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
    extends StateNotifier<NotifierState<EditProfileResponse>> {
  final AccountRepository _repo;

  ValidateIDNotifier(this._repo) : super(NotifierState());

  void validateID({
    required String idType,
    required String idNumber,
    required bool isUpload,
    String? firstName, lastName, dob,
    Function()? then,
  }) async {
    state = notifyLoading();
    state = await _repo.validateId(
      idNumber: idNumber,
      idType: idType,
      firstName: firstName,
      lastName: lastName,
      dob: dob,
      isUpload: isUpload
    );
    if (state.status == NotifierStatus.done) {
      if (then != null) then();
    }
  }
}

class GetTiersNotifier extends StateNotifier<NotifierState<TierListResponse>> {
  final AccountRepository _repo;

  GetTiersNotifier(this._repo) : super(NotifierState());

  void getTierList({
    Function(TierListResponse)? then,
  }) async {
    state = notifyLoading();
    state = await _repo.getTierList();
    if (state.status == NotifierStatus.done) {
      if (then != null) then(state.data!);
    }
  }
}

class GetSignedUrlNotifier extends StateNotifier<NotifierState<String>> {
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

class Generate2FANotifier extends StateNotifier<NotifierState<String>> {
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

class Validate2FANotifier extends StateNotifier<NotifierState<bool>> {
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

class Disable2FANotifier extends StateNotifier<NotifierState<bool>> {
  final AccountRepository _repo;

  Disable2FANotifier(this._repo) : super(NotifierState());

  void disable2FA({
    required String transactionPin,
    Function()? then,
  }) async {
    state = notifyLoading();
    state = await _repo.disable2FA(transactionPin: transactionPin);
    if (state.status == NotifierStatus.done) {
      if (then != null) then();
    }
  }
}

class GetReferralNotifier
    extends StateNotifier<NotifierState<GetReferralResponse>> {
  final AccountRepository _repo;

  GetReferralNotifier(this._repo) : super(NotifierState());

  void getReferralTrail({
    Function()? then,
  }) async {
    state = notifyLoading();
    state = await _repo.getReferralTrail();
    if (state.status == NotifierStatus.done) {
      if (then != null) then();
    }
  }
}

class GetBannerNotifier extends StateNotifier<NotifierState<BannerResponse>> {
  final AccountRepository _repo;

  GetBannerNotifier(this._repo) : super(NotifierState());

  void getBanner({
    Function()? then,
  }) async {
    state = notifyLoading();
    state = await _repo.getBanner();
    if (state.status == NotifierStatus.done) {
      if (then != null) then();
    }
  }
}

class GetUserProfileNotifier
    extends StateNotifier<NotifierState<EditProfileResponse>> {
  final AccountRepository _repo;

  GetUserProfileNotifier(this._repo) : super(NotifierState());

  void getUserProfile({
    Function()? then,
  }) async {
    state = notifyLoading();
    state = await _repo.getUserProfile();
    if (state.status == NotifierStatus.done) {
      if (then != null) then();
    }
  }
}


class ManageRequestNotifier
    extends StateNotifier<NotifierState<ManageRequestResponse>> {
  final AccountRepository _repo;

  ManageRequestNotifier(this._repo) : super(NotifierState());

  void manageRequest({
    Function(ManageRequestData)? then,
    required String type,
     String? status,
    required int page,
  }) async {
    state = notifyLoading();
    state = await _repo.manageRequest(type: type, page: page, status: status);
    if (state.status == NotifierStatus.done) {
      if (then != null) then(state.data!.data!);
    }
  }
}
