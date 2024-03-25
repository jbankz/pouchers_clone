import 'package:pouchers/ui/features/admin/domain/dto/admin_dto.dart';
import 'package:pouchers/ui/features/admin/domain/model/envs/envs.dart';
import 'package:dio/dio.dart';

import '../../../../../app/core/usecase/poucher_usecase.dart';
import '../repository/admin_repo.dart';

class EnvsUseCaseImpl
    implements PoucherUseCaseWithOptionalParam<AdminDto, List<Envs>> {
  final AdminRepo _adminRepo;

  EnvsUseCaseImpl(this._adminRepo);

  @override
  Future<List<Envs>?> execute(
          {AdminDto? parameter, CancelToken? cancelToken}) async =>
      await _adminRepo.envs(adminDto: parameter, cancelToken: cancelToken);
}
