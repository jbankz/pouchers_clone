import 'package:pouchers/ui/features/merchant/domain/model/get_merchants.dart';
import 'package:dio/dio.dart';

import '../../../../../app/core/network/api_path.dart';
import '../../../../../app/core/network/network_service.dart';
import 'merchants_source.dart';

class MerchantsSourceImpl implements MerchantsSource {
  final NetworkService networkService;

  MerchantsSourceImpl({required this.networkService});

  @override
  Future<GetMerchant> fetchMerchants({CancelToken? cancelToken}) async {
    final response = await networkService.request(
        path: ApiPath.getMerchants,
        requestType: RequestType.get,
        cancelToken: cancelToken);

    return GetMerchant.fromJson(response.data['data'] as Map<String, dynamic>);
  }
}
