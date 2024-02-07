import 'dart:async';
import 'dart:convert';

import 'package:Pouchers/app/app.locator.dart';
import 'package:Pouchers/ui/common/app_keys.dart';
import 'package:Pouchers/ui/features/dashboard/views/transaction/domain/model/transaction_history.dart';
import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../../../../../app/core/manager/hive_manager.dart';

late TransactionHistoryDao transactionHistoryDao;
final _hiveManager = locator<HiveManager>();

class TransactionHistoryDao {
  late Box _box;

  Box get box => _box;

  TransactionHistoryDao() {
    openBox().then((value) => _box = value);
  }

  Future<Box> openBox() =>
      _hiveManager.openBox(AppKeys.transactionHistoryDaoKey);

  List<TransactionHistory> get transactions => fetchTransactionHistory(_box);

  Future<void> save(List<TransactionHistory> transactions,
      {bool clear = true}) async {
    if (transactions.isEmpty) return;

    if (clear) _box.clear();

    for (var transaction in transactions) {
      await _box.put(transaction.transactionId, transaction);
    }
  }

  Future<void> clear() async => await _box.clear();

  List<TransactionHistory> fetchTransactionHistory(Box box) =>
      Map<String, dynamic>.from(box.toMap())
          .values
          .map((e) => TransactionHistory.fromJson(json.decode(json.encode(e))))
          .toList()
        ..sort((a, b) => (b.createdAt ?? DateTime.now().toLocal())
            .compareTo(a.createdAt ?? DateTime.now().toLocal()));

  ValueListenable<Box> getListenable({List<String>? keys}) =>
      (keys == null ? _box.listenable() : _box.listenable(keys: keys));

  Future truncate() async => await _box.clear();
}
