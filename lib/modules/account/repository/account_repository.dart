import 'package:hive_flutter/hive_flutter.dart';
import 'package:Pouchers/app/common/provider.dart';
import 'package:Pouchers/app/helpers/network_helpers.dart';
import 'package:Pouchers/app/helpers/notifiers.dart';
import 'package:Pouchers/app/helpers/service_response.dart';
import 'package:Pouchers/modules/account/models/profile_model.dart';
import 'package:Pouchers/modules/account/models/referral_model.dart';
import 'package:Pouchers/modules/account/models/security_question.dart';
import 'package:Pouchers/modules/account/models/tier_list.dart';
import 'package:Pouchers/modules/account/service/account_service.dart';
import 'package:Pouchers/modules/login/models/login_response.dart';
import 'package:Pouchers/utils/strings.dart';
import 'package:riverpod/riverpod.dart';

import '../../../ui/features/profile/data/dao/user_dao.dart';

final accountRepoProvider =
    Provider.autoDispose<AccountRepository>((ref) => AccountRepository(ref));

class AccountRepository {
  final ProviderRef ref;

  AccountRepository(this.ref);

  Future<NotifierState<String>> requestPasswordChange() async {
    ServiceResponse<String> passwordChange;
    HiveStoreResponseData userProfile = Hive.box(kUserBox).get(kUserInfoKey);
    passwordChange = await AccountService.requestPasswordChange(
        email: userProfile.email ?? "", token: userProfile.token!);

    if (passwordChange.notAuthenticated) {
      await refreshToken(refreshToken: userProfile.refreshToken!);
      HiveStoreResponseData userProfiles = Hive.box(kUserBox).get(kUserInfoKey);
      passwordChange = await AccountService.requestPasswordChange(
          email: userProfiles.email ?? "", token: userProfiles.token!);
    }
    return passwordChange.toNotifierState();
  }

  Future<NotifierState<String>> requestPhoneChange() async {
    ServiceResponse<String> phoneChange;
    HiveStoreResponseData userProfile = Hive.box(kUserBox).get(kUserInfoKey);
    phoneChange = await AccountService.requestPhoneChange(
        email: userProfile.email ?? "", token: userProfile.token!);

    if (phoneChange.notAuthenticated) {
      await refreshToken(refreshToken: userProfile.refreshToken!);
      HiveStoreResponseData userProfiles = Hive.box(kUserBox).get(kUserInfoKey);
      phoneChange = await AccountService.requestPhoneChange(
          email: userProfiles.email ?? "", token: userProfiles.token!);
    }
    return phoneChange.toNotifierState();
  }

  Future<NotifierState<EditProfileResponse>> changePhoneNumber(
      {required String phoneNumber}) async {
    ServiceResponse<EditProfileResponse> changePhone;
    HiveStoreResponseData userProfile = Hive.box(kUserBox).get(kUserInfoKey);
    changePhone = await AccountService.changePhoneNumber(
        phoneNumber: phoneNumber, token: userProfile.token!);

    if (changePhone.notAuthenticated) {
      await refreshToken(refreshToken: userProfile.refreshToken!);
      HiveStoreResponseData userProfiles = Hive.box(kUserBox).get(kUserInfoKey);
      changePhone = await AccountService.changePhoneNumber(
          phoneNumber: phoneNumber, token: userProfiles.token!);
    }
    return changePhone.toNotifierState();
  }

  Future<NotifierState<String>> disableUser(
      String reason, String password) async {
    ServiceResponse<String> disable;
    HiveStoreResponseData userProfile = Hive.box(kUserBox).get(kUserInfoKey);
    disable = await AccountService.disableAccount(
        reason: reason, token: userProfile.token!, password: password);

    if (disable.notAuthenticated) {
      await refreshToken(refreshToken: userProfile.refreshToken!);
      HiveStoreResponseData userProfiles = Hive.box(kUserBox).get(kUserInfoKey);
      disable = await AccountService.disableAccount(
          reason: reason, token: userProfiles.token!, password: password);
    }
    return disable.toNotifierState();
  }

