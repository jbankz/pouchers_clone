import 'dart:async';

import 'package:pouchers/app/app.locator.dart';
import 'package:pouchers/ui/common/app_keys.dart';
import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../../../../../app/core/manager/hive_manager.dart';
import '../../domain/model/transaction_analytic.dart';

late TransactionAnalyticsDao transactionAnalyticsDao;
final _hiveManager = locator<HiveManager>();

class TransactionAnalyticsDao {
  late Box _box;

  Box get box => _box;

  TransactionAnalyticsDao() {
    openBox().then((value) => _box = value);
  }

  Future<Box> openBox() =>
      _hiveManager.openBox(AppKeys.transactionAnalytcDaoKey);

  Future<void> save(TransactionAnalytic transaction) async {
    await _box.put(AppKeys.transactionAnalytcDaoKey, transaction);
  }

  Future<void> clear() async => await _box.clear();

  TransactionAnalytic? fetchTransactionAnalytic(Box box) =>
      box.toMap()[AppKeys.transactionAnalytcDaoKey];

  ValueListenable<Box> getListenable({List<String>? keys}) =>
      (keys == null ? _box.listenable() : _box.listenable(keys: keys));

  Future truncate() async => await _box.clear();
}
