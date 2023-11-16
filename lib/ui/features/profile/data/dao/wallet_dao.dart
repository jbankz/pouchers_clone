import 'dart:async';

import 'package:Pouchers/app/app.locator.dart';
import 'package:Pouchers/ui/common/app_keys.dart';
import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../../../app/core/manager/hive_manager.dart';
import '../../domain/model/wallet.dart';

late WalletDao walletDao;
final _hiveManager = locator<HiveManager>();

class WalletDao {
  late Box<Map> _box;

  Box<Map>? get box => _box;

  WalletDao() {
    openBox().then((value) => _box = value);
  }

  Future<Box<Map>> openBox() => _hiveManager.openBox<Map>(AppKeys.walletDaoKey);

  Future<void> save(Wallet? wallet) async =>
      await _box.put(AppKeys.walletDaoKey, wallet?.toJson() ?? {});

  Wallet convert(Box box) =>
      Wallet.fromJson(box.toMap()[AppKeys.walletDaoKey] ?? {});

  ValueListenable<Box> getListenable({List<String>? keys}) =>
      (keys == null ? _box.listenable() : _box.listenable(keys: keys));

  Future truncate() async => await _box.clear();
}