  Future<NotifierState<String>> deleteUser(String reason) async {
    ServiceResponse<String> delete;
    HiveStoreResponseData userProfile = Hive.box(kUserBox).get(kUserInfoKey);
    delete = await AccountService.deleteAccount(
      reason: reason,
      token: userProfile.token!,
    );

    if (delete.notAuthenticated) {
      await refreshToken(refreshToken: userProfile.refreshToken!);
      HiveStoreResponseData userProfiles = Hive.box(kUserBox).get(kUserInfoKey);
      delete = await AccountService.deleteAccount(
        reason: reason,
        token: userProfiles.token!,
      );
    }
    return delete.toNotifierState();
  }

  Future<NotifierState<EditProfileResponse>> editProfile(
      {String? firstName,
      String? lastName,
      String? tag,
      String? dob,
      String? address,
      String? gender,
      String? profilePicture,
      String? utilityBill,
      String? fcmToken,
      String? city,
      String? userState,
      String? postalCode,
      bool? isLoginBiometricActive,
      bool? isPaymentBiometricActive}) async {
    ServiceResponse<EditProfileResponse> editProfile;
    HiveStoreResponseData userProfile = Hive.box(kUserBox).get(kUserInfoKey);
    editProfile = await AccountService.editProfile(
        firstName: firstName,
        lastName: lastName,
        tag: tag,
        dob: dob,
        address: address,
        fcmToken: fcmToken,
        gender: gender,
        profilePicture: profilePicture,
        utilityBill: utilityBill,
        city: city,
        userState: userState,
        postalCode: postalCode,
        isLoginBiometricActive: isLoginBiometricActive,
        isPaymentBiometricActive: isPaymentBiometricActive,
        token: userProfile.token!);

    if (editProfile.notAuthenticated) {
      await refreshToken(refreshToken: userProfile.refreshToken!);
      HiveStoreResponseData userProfiles = Hive.box(kUserBox).get(kUserInfoKey);
      editProfile = await AccountService.editProfile(
          firstName: firstName,
          lastName: lastName,
          tag: tag,
          dob: dob,
          address: address,
          gender: gender,
          city: city,
          userState: userState,
          postalCode: postalCode,
          fcmToken: fcmToken,
          profilePicture: profilePicture,
          utilityBill: utilityBill,
          isLoginBiometricActive: isLoginBiometricActive,
          isPaymentBiometricActive: isPaymentBiometricActive,
          token: userProfiles.token!);
    }
    return editProfile.toNotifierState();
  }

  Future<NotifierState<SecurityQuestionResponse>> getSecurityQuestion() async {
    ServiceResponse<SecurityQuestionResponse> securityQuestion;
    HiveStoreResponseData userProfile = Hive.box(kUserBox).get(kUserInfoKey);
    securityQuestion =
        await AccountService.getSecurityQuestion(token: userProfile.token!);

    if (securityQuestion.notAuthenticated) {
      await refreshToken(refreshToken: userProfile.refreshToken!);
      HiveStoreResponseData userProfiles = Hive.box(kUserBox).get(kUserInfoKey);
      securityQuestion =
          await AccountService.getSecurityQuestion(token: userProfiles.token!);
    }
    return securityQuestion.toNotifierState();
  }

  Future<NotifierState<SelectedQuestionResponse>> getSelectedQuestion() async {
    ServiceResponse<SelectedQuestionResponse> selectedQuestion;
    HiveStoreResponseData userProfile = Hive.box(kUserBox).get(kUserInfoKey);
    selectedQuestion =
        await AccountService.getSelectedQuestion(token: userProfile.token!);

    if (selectedQuestion.notAuthenticated) {
      await refreshToken(refreshToken: userProfile.refreshToken!);
      HiveStoreResponseData userProfiles = Hive.box(kUserBox).get(kUserInfoKey);
      selectedQuestion =
          await AccountService.getSelectedQuestion(token: userProfiles.token!);
    }
    return selectedQuestion.toNotifierState();
  }

