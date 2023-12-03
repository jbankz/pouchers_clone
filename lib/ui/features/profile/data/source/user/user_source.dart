import 'package:Pouchers/ui/features/profile/domain/dto/user_dto.dart';
import 'package:Pouchers/ui/features/profile/domain/model/user.dart';
import 'package:dio/dio.dart';

import '../../../domain/model/referral/referral.dart';

abstract class UserSource {
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
}
