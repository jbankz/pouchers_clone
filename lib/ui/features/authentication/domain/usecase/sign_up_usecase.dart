import '../../../../../app/core/usecase/poucher_usecase.dart';
import 'package:Pouchers/ui/features/authentication/domain/dto/auth_dto.dart';
import 'package:Pouchers/ui/features/authentication/domain/model/sign_up_model/sign_up_model.dart';
import 'package:dio/dio.dart';

import '../repository/auth_repo.dart';

class SignUpUseCaseImpl
    implements PoucherUseCaseWithRequiredParam<AuthDto, SignUpModel> {
  final AuthRepo _authRepo;

  SignUpUseCaseImpl(this._authRepo);

  @override
  Future<SignUpModel?> execute(
          {required AuthDto parameter, CancelToken? cancelToken}) async =>
      await _authRepo.signUp(parameter, cancelToken: cancelToken);
}
