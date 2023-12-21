import 'package:dio/dio.dart';

import '../../domain/model/get_merchants.dart';

abstract class MerchantsSource {
  Future<GetMerchant> fetchMerchants({CancelToken? cancelToken});
}
