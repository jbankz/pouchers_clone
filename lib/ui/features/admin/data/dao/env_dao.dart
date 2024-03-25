import 'dart:async';

import 'package:pouchers/app/app.locator.dart';
import 'package:pouchers/ui/common/app_keys.dart';
import 'package:pouchers/ui/features/admin/domain/model/envs/envs.dart';
import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../../../../../app/core/manager/hive_manager.dart';

late EnvDao envDao;
final _hiveManager = locator<HiveManager>();

class EnvDao {
  late Box _box;

  Box get box => _box;

  EnvDao() {
    openBox().then((value) => _box = value);
  }

  Future<Box> openBox() => _hiveManager.openBox(AppKeys.envDaoKey);

  List<Envs> get envs => retrieve(_box);

  Future<void> save(List<Envs> envs, {bool clear = true}) async {
    if (envs.isEmpty) return;

    if (clear) _box.clear();

    for (var env in envs) {
      await _box.put(env.updatedAt?.toIso8601String(), env);
    }
  }

  Future<void> clear() async => await _box.clear();

  List<Envs> retrieve(Box box) => box.values.cast<Envs>().toList();

  ValueListenable<Box> getListenable({List<String>? keys}) =>
      (keys == null ? _box.listenable() : _box.listenable(keys: keys));

  Future truncate() async => await _box.clear();
}
