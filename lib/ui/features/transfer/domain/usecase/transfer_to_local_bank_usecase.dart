import 'package:pouchers/ui/features/transfer/domain/dto/transfer_money_dto.dart';
import 'package:pouchers/ui/features/transfer/domain/repository/local_bank_repository.dart';
import 'package:dio/dio.dart';

import '../../../../../app/core/usecase/poucher_usecase.dart';

class TransferToLocalBankUseCaseImpl
    implements PoucherUseCaseWithRequiredParam<TransferMoneyDto, bool> {
  final LocalBankRepository _localBankRepository;

  TransferToLocalBankUseCaseImpl(this._localBankRepository);

  @override
  Future<bool?> execute(
          {required TransferMoneyDto parameter,
          CancelToken? cancelToken}) async =>
      await _localBankRepository.transferToLocalBank(parameter,
          cancelToken: cancelToken);
}
