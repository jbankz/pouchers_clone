import 'package:dio/dio.dart';

import '../../domain/model/notification_data_model.dart';
import '../../domain/model/unread_payment_request.dart';

abstract class NotificationSource {
  Future<NotificationDataModel> notifications({CancelToken? cancelToken});
  Future<bool> readNotification(String notificationId,
      {CancelToken? cancelToken});
  Future<UnreadPaymentRequest> unReadPaymentNotification(
      {CancelToken? cancelToken});
}
