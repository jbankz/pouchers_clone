import 'package:Pouchers/ui/features/profile/data/source/user/user_source.dart';
import 'package:Pouchers/ui/features/profile/domain/dto/user_dto.dart';
import 'package:Pouchers/ui/features/profile/domain/model/user.dart';
import 'package:dio/dio.dart';

import '../../domain/repository/user_repo.dart';
import '../dao/user_dao.dart';

class UserRepoImpl implements UserRepo {
  final UserSource _userSource;

  UserRepoImpl(this._userSource);

  @override
  Future<User?> validateBVN(
      {required UserDto userDto, CancelToken? cancelToken}) async {
    final user = await _userSource.validateBVN(userDto: userDto);
    await userDao.save(user);
    return user;
  }

  @override
  Future<User?> validateID(
      {required UserDto userDto, CancelToken? cancelToken}) async {
    final user = await _userSource.validateID(userDto: userDto);
    await userDao.save(user);
    return user;
  }

  @override
  Future<User?> profile({CancelToken? cancelToken}) async {
    final user = await _userSource.profile(cancelToken: cancelToken);
    await userDao.save(user);
    return user;
  }

  @override
  Future<User?> updateProfile(
      {required UserDto userDto, CancelToken? cancelToken}) async {
    final user = await _userSource.updateProfile(
        userDto: userDto, cancelToken: cancelToken);
    await userDao.save(user);
    return user;
  }

  @override
  Future<User?> changePhoneNumber(
      {required UserDto userDto, CancelToken? cancelToken}) async {
    final user = await _userSource.changePhoneNumber(
        userDto: userDto, cancelToken: cancelToken);
    await userDao.save(user);
    return user;
  }

  @override
  Future<User?> requestPhoneNumberOtp(
          {required UserDto userDto, CancelToken? cancelToken}) async =>
      await _userSource.requestPhoneNumberOtp(
          userDto: userDto, cancelToken: cancelToken);

  @override
  Future<User?> validatePhoneOtp(
          {required UserDto userDto, CancelToken? cancelToken}) async =>
      await _userSource.validatePhoneOtp(
          userDto: userDto, cancelToken: cancelToken);
}
