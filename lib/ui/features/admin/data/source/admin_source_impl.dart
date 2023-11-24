import 'package:Pouchers/ui/features/admin/domain/model/envs/envs.dart';
import 'package:dio/dio.dart';

import '../../../../../app/core/network/api_path.dart';
import '../../../../../app/core/network/network_service.dart';
import '../../domain/dto/admin_dto.dart';
import 'admin_source.dart';

class AdminSourceImpl implements AdminSource {
  final NetworkService networkService;

  AdminSourceImpl({required this.networkService});

  @override
  Future<List<Envs>?> envs(
      {AdminDto? adminDto, CancelToken? cancelToken}) async {
    final response = await networkService.request(
        path: ApiPath.envs,
        requestType: RequestType.get,
        queryParams: adminDto?.toJson(),
        cancelToken: cancelToken);

    return (response.data?['data'] as List<dynamic>)
        .map((e) => Envs.fromJson(e as Map<String, dynamic>))
        .toList();
  }
}
