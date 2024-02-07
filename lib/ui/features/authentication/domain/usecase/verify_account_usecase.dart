import '../../../../../app/core/usecase/poucher_usecase.dart';
import 'package:Pouchers/ui/features/authentication/domain/dto/auth_dto.dart';
import 'package:Pouchers/ui/features/authentication/domain/model/verify_account_model/verify_account_model.dart';
import 'package:dio/dio.dart';

import '../repository/auth_repo.dart';

class VerifyAccountUseCaseImpl
    implements PoucherUseCaseWithRequiredParam<AuthDto, VerifyAccountModel> {
  final AuthRepo _authRepo;

  VerifyAccountUseCaseImpl(this._authRepo);

  @override
  Future<VerifyAccountModel?> execute(
          {required AuthDto parameter, CancelToken? cancelToken}) async =>
      await _authRepo.verifyAccount(parameter, cancelToken: cancelToken);
}
