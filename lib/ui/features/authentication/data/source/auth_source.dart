import 'package:Pouchers/ui/features/authentication/domain/dto/auth_dto.dart';
import 'package:Pouchers/ui/features/authentication/domain/model/sign_up_model/sign_up_model.dart';
import 'package:dio/dio.dart';

import '../../domain/model/create_pin_model/create_pin_model.dart';
import '../../domain/model/create_tag_model/create_tag_model.dart';
import '../../domain/model/request_otp_model/request_otp_model.dart';
import '../../domain/model/reset_password_model/reset_password_model.dart';
import '../../domain/model/validate_reset_password_model/validate_reset_password_model.dart';
import '../../domain/model/sign_in_model/sign_in_model.dart';
import '../../domain/model/verify_account_model/verify_account_model.dart';

abstract class AuthSource {
  Future<SignUpModel?> signUp(AuthDto authDto, {CancelToken? cancelToken});
  Future<SignInModel?> signIn(AuthDto authDto, {CancelToken? cancelToken});
  Future<VerifyAccountModel?> verifyAccount(AuthDto authDto,
      {CancelToken? cancelToken});
  Future<RequestOtpModel?> requestOtp(AuthDto authDto,
      {CancelToken? cancelToken});
  Future<CreateTagModel?> createTag(AuthDto authDto,
      {CancelToken? cancelToken});
  Future<CreatePinModel?> createPin(AuthDto authDto,
      {CancelToken? cancelToken});
  Future<bool> forgotPassword(AuthDto authDto, {CancelToken? cancelToken});
  Future<ValidateResetPasswordModel?> validateResetPassword(AuthDto authDto,
      {CancelToken? cancelToken});
  Future<ResetPasswordModel?> resetPassword(AuthDto authDto,
      {CancelToken? cancelToken});
}
