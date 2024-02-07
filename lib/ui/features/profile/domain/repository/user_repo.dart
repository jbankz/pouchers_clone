import 'package:Pouchers/ui/features/profile/domain/model/user.dart';
import 'package:dio/dio.dart';

import '../dto/user_dto.dart';
import '../model/referral/referral.dart';

abstract class UserRepo {
  Future<User?> validateBVN(
      {required UserDto userDto, CancelToken? cancelToken});
  Future<User?> validateID(
      {required UserDto userDto, CancelToken? cancelToken});
  Future<User?> profile({CancelToken? cancelToken});
  Future<User?> updateProfile(
      {required UserDto userDto, CancelToken? cancelToken});
  Future<User?> requestPhoneNumberOtp(
      {required UserDto userDto, CancelToken? cancelToken});
  Future<User?> changePhoneNumber(
      {required UserDto userDto, CancelToken? cancelToken});
  Future<User?> validatePhoneOtp(
      {required UserDto userDto, CancelToken? cancelToken});
  Future<Referral?> referral({CancelToken? cancelToken});
  Future<bool> disableAccount(String reason, {CancelToken? cancelToken});
  Future<bool> deleteAccount({CancelToken? cancelToken});
  Future<User?> user({required UserDto userDto, CancelToken? cancelToken});
  Future<List<User>> contacts(
      {required UserDto userDto, CancelToken? cancelToken});
}
