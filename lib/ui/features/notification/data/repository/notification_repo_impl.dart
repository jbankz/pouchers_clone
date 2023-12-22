import 'package:Pouchers/ui/features/notification/data/dao/notification_dao.dart';
import 'package:Pouchers/ui/features/notification/domain/dto/notification_dto.dart';
import 'package:Pouchers/ui/features/notification/domain/model/notification_data_model.dart';
import 'package:dio/dio.dart';

import '../../domain/model/unread_payment_request.dart';
import '../../domain/repository/notification_repo.dart';
import '../source/notification_source.dart';

class NotificationRepoImpl implements NotificationRepo {
  final NotificationSource _notificationSource;

  NotificationRepoImpl(this._notificationSource);

  @override
  Future<NotificationDataModel> notifications(NotificationDto notificationDto,
      {CancelToken? cancelToken}) async {
    final response = await _notificationSource.notifications(notificationDto,
        cancelToken: cancelToken);
    notificationDao.save(response.notifications,
        clear: notificationDto.page <= 1);
    return response;
  }

  @override
  Future<bool> readNotification(String notificationId,
          {CancelToken? cancelToken}) async =>
      await _notificationSource.readNotification(notificationId,
          cancelToken: cancelToken);

  @override
  Future<UnreadPaymentRequest> unReadPaymentNotification(
          {CancelToken? cancelToken}) async =>
      await _notificationSource.unReadPaymentNotification(
          cancelToken: cancelToken);
}
