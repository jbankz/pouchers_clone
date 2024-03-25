import 'package:pouchers/ui/features/profile/domain/dto/user_dto.dart';
import 'package:pouchers/ui/features/profile/domain/model/user.dart';
import 'package:pouchers/ui/features/profile/domain/repository/user_repo.dart';
import 'package:dio/dio.dart';

import '../../../../../app/core/usecase/poucher_usecase.dart';

class GetContactsUseCaseImpl
    implements PoucherUseCaseWithRequiredParam<UserDto, List<User>> {
  final UserRepo _userRepo;

  GetContactsUseCaseImpl(this._userRepo);

  @override
  Future<List<User>?> execute(
          {required UserDto parameter, CancelToken? cancelToken}) async =>
      await _userRepo.contacts(userDto: parameter, cancelToken: cancelToken);
}
