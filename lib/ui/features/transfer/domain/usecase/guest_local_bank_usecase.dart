import 'package:pouchers/ui/features/transfer/domain/model/guest_local_bank.dart';
import 'package:pouchers/ui/features/transfer/domain/repository/local_bank_repository.dart';
import 'package:dio/dio.dart';

import '../../../../../app/core/usecase/poucher_usecase.dart';

class GuestLocalBankUseCaseImpl
    implements PoucherUseCaseWithOutParam<Future<List<GuestLocalBank>>> {
  final LocalBankRepository _localBankRepository;

  GuestLocalBankUseCaseImpl(this._localBankRepository);

  @override
  Future<List<GuestLocalBank>> execute([CancelToken? cancelToken]) async =>
      await _localBankRepository.guestLocalBanks(cancelToken: cancelToken);
}
