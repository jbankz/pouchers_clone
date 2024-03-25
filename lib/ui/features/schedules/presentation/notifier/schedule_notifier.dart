import 'package:pouchers/app/core/router/page_router.dart';
import 'package:pouchers/ui/features/schedules/domain/dto/schedule_dto.dart';
import 'package:pouchers/ui/features/schedules/domain/model/schedule_model.dart';
import 'package:pouchers/ui/features/schedules/presentation/notifier/module/module.dart';
import 'package:pouchers/ui/features/utilities/domain/dto/mobile_dto.dart';
import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../app/app.logger.dart';
import '../state/schedule_state.dart';

part 'schedule_notifier.g.dart';

@riverpod
class ScheduleNotifier extends _$ScheduleNotifier {
  final _logger = getLogger('ScheduleNotifier');

  List<ScheduleModel> _shedules = [];

  int _page = 1;

  @override
  ScheduleState build() => ScheduleState(schedules: _shedules);

  void increamentPageCount() => _page++;

  void resetPageCount() => _page = 1;

  Future<void> fetchSchedules(
      {String? category, CancelToken? cancelToken}) async {
    try {
      state = state.copyWith(isBusy: true);

      _shedules = await ref.read(schedulesProvider
          .call(ScheduleDto(page: _page, category: category),
              cancelToken: cancelToken)
          .future);
    } catch (e) {
      _logger.e(e.toString());
    } finally {
      state = state.copyWith(isBusy: false, schedules: _shedules);
    }
  }

  Future<void> deleteSchedule(
      {String? scheduleId, CancelToken? cancelToken}) async {
    try {
      state = state.copyWith(isBusy: true);
      await ref.read(deleteScheduleProvider
          .call(ScheduleDto(scheduleId: scheduleId), cancelToken: cancelToken)
          .future);

      PageRouter.pop();
    } catch (e) {
      _logger.e(e.toString());
    } finally {
      state = state.copyWith(isBusy: false);
    }
  }

  Future<void> updateSchedule(
      {required MobileDto mobileDto, CancelToken? cancelToken}) async {
    try {
      state = state.copyWith(isBusy: true);
      await ref.read(updateScheduleProvider
          .call(mobileDto, cancelToken: cancelToken)
          .future);
      PageRouter.pop();
    } catch (e) {
      _logger.e(e.toString());
    } finally {
      state = state.copyWith(isBusy: false);
    }
  }
}
