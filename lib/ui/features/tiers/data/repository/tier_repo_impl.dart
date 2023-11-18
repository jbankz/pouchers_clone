import 'package:Pouchers/ui/features/tiers/data/source/tier_source.dart';
import 'package:dio/dio.dart';

import '../../domain/model/tiers/data.dart';
import '../../domain/repository/tier_repo.dart';

class TierRepoImpl implements TierRepo {
  final TierSource _tierSource;

  TierRepoImpl(this._tierSource);

  @override
  Future<Data?> tiers({CancelToken? cancelToken}) async =>
      await _tierSource.tiers(cancelToken: cancelToken);
}
