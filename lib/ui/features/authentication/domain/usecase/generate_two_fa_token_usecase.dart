import 'package:dio/dio.dart';

import '../../../../../app/core/usecase/poucher_usecase.dart';
import '../model/generate_2fa_token.dart';
import '../repository/auth_repo.dart';

class GenerateTwoFaUseCaseImpl
    implements PoucherUseCaseWithOutParam<Future<Generate2faToken>> {
  final AuthRepo _authRepo;

  GenerateTwoFaUseCaseImpl(this._authRepo);

  @override
  Future<Generate2faToken> execute([CancelToken? cancelToken]) async =>
      await _authRepo.generate2faToken(cancelToken: cancelToken);
}