  Future<NotifierState<String>> setSecurityQuestion({
    required String questionId,
    required String answer,
    required bool isValidate,
  }) async {
    ServiceResponse<String> setQuestion;
    HiveStoreResponseData userProfile = Hive.box(kUserBox).get(kUserInfoKey);
    setQuestion = await AccountService.setSecurityQuestion(
      questionId: questionId,
      answer: answer,
      token: userProfile.token!,
      isValidate: isValidate,
    );

    if (setQuestion.notAuthenticated) {
      await refreshToken(refreshToken: userProfile.refreshToken!);
      HiveStoreResponseData userProfiles = Hive.box(kUserBox).get(kUserInfoKey);
      setQuestion = await AccountService.setSecurityQuestion(
        questionId: questionId,
        answer: answer,
        token: userProfiles.token!,
        isValidate: isValidate,
      );
    }
    return setQuestion.toNotifierState();
  }

  Future<NotifierState<String>> resetPin({
    required String oldPin,
    required String newPin,
  }) async {
    ServiceResponse<String> reset;
    HiveStoreResponseData userProfile = Hive.box(kUserBox).get(kUserInfoKey);
    reset = await AccountService.resetPin(
        oldPin: oldPin, newPin: newPin, token: userProfile.token!);

    if (reset.notAuthenticated) {
      await refreshToken(refreshToken: userProfile.refreshToken!);
      HiveStoreResponseData userProfiles = Hive.box(kUserBox).get(kUserInfoKey);
      reset = await AccountService.resetPin(
          oldPin: oldPin, newPin: newPin, token: userProfiles.token!);
    }
    return reset.toNotifierState();
  }

  Future<NotifierState<String>> validatePin({required String pin}) async {
    ServiceResponse<String> validatePin;
    HiveStoreResponseData userProfile = Hive.box(kUserBox).get(kUserInfoKey);
    validatePin =
        await AccountService.validatePin(pin: pin, token: userProfile.token!);

    if (validatePin.notAuthenticated) {
      await refreshToken(refreshToken: userProfile.refreshToken!);
      HiveStoreResponseData userProfiles = Hive.box(kUserBox).get(kUserInfoKey);
      validatePin = await AccountService.validatePin(
          pin: pin, token: userProfiles.token!);
    }
    return validatePin.toNotifierState();
  }

  Future<NotifierState<String>> resendOtp({required String email}) async {
    ServiceResponse<String> resendOtp;
    HiveStoreResponseData userProfile = Hive.box(kUserBox).get(kUserInfoKey);
    resendOtp =
        await AccountService.resendOtp(email: email, token: userProfile.token!);

    if (resendOtp.notAuthenticated) {
      await refreshToken(refreshToken: userProfile.refreshToken!);
      HiveStoreResponseData userProfiles = Hive.box(kUserBox).get(kUserInfoKey);
      resendOtp = await AccountService.resendOtp(
          email: email, token: userProfiles.token!);
    }
    return resendOtp.toNotifierState();
  }

  Future<NotifierState<String>> validateResendOtp({required String otp}) async {
    ServiceResponse<String> validateResend;
    HiveStoreResponseData userProfile = Hive.box(kUserBox).get(kUserInfoKey);
    validateResend = await AccountService.validateResendOtp(
        otp: otp, token: userProfile.token!);

    if (validateResend.notAuthenticated) {
      await refreshToken(refreshToken: userProfile.refreshToken!);
      HiveStoreResponseData userProfiles = Hive.box(kUserBox).get(kUserInfoKey);
      validateResend = await AccountService.validateResendOtp(
          otp: otp, token: userProfiles.token!);
    }
    return validateResend.toNotifierState();
  }

