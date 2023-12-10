import 'package:dio/dio.dart';

import '../../domain/dto/admin_dto.dart';
import '../../domain/model/banner.dart';
import '../../domain/model/envs/envs.dart';

abstract class AdminSource {
  Future<List<Envs>?> envs({AdminDto? adminDto, CancelToken? cancelToken});
  Future<List<Banner>> banners({CancelToken? cancelToken});
}
