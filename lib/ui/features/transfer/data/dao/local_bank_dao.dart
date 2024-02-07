import 'dart:async';

import 'package:Pouchers/app/app.locator.dart';
import 'package:Pouchers/ui/common/app_keys.dart';
import 'package:Pouchers/ui/features/transfer/domain/model/local_bank.dart';
import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../../../app/core/manager/hive_manager.dart';

late LocalBankDao localBankDao;
final _hiveManager = locator<HiveManager>();

class LocalBankDao {
  late Box _box;

  Box get box => _box;

  LocalBankDao() {
    openBox().then((value) => _box = value);
  }

  Future<Box> openBox() => _hiveManager.openBox(AppKeys.localBanksDaoKey);

  Future<void> save(List<LocalBank> banks) async {
    if (banks.isEmpty) return;

    for (var bank in banks) {
      await _box.put(bank.id, bank);
    }
  }

  List<LocalBank> retrieve(Box box, {String query = ''}) => query.isEmpty
      ? box.values.cast<LocalBank>().toList()
      : box.values
          .cast<LocalBank>()
          .where((element) =>
              element.attributes?.name
                  ?.toLowerCase()
                  .startsWith(query.toLowerCase()) ??
              false)
          .toList();

  ValueListenable<Box> getListenable({List<String>? keys}) =>
      (keys == null ? _box.listenable() : _box.listenable(keys: keys));

  Future truncate() async => await _box.clear();
}
