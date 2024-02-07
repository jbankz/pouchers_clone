import 'package:dio/dio.dart';

import '../../../utilities/domain/dto/mobile_dto.dart';
import '../dto/schedule_dto.dart';
import '../model/schedule_model.dart';

abstract class ScheduleRepo {
  Future<List<ScheduleModel>> shedules(ScheduleDto scheduleDto,
      {CancelToken? cancelToken});
  Future<bool> deleteShedule(ScheduleDto scheduleDto,
      {CancelToken? cancelToken});
  Future<bool> updateSchedule(MobileDto mobileDto, {CancelToken? cancelToken});
}
