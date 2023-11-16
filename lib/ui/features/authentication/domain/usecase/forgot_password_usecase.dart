import '../../../../../app/core/usecase/poucher_usecase.dart';
import 'package:Pouchers/ui/features/authentication/domain/dto/auth_dto.dart';
import 'package:dio/dio.dart';

import '../repository/auth_repo.dart';

class ForgotPasswordUseCaseImpl
    implements PoucherUseCaseWithRequiredParam<AuthDto, bool> {
  final AuthRepo _authRepo;

  ForgotPasswordUseCaseImpl(this._authRepo);

  @override
  Future<bool> execute(
          {required AuthDto parameter, CancelToken? cancelToken}) async =>
      await _authRepo.forgotPassword(parameter, cancelToken: cancelToken);
}
