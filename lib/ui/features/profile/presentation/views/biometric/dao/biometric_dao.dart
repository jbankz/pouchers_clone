import 'dart:async';

import 'package:Pouchers/app/app.locator.dart';
import 'package:Pouchers/ui/common/app_keys.dart';
import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../../../../../app/core/manager/hive_manager.dart';

late BiometricDao biometricDao;
final _hiveManager = locator<HiveManager>();

class BiometricDao {
  late Box<bool> _box;

  Box<bool> get box => _box;

  BiometricDao() {
    openBox().then((value) => _box = value);
  }

  Future<Box<bool>> openBox() =>
      _hiveManager.openBox<bool>(AppKeys.biometricDaoKey);

  set login(bool value) => _box.put(AppKeys.loginKey, value);
  set pay(bool value) => _box.put(AppKeys.payKey, value);
  set unlock(bool value) => _box.put(AppKeys.unlockKey, value);

  bool get login => _box.get(AppKeys.loginKey, defaultValue: false) ?? false;
  bool get pay => _box.get(AppKeys.payKey, defaultValue: false) ?? false;
  bool get unlock => _box.get(AppKeys.unlockKey, defaultValue: false) ?? false;

  ValueListenable<Box> getListenable({List<String>? keys}) =>
      (keys == null ? _box.listenable() : _box.listenable(keys: keys));

  Future truncate() async => await _box.clear();
}
