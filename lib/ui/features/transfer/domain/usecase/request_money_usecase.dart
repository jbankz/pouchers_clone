import 'package:pouchers/ui/features/transfer/domain/dto/transfer_money_dto.dart';
import 'package:pouchers/ui/features/transfer/domain/repository/transfer_repository.dart';
import 'package:dio/dio.dart';

import '../../../../../app/core/usecase/poucher_usecase.dart';

class RequestMoneyUseCaseImpl
    implements PoucherUseCaseWithRequiredParam<TransferMoneyDto, bool> {
  final TransferRepository _transferRepository;

  RequestMoneyUseCaseImpl(this._transferRepository);

  @override
  Future<bool> execute(
          {required TransferMoneyDto parameter,
          CancelToken? cancelToken}) async =>
      await _transferRepository.requestMoney(parameter,
          cancelToken: cancelToken);
}
