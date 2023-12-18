import 'package:Pouchers/ui/features/notification/data/dao/notification_dao.dart';
import 'package:Pouchers/ui/features/notification/presentation/notifier/module/module.dart';
import 'package:Pouchers/ui/features/notification/presentation/view/state/notification_state.dart';
import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../app/app.logger.dart';
import '../../domain/model/notification_model.dart';

part 'notification_notifier.g.dart';

@riverpod
class NotificationNotifier extends _$NotificationNotifier {
  final _logger = getLogger('NotificationNotifier');

  List<NotificationModel> _notifications = [];

  @override
  NotificationState build() => NotificationState(notifications: _notifications);

  Future<void> fetchNotifications({CancelToken? cancelToken}) async {
    try {
      state = state.copyWith(isBusy: notificationDao.box.isEmpty);

      final response = await ref
          .read(notificationProvider.call(cancelToken: cancelToken).future);

      _notifications = response.notifications;
    } catch (e) {
      _logger.e(e.toString());
    } finally {
      state = state.copyWith(isBusy: false, notifications: _notifications);
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
}
