import 'package:pouchers/ui/features/notification/domain/model/notification_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/model/unread_payment_request.dart';

part 'notification_state.freezed.dart';

@Freezed(copyWith: true)
class NotificationState<T> with _$NotificationState<T> {
  const factory NotificationState(
      {@Default(false) bool isBusy,
      @Default([]) List<NotificationModel> notifications,
      String? errorMessage,
      StackTrace? stackTrace,
      UnreadPaymentRequest? unreadPaymentModel}) = _NotificationState<T>;
}
