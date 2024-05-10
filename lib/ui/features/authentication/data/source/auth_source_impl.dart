import 'package:pouchers/ui/features/authentication/domain/dto/two_fa_dto.dart';
import 'package:pouchers/ui/features/authentication/domain/model/generate_2fa_token.dart';
import 'package:pouchers/ui/features/authentication/domain/model/reset_password_model/reset_password_model.dart';
import 'package:pouchers/ui/features/authentication/domain/model/security_questions.dart';
import 'package:pouchers/ui/features/authentication/domain/model/selected_questions.dart';
import 'package:pouchers/ui/features/authentication/domain/model/set_questions.dart';
import 'package:pouchers/ui/features/authentication/domain/model/validate_reset_password_model/validate_reset_password_model.dart';
import 'package:pouchers/ui/features/authentication/domain/model/sign_in_model/sign_in_model.dart';
import 'package:pouchers/ui/features/profile/domain/model/user.dart';
import 'package:dio/dio.dart';

import '../../../../../app/core/network/api_path.dart';
import '../../../../../app/core/network/network_service.dart';
import '../../domain/dto/auth_dto.dart';
import '../../domain/model/create_pin_model/create_pin_model.dart';
import '../../domain/model/create_tag_model/create_tag_model.dart';
import '../../domain/model/request_otp_model/request_otp_model.dart';
import '../../domain/model/sign_up_model/sign_up_model.dart';
import '../../domain/model/verify_account_model/verify_account_model.dart';
import 'auth_source.dart';

class AuthSourceImpl implements AuthSource {
  final NetworkService networkService;

  AuthSourceImpl({required this.networkService});

  @override
  Future<SignUpModel?> signUp(AuthDto authDto,
      {CancelToken? cancelToken}) async {
    final response = await networkService.request(
        path: ApiPath.signup,
        requestType: RequestType.post,
        data: authDto.toJson(),
        cancelToken: cancelToken);
    return SignUpModel.fromJson(response.data as Map<String, dynamic>);
  }

  @override
  Future<SignInModel?> signIn(AuthDto authDto,
      {CancelToken? cancelToken}) async {
    final response = await networkService.request(
        path: ApiPath.login,
        requestType: RequestType.post,
        data: authDto.toJson(),
        cancelToken: cancelToken);
    response.data?['tag'] = null;

    return SignInModel.fromJson(response.data as Map<String, dynamic>);
  }

  @override
  Future<VerifyAccountModel?> verifyAccount(AuthDto authDto,
      {CancelToken? cancelToken}) async {
    final response = await networkService.request(
        path: ApiPath.verifyAccount,
        requestType: RequestType.post,
        data: authDto.toJson(),
        cancelToken: cancelToken);
    return VerifyAccountModel.fromJson(response.data as Map<String, dynamic>);
  }

  @override
  Future<RequestOtpModel?> requestOtp(AuthDto authDto,
      {CancelToken? cancelToken}) async {
    final String path = authDto.userJustWantsToChangeTherePassword
        ? ApiPath.requestOtpForChangingPassword
        : ApiPath.requestOtp;

    final type = authDto.userJustWantsToChangeTherePassword
        ? RequestType.patch
        : RequestType.post;

    final response = await networkService.request(
        path: path,
        requestType: type,
        data: authDto.toJson(),
        cancelToken: cancelToken);
    return RequestOtpModel.fromJson(response.data as Map<String, dynamic>);
  }

  @override
  Future<CreateTagModel?> createTag(AuthDto authDto,
      {CancelToken? cancelToken}) async {
    final response = await networkService.request(
        path: ApiPath.createTag,
        requestType: RequestType.post,
        data: authDto.toJson(),
        cancelToken: cancelToken);

    return CreateTagModel.fromJson(response.data as Map<String, dynamic>);
  }

  @override
  Future<CreatePinModel?> createPin(AuthDto authDto,
      {CancelToken? cancelToken}) async {
    final response = await networkService.request(
        path: ApiPath.createPin,
        requestType: RequestType.post,
        data: authDto.toJson(),
        cancelToken: cancelToken);
    return CreatePinModel.fromJson(response.data as Map<String, dynamic>);
  }

