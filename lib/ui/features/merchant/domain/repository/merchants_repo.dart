import 'package:pouchers/ui/features/merchant/domain/model/get_merchants.dart';
import 'package:dio/dio.dart';

abstract class MerchantsRepo {
  Future<GetMerchant> fetchMerchants({CancelToken? cancelToken});
}
