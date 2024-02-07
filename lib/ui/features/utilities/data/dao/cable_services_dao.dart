import 'dart:async';

import 'package:Pouchers/app/app.locator.dart';
import 'package:Pouchers/ui/common/app_keys.dart';
import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../../../app/core/manager/hive_manager.dart';
import '../../domain/model/get_cable_service.dart';

late CableServicesDao cableServicesDao;
final _hiveManager = locator<HiveManager>();

class CableServicesDao {
  late Box _box;

  Box get box => _box;

  CableServicesDao() {
    openBox().then((value) => _box = value);
  }

  Future<Box> openBox() => _hiveManager.openBox(AppKeys.cableServicesDaoKey);

  Future<void> save(GetCableService cableService) async =>
      await _box.put(AppKeys.cableServicesDaoKey, cableService);

  GetCableService retrieve(Box box) => box.get(AppKeys.cableServicesDaoKey);

  ValueListenable<Box> getListenable({List<String>? keys}) =>
      (keys == null ? _box.listenable() : _box.listenable(keys: keys));

  Future truncate() async => await _box.clear();
}
