import 'package:dio/dio.dart';

import '../dto/notification_dto.dart';
import '../model/notification_data_model.dart';
import '../model/unread_payment_request.dart';

abstract class NotificationRepo {
  Future<NotificationDataModel> notifications(NotificationDto notificationDto,
      {CancelToken? cancelToken});
  Future<bool> readNotification(String notificationId,
      {CancelToken? cancelToken});
  Future<UnreadPaymentRequest> unReadPaymentNotification(
      {CancelToken? cancelToken});
  Future<bool> readAllNotification({CancelToken? cancelToken});
}
