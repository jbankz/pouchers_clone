import 'package:Pouchers/ui/features/profile/domain/repository/user_repo.dart';
import 'package:dio/dio.dart';

import '../../../../../app/core/usecase/poucher_usecase.dart';

class DisableAccountUseCaseImpl
    implements PoucherUseCaseWithRequiredParam<String, bool> {
  final UserRepo _userRepo;

  DisableAccountUseCaseImpl(this._userRepo);

  @override
  Future<bool?> execute(
          {required String parameter, CancelToken? cancelToken}) async =>
      await _userRepo.disableAccount(parameter, cancelToken: cancelToken);
}
