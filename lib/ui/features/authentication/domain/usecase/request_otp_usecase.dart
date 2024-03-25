import '../../../../../app/core/usecase/poucher_usecase.dart';
import 'package:pouchers/ui/features/authentication/domain/dto/auth_dto.dart';
import 'package:pouchers/ui/features/authentication/domain/model/request_otp_model/request_otp_model.dart';
import 'package:dio/dio.dart';

import '../repository/auth_repo.dart';

class RequestOtpUseCaseImpl
    implements PoucherUseCaseWithRequiredParam<AuthDto, RequestOtpModel> {
  final AuthRepo _authRepo;

  RequestOtpUseCaseImpl(this._authRepo);

  @override
  Future<RequestOtpModel?> execute(
          {required AuthDto parameter, CancelToken? cancelToken}) async =>
      await _authRepo.requestOtp(parameter, cancelToken: cancelToken);
}
