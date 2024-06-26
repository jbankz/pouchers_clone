import 'dart:async';

import 'package:pouchers/app/app.locator.dart';
import 'package:pouchers/ui/common/app_keys.dart';
import 'package:pouchers/ui/features/profile/domain/model/user.dart';
import 'package:pouchers/utils/extension.dart';
import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../../../app/core/manager/hive_manager.dart';

late UserDao userDao;
final _hiveManager = locator<HiveManager>();

class UserDao {
  late Box _box;

  Box get box => _box;

  UserDao() {
    openBox().then((value) => _box = value);
  }

  Future<Box> openBox() => _hiveManager.openBox(AppKeys.userDaoKey);

  User get user => returnUser(_box);

  Future<void> save(User? user) async =>
      await _box.put(AppKeys.userDaoKey, user ?? User());

  User returnUser(Box box) => box.get(AppKeys.userDaoKey) as User? ?? User();

  ValueListenable<Box> getListenable({List<String>? keys}) =>
      (keys == null ? _box.listenable() : _box.listenable(keys: keys));

  Future truncate() async => await _box.clear();

  String get initials =>
      '${returnUser(box).firstName?[0] ?? ''}${returnUser(box).lastName?[0] ?? ''}'
          .toUpperCase();

  String get fullName =>
      '${returnUser(box).firstName?.titleCase ?? ''} ${returnUser(box).lastName?.titleCase ?? ''}';
}
