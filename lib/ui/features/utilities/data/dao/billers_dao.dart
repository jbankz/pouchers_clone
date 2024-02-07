import 'dart:async';

import 'package:Pouchers/app/app.locator.dart';
import 'package:Pouchers/ui/common/app_keys.dart';
import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../../../app/core/manager/hive_manager.dart';
import '../../domain/model/billers.dart';

late BillersDao billersDao;
final _hiveManager = locator<HiveManager>();

class BillersDao {
  late Box _box;

  Box get box => _box;

  BillersDao() {
    openBox().then((value) => _box = value);
  }

  Future<Box> openBox() => _hiveManager.openBox(AppKeys.billersDaoKey);

  Future<void> save(List<Billers> providers) async {
    if (providers.isEmpty) return;

    for (var provider in providers) {
      await _box.put(provider.operatorpublicid, provider);
    }
  }

  List<Billers> retrieve(Box box, {String query = ''}) => query.isEmpty
      ? box.values.cast<Billers>().toList()
      : box.values
          .cast<Billers>()
          .where((element) =>
              element.displayName
                  ?.toLowerCase()
                  .startsWith(query.toLowerCase()) ??
              false)
          .toList();

  ValueListenable<Box> getListenable({List<String>? keys}) =>
      (keys == null ? _box.listenable() : _box.listenable(keys: keys));

  Future truncate() async => await _box.clear();
}
