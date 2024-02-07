import 'package:Pouchers/ui/features/authentication/domain/dto/two_fa_dto.dart';
import 'package:dio/dio.dart';

import '../../../../../app/core/usecase/poucher_usecase.dart';
import '../model/set_questions.dart';
import '../repository/auth_repo.dart';

class AnswerQuestionsUseCaseImpl
    implements PoucherUseCaseWithRequiredParam<TwoFaDto, List<SetQuestions>> {
  final AuthRepo _authRepo;

  AnswerQuestionsUseCaseImpl(this._authRepo);

  @override
  Future<List<SetQuestions>?> execute(
          {required TwoFaDto parameter, CancelToken? cancelToken}) async =>
      await _authRepo.setQuestions(parameter, cancelToken: cancelToken);
}
