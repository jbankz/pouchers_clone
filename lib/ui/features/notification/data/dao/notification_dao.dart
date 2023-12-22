import 'dart:async';

import 'package:Pouchers/app/app.locator.dart';
import 'package:Pouchers/ui/common/app_keys.dart';
import 'package:Pouchers/ui/features/notification/domain/model/notification_model.dart';
import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../../../app/core/manager/hive_manager.dart';

late NotificationDao notificationDao;
final _hiveManager = locator<HiveManager>();

class NotificationDao {
  late Box _box;

  Box get box => _box;

  NotificationDao() {
    openBox().then((value) => _box = value);
  }

  Future<Box> openBox() => _hiveManager.openBox(AppKeys.notificationDaoKey);

  Future<void> save(List<NotificationModel> notifications,
      {bool clear = true}) async {
    if (notifications.isEmpty) return;

    if (clear) await _box.clear();

    for (var notification in notifications) {
      await _box.put(notification.notificationId, notification);
    }
  }

  Future<void> updateReadStatus(NotificationModel notification) async {
    await _box.put(
        notification.notificationId, notification.copyWith(isRead: true));
  }

  List<NotificationModel> retrieve(Box box) =>
      box.values.cast<NotificationModel>().toList()
        ..sort((a, b) => a.isRead ? 1 : -1)
        ..sort((a, b) => (b.createdAt ?? DateTime.now().toLocal())
            .compareTo(a.createdAt ?? DateTime.now().toLocal()));

  ValueListenable<Box> getListenable({List<String>? keys}) =>
      (keys == null ? _box.listenable() : _box.listenable(keys: keys));

  Future truncate() async => await _box.clear();
}
