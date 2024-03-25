import 'package:pouchers/ui/features/transfer/domain/repository/transfer_repository.dart';
import 'package:pouchers/ui/features/utilities/domain/dto/mobile_dto.dart';
import 'package:pouchers/ui/features/utilities/domain/model/schedule.dart';
import 'package:dio/dio.dart';

import '../../../../../app/core/usecase/poucher_usecase.dart';

class ScheduleP2PTransferUseCaseImpl
    implements PoucherUseCaseWithRequiredParam<MobileDto, Schedule> {
  final TransferRepository _transferRepository;

  ScheduleP2PTransferUseCaseImpl(this._transferRepository);

  @override
  Future<Schedule?> execute(
          {required MobileDto parameter, CancelToken? cancelToken}) async =>
      await _transferRepository.schedule(parameter, cancelToken: cancelToken);
}
