import 'dart:async';

import 'package:Pouchers/app/app.locator.dart';
import 'package:Pouchers/ui/common/app_keys.dart';
import 'package:Pouchers/ui/features/notification/domain/model/notification_model.dart';
import 'package:Pouchers/ui/features/transfer/domain/model/local_bank.dart';
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

  Future<void> save(List<NotificationModel> notifications) async {
    if (notifications.isEmpty) return;

    for (var notification in notifications) {
      await _box.put(notification.createdAt?.toIso8601String(), notification);
    }
  }

  List<NotificationModel> retrieve(Box box) =>
      box.values.cast<NotificationModel>().toList();

  ValueListenable<Box> getListenable({List<String>? keys}) =>
      (keys == null ? _box.listenable() : _box.listenable(keys: keys));

  Future truncate() async => await _box.clear();
}
