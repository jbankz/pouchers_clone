import 'package:pouchers/ui/features/schedules/domain/dto/schedule_dto.dart';
import 'package:pouchers/ui/features/schedules/domain/model/schedule_model.dart';
import 'package:pouchers/ui/features/utilities/domain/dto/mobile_dto.dart';
import 'package:dio/dio.dart';

import '../../domain/repository/schedule_repo.dart';
import '../source/schedule_source.dart';

class ScheduleRepoImpl implements ScheduleRepo {
  final ScheduleSource _scheduleSource;

  ScheduleRepoImpl({required ScheduleSource scheduleSource})
      : _scheduleSource = scheduleSource;

  @override
  Future<List<ScheduleModel>> shedules(ScheduleDto scheduleDto,
          {CancelToken? cancelToken}) async =>
      await _scheduleSource.shedules(scheduleDto, cancelToken: cancelToken);

  @override
  Future<bool> deleteShedule(ScheduleDto scheduleDto,
          {CancelToken? cancelToken}) async =>
      await _scheduleSource.deleteShedule(scheduleDto,
          cancelToken: cancelToken);

  @override
  Future<bool> updateSchedule(MobileDto mobileDto,
          {CancelToken? cancelToken}) async =>
      await _scheduleSource.updateSchedule(mobileDto, cancelToken: cancelToken);
}
