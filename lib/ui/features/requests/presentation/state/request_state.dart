import 'package:Pouchers/ui/features/notification/domain/model/notification_model.dart';
import 'package:Pouchers/ui/features/requests/domain/model/request_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'request_state.freezed.dart';

@Freezed(copyWith: true)
class RequestState<T> with _$RequestState<T> {
  const factory RequestState(
      {@Default(false) bool isBusy,
      @Default([]) List<RequestModel> requests}) = _RequestState<T>;
}
