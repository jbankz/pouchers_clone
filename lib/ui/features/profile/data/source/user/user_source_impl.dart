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

  @override
  Future<User?> user(
      {required UserDto userDto, CancelToken? cancelToken}) async {
    final response = await networkService.request(
        path: '${ApiPath.profile}/${userDto.tag}',
        requestType: RequestType.get,
        cancelToken: cancelToken);
    return User.fromJson(response.data['data'] as Map<String, dynamic>);
  }

  @override
  Future<List<User>> contacts(
      {required UserDto userDto, CancelToken? cancelToken}) async {
    final response = await networkService.request(
        path: ApiPath.contacts,
        requestType: RequestType.post,
        data: userDto.toJson(),
        cancelToken: cancelToken);

    final sample = {
      "status": "success",
      "message": "User's contacts on pouchers fetched successfully",
      "code": 200,
      "data": [
        {
          "id": 2,
          "phone_number": "09058702550",
          "email": "da@enyata.com",
          "first_name": "dayo",
          "last_name": "asha",
          "profile_picture": null,
          "tag": 'daya'
        },
        {
          "id": 4,
          "phone_number": "00010000000",
          "email": "r@enyata.com",
          "first_name": "test2",
          "last_name": "test2",
          "profile_picture": null,
          "tag": 'daya'
        },
        {
          "id": 5,
          "phone_number": "00000011111",
          "email": "w@enyata.com",
          "first_name": "test3",
          "last_name": "test3",
          "profile_picture": null,
          "tag": 'daya'
        },
        {
          "id": 23,
          "phone_number": "09032332135",
          "email": "oke1@gmail.com",
          "first_name": "oke",
          "last_name": "oke",
          "profile_picture": null,
          "tag": 'daya'
        },
        {
          "id": 32,
          "phone_number": "31234415443",
          "email": "timtim@snowwhite.com",
          "first_name": "johnny",
          "last_name": "akinpelu",
          "profile_picture": null,
          "tag": 'daya'
        }
      ]
    };

    return (sample['data'] as List<dynamic>)
        .map((data) => User.fromJson(data as Map<String, dynamic>))
        .toList();
  }
}
