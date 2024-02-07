import 'package:Pouchers/ui/features/authentication/domain/dto/two_fa_dto.dart';
import 'package:dio/dio.dart';

import '../../../../../app/core/usecase/poucher_usecase.dart';
import '../repository/auth_repo.dart';

class ValidateTwoFaQuestionUseCaseImpl
    implements PoucherUseCaseWithRequiredParam<TwoFaDto, bool> {
  final AuthRepo _authRepo;

  ValidateTwoFaQuestionUseCaseImpl(this._authRepo);

  @override
  Future<bool> execute(
          {required TwoFaDto parameter, CancelToken? cancelToken}) async =>
      await _authRepo.validate2FaQuestion(parameter, cancelToken: cancelToken);
}
