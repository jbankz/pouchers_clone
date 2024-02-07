import 'package:dio/dio.dart';

import '../../../utilities/domain/dto/mobile_dto.dart';
import '../../domain/dto/schedule_dto.dart';
import '../../domain/model/schedule_model.dart';

abstract class ScheduleSource {
  Future<List<ScheduleModel>> shedules(ScheduleDto scheduleDto,
      {CancelToken? cancelToken});
  Future<bool> deleteShedule(ScheduleDto scheduleDto,
      {CancelToken? cancelToken});
  Future<bool> updateSchedule(MobileDto mobileDto, {CancelToken? cancelToken});
}
