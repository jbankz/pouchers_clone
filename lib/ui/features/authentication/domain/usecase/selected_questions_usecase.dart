import 'package:dio/dio.dart';

import '../../../../../app/core/usecase/poucher_usecase.dart';
import '../model/selected_questions.dart';
import '../repository/auth_repo.dart';

class SelectedQuestionsUseCaseImpl
    implements PoucherUseCaseWithOutParam<Future<List<SelectedQuestions>>> {
  final AuthRepo _authRepo;

  SelectedQuestionsUseCaseImpl(this._authRepo);

  @override
  Future<List<SelectedQuestions>> execute([CancelToken? cancelToken]) async =>
      await _authRepo.selectedQuestions(cancelToken: cancelToken);
}
