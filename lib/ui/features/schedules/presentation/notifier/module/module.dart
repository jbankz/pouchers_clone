import 'package:pouchers/ui/features/schedules/domain/dto/schedule_dto.dart';
import 'package:pouchers/ui/features/schedules/domain/model/schedule_model.dart';
import 'package:pouchers/ui/features/utilities/domain/dto/mobile_dto.dart';
import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../domain/usecase/module/module.dart';

part 'module.g.dart';

@riverpod
Future<List<ScheduleModel>> schedules(SchedulesRef ref, ScheduleDto scheduleDto,
        {CancelToken? cancelToken}) async =>
    await ref
        .read(scheduledUseCaseModule)
        .execute(parameter: scheduleDto, cancelToken: cancelToken);

@riverpod
Future<bool> deleteSchedule(DeleteScheduleRef ref, ScheduleDto scheduleDto,
        {CancelToken? cancelToken}) async =>
    await ref
        .read(deleteScheduledUseCaseModule)
        .execute(parameter: scheduleDto, cancelToken: cancelToken);

@riverpod
Future<bool> updateSchedule(UpdateScheduleRef ref, MobileDto mobileDto,
        {CancelToken? cancelToken}) async =>
    await ref
        .read(updateScheduledUseCaseModule)
        .execute(parameter: mobileDto, cancelToken: cancelToken);
