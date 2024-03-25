import '../../../../../app/core/usecase/poucher_usecase.dart';
import 'package:pouchers/ui/features/authentication/domain/dto/auth_dto.dart';
import 'package:pouchers/ui/features/authentication/domain/model/create_tag_model/create_tag_model.dart';
import 'package:dio/dio.dart';

import '../repository/auth_repo.dart';

class CreateTagUseCaseImpl
    implements PoucherUseCaseWithRequiredParam<AuthDto, CreateTagModel> {
  final AuthRepo _authRepo;

  CreateTagUseCaseImpl(this._authRepo);

  @override
  Future<CreateTagModel?> execute(
          {required AuthDto parameter, CancelToken? cancelToken}) async =>
      await _authRepo.createTag(parameter, cancelToken: cancelToken);
}
