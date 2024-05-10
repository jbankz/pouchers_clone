import 'dart:async';

import 'package:pouchers/app/app.locator.dart';
import 'package:pouchers/ui/common/app_keys.dart';
import 'package:pouchers/ui/features/requests/domain/model/request_model.dart';
import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../../../app/core/manager/hive_manager.dart';

late RequestSentDao requestSentDao;
final _hiveManager = locator<HiveManager>();

class RequestSentDao {
  late Box _box;

  Box get box => _box;

  RequestSentDao() {
    openBox().then((value) => _box = value);
  }

  Future<Box> openBox() =>
      _hiveManager.openBox('${AppKeys.requestDaoKey}-sent');

  Future<void> save(List<RequestModel> requests, {bool clear = true}) async {
    // if (requests.isEmpty) return;

    if (clear) await _box.clear();

    for (RequestModel request in requests) {
      await _box.put(request.createdAt?.toIso8601String(), request);
    }
  }

  List<RequestModel> retrieve(Box box) =>
      box.values.cast<RequestModel>().toList();

  ValueListenable<Box> getListenable({List<String>? keys}) =>
      (keys == null ? _box.listenable() : _box.listenable(keys: keys));

  Future truncate() async => await _box.clear();
}
