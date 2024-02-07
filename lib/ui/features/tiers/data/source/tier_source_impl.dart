import 'package:dio/dio.dart';

import '../../../../../app/core/network/api_path.dart';
import '../../../../../app/core/network/network_service.dart';
import '../../domain/model/tiers/data.dart';
import 'tier_source.dart';

class TierSourceImpl implements TierSource {
  final NetworkService networkService;

  TierSourceImpl({required this.networkService});

  @override
  Future<Data?> tiers({CancelToken? cancelToken}) async {
    final response = await networkService.request(
        path: ApiPath.tiers,
        requestType: RequestType.get,
        cancelToken: cancelToken);
    return Data.fromJson(response.data?['data'] as Map<String, dynamic>);
  }
}
