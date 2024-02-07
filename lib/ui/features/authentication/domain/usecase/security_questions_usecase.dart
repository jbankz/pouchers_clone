import 'package:dio/dio.dart';

import '../../../../../app/core/usecase/poucher_usecase.dart';
import '../model/security_questions.dart';
import '../repository/auth_repo.dart';

class SecurityQuestionsUseCaseImpl
    implements PoucherUseCaseWithOutParam<Future<List<SecurityQuestions>>> {
  final AuthRepo _authRepo;

  SecurityQuestionsUseCaseImpl(this._authRepo);

  @override
  Future<List<SecurityQuestions>> execute([CancelToken? cancelToken]) async =>
      await _authRepo.securityQuestions(cancelToken: cancelToken);
}
