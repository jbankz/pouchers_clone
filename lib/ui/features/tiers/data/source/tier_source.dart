import 'package:dio/dio.dart';

import '../../domain/model/tiers/data.dart';

abstract class TierSource {
  Future<Data?> tiers({CancelToken? cancelToken});
}