  Future<NotifierState<EditProfileResponse>> validateBvn(
      {required String bvn}) async {
    ServiceResponse<EditProfileResponse> validateBvn;
    // HiveStoreResponseData userProfile = Hive.box(kUserBox).get(kUserInfoKey);
    final userProfile = userDao.returnUser(userDao.box);
    validateBvn =
        await AccountService.validateBvn(bvn: bvn, token: userProfile.token!);

    if (validateBvn.notAuthenticated) {
      await refreshToken(refreshToken: userProfile.refreshToken!);
      HiveStoreResponseData userProfiles = Hive.box(kUserBox).get(kUserInfoKey);
      validateBvn = await AccountService.validateBvn(
          bvn: bvn, token: userProfiles.token!);
    }
    return validateBvn.toNotifierState();
  }

  Future<NotifierState<EditProfileResponse>> validateId(
      {required String idType,
      required String idNumber,
      required bool isUpload,
      String? firstName,
      lastName,
      dob}) async {
    ServiceResponse<EditProfileResponse> validateId;
    final userProfile = userDao.returnUser(userDao.box);
    validateId = await AccountService.validateId(
        isUpload: isUpload,
        surname: userProfile.lastName,
        idType: idType,
        idNumber: idNumber,
        firstName: firstName,
        lastName: lastName,
        dob: dob,
        token: userProfile.token!);

    if (validateId.notAuthenticated) {
      await refreshToken(refreshToken: userProfile.refreshToken!);
      HiveStoreResponseData userProfiles = Hive.box(kUserBox).get(kUserInfoKey);
      validateId = await AccountService.validateId(
          isUpload: isUpload,
          surname: userProfiles.lastName,
          idType: idType,
          idNumber: idNumber,
          firstName: firstName,
          lastName: lastName,
          dob: dob,
          token: userProfiles.token!);
    }
    return validateId.toNotifierState();
  }

  Future<NotifierState<TierListResponse>> getTierList() async {
    ServiceResponse<TierListResponse> tierList;
    // HiveStoreResponseData userProfile = Hive.box(kUserBox).get(kUserInfoKey);
    final userProfile = userDao.returnUser(userDao.box);

    tierList = await AccountService.getTierList(token: userProfile.token!);

    if (tierList.notAuthenticated) {
      await refreshToken(refreshToken: userProfile.refreshToken!);
      HiveStoreResponseData userProfiles = Hive.box(kUserBox).get(kUserInfoKey);
      tierList = await AccountService.getTierList(token: userProfiles.token!);
    }
    return tierList.toNotifierState();
  }

  Future<NotifierState<String>> getSignedUrl(
      {required String fileName, required bool isPhoto}) async {
    ServiceResponse<String> signedUrl;
    HiveStoreResponseData userProfile = Hive.box(kUserBox).get(kUserInfoKey);
    signedUrl = await AccountService.getSignedUrl(
        token: userProfile.token!, fileName: fileName, isPhoto: isPhoto);

    if (signedUrl.notAuthenticated) {
      await refreshToken(refreshToken: userProfile.refreshToken!);
      HiveStoreResponseData userProfiles = Hive.box(kUserBox).get(kUserInfoKey);
      signedUrl = await AccountService.getSignedUrl(
          token: userProfiles.token!, fileName: fileName, isPhoto: isPhoto);
    }
    return signedUrl.toNotifierState();
  }

  Future<NotifierState<String>> generate2FA() async {
    ServiceResponse<String> generate2FA;
    HiveStoreResponseData userProfile = Hive.box(kUserBox).get(kUserInfoKey);
    generate2FA = await AccountService.generate2FAToken(
      token: userProfile.token!,
    );

    if (generate2FA.notAuthenticated) {
      await refreshToken(refreshToken: userProfile.refreshToken!);
      HiveStoreResponseData userProfiles = Hive.box(kUserBox).get(kUserInfoKey);
      generate2FA = await AccountService.generate2FAToken(
        token: userProfiles.token!,
      );
    }
    return generate2FA.toNotifierState();
  }

