import 'package:Pouchers/ui/features/admin/domain/model/envs/envs.dart';
import 'package:dio/dio.dart';

import '../dto/admin_dto.dart';
import '../model/banner.dart';

abstract class AdminRepo {
  Future<List<Envs>?> envs({AdminDto? adminDto, CancelToken? cancelToken});
  Future<List<Banner>> banners({CancelToken? cancelToken});
}
