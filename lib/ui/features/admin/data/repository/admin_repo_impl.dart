import 'package:Pouchers/ui/features/admin/data/source/admin_source.dart';
import 'package:Pouchers/ui/features/admin/domain/dto/admin_dto.dart';
import 'package:Pouchers/ui/features/admin/domain/model/envs/envs.dart';
import 'package:dio/dio.dart';

import '../../domain/repository/admin_repo.dart';

class AdminRepoImpl implements AdminRepo {
  final AdminSource _adminSource;

  AdminRepoImpl(this._adminSource);

  @override
  Future<List<Envs>?> envs(
          {AdminDto? adminDto, CancelToken? cancelToken}) async =>
      await _adminSource.envs(adminDto: adminDto, cancelToken: cancelToken);
}
