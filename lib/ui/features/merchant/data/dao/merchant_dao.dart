import 'dart:async';

import 'package:Pouchers/app/app.locator.dart';
import 'package:Pouchers/ui/common/app_keys.dart';
import 'package:Pouchers/ui/features/merchant/domain/model/get_merchants.dart';
import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../../../app/core/manager/hive_manager.dart';

late MerchantDao merchantDao;
final _hiveManager = locator<HiveManager>();

class MerchantDao {
  late Box _box;

  Box get box => _box;

  MerchantDao() {
    openBox().then((value) => _box = value);
  }

  Future<Box> openBox() => _hiveManager.openBox(AppKeys.merchantDaoKey);

  Future<void> save(GetMerchant getMerchant) async =>
      await _box.put(AppKeys.merchantDaoKey, getMerchant);

  GetMerchant get merchant => _box.get(AppKeys.merchantDaoKey);

  GetMerchant retrieve(Box box) => box.get(AppKeys.merchantDaoKey);

  ValueListenable<Box> getListenable({List<String>? keys}) =>
      (keys == null ? _box.listenable() : _box.listenable(keys: keys));

  Future truncate() async => await _box.clear();
}
