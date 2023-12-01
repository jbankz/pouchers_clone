import 'package:dio/dio.dart';

import '../../../profile/domain/model/user.dart';
import '../dto/auth_dto.dart';
import '../dto/two_fa_dto.dart';
import '../model/create_pin_model/create_pin_model.dart';
import '../model/create_tag_model/create_tag_model.dart';
import '../model/generate_2fa_token.dart';
import '../model/request_otp_model/request_otp_model.dart';
import '../model/reset_password_model/reset_password_model.dart';
import '../model/security_questions.dart';
import '../model/selected_questions.dart';
import '../model/set_questions.dart';
import '../model/validate_reset_password_model/validate_reset_password_model.dart';
import '../model/sign_in_model/sign_in_model.dart';
import '../model/sign_up_model/sign_up_model.dart';
import '../model/verify_account_model/verify_account_model.dart';

abstract class AuthRepo {
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
  Future<bool> changePin(AuthDto authDto, {CancelToken? cancelToken});
  Future<bool> validatePin(AuthDto authDto, {CancelToken? cancelToken});
  Future<List<SecurityQuestions>> securityQuestions({CancelToken? cancelToken});
  Future<List<SetQuestions>> setQuestions(TwoFaDto twoFaDto,
      {CancelToken? cancelToken});
  Future<Generate2faToken> generate2faToken({CancelToken? cancelToken});
  Future<bool> validate2faToken(TwoFaDto twoFaDto, {CancelToken? cancelToken});
  Future<List<SelectedQuestions>> selectedQuestions({CancelToken? cancelToken});
  Future<User?> disable2fa({CancelToken? cancelToken});
  Future<bool> validate2FaQuestion(TwoFaDto twoFaDto,
      {CancelToken? cancelToken});
}
