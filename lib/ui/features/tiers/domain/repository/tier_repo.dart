import 'package:dio/dio.dart';

import '../model/tiers/data.dart';

abstract class TierRepo {
  Future<Data?> tiers({CancelToken? cancelToken});
}
