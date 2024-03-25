import 'package:pouchers/ui/features/transfer/domain/model/local_bank.dart';
import 'package:pouchers/ui/features/transfer/domain/repository/local_bank_repository.dart';
import 'package:dio/dio.dart';

import '../../../../../app/core/usecase/poucher_usecase.dart';

class LocalBankUseCaseImpl
    implements PoucherUseCaseWithOutParam<Future<List<LocalBank>>> {
  final LocalBankRepository _localBankRepository;

  LocalBankUseCaseImpl(this._localBankRepository);

  @override
  Future<List<LocalBank>> execute([CancelToken? cancelToken]) async =>
      await _localBankRepository.localBanks(cancelToken: cancelToken);
}
