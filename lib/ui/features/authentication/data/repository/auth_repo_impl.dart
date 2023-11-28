import 'package:Pouchers/app/app.locator.dart';
import 'package:Pouchers/app/core/manager/secure_manager.dart';
import 'package:Pouchers/app/core/manager/session_manager.dart';
import 'package:Pouchers/ui/features/authentication/data/source/auth_source.dart';
import 'package:Pouchers/ui/features/authentication/domain/dto/auth_dto.dart';
import 'package:Pouchers/ui/features/authentication/domain/model/create_pin_model/create_pin_model.dart';
import 'package:Pouchers/ui/features/authentication/domain/model/create_tag_model/create_tag_model.dart';
import 'package:Pouchers/ui/features/authentication/domain/model/request_otp_model/request_otp_model.dart';
import 'package:Pouchers/ui/features/authentication/domain/model/reset_password_model/reset_password_model.dart';
import 'package:Pouchers/ui/features/authentication/domain/model/validate_reset_password_model/validate_reset_password_model.dart';
import 'package:Pouchers/ui/features/authentication/domain/model/sign_in_model/sign_in_model.dart';
import 'package:Pouchers/ui/features/authentication/domain/model/sign_up_model/sign_up_model.dart';
import 'package:Pouchers/ui/features/authentication/domain/model/verify_account_model/verify_account_model.dart';
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
}