  Future<NotifierState<bool>> validate2FA({required String userToken}) async {
    ServiceResponse<bool> validate2FA;
    HiveStoreResponseData userProfile = Hive.box(kUserBox).get(kUserInfoKey);
    validate2FA = await AccountService.validate2FAToken(
        token: userProfile.token!, userToken: userToken);

    if (validate2FA.notAuthenticated) {
      await refreshToken(refreshToken: userProfile.refreshToken!);
      HiveStoreResponseData userProfiles = Hive.box(kUserBox).get(kUserInfoKey);
      validate2FA = await AccountService.validate2FAToken(
          token: userProfiles.token!, userToken: userToken);
    }
    return validate2FA.toNotifierState();
  }

  Future<NotifierState<bool>> disable2FA(
      {required String transactionPin}) async {
    ServiceResponse<bool> disable2FA;
    HiveStoreResponseData userProfile = Hive.box(kUserBox).get(kUserInfoKey);
    disable2FA = await AccountService.disable2FA(
        token: userProfile.token!, transactionPin: transactionPin);

    if (disable2FA.notAuthenticated) {
      await refreshToken(refreshToken: userProfile.refreshToken!);
      HiveStoreResponseData userProfiles = Hive.box(kUserBox).get(kUserInfoKey);
      disable2FA = await AccountService.disable2FA(
          token: userProfiles.token!, transactionPin: transactionPin);
    }
    return disable2FA.toNotifierState();
  }

  Future<NotifierState<GetReferralResponse>> getReferralTrail() async {
    ServiceResponse<GetReferralResponse> getReferralTrail;
    HiveStoreResponseData userProfile = Hive.box(kUserBox).get(kUserInfoKey);
    getReferralTrail = await AccountService.getReferralTrail(
      token: userProfile.token!,
    );

    if (getReferralTrail.notAuthenticated) {
      await refreshToken(refreshToken: userProfile.refreshToken!);
      HiveStoreResponseData userProfiles = Hive.box(kUserBox).get(kUserInfoKey);
      getReferralTrail = await AccountService.getReferralTrail(
        token: userProfiles.token!,
      );
    }
    return getReferralTrail.toNotifierState();
  }

  Future<NotifierState<BannerResponse>> getBanner() async {
    ServiceResponse<BannerResponse> getBanner;
    HiveStoreResponseData userProfile = Hive.box(kUserBox).get(kUserInfoKey);
    getBanner = await AccountService.getBanner(
      token: userProfile.token!,
    );

    if (getBanner.notAuthenticated) {
      await refreshToken(refreshToken: userProfile.refreshToken!);
      HiveStoreResponseData userProfiles = Hive.box(kUserBox).get(kUserInfoKey);
      getBanner = await AccountService.getBanner(
        token: userProfiles.token!,
      );
    }
    return getBanner.toNotifierState();
  }

  Future<NotifierState<EditProfileResponse>> getUserProfile() async {
    ServiceResponse<EditProfileResponse> getUserProfile;
    HiveStoreResponseData userProfile = Hive.box(kUserBox).get(kUserInfoKey);
    getUserProfile = await AccountService.getUserProfile(
      token: userProfile.token!,
    );

    if (getUserProfile.notAuthenticated) {
      await refreshToken(refreshToken: userProfile.refreshToken!);
      HiveStoreResponseData userProfiles = Hive.box(kUserBox).get(kUserInfoKey);
      getUserProfile = await AccountService.getUserProfile(
        token: userProfiles.token!,
      );
    }
    return getUserProfile.toNotifierState();
  }

  Future<NotifierState<ManageRequestResponse>> manageRequest(
      {required String type, required int page, String? status}) async {
    ServiceResponse<ManageRequestResponse> manageRequest;
    HiveStoreResponseData userProfile = Hive.box(kUserBox).get(kUserInfoKey);
    manageRequest = await AccountService.manageRequest(
        token: userProfile.token!, page: page, type: type, status: status);

    if (manageRequest.notAuthenticated) {
      await refreshToken(refreshToken: userProfile.refreshToken!);
      HiveStoreResponseData userProfiles = Hive.box(kUserBox).get(kUserInfoKey);
      manageRequest = await AccountService.manageRequest(
          token: userProfiles.token!, page: page, type: type, status: status);
    }
    return manageRequest.toNotifierState();
  }
}
