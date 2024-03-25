import 'package:pouchers/ui/features/profile/domain/repository/user_repo.dart';
import 'package:dio/dio.dart';

import '../../../../../app/core/usecase/poucher_usecase.dart';

class DeleteAccountUseCaseImpl
    implements PoucherUseCaseWithOutParam<Future<bool>> {
  final UserRepo _userRepo;

  DeleteAccountUseCaseImpl(this._userRepo);

  @override
  Future<bool> execute([CancelToken? cancelToken]) async =>
      await _userRepo.deleteAccount(cancelToken: cancelToken);
}
