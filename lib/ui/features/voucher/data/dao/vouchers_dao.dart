import 'dart:async';

import 'package:Pouchers/app/app.locator.dart';
import 'package:Pouchers/ui/common/app_keys.dart';
import 'package:Pouchers/ui/features/voucher/domain/model/vouchers.dart';
import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../../../app/core/manager/hive_manager.dart';

late VouchersDao vouchersDao;
final _hiveManager = locator<HiveManager>();

class VouchersDao {
  late Box _box;

  Box get box => _box;

  VouchersDao() {
    openBox().then((value) => _box = value);
  }

  Future<Box> openBox() => _hiveManager.openBox(AppKeys.vouchersDaoKey);

  Future<void> save(List<Vouchers> vouchers, {bool clear = true}) async {
    if (vouchers.isEmpty) return;

    if (clear) await _box.clear();

    for (var voucher in vouchers) {
      await _box.put(voucher.createdAt?.toIso8601String(), voucher);
    }
  }

  List<Vouchers> retrieve(Box box) => box.values.cast<Vouchers>().toList();

  ValueListenable<Box> getListenable({List<String>? keys}) =>
      (keys == null ? _box.listenable() : _box.listenable(keys: keys));

  Future truncate() async => await _box.clear();
}
