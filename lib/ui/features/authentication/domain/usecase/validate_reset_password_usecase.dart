import '../../../../../app/core/usecase/poucher_usecase.dart';
import 'package:Pouchers/ui/features/authentication/domain/dto/auth_dto.dart';
import 'package:Pouchers/ui/features/authentication/domain/model/validate_reset_password_model/validate_reset_password_model.dart';
import 'package:dio/dio.dart';

import '../repository/auth_repo.dart';

class ValidateResetPasswordUseCaseImpl
    implements
        PoucherUseCaseWithRequiredParam<AuthDto, ValidateResetPasswordModel> {
  final AuthRepo _authRepo;

  ValidateResetPasswordUseCaseImpl(this._authRepo);

  @override
  Future<ValidateResetPasswordModel?> execute(
          {required AuthDto parameter, CancelToken? cancelToken}) async =>
      await _authRepo.validateResetPassword(parameter,
          cancelToken: cancelToken);
}
