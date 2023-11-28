import 'package:Pouchers/ui/features/profile/domain/dto/user_dto.dart';
import 'package:Pouchers/ui/features/profile/domain/model/user.dart';
import 'package:Pouchers/ui/features/profile/domain/repository/user_repo.dart';
import 'package:dio/dio.dart';

import '../../../../../app/core/usecase/poucher_usecase.dart';

class ChangePhoneNumberOtpUseCaseImpl
    implements PoucherUseCaseWithRequiredParam<UserDto, User?> {
  final UserRepo _userRepo;

  ChangePhoneNumberOtpUseCaseImpl(this._userRepo);

  @override
  Future<User?> execute(
          {required UserDto parameter, CancelToken? cancelToken}) async =>
      await _userRepo.changePhoneNumber(
          userDto: parameter, cancelToken: cancelToken);
}
