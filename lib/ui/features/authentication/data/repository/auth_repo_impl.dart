import 'package:Pouchers/app/app.locator.dart';
import 'package:Pouchers/app/core/manager/hive_manager.dart';
import 'package:Pouchers/app/core/manager/secure_manager.dart';
import 'package:Pouchers/app/core/manager/session_manager.dart';
import 'package:Pouchers/ui/features/authentication/data/source/auth_source.dart';
import 'package:Pouchers/ui/features/authentication/domain/dto/auth_dto.dart';
import 'package:Pouchers/ui/features/authentication/domain/dto/two_fa_dto.dart';
import 'package:Pouchers/ui/features/authentication/domain/model/create_pin_model/create_pin_model.dart';
import 'package:Pouchers/ui/features/authentication/domain/model/create_tag_model/create_tag_model.dart';
import 'package:Pouchers/ui/features/authentication/domain/model/generate_2fa_token.dart';
import 'package:Pouchers/ui/features/authentication/domain/model/request_otp_model/request_otp_model.dart';
import 'package:Pouchers/ui/features/authentication/domain/model/reset_password_model/reset_password_model.dart';
import 'package:Pouchers/ui/features/authentication/domain/model/security_questions.dart';
import 'package:Pouchers/ui/features/authentication/domain/model/selected_questions.dart';
import 'package:Pouchers/ui/features/authentication/domain/model/set_questions.dart';
import 'package:Pouchers/ui/features/authentication/domain/model/validate_reset_password_model/validate_reset_password_model.dart';
import 'package:Pouchers/ui/features/authentication/domain/model/sign_in_model/sign_in_model.dart';
import 'package:Pouchers/ui/features/authentication/domain/model/sign_up_model/sign_up_model.dart';
import 'package:Pouchers/ui/features/authentication/domain/model/verify_account_model/verify_account_model.dart';
import 'package:Pouchers/ui/features/profile/domain/model/user.dart';
import 'package:dio/dio.dart';

import '../../../profile/data/dao/user_dao.dart';
import '../../domain/repository/auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  final AuthSource _authSource;
  final _session = locator<SessionManager>();
  final _securedManager = locator<SecuredManager>();

  AuthRepoImpl(this._authSource);

  @override
  Future<SignUpModel?> signUp(AuthDto authDto,
      {CancelToken? cancelToken}) async {
    /// Secure users credentials
    _securedManager
      ..storeEmailCred(authDto.email ?? '')
      ..storePasswordCred(authDto.password ?? '');

    return await _authSource.signUp(authDto, cancelToken: cancelToken);
  }

  @override
  Future<SignInModel?> signIn(AuthDto authDto,
      {CancelToken? cancelToken}) async {
    final response =
        await _authSource.signIn(authDto, cancelToken: cancelToken);

    _session
      ..accessToken = response?.data?.token ?? ''
      ..isGuest = false
      ..isLoggedIn = true;

    /// Secure users credentials
    _securedManager
      ..storeEmailCred(authDto.email ?? '')
      ..storePasswordCred(authDto.password ?? '');

    /// Cache users data
    userDao.save(response?.data);

    return response;
  }

  @override
  Future<VerifyAccountModel?> verifyAccount(AuthDto authDto,
      {CancelToken? cancelToken}) async {
    final response =
        await _authSource.verifyAccount(authDto, cancelToken: cancelToken);
    _session
      ..accessToken = response?.data?.token ?? ''
      ..isLoggedIn = true;

    userDao.save(response?.data);
    return response;
  }

  @override
  Future<RequestOtpModel?> requestOtp(AuthDto authDto,
          {CancelToken? cancelToken}) async =>
      await _authSource.requestOtp(authDto, cancelToken: cancelToken);

  @override
  Future<CreateTagModel?> createTag(AuthDto authDto,
          {CancelToken? cancelToken}) async =>
      await _authSource.createTag(authDto, cancelToken: cancelToken);

  @override
  Future<CreatePinModel?> createPin(AuthDto authDto,
          {CancelToken? cancelToken}) async =>
      await _authSource.createPin(authDto, cancelToken: cancelToken);

  @override
  Future<bool> forgotPassword(AuthDto authDto,
          {CancelToken? cancelToken}) async =>
      await _authSource.forgotPassword(authDto);

  @override
  Future<ValidateResetPasswordModel?> validateResetPassword(AuthDto authDto,
          {CancelToken? cancelToken}) async =>
      await _authSource.validateResetPassword(authDto);

  @override
  Future<ResetPasswordModel?> resetPassword(AuthDto authDto,
          {CancelToken? cancelToken}) async =>
      await _authSource.resetPassword(authDto);

  @override
  Future<bool> changePin(AuthDto authDto, {CancelToken? cancelToken}) async =>
      await _authSource.changePin(authDto, cancelToken: cancelToken);

  @override
  Future<User?> disable2fa(AuthDto authDto, {CancelToken? cancelToken}) async {
    final response =
        await _authSource.disable2fa(authDto, cancelToken: cancelToken);
    userDao.save(response);
    return response;
  }

  @override
  Future<Generate2faToken> generate2faToken({CancelToken? cancelToken}) async =>
      await _authSource.generate2faToken(cancelToken: cancelToken);

  @override
  Future<List<SecurityQuestions>> securityQuestions(
          {CancelToken? cancelToken}) async =>
      await _authSource.securityQuestions(cancelToken: cancelToken);

  @override
  Future<List<SelectedQuestions>> selectedQuestions(
          {CancelToken? cancelToken}) async =>
      await _authSource.selectedQuestions(cancelToken: cancelToken);

  @override
  Future<List<SetQuestions>> setQuestions(TwoFaDto twoFaDto,
          {CancelToken? cancelToken}) async =>
      await _authSource.setQuestions(twoFaDto, cancelToken: cancelToken);

  @override
  Future<bool> validate2faToken(TwoFaDto twoFaDto,
      {CancelToken? cancelToken}) async {
    userDao.save(userDao.user.copyWith(is2faActive: true));

    return await _authSource.validate2faToken(twoFaDto,
        cancelToken: cancelToken);
  }

  @override
  Future<bool> validatePin(AuthDto authDto, {CancelToken? cancelToken}) async =>
      await _authSource.validatePin(authDto, cancelToken: cancelToken);

  @override
  Future<bool> validate2FaQuestion(TwoFaDto twoFaDto,
          {CancelToken? cancelToken}) async =>
      await _authSource.validate2FaQuestion(twoFaDto, cancelToken: cancelToken);
}
