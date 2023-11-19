import 'package:Pouchers/ui/features/profile/domain/model/user.dart';
import 'package:dio/dio.dart';

import '../dto/user_dto.dart';

abstract class UserRepo {
  Future<User?> validateBVN(
      {required UserDto userDto, CancelToken? cancelToken});
  Future<User?> validateID(
      {required UserDto userDto, CancelToken? cancelToken});
}
