import 'package:Pouchers/ui/features/authentication/domain/dto/auth_dto.dart';
import 'package:Pouchers/ui/features/authentication/domain/model/sign_in_model/sign_in_model.dart';
import 'package:dio/dio.dart';

import '../../../../../app/core/usecase/poucher_usecase.dart';
import '../repository/auth_repo.dart';

class SignInUseCaseImpl
    implements PoucherUseCaseWithRequiredParam<AuthDto, SignInModel> {
  final AuthRepo _authRepo;

  SignInUseCaseImpl(this._authRepo);

  @override
  Future<SignInModel?> execute(
          {required AuthDto parameter, CancelToken? cancelToken}) async =>
      await _authRepo.signIn(parameter, cancelToken: cancelToken);
}
