import 'dart:async';
import 'dart:convert';

import 'package:Pouchers/app/app.locator.dart';
import 'package:Pouchers/ui/common/app_keys.dart';
import 'package:Pouchers/ui/features/dashboard/views/card/domain/model/get_card/data.dart';
import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../../../../../app/core/manager/hive_manager.dart';

late CardsDao cardsDao;
final _hiveManager = locator<HiveManager>();

class CardsDao {
  late Box<Map> _box;

  Box<Map>? get box => _box;

  CardsDao() {
    openBox().then((value) => _box = value);
  }

  Future<Box<Map>> openBox() => _hiveManager.openBox<Map>(AppKeys.cardsDaoKey);

  List<Data> get cards => fetchCards(_box);

  Future<void> saveCards(List<Data> cards) async {
    await clear();

    final map = {for (var g in cards) (g).sudoId: (g).toJson()};

    await _box.putAll(map);
  }

  Future<void> clear() async => await _box.clear();

  List<Data> fetchCards(Box box) {
    final Map<String, dynamic> raw = Map<String, dynamic>.from(box.toMap());
    return raw.values
        .map((e) => Data.fromJson(json.decode(json.encode(e))))
        .toList();
  }

  ValueListenable<Box> getListenable({List<String>? keys}) =>
      (keys == null ? _box.listenable() : _box.listenable(keys: keys));

  Future truncate() async => await _box.clear();
}
