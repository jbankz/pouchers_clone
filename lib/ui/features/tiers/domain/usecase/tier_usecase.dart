import 'package:dio/dio.dart';

import '../../../../../app/core/usecase/poucher_usecase.dart';
import '../model/tiers/data.dart';
import '../repository/tier_repo.dart';

class TierUseCaseImpl implements PoucherUseCaseWithOutParam<Future<Data?>> {
  final TierRepo _tierRepo;

  TierUseCaseImpl(this._tierRepo);

  @override
  Future<Data?> execute([CancelToken? cancelToken]) async =>
      await _tierRepo.tiers(cancelToken: cancelToken);
}
