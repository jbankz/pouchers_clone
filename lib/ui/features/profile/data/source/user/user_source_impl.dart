import 'package:Pouchers/ui/features/profile/domain/dto/user_dto.dart';
import 'package:Pouchers/ui/features/profile/domain/model/user.dart';
import 'package:dio/dio.dart';

import '../../../../../../app/core/network/api_path.dart';
import '../../../../../../app/core/network/network_service.dart';

import '../../../domain/model/referral/referral.dart';
import 'user_source.dart';

class UserSourceImpl implements UserSource {
  final NetworkService networkService;

  UserSourceImpl({required this.networkService});

  @override
  Future<User?> validateBVN(
      {required UserDto userDto, CancelToken? cancelToken}) async {
    final response = await networkService.request(
        path: ApiPath.validateBVN,
        requestType: RequestType.patch,
        data: userDto.toJson(),
        cancelToken: cancelToken);
    return User.fromJson(response.data['data'] as Map<String, dynamic>);
  }

  @override
  Future<User?> validateID(
      {required UserDto userDto, CancelToken? cancelToken}) async {
    final response = await networkService.request(
        path: ApiPath.validateID,
        requestType: RequestType.patch,
        data: userDto.toJson(),
        queryParams: {userDto.toJson()['id_type']: userDto.idNumber},
        cancelToken: cancelToken);
    return User.fromJson(response.data['data'] as Map<String, dynamic>);
  }

  @override
  Future<User?> profile({CancelToken? cancelToken}) async {
    final response = await networkService.request(
        path: ApiPath.profile,
        requestType: RequestType.get,
        cancelToken: cancelToken);
    return User.fromJson(response.data['data'] as Map<String, dynamic>);
  }

  @override
  Future<User?> updateProfile(
      {required UserDto userDto, CancelToken? cancelToken}) async {
    final response = await networkService.request(
        path: ApiPath.profile,
        requestType: RequestType.patch,
        data: userDto.toJson(),
        cancelToken: cancelToken);
    return User.fromJson(response.data['data'] as Map<String, dynamic>);
  }

  @override
  Future<User?> changePhoneNumber(
      {required UserDto userDto, CancelToken? cancelToken}) async {
    final response = await networkService.request(
        path: ApiPath.changePhone,
        requestType: RequestType.patch,
        data: userDto.toJson(),
        cancelToken: cancelToken);
    return User.fromJson(response.data['data'] as Map<String, dynamic>);
  }

  @override
  Future<User?> requestPhoneNumberOtp(
      {required UserDto userDto, CancelToken? cancelToken}) async {
    final response = await networkService.request(
        path: ApiPath.requestPhoneChange,
        requestType: RequestType.patch,
        data: userDto.toJson(),
        cancelToken: cancelToken);
    return User.fromJson(response.data['data'] as Map<String, dynamic>);
  }

  @override
  Future<User?> validatePhoneOtp(
      {required UserDto userDto, CancelToken? cancelToken}) async {
    final response = await networkService.request(
        path: ApiPath.validatePhoneOtp,
        requestType: RequestType.post,
        data: userDto.toJson(),
        cancelToken: cancelToken);
    return User.fromJson(response.data['data'] as Map<String, dynamic>);
  }

  @override
  Future<Referral?> referral({CancelToken? cancelToken}) async {
    final response = await networkService.request(
        path: ApiPath.referrals,
        requestType: RequestType.get,
        cancelToken: cancelToken);
    return Referral.fromJson(response.data?['data'] as Map<String, dynamic>);
  }

  @override
  Future<bool> disableAccount(String reason, {CancelToken? cancelToken}) async {
    final response = await networkService.request(
        path: ApiPath.disable,
        requestType: RequestType.patch,
        data: {'disable_reason': reason},
        cancelToken: cancelToken);
    return response.statusCode == 200;
  }

  @override
  Future<bool> deleteAccount({CancelToken? cancelToken}) async {
    final response = await networkService.request(
        path: ApiPath.delete,
        requestType: RequestType.delete,
        cancelToken: cancelToken);
    return response.statusCode == 200;
  }
}
