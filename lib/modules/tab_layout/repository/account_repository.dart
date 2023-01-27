import 'package:hive_flutter/hive_flutter.dart';
import 'package:pouchers/app/helpers/network_helpers.dart';
import 'package:pouchers/app/helpers/notifiers.dart';
import 'package:pouchers/data/hive_data.dart';
import 'package:pouchers/modules/login/models/login_response.dart';
import 'package:pouchers/modules/tab_layout/models/profile_model.dart';
import 'package:pouchers/modules/tab_layout/models/security_question.dart';
import 'package:pouchers/modules/tab_layout/models/tier_list.dart';
import 'package:pouchers/modules/tab_layout/service/account_service.dart';
import 'package:pouchers/utils/strings.dart';
import 'package:riverpod/riverpod.dart';

final accountRepoProvider =
Provider.autoDispose<AccountRepository>((ref) => AccountRepository(ref));

class AccountRepository {
  final ProviderRef ref;

  AccountRepository(this.ref);

  Future<NotifierState<String>> requestPasswordChange() async {
    final accessToken = await getAccessToken();
    HiveStoreResponseData userProfile = Hive.box(kUserBox).get(kUserInfoKey);
    return (await AccountService.requestPasswordChange(
        email: userProfile.email ?? "", token: accessToken!))
        .toNotifierState();
  }

  Future<NotifierState<String>> requestPhoneChange() async {
    final accessToken = await getAccessToken();
    HiveStoreResponseData userProfile = Hive.box(kUserBox).get(kUserInfoKey);
    return (await AccountService.requestPhoneChange(
        email: userProfile.email ?? "", token: accessToken!))
        .toNotifierState();
  }

  Future<NotifierState<EditProfileResponse>> changePhoneNumber(
      {required String phoneNumber}) async {
    final accessToken = await getAccessToken();
    return (await AccountService.changePhoneNumber(
        phoneNumber: phoneNumber, token: accessToken!))
        .toNotifierState();
  }

  Future<NotifierState<String>> disableUser(String reason,
      String password) async {
    final accessToken = await getAccessToken();
    return (await AccountService.disableAccount(
        reason: reason, token: accessToken!, password: password))
        .toNotifierState();
  }

  Future<NotifierState<String>> deleteUser(String reason) async {
    final accessToken = await getAccessToken();
    return (await AccountService.deleteAccount(
      reason: reason,
      token: accessToken!,
    ))
        .toNotifierState();
  }

  Future<NotifierState<EditProfileResponse>> editProfile({
    String? firstName,
    String? lastName,
    String? tag,
    String? dob,
    String? address,
    String? gender,
    String? profilePicture,
    String? utilityBill,
    bool? isLoginBiometricActive,
    bool? isPaymentBiometricActive
  }) async {
    final accessToken = await getAccessToken();
    final result = await AccountService.editProfile(
        firstName: firstName,
        lastName: lastName,
        tag: tag,
        dob: dob,
        address: address,
        gender: gender,
        profilePicture: profilePicture,
        utilityBill: utilityBill,
        isLoginBiometricActive: isLoginBiometricActive,
        isPaymentBiometricActive: isPaymentBiometricActive,
        token: accessToken!);
    return result.toNotifierState();
  }

  Future<NotifierState<SecurityQuestionResponse>> getSecurityQuestion() async {
    final accessToken = await getAccessToken();
    return (await AccountService.getSecurityQuestion(token: accessToken!))
        .toNotifierState();
  }

  Future<NotifierState<SelectedQuestionResponse>> getSelectedQuestion() async {
    final accessToken = await getAccessToken();
    return (await AccountService.getSelectedQuestion(token: accessToken!))
        .toNotifierState();
  }

  Future<NotifierState<String>> setSecurityQuestion({
    required String questionId,
    required String answer,
    required bool isValidate,
  }) async {
    final accessToken = await getAccessToken();
    return (await AccountService.setSecurityQuestion(
        questionId: questionId,
        answer: answer,
        token: accessToken!,
        isValidate: isValidate))
        .toNotifierState();
  }

  Future<NotifierState<String>> resetPin({
    required String oldPin,
    required String newPin,
  }) async {
    final accessToken = await getAccessToken();
    return (await AccountService.resetPin(
        oldPin: oldPin, newPin: newPin, token: accessToken!))
        .toNotifierState();
  }

  Future<NotifierState<String>> validatePin({required String pin}) async {
    final accessToken = await getAccessToken();
    return (await AccountService.validatePin(pin: pin, token: accessToken!))
        .toNotifierState();
  }

  Future<NotifierState<String>> resendOtp({required String email}) async {
    final accessToken = await getAccessToken();
    return (await AccountService.resendOtp(email: email, token: accessToken!))
        .toNotifierState();
  }

  Future<NotifierState<String>> validateResendOtp({required String otp}) async {
    final accessToken = await getAccessToken();
    return (await AccountService.validateResendOtp(
        otp: otp, token: accessToken!))
        .toNotifierState();
  }


  Future<NotifierState<EditProfileResponse>> validateBvn(
      {required String bvn}) async {
    final accessToken = await getAccessToken();
    return (await AccountService.validateBvn(bvn: bvn, token: accessToken!))
        .toNotifierState();
  }

  Future<NotifierState<EditProfileResponse>> validateId(
      {required String idType, required String idNumber,}) async {
    final accessToken = await getAccessToken();
    return (await AccountService.validateId(
        idType: idType, idNumber: idNumber, token: accessToken!))
        .toNotifierState();
  }

  Future<NotifierState<TierListResponse>> getTierList() async {
    final accessToken = await getAccessToken();
    return (await AccountService.getTierList(token: accessToken!))
        .toNotifierState();
  }

  Future<NotifierState<String>> getSignedUrl(
      {required String fileName, required bool isPhoto}) async {
    final accessToken = await getAccessToken();
    return (await AccountService.getSignedUrl(
        token: accessToken!, fileName: fileName, isPhoto: isPhoto))
        .toNotifierState();
  }

  Future<NotifierState<String>> generate2FA() async {
    final accessToken = await getAccessToken();
    return (await AccountService.generate2FAToken(
        token: accessToken!,))
        .toNotifierState();
  }

  Future<NotifierState<bool>> validate2FA({required String userToken}) async {
    final accessToken = await getAccessToken();
    return (await AccountService.validate2FAToken(
      token: accessToken!, userToken: userToken))
        .toNotifierState();
  }

  Future<NotifierState<bool>> disable2FA() async {
    final accessToken = await getAccessToken();
    return (await AccountService.disable2FA(
      token: accessToken!,))
        .toNotifierState();
  }
}
