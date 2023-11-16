import 'package:Pouchers/ui/features/authentication/domain/model/reset_password_model/reset_password_model.dart';
import 'package:Pouchers/ui/features/authentication/domain/model/validate_reset_password_model/validate_reset_password_model.dart';
import 'package:Pouchers/ui/features/authentication/domain/model/sign_in_model/sign_in_model.dart';
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
    final response = await networkService.request(
        path: ApiPath.requestOtp,
        requestType: RequestType.post,
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
}
