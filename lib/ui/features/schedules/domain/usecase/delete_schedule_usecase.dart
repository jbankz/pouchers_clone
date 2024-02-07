import 'package:dio/dio.dart';

import '../../../../../app/core/usecase/poucher_usecase.dart';
import '../dto/schedule_dto.dart';
import '../repository/schedule_repo.dart';

class DeleteScheduleUseCaseImpl
    implements PoucherUseCaseWithRequiredParam<ScheduleDto, bool> {
  final ScheduleRepo _scheduleRepo;

  DeleteScheduleUseCaseImpl({required ScheduleRepo scheduleRepo})
      : _scheduleRepo = scheduleRepo;

  @override
  Future<bool?> execute(
          {required ScheduleDto parameter, CancelToken? cancelToken}) async =>
      await _scheduleRepo.deleteShedule(parameter, cancelToken: cancelToken);
}
