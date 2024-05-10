import 'package:pouchers/ui/features/authentication/domain/dto/auth_dto.dart';
import 'package:pouchers/ui/features/authentication/domain/model/sign_up_model/sign_up_model.dart';
import 'package:dio/dio.dart';

import '../../../profile/domain/model/user.dart';
import '../../domain/dto/two_fa_dto.dart';
import '../../domain/model/create_pin_model/create_pin_model.dart';
import '../../domain/model/create_tag_model/create_tag_model.dart';
import '../../domain/model/generate_2fa_token.dart';
import '../../domain/model/request_otp_model/request_otp_model.dart';
import '../../domain/model/reset_password_model/reset_password_model.dart';
import '../../domain/model/security_questions.dart';
import '../../domain/model/selected_questions.dart';
import '../../domain/model/set_questions.dart';
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
  Future<bool> changePin(AuthDto authDto, {CancelToken? cancelToken});
  Future<bool> validatePin(AuthDto authDto, {CancelToken? cancelToken});
  Future<List<SecurityQuestions>> securityQuestions({CancelToken? cancelToken});
  Future<List<SetQuestions>> setQuestions(TwoFaDto twoFaDto,
      {CancelToken? cancelToken});
  Future<Generate2faToken> generate2faToken({CancelToken? cancelToken});
  Future<bool> validate2faToken(TwoFaDto twoFaDto, {CancelToken? cancelToken});
  Future<List<SelectedQuestions>> selectedQuestions({CancelToken? cancelToken});
  Future<User?> disable2fa(AuthDto authDto, {CancelToken? cancelToken});
  Future<bool> validate2FaQuestion(TwoFaDto twoFaDto,
      {CancelToken? cancelToken});
}
