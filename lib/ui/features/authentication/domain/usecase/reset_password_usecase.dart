import '../../../../../app/core/usecase/poucher_usecase.dart';
import 'package:Pouchers/ui/features/authentication/domain/dto/auth_dto.dart';
import 'package:Pouchers/ui/features/authentication/domain/model/reset_password_model/reset_password_model.dart';
import 'package:dio/dio.dart';

import '../repository/auth_repo.dart';

class ResetPasswordUseCaseImpl
    implements PoucherUseCaseWithRequiredParam<AuthDto, ResetPasswordModel> {
  final AuthRepo _authRepo;

  ResetPasswordUseCaseImpl(this._authRepo);

  @override
  Future<ResetPasswordModel?> execute(
          {required AuthDto parameter, CancelToken? cancelToken}) async =>
      await _authRepo.resetPassword(parameter, cancelToken: cancelToken);
}
