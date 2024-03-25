import 'package:pouchers/ui/features/profile/domain/model/user.dart';
import 'package:pouchers/ui/features/profile/domain/repository/user_repo.dart';
import 'package:dio/dio.dart';

import '../../../../../app/core/usecase/poucher_usecase.dart';

class GetProfileUseCaseImpl
    implements PoucherUseCaseWithOutParam<Future<User?>> {
  final UserRepo _userRepo;

  GetProfileUseCaseImpl(this._userRepo);

  @override
  Future<User?> execute([CancelToken? cancelToken]) async =>
      _userRepo.profile(cancelToken: cancelToken);
}
