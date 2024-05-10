import 'package:pouchers/ui/features/transfer/domain/dto/transfer_money_dto.dart';
import 'package:pouchers/ui/features/transfer/domain/model/transfer.dart';
import 'package:pouchers/ui/features/transfer/domain/repository/transfer_repository.dart';
import 'package:dio/dio.dart';

import '../../../../../app/core/usecase/poucher_usecase.dart';

class P2PTransferUseCaseImpl
    implements PoucherUseCaseWithRequiredParam<TransferMoneyDto, Transfer> {
  final TransferRepository _transferRepository;

  P2PTransferUseCaseImpl(this._transferRepository);

  @override
  Future<Transfer?> execute(
          {required TransferMoneyDto parameter,
          CancelToken? cancelToken}) async =>
      await _transferRepository.p2pTransfer(parameter,
          cancelToken: cancelToken);
}
