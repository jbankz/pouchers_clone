import 'package:pouchers/ui/features/schedules/domain/model/schedule_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'schedule_state.freezed.dart';

@Freezed(copyWith: true)
class ScheduleState<T> with _$ScheduleState<T> {
  const factory ScheduleState(
      {@Default(false) bool isBusy,
      @Default([]) List<ScheduleModel> schedules}) = _ScheduleState<T>;
}
