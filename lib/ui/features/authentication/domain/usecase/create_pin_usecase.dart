import 'package:Pouchers/ui/features/authentication/domain/dto/auth_dto.dart';
import 'package:Pouchers/ui/features/authentication/domain/model/create_pin_model/create_pin_model.dart';
import 'package:dio/dio.dart';

import '../../../../../app/core/usecase/poucher_usecase.dart';
import '../repository/auth_repo.dart';

class CreatePinUseCaseImpl
    implements PoucherUseCaseWithRequiredParam<AuthDto, CreatePinModel> {
  final AuthRepo _authRepo;

  CreatePinUseCaseImpl(this._authRepo);

  @override
  Future<CreatePinModel?> execute(
          {required AuthDto parameter, CancelToken? cancelToken}) async =>
      await _authRepo.createPin(parameter, cancelToken: cancelToken);
}
