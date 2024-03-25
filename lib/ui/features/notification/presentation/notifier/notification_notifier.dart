import 'package:pouchers/ui/features/notification/data/dao/notification_dao.dart';
import 'package:pouchers/ui/features/notification/domain/dto/notification_dto.dart';
import 'package:pouchers/ui/features/notification/presentation/notifier/module/module.dart';
import 'package:pouchers/ui/features/notification/presentation/view/state/notification_state.dart';
import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../app/app.logger.dart';
import '../../domain/model/notification_model.dart';
import '../../domain/model/unread_payment_request.dart';

part 'notification_notifier.g.dart';

@riverpod
class NotificationNotifier extends _$NotificationNotifier {
  final _logger = getLogger('NotificationNotifier');

  final List<NotificationModel> _notifications = [];
  UnreadPaymentRequest? _unreadPaymentModel;

  int _page = 1;

  @override
  NotificationState build() => NotificationState(notifications: _notifications);

  void increamentPageCount() => _page++;

  void resetPageCount() => _page = 1;

  Future<void> fetchNotifications({CancelToken? cancelToken}) async {
    try {
      state = state.copyWith(isBusy: notificationDao.box.isEmpty);

      await ref.read(notificationProvider
          .call(NotificationDto(page: _page), cancelToken: cancelToken)
          .future);
    } catch (e) {
      _logger.e(e.toString());
    } finally {
      state = state.copyWith(isBusy: false, notifications: _notifications);
    }
  }

  Future<void> fetchUnreadPaymentNotifications(
      {CancelToken? cancelToken}) async {
    try {
      state = state.copyWith(isBusy: true);

      _unreadPaymentModel = await ref.read(unreadPaymentNotificationProvider
          .call(cancelToken: cancelToken)
          .future);
    } catch (e) {
      _logger.e(e.toString());
    } finally {
      state = state.copyWith(
          isBusy: false, unreadPaymentModel: _unreadPaymentModel);
    }
  }

  Future<void> readNotification(NotificationModel notification,
      {CancelToken? cancelToken}) async {
    try {
      await notificationDao.updateReadStatus(notification);

      await ref.read(readNotificationProvider
          .call(notification.notificationId ?? '', cancelToken: cancelToken)
          .future);
    } catch (e) {
      _logger.e(e.toString());
    } finally {}
  }

  Future<void> readAllNotification({CancelToken? cancelToken}) async {
    try {
      await notificationDao.readAllNotifications();
      await ref.read(
          readAllNotificationProvider.call(cancelToken: cancelToken).future);
    } catch (e) {
      _logger.e(e.toString());
    } finally {}
  }
}
