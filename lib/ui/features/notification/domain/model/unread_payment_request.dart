import 'package:freezed_annotation/freezed_annotation.dart';

import 'notification_model.dart';

part 'unread_payment_request.freezed.dart';
part 'unread_payment_request.g.dart';

@freezed
class UnreadPaymentRequest with _$UnreadPaymentRequest {
  factory UnreadPaymentRequest(
      {@Default(0) int unreadPaymentRequestCount,
      @Default([]) List<NotificationModel> result}) = _UnreadPaymentRequest;

  factory UnreadPaymentRequest.fromJson(Map<String, dynamic> json) =>
      _$UnreadPaymentRequestFromJson(json);
}
