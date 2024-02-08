import 'package:Pouchers/ui/features/admin/data/dao/banner_dao.dart';
import 'package:Pouchers/ui/features/admin/data/dao/env_dao.dart';
import 'package:Pouchers/ui/features/admin/data/source/admin_source.dart';
import 'package:Pouchers/ui/features/admin/domain/dto/admin_dto.dart';
import 'package:Pouchers/ui/features/admin/domain/model/banner.dart';
import 'package:Pouchers/ui/features/admin/domain/model/envs/envs.dart';
import 'package:dio/dio.dart';

import '../../domain/repository/admin_repo.dart';

class AdminRepoImpl implements AdminRepo {
  final AdminSource _adminSource;

  AdminRepoImpl(this._adminSource);

  @override
  Future<List<Envs>?> envs(
      {AdminDto? adminDto, CancelToken? cancelToken}) async {
    final envs =
        await _adminSource.envs(adminDto: adminDto, cancelToken: cancelToken);
    envDao.save(envs ?? []);
    return envs;
  }

  @override
  Future<List<Banner>> banners({CancelToken? cancelToken}) async {
    final response = await _adminSource.banners(cancelToken: cancelToken);
    bannerDao.save(response);
    return response;
  }
}
