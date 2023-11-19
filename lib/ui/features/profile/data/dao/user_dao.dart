import 'dart:async';

import 'package:Pouchers/app/app.locator.dart';
import 'package:Pouchers/ui/common/app_keys.dart';
import 'package:Pouchers/ui/features/profile/domain/model/user.dart';
import 'package:Pouchers/utils/extension.dart';
import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../../../app/core/manager/hive_manager.dart';

late UserDao userDao;
final _hiveManager = locator<HiveManager>();

class UserDao {
  late Box<Map> _box;

  Box<Map> get box => _box;

  UserDao() {
    openBox().then((value) => _box = value);
  }

  Future<Box<Map>> openBox() => _hiveManager.openBox<Map>(AppKeys.userDaoKey);

  Future<void> save(User? user) async =>
      await _box.put(AppKeys.userDaoKey, user?.toJson() ?? {});

  User returnUser(Box box) =>
      User.fromJson(Map<String, dynamic>.from(box.toMap()[AppKeys.userDaoKey]));

  ValueListenable<Box> getListenable({List<String>? keys}) =>
      (keys == null ? _box.listenable() : _box.listenable(keys: keys));

  Future truncate() async => await _box.clear();

  String get initials =>
      '${returnUser(box).firstName?[0] ?? ''}${returnUser(box).lastName?[0] ?? ''}'
          .toUpperCase();

  String get fullName =>
      '${returnUser(box).firstName?.titleCase ?? ''} ${returnUser(box).lastName?.titleCase ?? ''}';
}
