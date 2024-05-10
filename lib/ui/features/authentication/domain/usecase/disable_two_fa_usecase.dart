import 'package:pouchers/ui/features/authentication/domain/dto/auth_dto.dart';
import 'package:dio/dio.dart';

import '../../../../../app/core/usecase/poucher_usecase.dart';
import '../../../profile/domain/model/user.dart';
import '../repository/auth_repo.dart';

class DisableTwoFaUseCaseImpl
    implements PoucherUseCaseWithRequiredParam<AuthDto, User> {
  final AuthRepo _authRepo;

  DisableTwoFaUseCaseImpl(this._authRepo);

  @override
  Future<User?> execute(
          {required AuthDto parameter, CancelToken? cancelToken}) async =>
      await _authRepo.disable2fa(parameter, cancelToken: cancelToken);
}
