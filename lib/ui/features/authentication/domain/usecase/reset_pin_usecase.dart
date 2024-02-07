import 'package:Pouchers/ui/features/authentication/domain/dto/auth_dto.dart';
import 'package:dio/dio.dart';

import '../../../../../app/core/usecase/poucher_usecase.dart';
import '../repository/auth_repo.dart';

class ResetUseCaseImpl
    implements PoucherUseCaseWithRequiredParam<AuthDto, bool> {
  final AuthRepo _authRepo;

  ResetUseCaseImpl(this._authRepo);

  @override
  Future<bool> execute(
          {required AuthDto parameter, CancelToken? cancelToken}) async =>
      await _authRepo.changePin(parameter, cancelToken: cancelToken);
}
