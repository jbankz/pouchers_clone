import 'package:dio/dio.dart';

import '../../../../../app/core/usecase/poucher_usecase.dart';
import '../../domain/model/schedule_model.dart';
import '../dto/schedule_dto.dart';
import '../repository/schedule_repo.dart';

class ScheduleUseCaseImpl
    implements
        PoucherUseCaseWithRequiredParam<ScheduleDto, List<ScheduleModel>> {
  final ScheduleRepo _scheduleRepo;

  ScheduleUseCaseImpl({required ScheduleRepo scheduleRepo})
      : _scheduleRepo = scheduleRepo;

  @override
  Future<List<ScheduleModel>?> execute(
          {required ScheduleDto parameter, CancelToken? cancelToken}) async =>
      await _scheduleRepo.shedules(parameter, cancelToken: cancelToken);
}
