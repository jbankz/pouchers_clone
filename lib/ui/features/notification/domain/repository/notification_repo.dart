import 'package:dio/dio.dart';

import '../model/notification_data_model.dart';
import '../model/unread_payment_request.dart';

abstract class NotificationRepo {
  Future<NotificationDataModel> notifications({CancelToken? cancelToken});
  Future<bool> readNotification(String notificationId,
      {CancelToken? cancelToken});
  Future<UnreadPaymentRequest> unReadPaymentNotification(
      {CancelToken? cancelToken});
}