  @override
  Future<bool> forgotPassword(AuthDto authDto,
      {CancelToken? cancelToken}) async {
    final response = await networkService.request(
        path: ApiPath.forgotPassword,
        requestType: RequestType.post,
        data: authDto.toJson(),
        cancelToken: cancelToken);
    return response.statusCode == 200;
  }

  @override
  Future<ValidateResetPasswordModel?> validateResetPassword(AuthDto authDto,
      {CancelToken? cancelToken}) async {
    final response = await networkService.request(
        path: ApiPath.validatePasswordResetPassword,
        requestType: RequestType.post,
        data: authDto.toJson(),
        cancelToken: cancelToken);
    return ValidateResetPasswordModel.fromJson(
        response.data as Map<String, dynamic>);
  }

  @override
  Future<ResetPasswordModel?> resetPassword(AuthDto authDto,
      {CancelToken? cancelToken}) async {
    final response = await networkService.request(
        path: ApiPath.resetPassword,
        requestType: RequestType.put,
        data: authDto.toJson(),
        cancelToken: cancelToken);
    return ResetPasswordModel.fromJson(response.data as Map<String, dynamic>);
  }

  @override
  Future<bool> changePin(AuthDto authDto, {CancelToken? cancelToken}) async {
    final response = await networkService.request(
        path: ApiPath.resetPin,
        requestType: RequestType.patch,
        data: authDto.toJson(),
        cancelToken: cancelToken);
    return response.statusCode == 200;
  }

  @override
  Future<User?> disable2fa(AuthDto authDto, {CancelToken? cancelToken}) async {
    final response = await networkService.request(
        path: ApiPath.disable2fa,
        requestType: RequestType.patch,
        data: authDto.toJson(),
        cancelToken: cancelToken);
    return User.fromJson(response.data?['data'] as Map<String, dynamic>);
  }

  @override
  Future<Generate2faToken> generate2faToken({CancelToken? cancelToken}) async {
    final response = await networkService.request(
        path: ApiPath.generate2fa,
        requestType: RequestType.post,
        cancelToken: cancelToken);
    return Generate2faToken.fromJson(
        response.data?['data'] as Map<String, dynamic>);
  }

  @override
  Future<List<SecurityQuestions>> securityQuestions(
      {CancelToken? cancelToken}) async {
    final response = await networkService.request(
        path: ApiPath.securityQuestions,
        requestType: RequestType.get,
        cancelToken: cancelToken);
    return (response.data?['data'] as List<dynamic>)
        .map((json) => SecurityQuestions.fromJson(json))
        .toList();
  }

  @override
  Future<List<SelectedQuestions>> selectedQuestions(
      {CancelToken? cancelToken}) async {
    final response = await networkService.request(
        path: ApiPath.selectedQuestions,
        requestType: RequestType.get,
        cancelToken: cancelToken);
    return (response.data?['data'] as List<dynamic>)
        .map((json) => SelectedQuestions.fromJson(json))
        .toList();
  }

  @override
  Future<List<SetQuestions>> setQuestions(TwoFaDto twoFaDto,
      {CancelToken? cancelToken}) async {
    final response = await networkService.request(
        path: ApiPath.setQuestions,
        requestType: RequestType.post,
        data: twoFaDto.toJson(),
        cancelToken: cancelToken);
    return (response.data?['data'] as List<dynamic>)
        .map((data) => SetQuestions.fromJson(data as Map<String, dynamic>))
        .toList();
  }

  @override
  Future<bool> validate2faToken(TwoFaDto twoFaDto,
      {CancelToken? cancelToken}) async {
    final response = await networkService.request(
        path: ApiPath.validate2Fa,
        requestType: RequestType.post,
        data: twoFaDto.toJson(),
        cancelToken: cancelToken);
    return response.statusCode == 200;
  }

  @override
  Future<bool> validatePin(AuthDto authDto, {CancelToken? cancelToken}) async {
    final response = await networkService.request(
        path: ApiPath.validatePin,
        requestType: RequestType.post,
        data: authDto.toJson(),
        cancelToken: cancelToken);
    return response.statusCode == 200;
  }

  @override
  Future<bool> validate2FaQuestion(TwoFaDto twoFaDto,
      {CancelToken? cancelToken}) async {
    final response = await networkService.request(
        path: ApiPath.validate2FaQuestion,
        requestType: RequestType.post,
        data: twoFaDto.toJson(),
        cancelToken: cancelToken);
    return response.statusCode == 200;
  }
}
