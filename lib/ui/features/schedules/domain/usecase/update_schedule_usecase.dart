import 'package:pouchers/ui/features/utilities/domain/dto/mobile_dto.dart';
import 'package:dio/dio.dart';

import '../../../../../app/core/usecase/poucher_usecase.dart';
import '../repository/schedule_repo.dart';

class UpdateScheduleUseCaseImpl
    implements PoucherUseCaseWithRequiredParam<MobileDto, bool> {
  final ScheduleRepo _scheduleRepo;

  UpdateScheduleUseCaseImpl({required ScheduleRepo scheduleRepo})
      : _scheduleRepo = scheduleRepo;

  @override
  Future<bool?> execute(
          {required MobileDto parameter, CancelToken? cancelToken}) async =>
      await _scheduleRepo.updateSchedule(parameter, cancelToken: cancelToken);
}
