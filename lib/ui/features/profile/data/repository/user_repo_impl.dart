import 'package:Pouchers/ui/features/profile/data/dao/contacts_dao.dart';
import 'package:Pouchers/ui/features/profile/data/dao/referral_dao.dart';
import 'package:Pouchers/ui/features/profile/data/source/user/user_source.dart';
import 'package:Pouchers/ui/features/profile/domain/dto/user_dto.dart';
import 'package:Pouchers/ui/features/profile/domain/model/user.dart';
import 'package:dio/dio.dart';

import '../../domain/model/referral/referral.dart';
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

  @override
  Future<Referral?> referral({CancelToken? cancelToken}) async {
    final referral = await _userSource.referral(cancelToken: cancelToken);
    referralDao.save(referral);
    return referral;
  }

  @override
  Future<bool> deleteAccount({CancelToken? cancelToken}) async =>
      await _userSource.deleteAccount(cancelToken: cancelToken);

  @override
  Future<bool> disableAccount(String reason,
          {CancelToken? cancelToken}) async =>
      await _userSource.disableAccount(reason, cancelToken: cancelToken);

  @override
  Future<User?> user(
          {required UserDto userDto, CancelToken? cancelToken}) async =>
      await _userSource.user(userDto: userDto, cancelToken: cancelToken);

  @override
  Future<List<User>> contacts(
      {required UserDto userDto, CancelToken? cancelToken}) async {
    final poucherContacts =
        await _userSource.contacts(userDto: userDto, cancelToken: cancelToken);
    contactDao.save(poucherContacts);
    return poucherContacts;
  }
}
