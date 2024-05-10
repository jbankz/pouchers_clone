import 'package:pouchers/ui/features/profile/domain/dto/user_dto.dart';
import 'package:pouchers/ui/features/profile/domain/model/user.dart';
import 'package:pouchers/ui/features/profile/domain/repository/user_repo.dart';
import 'package:dio/dio.dart';

import '../../../../../app/core/usecase/poucher_usecase.dart';

class UpdateProfileUseCaseImpl
    implements PoucherUseCaseWithRequiredParam<UserDto, User> {
  final UserRepo _userRepo;

  UpdateProfileUseCaseImpl(this._userRepo);

  @override
  Future<User?> execute({required parameter, CancelToken? cancelToken}) async =>
      await _userRepo.updateProfile(
          userDto: parameter, cancelToken: cancelToken);
}
