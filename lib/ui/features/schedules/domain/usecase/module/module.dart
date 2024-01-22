import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../../app/core/usecase/poucher_usecase.dart';
import '../../../data/repository/module/schedule_repo_module.dart';
import '../delete_schedule_usecase.dart';
import '../schedules_usecase.dart';
import '../update_schedule_usecase.dart';

final scheduledUseCaseModule = Provider<PoucherUseCaseWithRequiredParam>(
    (ref) => ScheduleUseCaseImpl(scheduleRepo: ref.read(scheduleRepoModule)));

final deleteScheduledUseCaseModule = Provider<PoucherUseCaseWithRequiredParam>(
    (ref) =>
        DeleteScheduleUseCaseImpl(scheduleRepo: ref.read(scheduleRepoModule)));

final updateScheduledUseCaseModule = Provider<PoucherUseCaseWithRequiredParam>(
    (ref) =>
        UpdateScheduleUseCaseImpl(scheduleRepo: ref.read(scheduleRepoModule)));
