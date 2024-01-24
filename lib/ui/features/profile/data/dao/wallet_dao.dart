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
  late Box _box;

  Box get box => _box;

  WalletDao() {
    openBox().then((value) => _box = value);
  }

  Future<Box> openBox() => _hiveManager.openBox(AppKeys.walletDaoKey);

  Wallet get wallet => retrieve(_box);

  bool get balanceVisibilty =>
      _box.get(AppKeys.balanceVisibilityKey, defaultValue: false) as bool;

  Future<void> toggleBalanceVisibility() async {
    await _box.put(AppKeys.balanceVisibilityKey, !balanceVisibilty);
  }

  Future<void> save(Wallet? wallet) async =>
      await _box.put(AppKeys.walletDaoKey, wallet);

  Wallet retrieve(Box box) =>
      box.get(AppKeys.walletDaoKey) as Wallet? ?? Wallet();

  ValueListenable<Box> getListenable({List<String>? keys}) =>
      (keys == null ? _box.listenable() : _box.listenable(keys: keys));

  Future truncate() async => await _box.clear();
}
